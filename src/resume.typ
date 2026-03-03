#import "metadata.typ": resume_data
#import "modules/sections.typ": render_introduce, render_projects, render_skills, render_education_certs

#let c-primary = rgb("#1f2937")
#let c-accent = rgb("#2f7ac6")
#let c-muted = rgb("#6b7280")
#let c-line = rgb("#cbd5e1")

#set page(
  paper: "a4",
  margin: (top: 1.05cm, left: 1.15cm, right: 1.15cm, bottom: 1.15cm),
)
#set text(
  font: (
    "Malgun Gothic",
    "NanumGothic",
    "Yu Gothic UI",
    "Segoe UI",
    "Arial",
  ),
  fallback: true,
  size: 10pt,
  fill: c-primary,
)
#set par(leading: 0.72em)

#align(center)[
  #text(size: 17pt, weight: 860, fill: c-primary)[#resume_data.name_kr]
  #v(0.06em)
  #text(size: 9.4pt, fill: c-muted)[#resume_data.name_en]
  #v(0.12em)
  #text(size: 9.2pt, weight: 620, fill: c-muted)[#resume_data.tagline]

  #v(0.26em)
  #set text(size: 8.2pt, fill: c-accent)
  #link("mailto:" + resume_data.contacts.email)[#resume_data.contacts.email]
  #text(fill: c-muted)[  |  ]
  #resume_data.contacts.phone
  #text(fill: c-muted)[  |  ]
  #link("https://github.com/" + resume_data.contacts.github)[github.com/#resume_data.contacts.github]
  #text(fill: c-muted)[  |  ]
  #link(resume_data.contacts.blog)[velog.io/\@emprimula]
]

#v(0.08em)
#line(length: 100%, stroke: 0.65pt + c-line)
#v(0.07em)

#render_introduce(resume_data.Introduce)
#v(0.02em)
#render_skills(resume_data.skills)
#v(0.02em)
#render_projects(resume_data.projects)
#v(0.02em)
#render_education_certs(resume_data.education, resume_data.certifications)
