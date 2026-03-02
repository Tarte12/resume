// ─── Color Palette ───────────────────────────────────────────────────────────
#let c-primary = rgb("#2d3436")
#let c-accent  = rgb("#0984e3")
#let c-muted   = rgb("#636e72")
#let c-line    = rgb("#dfe6e9")

// ─── Tech Brand Colors ────────────────────────────────────────────────────────
#let tech-colors = (
  "Java 21":                 rgb("#e74c3c"),
  "Java":                    rgb("#e74c3c"),
  "Spring Boot 3.5":         rgb("#6db33f"),
  "Spring Boot":             rgb("#6db33f"),
  "Spring Security":         rgb("#6db33f"),
  "JPA/Hibernate":           rgb("#59666C"),
  "JPA":                     rgb("#59666C"),
  "Redis":                   rgb("#DC382D"),
  "PostgreSQL":              rgb("#336791"),
  "MySQL":                   rgb("#4479A1"),
  "SQLite":                  rgb("#003B57"),
  "DBMS/RDBMS":              rgb("#336791"),
  "Docker":                  rgb("#2496ED"),
  "GitHub Actions":          rgb("#2088FF"),
  "JWT":                     rgb("#e17055"),
  "OAuth2":                  rgb("#4285F4"),
  "AWS":                     rgb("#FF9900"),
  "TDD":                     rgb("#00b894"),
  "JUnit5":                  rgb("#25A162"),
  "Claude Code":             rgb("#7c3aed"),
  "CodeRabbit":              rgb("#f97316"),
)

#let get-tech-color(tech) = {
  if tech in tech-colors { tech-colors.at(tech) }
  else { c-accent }
}

// ─── Section Header ───────────────────────────────────────────────────────────
#let section_title(kr, en) = [
  #v(1.2em)
  #grid(
    columns: (auto, auto, 1fr),
    column-gutter: 6pt,
    align: horizon,
    text(size: 13pt, weight: 800, fill: c-primary)[#kr],
    text(size: 9pt,  weight: 600, fill: c-muted)[#en],
    box(height: 0.8pt, width: 100%, fill: c-line),
  )
  #v(0.6em)
]

// ─── Badge ────────────────────────────────────────────────────────────────────
#let badge(body, color: c-accent) = box(
  fill:   color.lighten(90%),
  stroke: 0.5pt + color.lighten(50%),
  radius: 4pt,
  inset:  (x: 5pt, y: 2.5pt),
)[#text(size: 7.5pt, weight: 700, fill: color)[#body]]

#let tech-badge(tech) = badge(tech, color: get-tech-color(tech))

// ─── Highlight Tag Colors & Renderer ──────────────────────────────────────────
#let tag-colors = (
  "보안": rgb("#e74c3c"),
  "설계": rgb("#0984e3"),
  "FE":   rgb("#f39c12"),
  "품질": rgb("#00b894"),
)

#let render-highlight-item(h) = {
  if h.starts-with("[") {
    let parts = h.slice(1).split("] ")
    if parts.len() >= 2 {
      let tag   = parts.at(0)
      let rest  = parts.slice(1).join("] ")
      let color = if tag in tag-colors { tag-colors.at(tag) } else { c-accent }
      grid(
        columns: (auto, 1fr),
        column-gutter: 6pt,
        align: (left + top, left + top),
        badge(tag, color: color),
        text(size: 9pt, fill: c-primary)[#rest],
      )
    } else {
      text(size: 9pt, fill: c-primary)[• #h]
    }
  } else {
    text(size: 9pt, fill: c-primary)[• #h]
  }
}

// ─── Introduce ────────────────────────────────────────────────────────────────
#let render_introduce(introduce) = [
  #section_title("자기소개", "Introduce")
  #block(
    fill:   c-accent.lighten(97%),
    stroke: (left: 2.5pt + c-accent.lighten(30%)),
    radius: (right: 6pt),
    inset:  (x: 12pt, y: 11pt),
    width:  100%,
  )[
    #set par(leading: 0.75em, justify: true)
    #text(size: 9.5pt, fill: c-primary)[
      #eval(introduce, mode: "markup")
    ]
  ]
]

// ─── Projects ─────────────────────────────────────────────────────────────────
#let render_projects(projects) = [
  #section_title("프로젝트", "Projects")
  #for project in projects [
    // 프로젝트명 + 기간
    #grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      [
        #text(size: 11pt, weight: 800, fill: c-primary)[#project.name]
        #h(0.5em)
        #text(size: 9pt, fill: c-muted, style: "italic")[#project.description]
      ],
      text(size: 8.5pt, weight: 600, fill: c-muted)[#project.period],
    )
    #v(0.15em)
    // 역할 + 팀 구성
    #grid(
      columns: (auto, 1fr),
      column-gutter: 8pt,
      text(size: 9pt, weight: 700, fill: c-accent)[#project.role],
      if "team" in project {
        text(size: 8.5pt, fill: c-muted)["/ " + project.team]
      },
    )
    #v(0.35em)
    // 개요
    #if "overview" in project [
      #text(size: 9pt, fill: c-muted, style: "italic")[#project.overview]
      #v(0.3em)
    ]
    // 하이라이트
    #block[
      #set par(leading: 0.6em, spacing: 0.7em)
      #for h in project.highlights [
        #render-highlight-item(h)
      ]
    ]
    #v(0.5em)
    // 기술 뱃지
    #for s in project.stack [#tech-badge(s)#h(3pt)]
    #v(1.4em)
  ]
]

// ─── Skills ───────────────────────────────────────────────────────────────────
#let render_skills(skills) = [
  #section_title("기술 스택", "Skills")
  #grid(
    columns: (100pt, 1fr),
    row-gutter: 0.9em,
    column-gutter: 10pt,
    align: (left + top, left + top),
    text(size: 8.5pt, weight: 800, fill: c-muted)[Backend],
    [#for s in skills.backend.split(", ") [#badge(s, color: rgb("#6db33f"))#h(3pt)]],

    text(size: 8.5pt, weight: 800, fill: c-muted)[Database],
    [#for s in skills.database.split(", ") [#badge(s, color: rgb("#336791"))#h(3pt)]],

    text(size: 8.5pt, weight: 800, fill: c-muted)[Cloud],
    [#for s in skills.cloud.split(", ") [#badge(s, color: rgb("#FF9900"))#h(3pt)]],
  )
]

// ─── Education & Certifications (합쳐진 섹션) ────────────────────────────────
#let render_education_certs(education, certifications) = [
  #section_title("학력 및 자격증", "Education & Certifications")
  #for edu in education [
    #grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      [
        #text(size: 10pt, weight: 700, fill: c-primary)[#edu.school]
        #h(0.5em)
        #text(size: 9pt, fill: c-muted)[#edu.major]
      ],
      text(size: 8.5pt, weight: 600, fill: c-muted)[#edu.period],
    )
    #v(0.5em)
  ]
  #v(0.2em)
  #text(size: 8.5pt, weight: 800, fill: c-muted)[Certifications]
  #v(0.4em)
  #for cert in certifications [
    #grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      text(size: 9.5pt, fill: c-primary)[• #cert.title],
      text(size: 8.5pt, fill: c-muted)[#cert.date],
    )
    #v(0.3em)
  ]
]
