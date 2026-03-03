#let c-primary = rgb("#1f2937")
#let c-accent = rgb("#2f7ac6")
#let c-muted = rgb("#6b7280")
#let c-line = rgb("#cbd5e1")
#let c-chip-bg = rgb("#eef4fb")
#let c-chip-border = rgb("#d4e4f8")

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

#let chip(body, color: c-accent, size: 8pt) = box(
  fill: c-chip-bg,
  stroke: 0.45pt + c-chip-border,
  radius: 3pt,
  inset: (x: 4pt, y: 1.2pt),
)[
  #text(size: size, weight: 700, fill: color)[#body]
]

#let section_title(title) = [
  #v(0.62em)
  #text(size: 17pt, weight: 800, fill: c-accent)[#title]
  #v(0.16em)
  #line(length: 100%, stroke: 0.65pt + c-line)
  #v(0.28em)
]

#let render-highlight-group(h, idx) = {
  let color = if h.tag in tag-colors { tag-colors.at(h.tag) } else { c-accent }
  v(0.3em)
  grid(
    columns: (auto, 1fr),
    column-gutter: 5pt,
    align: (left + horizon, left + horizon),
    chip(h.tag, color: color, size: 7.8pt),
    text(size: 15pt, weight: 760, fill: c-primary)[#str(idx + 1). #h.title],
  )
  v(0.16em)
  for item in h.items {
    grid(
      columns: (8pt, 1fr),
      column-gutter: 4pt,
      align: (left + top, left + top),
      text(size: 9.8pt, fill: c-muted)[-],
      [#show strong: it => it.body
       #set text(size: 9.8pt, fill: c-primary)
       #set par(leading: 0.82em, justify: false)
       #eval(item, mode: "markup")],
    )
    v(0.22em)
  }
}

#let render_introduce(introduce) = [
  #section_title("Introduce")
  #show heading.where(level: 2): it => block(above: 0.9em, below: 0.55em)[
    #text(size: 15pt, weight: 760, fill: c-primary)[#it.body]
  ]
  #show strong: it => it.body
  #show list.item: it => block(below: 0.65em)[#it]
  #set list(marker: [-], indent: 1.1em, body-indent: 0.6em, tight: false)
  #set par(leading: 1.0em, spacing: 0.75em, justify: false)
  #text(size: 9.8pt, fill: c-primary)[#eval(introduce, mode: "markup")]
]

#let render_projects(projects) = [
  #section_title("Project")
  #for (idx, project) in projects.enumerate() [
    #grid(
      columns: (1fr, auto),
      column-gutter: 8pt,
      align: (left + top, right + top),
      text(size: 10.8pt, weight: 760, fill: c-primary)[#project.name],
      text(size: 8.5pt, fill: c-muted)[#project.period],
    )
    #v(0.05em)
    #text(size: 9pt, weight: 650, fill: c-muted)[
      #project.role#(if "team" in project { "  |  " + project.team } else { "" })
    ]

    #if "overview" in project [
      #v(0.13em)
      #text(size: 9.8pt, fill: c-muted)[#project.overview]
    ]

    #v(0.18em)
    #for s in project.stack [#chip(s, color: get-tech-color(s))#h(2pt)]

    #for (hidx, h) in project.highlights.enumerate() [#render-highlight-group(h, hidx)]

    #if idx < projects.len() - 1 [
      #v(0.32em)
      #line(length: 100%, stroke: 0.5pt + c-line)
      #v(0.22em)
    ]
  ]
]

#let render_skills(skills) = [
  #section_title("Skills")
  #grid(
    columns: (75pt, 1fr),
    column-gutter: 8pt,
    row-gutter: 0.34em,
    align: (left + top, left + top),
    text(size: 9pt, weight: 700, fill: c-muted)[Backend],
    [#for s in skills.backend.split(", ") [#chip(s, color: rgb("#16a34a"))#h(2pt)]],
    text(size: 9pt, weight: 700, fill: c-muted)[Database],
    [#for s in skills.database.split(", ") [#chip(s, color: rgb("#1d4ed8"))#h(2pt)]],
    text(size: 9pt, weight: 700, fill: c-muted)[Cloud/DevOps],
    [#for s in skills.cloud.split(", ") [#chip(s, color: rgb("#ea580c"))#h(2pt)]],
  )
]

#let render_education_certs(education, certifications) = [
  #section_title("Education")

  #for edu in education [
    #grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      [
        #text(size: 10pt, weight: 760, fill: c-primary)[#edu.school]
        #v(0.06em)
        #text(size: 9.8pt, fill: c-muted)[#edu.major]
      ],
      text(size: 8.5pt, fill: c-muted)[#edu.period],
    )
  ]

  #if certifications.len() > 0 [
    #v(0.24em)
    #text(size: 9pt, weight: 700, fill: c-accent)[Certifications]
    #v(0.08em)
    #for cert in certifications [
      #grid(
        columns: (1fr, auto),
        align: (left + top, right + top),
        text(size: 9.8pt, fill: c-primary)[- #cert.title],
        text(size: 8.5pt, fill: c-muted)[#cert.date],
      )
    ]
  ]
]
