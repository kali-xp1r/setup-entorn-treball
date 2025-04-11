#!/bin/sh
cd /home/user/Documents

git config --global user.email catskills@cendrassos.net
git config --global user.name  skill17


laravel new --vue --pest --npm test-project-vue
cp /home/user/bin/env-sample ./test-project-vue/.env
cd test-project-vue
php artisan key:generate
php artisan migrate
npm install
npm run build
cd ..

laravel new --react --pest --npm test-project-react
cp /home/user/bin/env-sample ./test-project-react/.env
cd test-project-react
php artisan key:generate
php artisan migrate
npm install
npm run build
cd ..


symfony new --webapp test-project-symfony
cd test-project-symfony
composer require symfony/ux-react
npm install -D @babel/preset-react --force

