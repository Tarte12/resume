#import "@preview/finely-crafted-cv:0.3.0": *

// 데이터 불러오기
#let data = yaml("resume.yml")

// 기본 폰트 및 스타일 세팅
#set text(font: ("Pretendard", "Malgun Gothic", "Arial"), fallback: true, size: 10pt)
#set par(leading: 0.65em) // 줄 간격 약간 넓혀서 가독성 향상

#show: resume.with(
  name: data.name,
  tagline: data.tagline,
  keywords: data.keywords.join(" · "),
  icon-contact-header: (
    (text(font: "Segoe UI Emoji", "📱"), data.contacts.phone),
    (text(font: "Segoe UI Emoji", "📧"), link("mailto:" + data.contacts.email, data.contacts.email)),
    (text(font: "Segoe UI Emoji", "🔗"), link("https://github.com/" + data.contacts.github, "GitHub")),
    (text(font: "Segoe UI Emoji", "📝"), link(data.contacts.blog, "Velog")),
  ),
)

// 섹션 제목 스타일링 (RanolP님 스타일 느낌의 밑줄과 간격)
#show heading.where(level: 1): it => [
  #pad(top: 0.5em, bottom: 0.5em)[
    #text(size: 14pt, weight: 700, fill: rgb("#333333"))[#it.body]
    #v(-0.5em)
    #line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
  ]
]

= 👨‍💻 Professional Summary

#pad(left: 0.5em)[
  #text(weight: 600, size: 11pt, fill: rgb("#2b8a3e"))[Workflow: 공정 효율화] \
  - #data.summary.workflow
  
  #v(0.5em)
  
  #text(weight: 600, size: 11pt, fill: rgb("#1971c2"))[Technical Solution: 문제 해결 및 설계] \
  - #data.summary.technical
]

= 💼 Projects

#for project in data.projects [
  #v(0.5em)
  #company-heading(text(weight: 700, size: 12pt)[#project.name] + " (" + project.description + ")", start: project.period, end: "")[
    #job-heading(text(weight: 600, fill: rgb("#555555"))[#project.role])[
      #for highlight in project.highlights [
        - #highlight
      ]
      
      #v(0.3em)
      // 기술 스택 뱃지 느낌으로 나열
      - *Tech Stack:* #text(fill: rgb("#444444"))[#project.stack.join("  |  ")]
    ]
  ]
]

= 🛠 Tech Stack

#pad(left: 0.5em)[
  #grid(
    columns: (120pt, 1fr),
    row-gutter: 0.8em,
    text(weight: 600)[Language & Framework], text(fill: rgb("#333333"))[Java 21, Spring Boot 3.5, Spring Security, JPA],
    text(weight: 600)[Database], text(fill: rgb("#333333"))[MySQL, SQLite, Redis],
    text(weight: 600)[Infra & Tools], text(fill: rgb("#333333"))[AWS, Docker, GitHub Actions, JUnit5, Claude Code, CodeRabbit],
    text(weight: 600)[Methodology], text(fill: rgb("#333333"))[TDD, Layered Architecture, Data Normalization]
  )
]

= 🎓 Education & ETC

#for edu in data.education [
  #company-heading(edu.school, start: edu.period, end: "")[
    #job-heading(edu.major)[]
  ]
]

#v(0.5em)

#for item in data.etc [
  - #text(weight: 600)[#item.title] #text(fill: rgb("#777777"))[| #item.date]
]
