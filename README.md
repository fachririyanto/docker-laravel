# Setup Docker
Untuk menjalankan aplikasi laravel di repo ini, kamu harus masuk dulu ke dalam folder projek dengan cara buka terminal dan arahkan ke dalam folder projek seperti kode berikut:
cd docker-laravel

Setelah itu jalankan kode berikut pada terminal untuk membuat docker image.
docker build -t laravel-docker .

Lalu jalankan kode berikut pada terminal untuk menjalankan/membuat docker container.
docker-compose up -d

Atau jika kamu menggunakan MacOS, bisa dengan menjalankan kode berikut pada terminal (menggunakan Makefile).
make setup

Setelah selesai meng-install docker, ada 2 container yang dapat kamu akses, yaitu:
- Web Server (http://localhost:9000)
- PHPMyAdmin (http://localhost:9090) dengan username: "root" & password: "password".

# Install Laravel
Pada terminal, ketikan kode berikut untuk masuk ke dalam terminal container.
docker exec -it laravel-docker-app bash

Lalu jalankan kode berikut untuk mendownload laravel.
composer create-project laravel/laravel .

Setelah selesai mendownload, folder "laravel-app" yang terdapat pada folder "docker-laravel" akan terisi dengan kode file laravel yang sudah di download sebelumnya. Saat ini aplikasi laravel sudah dapat diakses dengan alamat http://localhost:9000/public

# Fix Error
Jika kamu mendapatkan error berikut saat mengakses alamat http://localhost:9000/public (biasa terjadi pada yang memakai Windows):
The stream or file "/var/www/html/storage/logs/laravel.log" could not be opened: failed to open stream: Permission denied

Kamu dapat menjalankan kode pada bagian "Set Permission" di bawah ini.

# Set Permissions
Sebelum menjalan kode berikut, kamu harus masuk terlebih dahulu ke dalam terminal docker container (lihat di bagian "Install Laravel").
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

Jika sudah, coba refresh atau akses kembali alamat http://localhost:9000/public
