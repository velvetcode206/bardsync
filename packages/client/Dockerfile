FROM node:22-alpine AS builder

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

WORKDIR /app
COPY pnpm-lock.yaml pnpm-workspace.yaml package.json nx.json tsconfig.base.json /app
COPY packages/client /app/packages/client

RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm exec nx run @bardsync/client:build

FROM node:22-alpine AS runner

WORKDIR /app
COPY --from=builder /app/packages/client/.output /app/.output

EXPOSE 3000
CMD ["node", ".output/server/index.mjs"]