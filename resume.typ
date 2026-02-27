#import "metadata.typ": resume_data
#import "modules/sections.typ": render_summary, render_projects, render_skills, render_education_and_etc

#let c-primary = rgb("#12344d")
#let c-accent = rgb("#1f6f8b")
#let c-muted = rgb("#56616b")
#let c-line = rgb("#d4dde3")
#let c-soft = rgb("#f4f8fb")

#set page(
  paper: "a4",
  margin: (top: 1.35cm, left: 1.25cm, right: 1.25cm, bottom: 1.45cm),
)
#set text(font: ("Pretendard", "Noto Sans CJK KR", "Malgun Gothic", "Arial"), fallback: true, size: 9.6pt)
#set par(leading: 0.68em)

#box(
  fill: c-soft,
  stroke: 0.75pt + c-line,
  radius: 7pt,
  inset: 10pt,
)[
  #text(size: 22pt, weight: 800, fill: c-primary)[#resume_data.name]
  #v(0.15em)
  #text(size: 10.5pt, weight: 600, fill: c-accent)[#resume_data.tagline]
  #v(0.35em)
  #text(size: 8.6pt, fill: c-muted)[#resume_data.keywords.join("  ·  ")]
  #v(0.35em)
  #line(length: 100%, stroke: 0.45pt + c-line)
  #v(0.3em)

  #grid(
    columns: (auto, 1fr, auto, 1fr),
    column-gutter: 8pt,
    row-gutter: 4pt,
    [#text(size: 8pt, weight: 700, fill: c-accent)[PHONE]], [#text(size: 8.8pt, fill: c-primary)[#resume_data.contacts.phone]],
    [#text(size: 8pt, weight: 700, fill: c-accent)[EMAIL]], [#link("mailto:" + resume_data.contacts.email)[#text(size: 8.8pt, fill: c-primary)[#resume_data.contacts.email]]],
    [#text(size: 8pt, weight: 700, fill: c-accent)[GITHUB]], [#link("https://github.com/" + resume_data.contacts.github)[#text(size: 8.8pt, fill: c-primary)[github.com/#resume_data.contacts.github]]],
    [#text(size: 8pt, weight: 700, fill: c-accent)[BLOG]], [#link(resume_data.contacts.blog)[#text(size: 8.8pt, fill: c-primary)[velog.io/\@emprimula]]],
  )
]

#v(0.55em)

#render_summary(resume_data.summary)
#v(0.45em)
#render_projects(resume_data.projects)
#v(0.45em)
#render_skills(resume_data.skills)
#v(0.45em)
#render_education_and_etc(resume_data.education, resume_data.etc)
