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
  "Redis Blacklist":         rgb("#DC382D"),
  "PostgreSQL":              rgb("#336791"),
  "MySQL":                   rgb("#4479A1"),
  "SQLite":                  rgb("#003B57"),
  "Docker":                  rgb("#2496ED"),
  "GitHub Actions":          rgb("#2088FF"),
  "JWT":                     rgb("#e17055"),
  "OAuth2":                  rgb("#4285F4"),
  "Bucket4j Rate Limiting":  rgb("#9b59b6"),
  "TDD":                     rgb("#00b894"),
  "JUnit5":                  rgb("#25A162"),
  "Claude Code":             rgb("#7c3aed"),
  "CodeRabbit":              rgb("#f97316"),
)

#let get-tech-color(tech) = {
  if tech in tech-colors { tech-colors.at(tech) }
  else { c-accent }
}

// ─── Section Header: "한국어  English  ──────────────────────────────────" ────
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

// ─── Summary ──────────────────────────────────────────────────────────────────
#let render_summary(summary) = [
  #section_title("핵심 요약", "Summary")
  #block(
    fill:   c-accent.lighten(95%),
    stroke: (left: 3pt + c-accent),
    radius: (right: 4pt),
    inset:  (x: 10pt, y: 9pt),
    width:  100%,
  )[
    #set par(leading: 0.7em)
    #text(size: 9.5pt, fill: c-primary)[• #summary.workflow] \
    #v(0.2em)
    #text(size: 9.5pt, fill: c-primary)[• #summary.technical]
  ]
]

// ─── Projects ─────────────────────────────────────────────────────────────────
#let render_projects(projects) = [
  #section_title("프로젝트", "Projects")
  #for project in projects [
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
    #text(size: 9pt, weight: 700, fill: c-accent)[#project.role]
    #v(0.35em)
    #block[
      #set par(leading: 0.6em, spacing: 0.55em)
      #for h in project.highlights [
        #text(size: 9pt, fill: c-primary)[• #h]
      ]
    ]
    #v(0.5em)
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
    text(size: 8.5pt, weight: 800, fill: c-muted)[Language/Framework],
    [#for s in skills.language_framework.split(", ") [#badge(s, color: rgb("#6db33f"))#h(3pt)]],

    text(size: 8.5pt, weight: 800, fill: c-muted)[Database],
    [#for s in skills.data.split(", ") [#badge(s, color: rgb("#336791"))#h(3pt)]],

    text(size: 8.5pt, weight: 800, fill: c-muted)[Security/Auth],
    [#for s in skills.security_auth.split(", ") [#badge(s, color: rgb("#e17055"))#h(3pt)]],

    text(size: 8.5pt, weight: 800, fill: c-muted)[Infra/Quality],
    [#for s in skills.infra_quality.split(", ") [#badge(s, color: rgb("#2496ED"))#h(3pt)]],
  )
]

// ─── Education ────────────────────────────────────────────────────────────────
#let render_education(education) = [
  #section_title("학력", "Education")
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
]

// ─── Etc ──────────────────────────────────────────────────────────────────────
#let render_etc(etc) = [
  #section_title("기타 활동 및 자격", "Etc")
  #for item in etc [
    #grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      text(size: 9.5pt, fill: c-primary)[• #item.title],
      text(size: 8.5pt, fill: c-muted)[#item.date],
    )
    #v(0.4em)
  ]
]
