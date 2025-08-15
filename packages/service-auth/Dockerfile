FROM node:22-alpine AS builder

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

RUN apk add --no-cache openjdk21 bash git curl

WORKDIR /app
COPY pnpm-lock.yaml pnpm-workspace.yaml package.json nx.json /app
COPY packages/service-auth ./packages/service-auth

RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile

WORKDIR /app/packages/service-auth
RUN chmod +x ./gradlew
RUN ./gradlew dependencies --no-daemon
RUN ./gradlew build --no-daemon

WORKDIR /app
RUN pnpm exec nx run service-auth:build

FROM eclipse-temurin:21-jdk-alpine AS runner

WORKDIR /app
COPY --from=builder /app/packages/service-auth/build/libs/*.jar ./app.jar

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
