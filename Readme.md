# Проект "Merch Store"

"Merch Store" — это веб-приложение, разработанное с использованием Django и Docker, предназначенное для управления и продажи мерчандайзинговой продукции.

## Установка и запуск

1. **Клонирование репозитория**

   ```bash
   git clone https://github.com/richesel-student/merch-store.git
   cd merch-store
   ```

2. **Создание и запуск контейнеров**

   Используйте `docker-compose` для сборки и запуска контейнеров:

   ```bash
   docker-compose up --build
   ```


3. **Создание суперпользователя**

   Для доступа к административной панели Django создайте суперпользователя:

   ```bash
    docker exec -it django_app bash 
    ```
   затем
   ```bash
    python manage.py createsuperuser
   ```

4. **Доступ к приложению**

   После выполнения вышеуказанных шагов приложение будет доступно по адресам: `http://localhost:8000/api/users/login`
   `http://localhost:8000/api/users/`

   Административная панель Django доступна по адресу: `http://localhost:8000/admin/`


## Переменные окружения

Для настройки базы данных и других параметров используйте переменные окружения. Вы можете создать файл `.env` в корневой директории проекта и определить следующие переменные:

```env
POSTGRES_DB=mydatabase
POSTGRES_USER=myuser
POSTGRES_PASSWORD=mypassword
```


## Ошибки
1. Ошибки в базе данных  связаные с миграциями.
   
   **Решение**
 ```bash
   docker volume ls
   docker volume rm merch-store_postgres_data
   ```



 

Для получения дополнительной информации: @RinatDevlikamov

