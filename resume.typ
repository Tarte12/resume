#import "metadata.typ": resume_data
#import "modules/sections.typ": render_summary, render_projects, render_skills, render_education, render_etc

#let c-primary = rgb("#2d3436")
#let c-accent  = rgb("#0984e3")
#let c-muted   = rgb("#636e72")
#let c-line    = rgb("#dfe6e9")

#set page(
  paper: "a4",
  margin: (top: 1.4cm, left: 1.5cm, right: 1.5cm, bottom: 1.5cm),
)
#set text(
  font: ("Pretendard", "Noto Sans CJK KR", "Malgun Gothic", "Arial"),
  fallback: true,
  size: 9.5pt,
  fill: c-primary,
)
#set par(leading: 0.65em)

// ─── Header ───────────────────────────────────────────────────────────────────
#align(center)[
  // Name: 큰 한국어 + 작은 영어
  #text(size: 27pt, weight: 900, fill: c-primary)[#resume_data.name_kr]
  #h(0.5em)
  #text(size: 15pt, weight: 400, fill: c-muted)[#resume_data.name_en]

  #v(0.55em)

  // 한 줄 역할 소개
  #text(size: 10.5pt, weight: 600, fill: c-accent)[#resume_data.tagline]

  #v(0.75em)
  #line(length: 65%, stroke: 0.5pt + c-line)
  #v(0.55em)

  // 연락처
  #set text(size: 8.5pt, fill: c-muted)
  #grid(
    columns: (auto, auto, auto, auto),
    column-gutter: 16pt,
    align: center,
    [#text(fill: c-accent)[✉] #link("mailto:" + resume_data.contacts.email)[#resume_data.contacts.email]],
    [#text(fill: c-accent)[☎] #resume_data.contacts.phone],
    [#text(fill: c-accent)[⌥] #link("https://github.com/" + resume_data.contacts.github)[github.com/#resume_data.contacts.github]],
    [#text(fill: c-accent)[✎] #link(resume_data.contacts.blog)[velog.io/\@emprimula]],
  )
]

#v(1.0em)
#render_summary(resume_data.summary)
#v(0.5em)
#render_projects(resume_data.projects)
#v(0.5em)
#render_skills(resume_data.skills)
#v(0.5em)
#render_education(resume_data.education)
#v(0.5em)
#render_etc(resume_data.etc)
