# 📄 Kim Huisu (김희수)
### **Backend Engineer**

> **"안정적인 인프라와 보안 설계를 통해 지속 가능한 서비스를 구축합니다."**

[![PDF Download](https://img.shields.io/badge/Download-PDF-red?style=for-the-badge&logo=adobeacrobatreader)](https://github.com/Tarte12/resume/raw/main/Kim_Huisu_Resume.pdf)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github)](https://github.com/Tarte12)
[![Blog](https://img.shields.io/badge/Blog-11B48A?style=for-the-badge&logo=velog)](https://velog.io/@emprimula/posts)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:huisukim9905@gmail.com)

---

## 🚀 Core Highlights

### **1. AI-Driven Workflow & Process Optimization**
- **1PR = 1 Feature 원칙**: AI 기반 PR 세분화를 통해 **2.5주 일정 지연을 1주 이내로 정상화**
- **Automated Review**: Claude Code 및 CodeRabbit을 활용한 다중 리뷰 프로세스로 코드 품질과 리뷰 속도 동시 확보

### **2. Security & Backend Reliability**
- **인증 보안 강화**: Refresh Token Rotation 및 Redis 블랙리스트 기반 Access Token 즉시 무효화 체계 구축
- **API 표준화**: `ApiResponseDTO` 및 `GlobalExceptionHandler` 도입으로 시스템 전반의 응답 일관성 및 에러 핸들링 고도화

### **3. Scalable Architecture**
- **데이터 정합성**: TimeSlot 요일 정규화 및 `Instant` 기반 시간 처리 일관화로 글로벌 확장성 고려한 설계

---

## 🛠 Tech Stack

**Languages & Frameworks**  
![Java](https://img.shields.io/badge/Java_21-ED8B00?style=flat-square&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot_3.5-6DB33F?style=flat-square&logo=springboot&logoColor=white)
![Spring Security](https://img.shields.io/badge/Spring_Security-6DB33F?style=flat-square&logo=springsecurity&logoColor=white)
![JPA](https://img.shields.io/badge/JPA_Hibernate-59666C?style=flat-square&logo=hibernate&logoColor=white)

**Infrastructure & Database**  
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white)
![Redis](https://img.shields.io/badge/Redis-DC382D?style=flat-square&logo=redis&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=flat-square&logo=amazon-aws&logoColor=white)

**DevOps & Tools**  
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat-square&logo=githubactions&logoColor=white)
![JUnit5](https://img.shields.io/badge/JUnit5-25A162?style=flat-square&logo=junit5&logoColor=white)
![Claude](https://img.shields.io/badge/Claude_Code-7c3aed?style=flat-square&logo=anthropic&logoColor=white)

---

## 💻 Key Project: Cohi-Chat
**개발자를 위한 커피챗 예약 서비스** *(팀 프로젝트 / 2026.01 ~ 현재)*

- **핵심 역할**: Backend Infrastructure & Security Design
- **주요 성과**:
  - JWT 기반 인증 체계 및 OAuth 2.0(Google, Kakao) 통합
  - Refresh Token Rotation 및 Rate Limiting 적용을 통한 보안 취약점 보완
  - TDD 기반 유스케이스 검증 및 테스트 환경 추상화를 통한 개발 효율 증대

---

## 📂 Repository Structure

```text
.
├── src/
│   ├── data/          # 이력서 본문 데이터 (YAML)
│   ├── modules/       # 섹션별 렌더링 모듈 (Typst)
│   ├── metadata.typ   # 데이터 로더 및 설정
│   └── resume.typ     # 메인 엔트리 레이아웃
├── .github/           # PDF 자동 빌드 워크플로우
└── Kim_Huisu_Resume.pdf  # 자동 생성된 최종 이력서
```

### **Local Build**
```bash
typst compile src/resume.typ Kim_Huisu_Resume.pdf
```

---

> 이 이력서는 **Typst**로 작성되었으며, GitHub Actions를 통해 소스 수정 시 자동으로 PDF가 빌드됩니다.
