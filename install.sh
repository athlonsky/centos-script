#!/bin/bash

# Обновляем системные пакеты
sudo yum update -y

# Скачиваем Python
wget https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tgz

# Распаковываем
tar xvf Python-3.10.2.tgz

# Переходим в директорию для сборки и собираем
cd Python-3.10.2
./configure --enable-optimizations

# Устанавливаем Python
make altinstall

# Устанавливаем XRDP и включаем сервисы
sudo yum install -y xrdp
sudo systemctl enable xrdp
sudo systemctl start xrdp

# Устанавливаем XFCE
sudo yum groupinstall -y "Xfce"

# Создаем и ЧМОдим файл для подключения
echo "xfce4-session" > ~/.Xclients
chmod a+x ~/.Xclients

# Проверяем версию Python и установился ли он
python3.10 -V

# Перезагружаем систему
echo "Система перезагрузится через 10 секунд."
sleep 10
reboot
