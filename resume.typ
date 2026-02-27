#import "@preview/finely-crafted-cv:0.3.0": *

#show: resume.with(
  name: "Kim Huisu (김희수)",
  tagline: "AI를 도구로 지휘하며 실무 병목을 해결하는 Junior Backend Developer",
  keywords: "Java, Spring Boot, JPA, TDD, AI Workflow, MySQL, AWS",
  icon-contact-header: (
    (text("📱"), "010-8894-8093"),
    (text("📧"), link("mailto:huisukim9905@gmail.com", "huisukim9905@gmail.com")),
    (text("🔗"), link("https://github.com/Tarte12", "GitHub")),
    (text("📝"), link("https://velog.io/@emprimula/posts", "Blog (Velog)")),
  ),
)

= Professional Summary

*“AI 팀원의 팀 리더로서 데이터를 설계하고 공정을 지휘합니다.”*

- *Workflow (공정 효율화):* ‘1PR = 1 Feature’ 원칙 및 AI 기반 PR 세분화를 통해 일정 지연(2.5주)을 1주 이내로 정상화했습니다. Claude/CodeRabbit 기반의 다중 리뷰 프로세스 구축으로 효율을 극대화했습니다.
- *Technical Solution (문제 해결):* ModelMapper 제거 및 정적 팩토리 메서드 도입으로 Null 결함 차단. 비정규화된 JSON 구조를 정규화하여 시스템 확장성 확보.

= Projects

#company-heading("Cohi-Chat (개발자 커피챗 예약 서비스)", start: "2026.01", end: "Present")[
  #job-heading("Junior Backend Developer", location: "Team Project (2인)")[
    - *개요:* FastAPI -> Spring Boot 마이그레이션 및 TDD·AI 협업 기반의 공정 효율화 프로세스 구축
    - *Member 도메인 설계 및 아키텍처 개선:* 계층형(Layered) 아키텍처 재구성 및 타입 안정성이 보장되는 정적 팩토리 메서드 수동 매핑 전환
    - *데이터 정규화 및 DB 최적화:* 비정규화된 JSON 구조를 정규화 테이블로 분리, 표준 JPQL JOIN을 통한 조회 효율성 증대
    - *품질 관리 표준화:* TDD 도입 및 유스케이스 기반 테스트 전략 수립, Lint 자동화로 컴파일 단계 컨벤션 강제
    - *Tech Stack:* Java 21, Spring Boot 3.5, Spring Security, JPA, SQLite, Redis, Docker, JUnit5, Claude Code
  ]
]

= Tech Stack

- *Backend:* Java 21, Spring Boot 3.5, Spring Security, JPA/Hibernate, MySQL, Redis, SQLD
- *DevOps & Tools:* AWS, Docker, GitHub Actions, Claude Code, CodeRabbit, JUnit5
- *Strategy:* TDD, AI-driven Development, Layered Architecture, Data Normalization

= Education

#company-heading("한신대학교", start: "2019.03", end: "2025.02")[
  #job-heading("컴퓨터공학부 학사 졸업", location: "South Korea")[]
]

= ETC

- *Certifications:* SQLD (SQL 개발자) | 2024.12
- *GitHub:* 꾸준한 커밋과 프로젝트 관리를 통한 개발 역량 강화
