ARG PG_DOCKER_TAG=16.4-alpine

FROM postgres:$PG_DOCKER_TAG AS base
RUN apk add git
RUN apk add build-base
RUN apk add clang15
RUN apk add llvm15-dev llvm15
WORKDIR /home

ARG PGVECTOR_TAG=0.7.3
RUN git clone --branch v${PGVECTOR_TAG} https://github.com/pgvector/pgvector.git
WORKDIR /home/pgvector
RUN make
RUN make install

FROM postgres:$PG_DOCKER_TAG
COPY --from=base /usr/local/lib/postgresql/bitcode/vector.index.bc /usr/local/lib/postgresql/bitcode/vector.index.bc
COPY --from=base /usr/local/lib/postgresql/vector.so /usr/local/lib/postgresql/vector.so
COPY --from=base /usr/local/share/postgresql/extension /usr/local/share/postgresql/extension
