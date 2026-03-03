#import "metadata.typ": resume_data
#import "modules/sections.typ": render_introduce, render_projects, render_skills, render_education_certs

#let c-primary = rgb("#111827")
#let c-accent = rgb("#1d4ed8")
#let c-muted = rgb("#64748b")
#let c-line = rgb("#d8e1ee")

#set page(
  paper: "a4",
  margin: (top: 1.1cm, left: 1.2cm, right: 1.2cm, bottom: 1.12cm),
)
#set text(
  font: (
    "Malgun Gothic",
    "Pretendard",
    "NanumGothic",
    "Dotum",
    "Gulim",
    "MS PGothic",
    "Yu Gothic UI",
    "Segoe UI",
    "Arial",
  ),
  fallback: true,
  size: 12.9pt,
  fill: c-primary,
)
#set par(leading: 0.86em)

#align(center)[
  #text(size: 19.8pt, weight: 820, fill: c-primary)[#resume_data.name_kr]
  #v(0.05em)
  #text(size: 11.2pt, fill: c-muted)[#resume_data.name_en]
  #v(0.1em)
  #text(size: 10.9pt, weight: 650, fill: c-muted)[#resume_data.tagline]

  #v(0.24em)
  #set text(size: 10.1pt, fill: c-muted)
  #link("mailto:" + resume_data.contacts.email)[#text(fill: c-accent)[#resume_data.contacts.email]]
  #text(fill: c-muted)[  ·  ]
  #text(fill: c-accent)[#resume_data.contacts.phone]
  #text(fill: c-muted)[  ·  ]
  #link("https://github.com/" + resume_data.contacts.github)[#text(fill: c-accent)[github.com/#resume_data.contacts.github]]
  #text(fill: c-muted)[  ·  ]
  #link(resume_data.contacts.blog)[#text(fill: c-accent)[velog.io/\@emprimula]]
]

#v(0.09em)
#line(length: 100%, stroke: 0.58pt + c-line)
#v(0.08em)

#render_introduce(resume_data.Introduce)
#v(0.2em)
#render_skills(resume_data.skills)
#v(0.2em)
#render_projects(resume_data.projects)
#v(0.2em)
#render_education_certs(resume_data.education, resume_data.certifications)
