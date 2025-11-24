# [Stage 1] Build 단계: Maven을 이용해 자바 소스를 컴파일하고 WAR 파일을 만듭니다.
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# 1. 라이브러리 설치를 위해 pom.xml만 먼저 복사 (캐시 활용)
COPY pom.xml .
# 의존성 다운로드 (소스 변경시에도 라이브러리 다시 받는 시간 절약)
RUN mvn dependency:go-offline

# 2. 소스 코드 복사 및 빌드 (WAR 파일 생성)
COPY src ./src
RUN mvn clean package -DskipTests

# --------------------------------------------------------

# [Stage 2] Run 단계: 만들어진 WAR 파일을 Tomcat에 넣고 실행합니다.
FROM tomcat:9.0-jdk17-temurin

# 기본 Tomcat 앱 삭제
RUN rm -rf /usr/local/tomcat/webapps/*

# [핵심] Stage 1에서 빌드된 war 파일을 복사해서 ROOT.war로 이름 변경
# 이렇게 하면 자동으로 압축이 풀리며 실행됩니다.
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]