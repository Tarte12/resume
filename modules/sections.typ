#import "@preview/finely-crafted-cv:0.3.0": *

#let render_summary(summary) = [
  = Professional Summary#super[핵심 요약]

  #pad(left: 0.2em)[
    #text(weight: 650, size: 10.5pt, fill: rgb("#2b8a3e"))[Workflow] \
    - #summary.workflow

    #v(0.45em)

    #text(weight: 650, size: 10.5pt, fill: rgb("#1971c2"))[Technical] \
    - #summary.technical
  ]
]

#let render_projects(projects) = [
  = Projects#super[프로젝트]

  #for project in projects [
    #v(0.4em)
    #company-heading(text(weight: 700, size: 12pt)[#project.name] + " (" + project.description + ")", start: project.period, end: "")[
      #job-heading(text(weight: 600, fill: rgb("#495057"))[#project.role])[
        #for highlight in project.highlights [
          - #highlight
        ]

        #v(0.25em)
        - *Tech Stack:* #text(fill: rgb("#495057"))[#project.stack.join("  |  ")]
      ]
    ]
  ]
]

#let render_skills(skills) = [
  = Skills#super[기술 스택]

  #pad(left: 0.2em)[
    #grid(
      columns: (130pt, 1fr),
      row-gutter: 0.8em,
      text(weight: 600)[Language & Framework], text(fill: rgb("#333333"))[#skills.language_framework],
      text(weight: 600)[Data], text(fill: rgb("#333333"))[#skills.data],
      text(weight: 600)[Security & Auth], text(fill: rgb("#333333"))[#skills.security_auth],
      text(weight: 600)[Infra & Quality], text(fill: rgb("#333333"))[#skills.infra_quality]
    )
  ]
]

#let render_education_and_etc(education, etc) = [
  = Education & ETC#super[학력 및 기타]

  #for edu in education [
    #company-heading(edu.school, start: edu.period, end: "")[
      #job-heading(edu.major)[]
    ]
  ]

  #v(0.5em)

  #for item in etc [
    - #text(weight: 600)[#item.title] #text(fill: rgb("#777777"))[| #item.date]
  ]
]
