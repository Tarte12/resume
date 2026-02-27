#import "@preview/finely-crafted-cv:0.3.0": *

// 외부 데이터(YAML) 로드
#let data = yaml("resume.yml")

#show: resume.with(
  name: data.name,
  tagline: data.tagline,
  keywords: data.keywords.join(", "),
  // 아이콘 형식을 템플릿에 맞게 더 안전하게 수정
  icon-contact-header: (
    (text(font: "Segoe UI Emoji", "📱"), data.contacts.phone),
    (text(font: "Segoe UI Emoji", "📧"), link("mailto:" + data.contacts.email, data.contacts.email)),
    (text(font: "Segoe UI Emoji", "🔗"), link("https://github.com/" + data.contacts.github, "GitHub")),
    (text(font: "Segoe UI Emoji", "📝"), link(data.contacts.blog, "Blog")),
  ),
)

= Professional Summary

#data.summary.workflow
\ \
#data.summary.technical

= Projects

#for project in data.projects [
  #company-heading(project.name, start: project.period, end: "")[
    #job-heading(project.role, location: project.description)[
      #for highlight in project.highlights [
        - #highlight
      ]
      - *Tech Stack:* #project.stack.join(", ")
    ]
  ]
]

= Education

#for edu in data.education [
  #company-heading(edu.school, start: edu.period, end: "")[
    #job-heading(edu.major)[]
  ]
]

= ETC

#for item in data.etc [
  - #item.title | #item.date
]
