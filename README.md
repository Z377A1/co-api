# 🎬 Cinematic Order API Ecosystem

A multi-language microservices API ecosystem for cinemetic order data management.

## 📋 Services

| Service | Language/Framework | Port | Submodule |
|---------|-------------------|------|-----------|
| Owners | Rust (Axum) | 8001 | [co-api-owner](co-api-owner) |
| Franchises | Go (Gin) | 8002 | [co-api-franchise](co-api-franchise) |
| Movies | Bun (Elysia) | 8003 | [co-api-movie](co-api-movie) |
| Box Office | Java (Spring Boot) | 8004 | [CoApiBoxOffice](CoApiBoxOffice) |
| Cast | C# (Minimal API) | 8005 | [CoApiCastMember](CoApiCastMember) |
| Images | Kotlin (Spring Boot) | 8006 | [CoApiImage](CoApiImage) |

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose
- Git

### Clone with Submodules
```bash
git clone --recursive https://github.com/z377a1/co-api.git
cd co-api
```
If you already cloned without submodules:
```bash
git submodule update --init --recursive
```
### Run Everything
```bash
# Make scripts executable
chmod +x *.sh

# Build and run with Docker
docker-compose up --build
```
### Update Submodules
```bash
./update-submodules.sh
```
## 🔧 Development
Each service is in its own repository and can be developed independently:

```bash
# Work on a specific service
cd co-api-owner
git checkout -b feature/new-feature
# make changes
git commit -m "Add new feature"
git push origin feature/new-feature
```
### Adding a New Submodule
```bash
git submodule add https://github.com/your-username/new-api.git new-api
git commit -m "Add new-api submodule"
```
### 🐳 Docker Deployment
```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```
### 📊 API Gateway
- All services are accessible through the Nginx gateway at http://localhost/api/*

- Owners: http://localhost/api/owners

- Franchises: http://localhost/api/franchises

- Movies: http://localhost/api/movies

- Movies Swagger: http://localhost/api/movies/docs

- Box Office: http://localhost/api/boxoffice

- Cast: http://localhost/api/cast

- Images: http://localhost/api/images

## 📝 License
MIT
