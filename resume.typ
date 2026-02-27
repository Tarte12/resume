#import "@preview/finely-crafted-cv:0.3.0": *
#import "metadata.typ": resume_data
#import "modules/sections.typ": render_summary, render_projects, render_skills, render_education_and_etc

// 기본 폰트 및 페이지 세팅
#set page(
  paper: "a4",
  margin: (top: 1.5cm, left: 1.4cm, right: 1.4cm, bottom: 1.7cm),
)
#set text(font: ("Pretendard", "Malgun Gothic", "Arial"), fallback: true, size: 10pt)
#set par(leading: 0.7em)

#show: resume.with(
  name: resume_data.name,
  tagline: resume_data.tagline,
  keywords: resume_data.keywords.join(" · "),
  icon-contact-header: (
    (text(font: "Segoe UI Emoji", "📱"), resume_data.contacts.phone),
    (text(font: "Segoe UI Emoji", "📧"), link("mailto:" + resume_data.contacts.email, resume_data.contacts.email)),
    (text(font: "Segoe UI Emoji", "🔗"), link("https://github.com/" + resume_data.contacts.github, "GitHub")),
    (text(font: "Segoe UI Emoji", "📝"), link(resume_data.contacts.blog, "Velog")),
  ),
)

// 섹션 제목 스타일링
#show heading.where(level: 1): it => [
  #pad(top: 0.45em, bottom: 0.4em)[
    #text(size: 13pt, weight: 700, fill: rgb("#343a40"))[#it.body]
    #v(-0.35em)
    #line(length: 100%, stroke: 0.6pt + rgb("#ced4da"))
  ]
]

#render_summary(resume_data.summary)
#render_projects(resume_data.projects)
#render_skills(resume_data.skills)
#render_education_and_etc(resume_data.education, resume_data.etc)
