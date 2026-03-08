#let c-primary = rgb("#1f2937")
#let c-accent = rgb("#1d4ed8")
#let c-muted = rgb("#64748b")
#let c-line = rgb("#d8e1ee")
#let c-chip-bg = rgb("#f3f7fd")
#let c-chip-border = rgb("#d9e5f5")
#let section-title-size = 13.5pt

#let tech-colors = (
  "Java 21": rgb("#2563eb"),
  "Java": rgb("#2563eb"),
  "Spring Boot 3.5": rgb("#16a34a"),
  "Spring Boot": rgb("#16a34a"),
  "Spring Security": rgb("#16a34a"),
  "JPA/Hibernate": rgb("#64748b"),
  "JPA": rgb("#64748b"),
  "Redis": rgb("#ef4444"),
  "PostgreSQL": rgb("#1d4ed8"),
  "MySQL": rgb("#1e40af"),
  "SQLite": rgb("#0f3a6b"),
  "DBMS/RDBMS": rgb("#1d4ed8"),
  "Docker": rgb("#0284c7"),
  "GitHub Actions": rgb("#1e40af"),
  "JWT": rgb("#be123c"),
  "OAuth2": rgb("#7c3aed"),
  "AWS": rgb("#b45309"),
  "TDD": rgb("#0f766e"),
  "JUnit5": rgb("#0f766e"),
  "Claude Code": rgb("#7c3aed"),
  "CodeRabbit": rgb("#ea580c"),
)

#let tag-colors = (
  "보안": rgb("#ef4444"),
  "설계": rgb("#2f7ac6"),
  "데이터": rgb("#1d4ed8"),
  "프로세스": rgb("#7c3aed"),
  "공정": rgb("#7c3aed"),
  "품질": rgb("#0f766e"),
  "FE": rgb("#ea580c"),
)

#let get-tech-color(tech) = {
  if tech in tech-colors { tech-colors.at(tech) }
  else { c-accent }
}

#let chip(body, color: c-accent, size: 9.8pt) = box(
  fill: c-chip-bg,
  stroke: 0.45pt + c-chip-border,
  radius: 2.8pt,
  inset: (x: 4.4pt, y: 1.35pt),
)[
  #text(size: size, weight: 680, fill: color)[#body]
]

#let section_title(title) = [
  #v(0.24em)
  #text(size: section-title-size, weight: 780, fill: c-primary)[#title]
  #v(0.07em)
  #line(length: 100%, stroke: 0.52pt + c-line)
  #v(0.12em)
]

#let render-highlight-group(h, idx) = {
  let color = c-accent
  v(0.16em)
  grid(
    columns: (auto, 1fr),
    column-gutter: 5pt,
    align: (left + horizon, left + horizon),
    chip(h.tag, color: color, size: 9.5pt),
    text(size: 12.1pt, weight: 740, fill: c-primary)[#str(idx + 1). #h.title],
  )
  v(0.1em)
  for item in h.items {
    grid(
      columns: (8.5pt, 1fr),
      column-gutter: 4pt,
      align: (left + top, left + top),
      text(size: 11.4pt, fill: c-muted)[•],
      [
        #show strong: it => it.body
        #set text(size: 11.4pt, fill: c-primary)
        #set par(leading: 1.0em, spacing: 0.46em, justify: false)
        #eval(item, mode: "markup")
      ],
    )
    v(0.14em)
  }
}

#let render_introduce(introduce) = [
  #section_title("Introduce")
  #show heading.where(level: 2): it => block(above: 0.76em, below: 0.72em)[
    #text(size: 12pt, weight: 740, fill: c-primary)[#it.body]
  ]
  #show strong: it => it.body
  #show list.item: it => block(below: 0.8em)[#it]
  #set list(marker: [•], indent: 1.05em, body-indent: 0.52em, tight: false)
  #set par(leading: 1.22em, spacing: 0.92em, justify: false)
  #text(size: 11.5pt, fill: c-primary)[#eval(introduce, mode: "markup")]
]

#let render_projects(projects) = [
  #section_title("Projects")
  #for (idx, project) in projects.enumerate() [
    #grid(
      columns: (1fr, auto),
      column-gutter: 10pt,
      align: (left + top, right + top),
      text(size: 12.6pt, weight: 760, fill: c-primary)[#project.name],
      text(size: 10.4pt, fill: c-muted)[#project.period],
    )
    #v(0.07em)
    #text(size: 10.7pt, weight: 650, fill: c-muted)[
      #project.role#(if "team" in project { "  |  " + project.team } else { "" })
    ]

    #if "overview" in project [
      #v(0.12em)
      #text(size: 11.3pt, fill: c-muted)[#project.overview]
    ]

    #v(0.14em)
    #for s in project.stack [#chip(s, color: get-tech-color(s))#h(2.2pt)]

    #for (hidx, h) in project.highlights.enumerate() [#render-highlight-group(h, hidx)]

    #if idx < projects.len() - 1 [
      #v(0.24em)
      #line(length: 100%, stroke: 0.5pt + c-line)
      #v(0.2em)
    ]
  ]
]

#let render_skills(skills) = [
  #section_title("Skills")
  #grid(
    columns: (78pt, 1fr),
    column-gutter: 8pt,
    row-gutter: 0.76em,
    align: (left + top, left + top),
    text(size: 10.7pt, weight: 720, fill: c-muted)[Backend],
    [#for s in skills.backend.split(", ") [#chip(s, color: rgb("#16a34a"))#h(2.6pt)]],
    text(size: 10.7pt, weight: 720, fill: c-muted)[Frontend],
    [#for s in skills.frontend.split(", ") [#chip(s, color: rgb("#7c3aed"))#h(2.6pt)]],
    text(size: 10.7pt, weight: 720, fill: c-muted)[Database],
    [#for s in skills.database.split(", ") [#chip(s, color: rgb("#1d4ed8"))#h(2.6pt)]],
    text(size: 10.7pt, weight: 720, fill: c-muted)[Cloud/DevOps],
    [#for s in skills.cloud.split(", ") [#chip(s, color: rgb("#ea580c"))#h(2.6pt)]],
  )
]

#let render_education_certs(education, certifications) = [
  #section_title("Education")

  #for (idx, edu) in education.enumerate() [
    #grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      [
        #text(size: 11.9pt, weight: 740, fill: c-primary)[#edu.school]
        #v(0.06em)
        #text(size: 11.3pt, fill: c-muted)[#edu.major]
      ],
      text(size: 10.4pt, fill: c-muted)[#edu.period],
    )
    #if idx < education.len() - 1 [#v(0.18em)]
  ]

  #if certifications.len() > 0 [
    #v(0.18em)
    #section_title("Certifications")
    #for cert in certifications [
      #grid(
        columns: (1fr, auto),
        align: (left + top, right + top),
        text(size: 11.3pt, fill: c-primary)[• #cert.title],
        text(size: 10.4pt, fill: c-muted)[#cert.date],
      )
      #v(0.12em)
    ]
  ]
]
