# Kim Huisu (김희수)
### Junior Backend Developer

> **“백엔드 인증·보안·데이터 설계를 통해 서비스 안정성을 높입니다.”**

[📄 PDF 이력서 보기](https://github.com/Tarte12/resume/blob/main/Kim_Huisu_Resume.pdf)  
[⬇️ PDF 바로 다운로드](https://github.com/Tarte12/resume/raw/main/Kim_Huisu_Resume.pdf)

---

## 📂 Repository Structure
- `resume.typ`: 엔트리 템플릿 (레이아웃/조합)
- `metadata.typ`: 데이터 로더
- `data/resume.yml`: 이력서 본문 데이터
- `modules/sections.typ`: 섹션 렌더링 모듈
- `.github/workflows/build.yml`: PDF 자동 빌드/커밋

---

## 📞 Contacts
- **Phone**: 010-8894-8093
- **Email**: [huisukim9905@gmail.com](mailto:huisukim9905@gmail.com)
- **GitHub**: [github.com/Tarte12](https://github.com/Tarte12)
- **Blog**: [velog.io/@emprimula](https://velog.io/@emprimula/posts)

---

## 🚀 Summary: AI-Driven Workflow & Problem Solving

### **Workflow: 공정 효율화**
- **1PR = 1 Feature 원칙**: AI 기반 PR 세분화로 **2.5주 일정 지연을 1주 이내로 정상화**
- **다중 리뷰 프로세스**: Claude/CodeRabbit 기반 프로세스 구축으로 이슈 할당부터 PR 리뷰까지 효율화

### **Technical Solution: 문제 해결 및 설계**
- **백엔드 집중 기여**: 45일간 backend 관련 PR 28건 머지(+8,439/-1,482)
- **보안 강화**: Refresh Token Rate Limiting + Access Token Redis 블랙리스트 적용
- **API 표준화**: ApiResponseDTO 및 GlobalExceptionHandler 도입으로 응답/오류 처리 일관성 확보

---

## 🛠 Tech Stack
- **Languages & Frameworks**: Java 21, Spring Boot 3.5, Spring Security, JPA/Hibernate
- **Database**: PostgreSQL, MySQL, SQLite, Redis, SQLD 자격 보유
- **Infra & Tools**: AWS, Docker, GitHub Actions, Claude Code, CodeRabbit, JUnit5

---

## 💻 Projects

### **Cohi-Chat: 개발자를 위한 커피챗 예약 서비스**
*팀 프로젝트 (2인) / 2026.01 ~ 현재*
- **Role**: Backend Developer (인증/보안/예약 도메인)
- **개요**: Spring Boot 기반 인증/보안/예약 API 설계 및 운영 안정화

#### **주요 성과**
1. **인증 인프라 구축**: 회원가입/로그인/로그아웃/토큰 재발급 API 구현 및 JWT 인증 체계 구축
2. **보안 강화**: Access Token 블랙리스트(Redis) + Refresh Token Rate Limiting(Bucket4j) 적용
3. **소셜 로그인 구현**: Google/Kakao OAuth2 로그인 백엔드 및 운영 redirect URI 핫픽스 반영
4. **API 일관성 확보**: ApiResponseDTO + GlobalExceptionHandler 기반의 공통 응답/예외 처리 표준화
5. **데이터 정합성 개선**: TimeSlot 요일 정규화와 LocalDateTime→Instant 전환으로 시간 처리 일관화

---

## 🎓 Education
- **한신대학교** | 컴퓨터공학부 학사 (2019.03 ~ 2025.02 졸업)

---

## 🏆 ETC
- **자격증**: SQLD (SQL 개발자) | 2024.12
- **활동**: 알고리즘 문제 풀이 및 기술 블로그 운영

---

## 🧰 Local Build
```bash
typst compile resume.typ Kim_Huisu_Resume.pdf
```

---

> 이 이력서는 **Typst**로 작성되었으며, GitHub Actions를 통해 자동으로 PDF가 빌드됩니다.
> [📄 PDF 버전 다운로드 받기](https://github.com/Tarte12/resume/actions)
