#let c-primary = rgb("#0f172a")
#let c-accent = rgb("#0f766e")
#let c-muted = rgb("#475569")
#let c-line = rgb("#dbe4ee")
#let c-surface = rgb("#f8fafc")
#let c-surface-strong = rgb("#f1f5f9")

#let tech-colors = (
  "Java 21": rgb("#b45309"),
  "Java": rgb("#b45309"),
  "Spring Boot 3.5": rgb("#2f855a"),
  "Spring Boot": rgb("#2f855a"),
  "Spring Security": rgb("#2f855a"),
  "JPA/Hibernate": rgb("#4b5563"),
  "JPA": rgb("#4b5563"),
  "Redis": rgb("#b91c1c"),
  "PostgreSQL": rgb("#1d4ed8"),
  "MySQL": rgb("#2563eb"),
  "SQLite": rgb("#0f3a6b"),
  "DBMS/RDBMS": rgb("#1d4ed8"),
  "Docker": rgb("#0284c7"),
  "GitHub Actions": rgb("#1e40af"),
  "JWT": rgb("#be123c"),
  "OAuth2": rgb("#7c3aed"),
  "AWS": rgb("#b45309"),
  "TDD": rgb("#0f766e"),
  "JUnit5": rgb("#2f855a"),
  "Claude Code": rgb("#7c3aed"),
  "CodeRabbit": rgb("#ea580c"),
)

#let tag-colors = (
  "보안": rgb("#be123c"),
  "설계": rgb("#0f766e"),
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

#let chip(body, color: c-accent, size: 7.2pt) = box(
  fill: color.lighten(86%),
  stroke: 0.6pt + color.lighten(48%),
  radius: 99pt,
  inset: (x: 6pt, y: 2.2pt),
)[
  #text(size: size, weight: 700, fill: color)[#body]
]

#let section_title(kr, en) = [
  #v(0.92em)
  #grid(
    columns: (auto, auto, 1fr),
    column-gutter: 7pt,
    align: (left + bottom, left + bottom, left + bottom),
    text(size: 11.2pt, weight: 850, fill: c-primary)[#kr],
    text(size: 7.4pt, weight: 700, fill: c-muted)[#en],
    box(height: 1.2pt, width: 100%, fill: c-line),
  )
  #v(0.45em)
]

#let render-highlight-item(h) = {
  if h.starts-with("[") and h.contains("] ") {
    let raw = h.slice(1)
    let parts = raw.split("] ")
    let tag = parts.first()
    let body = parts.slice(1).join("] ")
    let color = if tag in tag-colors { tag-colors.at(tag) } else { c-accent }
    grid(
      columns: (auto, 1fr),
      column-gutter: 7pt,
      align: (left + top, left + top),
      chip(tag, color: color, size: 6.8pt),
      text(size: 8.65pt, fill: c-primary)[#body],
    )
  } else {
    grid(
      columns: (auto, 1fr),
      column-gutter: 7pt,
      align: (left + top, left + top),
      text(size: 8.7pt, fill: c-accent)[•],
      text(size: 8.65pt, fill: c-primary)[#h],
    )
  }
}

#let render_introduce(introduce) = [
  #section_title("자기소개", "Introduce")
  #block(
    fill: c-surface,
    stroke: (left: 2.6pt + c-accent, rest: 0.6pt + c-line),
    radius: 8pt,
    inset: (x: 11pt, y: 9pt),
    width: 100%,
  )[
    #set par(leading: 0.74em, spacing: 0.35em, justify: false)
    #text(size: 9.1pt, fill: c-primary)[#eval(introduce, mode: "markup")]
  ]
]

#let render_projects(projects) = [
  #section_title("프로젝트", "Projects")
  #for project in projects [
    #block(
      fill: c-surface,
      stroke: 0.7pt + c-line,
      radius: 9pt,
      inset: (x: 10pt, y: 9.5pt),
      width: 100%,
      breakable: false,
    )[
      #grid(
        columns: (1fr, auto),
        column-gutter: 8pt,
        align: (left + top, right + top),
        [
          #text(size: 10.2pt, weight: 800, fill: c-primary)[#project.name]
          #v(0.18em)
          #text(size: 8.3pt, fill: c-muted, style: "italic")[#project.description]
        ],
        text(size: 7.8pt, weight: 700, fill: c-muted)[#project.period],
      )

      #v(0.36em)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 6pt,
        align: (left + top, left + top),
        chip(project.role, color: c-accent, size: 6.9pt),
        if "team" in project {
          text(size: 8pt, fill: c-muted)[#project.team]
        } else {
          []
        },
      )

      #if "overview" in project [
        #v(0.24em)
        #text(size: 8.45pt, fill: c-muted, style: "italic")[#project.overview]
      ]

      #v(0.42em)
      #set par(spacing: 0.47em)
      #for h in project.highlights [#render-highlight-item(h)]

      #v(0.42em)
      #for s in project.stack [#chip(s, color: get-tech-color(s))#h(2.8pt)]
    ]
    #v(0.5em)
  ]
]

#let render_skills(skills) = [
  #section_title("기술 스택", "Skills")
  #block(
    fill: c-surface-strong,
    stroke: 0.65pt + c-line,
    radius: 8pt,
    inset: (x: 10pt, y: 8.5pt),
    width: 100%,
  )[
    #grid(
      columns: (74pt, 1fr),
      column-gutter: 7pt,
      row-gutter: 0.56em,
      align: (left + top, left + top),
      text(size: 7.9pt, weight: 800, fill: c-muted)[Backend],
      [#for s in skills.backend.split(", ") [#chip(s, color: rgb("#2f855a"), size: 6.85pt)#h(2.2pt)]],
      text(size: 7.9pt, weight: 800, fill: c-muted)[Database],
      [#for s in skills.database.split(", ") [#chip(s, color: rgb("#1d4ed8"), size: 6.85pt)#h(2.2pt)]],
      text(size: 7.9pt, weight: 800, fill: c-muted)[Cloud],
      [#for s in skills.cloud.split(", ") [#chip(s, color: rgb("#b45309"), size: 6.85pt)#h(2.2pt)]],
    )
  ]
]

#let render_education_certs(education, certifications) = [
  #section_title("학력 및 자격", "Education & Certifications")

  #for edu in education [
    #grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      [
        #text(size: 9.45pt, weight: 760, fill: c-primary)[#edu.school]
        #v(0.1em)
        #text(size: 8.4pt, fill: c-muted)[#edu.major]
      ],
      text(size: 7.9pt, weight: 700, fill: c-muted)[#edu.period],
    )
    #v(0.33em)
  ]

  #if certifications.len() > 0 [
    #v(0.08em)
    #text(size: 7.9pt, weight: 780, fill: c-muted)[Certifications]
    #v(0.2em)
    #for cert in certifications [
      #grid(
        columns: (1fr, auto),
        align: (left + top, right + top),
        text(size: 8.75pt, fill: c-primary)[#cert.title],
        text(size: 7.8pt, fill: c-muted)[#cert.date],
      )
      #v(0.13em)
    ]
  ]
]
