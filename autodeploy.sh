#!/bin/bash

# Останавливаем выполнение, если любая из команд вернет ошибку
set -e

# Устанавливаем необходимые пакеты
sudo apt-get update
sudo apt-get install -y unzip golang

# Скачиваем архив
sudo wget -O /root/autodeploy-nginx-site-main.zip \
  https://github.com/aheneel/autodeploy-nginx-site/archive/refs/heads/main.zip

# Распаковываем
sudo unzip /root/autodeploy-nginx-site-main.zip -d /root

# Создаем папку install и переносим файлы
sudo mkdir -p /root/install
sudo mv /root/autodeploy-nginx-site-main/* /root/install/

# Даем права на исполнение скриптам
sudo chmod +x /root/install/*

# Переходим в install и запускаем скрипты
cd /root/install
sudo ./1
sudo ./2
sudo ./3
sudo ./4
sudo ./5
sudo ./6
