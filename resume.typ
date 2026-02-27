#import "@preview/finely-crafted-cv:0.3.0": *

// RanolP님 방식: 외부 데이터(YAML) 로드
#let data = yaml("resume.yml")

#show: resume.with(
  name: data.name,
  tagline: data.tagline,
  keywords: data.keywords.join(", "),
  icon-contact-header: (
    (text("📱"), data.contacts.phone),
    (text("📧"), link("mailto:" + data.contacts.email, data.contacts.email)),
    (text("🔗"), link("https://github.com/" + data.contacts.github, "GitHub")),
    (text("📝"), link(data.contacts.blog, "Blog")),
  ),
)

= Professional Summary

#data.summary.workflow
\
#data.summary.technical

= Projects

#for project in data.projects [
  #company-heading(project.name + " (" + project.description + ")", start: project.period, end: "")[
    #job-heading(project.role)[
      #for highlight in project.highlights [
        - #highlight
      ]
      - *Tech Stack:* #project.stack.join(", ")
    ]
  ]
]

= Education

#for edu in data.education [
  #company-heading(edu.school, start: edu.period, end: "")[
    #job-heading(edu.major)[]
  ]
]

= ETC

#for item in data.etc [
  - #item.title | #item.date
]
