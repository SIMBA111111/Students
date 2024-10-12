# # Шаг 1: Базовый образ для сборки приложения
# FROM node:20.17-alpine AS builder

# # Рабочая директория
# WORKDIR /app

# # Копируем package.json и package-lock.json
# COPY package*.json ./

# # Устанавливаем зависимости
# RUN npm install

# # Копируем все файлы проекта
# COPY . .

# # Собираем Nuxt-приложение
# RUN npm run build

# # Шаг 2: Финальный образ для запуска приложения
# FROM node:20.17-alpine

# # Рабочая директория
# WORKDIR /app

# # Копируем собранные файлы из стадии сборки
# COPY --from=builder /app/.output /app/.output

# # Запуск продакшн-сервера
# CMD ["node", ".output/server/index.mjs"]


FROM node:20.17-alpine

# FROM node:16-alpine
# RUN npm install
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
# EXPOSE 3000
CMD ["npm", "run", "dev"]