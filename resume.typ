#import "metadata.typ": resume_data
#import "modules/sections.typ": render_summary, render_projects, render_skills, render_education, render_etc

#let c-primary = rgb("#2d3436")
#let c-accent = rgb("#0984e3")
#let c-muted = rgb("#636e72")
#let c-line = rgb("#dfe6e9")

#set page(
  paper: "a4",
  margin: (top: 1.5cm, left: 1.5cm, right: 1.5cm, bottom: 1.5cm),
)
#set text(font: ("Pretendard", "Noto Sans CJK KR", "Malgun Gothic", "Arial"), fallback: true, size: 9.5pt, fill: c-primary)
#set par(leading: 0.65em)

// Header Section
#align(center)[
  #text(size: 24pt, weight: 800)[#resume_data.name]
  #v(0.4em)
  #text(size: 11pt, weight: 600, fill: c-accent)[#resume_data.tagline]
  #v(0.8em)
  
  #set text(size: 8.5pt)
  #grid(
    columns: (auto, auto, auto, auto),
    column-gutter: 12pt,
    [#text(fill: c-accent)[#sym.envelope] #link("mailto:" + resume_data.contacts.email)[#resume_data.contacts.email]],
    [#text(fill: c-accent)[#sym.phone] #resume_data.contacts.phone],
    [#text(fill: c-accent)[#sym.link] #link("https://github.com/" + resume_data.contacts.github)[github.com/#resume_data.contacts.github]],
    [#text(fill: c-accent)[#sym.link] #link(resume_data.contacts.blog)[velog.io/\@emprimula]],
  )
]

#v(1.5em)

#render_summary(resume_data.summary)
#v(1em)
#render_projects(resume_data.projects)
#v(1em)
#render_skills(resume_data.skills)
#v(1em)
#render_education(resume_data.education)
#v(1em)
#render_etc(resume_data.etc)
