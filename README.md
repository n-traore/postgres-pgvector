#### 1. Clone the repo and go to the postgres vector folder
```bash
git clone https://github.com/n-traore/postgres-pgvector.git && \
cd postgres-pgvector
```

#### 2. Run this command so your `.env` is not commited to version control
```bash
git update-index --assume-unchanged .env
```

#### 3. Populate the `.env` file with your values


#### 4. Build the image
```bash
docker build --tag=pgvec-rag:0.0.1 .
```
To modify the default versions of postgres and pgvector, use the build arguments. For example:
```bash
docker build --build-arg=PG_DOCKER_TAG=15.1 --build-arg=PGVECTOR_TAG=0.5.1 --tag=pgvec-rag:0.0.1 .
```

#### 5. Create the container
```bash
docker compose --env-file .env up -d
```
