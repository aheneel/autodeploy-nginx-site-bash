#!/bin/bash

# Останавливаем выполнение, если любая из команд вернет ошибку
set -e

# 1. Устанавливаем необходимые пакеты
sudo apt-get update
sudo apt-get install -y unzip golang

# 2. Скачиваем архив
sudo wget -O /root/autodeploy-nginx-site-main.zip \
  https://github.com/aheneel/autodeploy-nginx-site/archive/refs/heads/main.zip

# 3. Распаковываем архив в /root
sudo unzip /root/autodeploy-nginx-site-main.zip -d /root

# 4. Создаем папку install и переносим файлы
sudo mkdir -p /root/install
sudo mv /root/autodeploy-nginx-site-main/* /root/install/

# 5. Переходим в /root/install
cd /root/install

# 6. Компилируем все .go файлы (1.go, 2.go, 3.go, 4.go, 5.go, 6.go, autodeploy.go)
#    При компиляции go build <file.go> получится бинарник с таким же именем без .go
sudo go build 1.go
sudo go build 2.go
sudo go build 3.go
sudo go build 4.go
sudo go build 5.go
sudo go build 6.go
sudo go build autodeploy.go

# 7. Удаляем исходники .go
sudo rm 1.go 2.go 3.go 4.go 5.go 6.go autodeploy.go

# 8. Даем права на исполнение
sudo chmod +x 1 2 3 4 5 6 autodeploy

# 9. Запускаем нужные бинарники (1,2,3,4,5,6). autodeploy не запускаем
sudo ./1
sudo ./2
sudo ./3
sudo ./4
sudo ./5
sudo ./6
