---

## Requirements

- Docker Desktop (or Docker Engine + Compose)
- Git
- Node.js 20+ and npm if you want to run Vite on the host instead of the Node container`
`
---

## Project overview

The local setup uses these containers:

- **nginx**: serves HTTP on port **8080**
- **app (php-fpm)**: runs Laravel/PHP
- **mysql**: database
- **node (dev-only)**: runs Vite + Tailwind HMR on port **5173**

In production, **node is not required** (assets are built once via `npm run build` in CI / Docker build stage).

---

## 1) Clone the repository

```bash
git clone https://github.com/nbiuk-devops-lab/laravel-application.git
cd laravel-application
```

---

## 2) Create your local environment file

Copy the example env file and adjust values if needed:

```bash
cp .env.example .env
```

Recommended defaults for local development:

- `APP_ENV=local`
- `APP_DEBUG=true`

> If you run MySQL via Docker (recommended), set DB host to the **service name**:
> `DB_HOST=mysql`

---

## 3) Start the containers (dev)

Start everything (nginx + php-fpm + mysql + vite):

```bash
docker compose up -d --build
```

## 4) Install PHP dependencies (Composer) inside the app container

```bash
docker compose exec app composer install
```

---

## 5) Generate the Laravel app key

```bash
docker compose exec app php artisan key:generate
```

---

## 6) Run database migrations

```bash
docker compose exec app php artisan migrate
```

(If you have seeders)

```bash
docker compose exec app php artisan db:seed
```

---

## 7) Launch the app in the browser

- App (nginx): http://localhost:8080

If Tailwind classes do not apply, verify the Vite container is running:

```bash
docker compose ps
```
