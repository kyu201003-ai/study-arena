# Study Arena

친구와 방 코드를 공유하거나 랜덤 매칭으로 만나는 학습 대결 웹앱의 첫 버전입니다.

## 구현된 기능
- Supabase 이메일 회원가입 및 로그인
- 닉네임 표시
- 대결방 생성 및 6자리 코드 참가
- 대기 중인 방을 이용한 기본 랜덤 매칭
- Supabase Realtime으로 상대 입장 상태 반영

퀴즈 진행, 점수 집계, 랭킹은 다음 개발 단계입니다.

## Supabase 연결
1. https://supabase.com 에서 프로젝트를 생성합니다.
2. Project Settings → API에서 Project URL과 anon/public key를 복사합니다.
3. index.html 스크립트의 SUPABASE_URL 및 SUPABASE_ANON_KEY 값을 교체합니다.
4. Supabase SQL Editor에서 supabase/schema.sql 내용을 실행합니다.
5. Authentication → URL Configuration에서 배포할 사이트 주소를 허용된 Redirect URLs에 추가합니다.

## GitHub Pages 배포
1. 저장소 Settings → Pages로 이동합니다.
2. Build and deployment에서 Deploy from a branch를 선택합니다.
3. Branch는 main, 폴더는 / (root)로 저장합니다.
4. 배포 주소를 Supabase Auth의 Redirect URLs에도 추가합니다.

## 보안 참고
브라우저에는 anon/public key만 사용하세요. service_role 키는 절대 프론트엔드에 넣지 마세요. 테이블 접근은 RLS 정책으로 제한합니다.
