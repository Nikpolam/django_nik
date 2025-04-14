#!/usr/bin/env bash
# Exit on error
set -o errexit

# Установка Python зависимостей
pip install -r requirements.txt

# Сборка фронтенда
cd frontend
npm install
npm run build
cd ..

# Сборка бэкенда + статика
python manage.py collectstatic --no-input --clear

# Миграции
python manage.py migrate

# Создание суперпользователя
python create_superuser.py

