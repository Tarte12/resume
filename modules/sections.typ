#let c-primary = rgb("#2d3436")
#let c-accent = rgb("#0984e3")
#let c-muted = rgb("#636e72")
#let c-line = rgb("#dfe6e9")
#let c-soft = rgb("#f1f2f6")

#let section_title(kr, en) = [
  #v(1.2em)
  #text(size: 14pt, weight: 800, fill: c-accent)[#kr]
  #h(0.4em)
  #text(size: 8pt, weight: 600, fill: c-muted)[#upper[#en]]
  #v(-0.35em)
  #line(length: 100%, stroke: 1.2pt + c-accent)
  #v(0.6em)
]

#let badge(body, color: c-accent) = [
  #box(
    fill: c-accent.lighten(92%),
    stroke: 0.5pt + c-accent.lighten(60%),
    radius: 3pt,
    inset: (x: 5pt, y: 3pt),
  )[
    #text(size: 8pt, weight: 700, fill: c-accent)[#body]
  ]
]

#let render_summary(summary) = [
  #section_title("핵심 요약", "summary")
  #text(size: 10pt, fill: c-primary)[
    #summary.workflow #summary.technical
  ]
]

#let render_projects(projects) = [
  #section_title("프로젝트", "projects")
  #for project in projects [
    #grid(
      columns: (1fr, auto),
      [
        #text(size: 12.5pt, weight: 800, fill: c-primary)[#project.name]
        #h(0.5em)
        #text(size: 9.5pt, fill: c-muted)[#project.description]
      ],
      [
        #text(size: 9pt, weight: 700, fill: c-muted)[#project.period]
      ]
    )
    #v(0.1em)
    #text(size: 10pt, weight: 700, fill: c-accent)[#project.role]
    #v(0.4em)

    #grid(
      columns: (1fr),
      row-gutter: 0.5em,
      ..project.highlights.map(h => [
        #text(size: 9.5pt, fill: c-primary)[• #h]
      ])
    )

    #v(0.6em)
    #stack(
      dir: ltr,
      spacing: 5pt,
      ..project.stack.map(s => badge(s))
    )
    #v(1.5em)
  ]
]

#let render_skills(skills) = [
  #section_title("기술 스택", "skills")
  #grid(
    columns: (110pt, 1fr),
    row-gutter: 1.1em,
    column-gutter: 12pt,
    [#text(size: 9.5pt, weight: 800, fill: c-accent)[Language/Framework]],
    [#stack(dir: ltr, spacing: 5pt, ..skills.language_framework.split(", ").map(s => badge(s)))],
    
    [#text(size: 9.5pt, weight: 800, fill: c-accent)[Database]],
    [#stack(dir: ltr, spacing: 5pt, ..skills.data.split(", ").map(s => badge(s)))],
    
    [#text(size: 9.5pt, weight: 800, fill: c-accent)[Security/Auth]],
    [#stack(dir: ltr, spacing: 5pt, ..skills.security_auth.split(", ").map(s => badge(s)))],
    
    [#text(size: 9.5pt, weight: 800, fill: c-accent)[Infra/Quality]],
    [#stack(dir: ltr, spacing: 5pt, ..skills.infra_quality.split(", ").map(s => badge(s)))],
  )
]

#let render_education(education) = [
  #section_title("학력", "education")
  #for edu in education [
    #grid(
      columns: (1fr, auto),
      [
        #text(size: 10.5pt, weight: 700, fill: c-primary)[#edu.school]
        #h(0.5em)
        #text(size: 9.5pt, fill: c-muted)[#edu.major]
      ],
      [
        #text(size: 9pt, weight: 600, fill: c-muted)[#edu.period]
      ]
    )
  ]
]

#let render_etc(etc) = [
  #section_title("기타 활동 및 자격", "etc")
  #for item in etc [
    #grid(
      columns: (1fr, auto),
      [
        - #text(size: 9.5pt, fill: c-primary)[#item.title]
      ],
      [
        #text(size: 9pt, fill: c-muted)[#item.date]
      ]
    )
  ]
]
