echo "==> Preparing Wordpress..."
if [ ! -f "/var/www/html/wp-config.php" ];
then
    while ! mysql -h mariadb --user=$USER --password=$PASS_USER -e "SELECT schema_name FROM information_schema.schemata WHERE schema_name='$DB_NAME'";do
            echo "Database is creating..."
            sleep 2;
    done
    echo "==> ${DB_NAME} is created ! "
#    sudo mkdir -p ${WP_PATH}
#    sudo chmod -R u+rwx ${WP_PATH}
    wp core download --allow-root
    wp config create --allow-root --dbname=${DB_NAME} --dbuser=${USER} --dbpass=${PASS_USER} --dbhost=mariadb --extra-php --force --skip-check

    echo "==> Wordpress config file created"
    wp core install --path=${WP_PATH} --allow-root  --skip-email --url=${URL} --title="My Awesome Wordpress Website" --admin_user=$USER --admin_password=${PASS_USER} --admin_email=${USER}@student.42lyon.fr
    chmod -R +rwx ${WP_PATH}
    sudo -u tgriffit -i -- wp user create --path=${WP_PATH} king king@student.42lyon.fr --role=administrator --user_pass=${PASS_ROOT}
    echo "==> Updating users.. (~2 minutes)"
    sudo -u tgriffit -i -- wp user update --path=${WP_PATH} ${USER} --user_pass=${PASS_USER}
    sudo -u tgriffit -i -- wp user update --path=${WP_PATH} king --user_pass=${PASS_ROOT}
    echo "==> Users' update done"
elif [ -f "/var/www/html/wp-config.php" ];
    then echo "==> Database ${DB_NAME} found"
fi

echo "==> Wordpress is started up."
mkdir -p /run/php/
echo "==> Test of php-fpm:"
php-fpm7.3 -t
echo "==> Runing Wordpress in foreground..."
php-fpm7.3 -F