#let c-primary = rgb("#12344d")
#let c-accent = rgb("#1f6f8b")
#let c-muted = rgb("#56616b")
#let c-line = rgb("#d4dde3")
#let c-soft = rgb("#f4f8fb")

#let section_title(kr, en) = [
  #grid(
    columns: (1fr, auto),
    align: (left, bottom),
    column-gutter: 8pt,
    [#text(size: 12.5pt, weight: 700, fill: c-primary)[#kr]],
    [#text(size: 7.5pt, tracking: 1.2pt, weight: 700, fill: c-muted)[#upper[#en]]],
  )
  #v(-0.15em)
  #line(length: 100%, stroke: 0.75pt + c-line)
  #v(0.3em)
]

#let metric_card(title, body, tone: c-accent) = [
  #box(
    fill: c-soft,
    stroke: 0.55pt + c-line,
    radius: 5pt,
    inset: 8pt,
  )[
    #text(size: 8pt, tracking: 0.8pt, weight: 700, fill: tone)[#upper[#title]]
    #v(0.2em)
    #text(size: 9.2pt, fill: c-primary)[#body]
  ]
]

#let render_summary(summary) = [
  #section_title("핵심 요약", "summary")
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 8pt,
    metric_card("Workflow", summary.workflow, tone: rgb("#2f7d4a")),
    metric_card("Technical", summary.technical, tone: rgb("#1b5f8a")),
  )
]

#let render_projects(projects) = [
  #section_title("프로젝트", "projects")
  #for project in projects [
    #box(
      fill: c-soft,
      stroke: 0.55pt + c-line,
      radius: 6pt,
      inset: 9pt,
    )[
      #grid(
        columns: (1fr, auto),
        column-gutter: 8pt,
        [
          #text(size: 11.5pt, weight: 700, fill: c-primary)[#project.name]
          #h(6pt)
          #text(size: 9.4pt, fill: c-muted)[#project.description]
        ],
        [
          #text(size: 8.8pt, weight: 600, fill: c-muted)[#project.period]
        ],
      )
      #v(0.25em)
      #text(size: 9.2pt, weight: 600, fill: c-accent)[#project.role]
      #v(0.35em)

      #for highlight in project.highlights [
        - #text(size: 9.2pt, fill: c-primary)[#highlight]
      ]

      #v(0.35em)
      #text(size: 8.3pt, weight: 700, fill: c-muted)[STACK]
      #line(length: 100%, stroke: 0.45pt + c-line)
      #text(size: 8.7pt, fill: c-muted)[#project.stack.join(" · ")]
    ]
    #v(0.4em)
  ]
]

#let render_skills(skills) = [
  #section_title("기술 스택", "skills")
  #box(
    fill: c-soft,
    stroke: 0.55pt + c-line,
    radius: 6pt,
    inset: 8pt,
  )[
    #grid(
      columns: (95pt, 1fr),
      row-gutter: 0.6em,
      column-gutter: 8pt,
      [#text(size: 8.4pt, weight: 700, fill: c-accent)[Framework]],
      [#text(size: 8.8pt, fill: c-primary)[#skills.language_framework]],
      [#text(size: 8.4pt, weight: 700, fill: c-accent)[Data]],
      [#text(size: 8.8pt, fill: c-primary)[#skills.data]],
      [#text(size: 8.4pt, weight: 700, fill: c-accent)[Security]],
      [#text(size: 8.8pt, fill: c-primary)[#skills.security_auth]],
      [#text(size: 8.4pt, weight: 700, fill: c-accent)[Infra/Quality]],
      [#text(size: 8.8pt, fill: c-primary)[#skills.infra_quality]],
    )
  ]
]

#let render_education_and_etc(education, etc) = [
  #section_title("학력 및 기타", "education")
  #box(
    fill: c-soft,
    stroke: 0.55pt + c-line,
    radius: 6pt,
    inset: 8pt,
  )[
    #for edu in education [
      #text(size: 9.3pt, weight: 700, fill: c-primary)[#edu.school]
      #h(4pt)
      #text(size: 8.9pt, fill: c-muted)[#edu.major]
      #h(4pt)
      #text(size: 8.6pt, fill: c-muted)[#edu.period]
    ]

    #v(0.45em)
    #line(length: 100%, stroke: 0.45pt + c-line)
    #v(0.35em)

    #for item in etc [
      - #text(size: 8.9pt, fill: c-primary)[#item.title] #text(size: 8.6pt, fill: c-muted)[| #item.date]
    ]
  ]
]
