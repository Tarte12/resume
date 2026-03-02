#import "metadata.typ": resume_data
#import "modules/sections.typ": render_introduce, render_projects, render_skills, render_education_certs

#let c-primary = rgb("#0f172a")
#let c-accent = rgb("#0f766e")
#let c-muted = rgb("#475569")
#let c-line = rgb("#dbe4ee")
#let c-surface = rgb("#f8fafc")

#set page(
  paper: "a4",
  margin: (top: 1.12cm, left: 1.2cm, right: 1.2cm, bottom: 1.15cm),
)
#set text(
  font: ("Pretendard", "Noto Sans CJK KR", "Malgun Gothic", "Arial"),
  fallback: true,
  size: 9pt,
  fill: c-primary,
)
#set par(leading: 0.62em)

#let contact-chip(label, body, url: none) = {
  box(
    fill: white,
    stroke: 0.65pt + c-line,
    radius: 99pt,
    inset: (x: 7pt, y: 2.8pt),
  )[
    #text(size: 7.3pt, weight: 750, fill: c-accent)[#label]
    #h(3pt)
    #if url == none {
      text(size: 7.25pt, fill: c-muted)[#body]
    } else {
      link(url)[#text(size: 7.25pt, fill: c-muted)[#body]]
    }
  ]
}

#block(
  fill: c-surface,
  stroke: 0.8pt + c-line,
  radius: 12pt,
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #grid(
    columns: (1fr, auto),
    column-gutter: 12pt,
    align: (left + top, right + top),
    [
      #text(size: 22pt, weight: 900, fill: c-primary)[#resume_data.name_kr]
      #v(0.04em)
      #text(size: 10.3pt, weight: 500, fill: c-muted)[#resume_data.name_en]
      #v(0.2em)
      #text(size: 8.1pt, weight: 760, fill: c-accent)[#resume_data.tagline]
    ],
    [
      #grid(
        columns: (auto, auto),
        column-gutter: 4pt,
        row-gutter: 4pt,
        align: (right + top, right + top),
        #contact-chip("EMAIL", resume_data.contacts.email, url: "mailto:" + resume_data.contacts.email),
        #contact-chip("PHONE", resume_data.contacts.phone),
        #contact-chip("GITHUB", "github.com/" + resume_data.contacts.github, url: "https://github.com/" + resume_data.contacts.github),
        #contact-chip("BLOG", "velog.io/@emprimula", url: resume_data.contacts.blog),
      )
    ],
  )
]

#v(0.62em)
#render_introduce(resume_data.Introduce)
#v(0.22em)
#render_projects(resume_data.projects)
#v(0.1em)
#render_skills(resume_data.skills)
#v(0.1em)
#render_education_certs(resume_data.education, resume_data.certifications)
