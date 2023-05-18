echo "==> Preparing Wordpress..."
if [ ! -f "/var/www/html/wp-config.php" ];
then
    while ! mysql -h mariadb --user=$USER --password=$PASS_USER -e "SELECT schema_name FROM information_schema.schemata WHERE schema_name='$DB_NAME'";do
            echo "Database is creating..."
            sleep 8;
    done
    echo "==> ${DB_NAME} is created ! "
    wp core download --allow-root
    wp config create --allow-root --dbname=${DB_NAME} --dbuser=${USER} --dbpass=${PASS_USER} --dbhost=mariadb --extra-php --force --skip-check
    echo "==> Wordpress config file created"
    wp core install --allow-root --skip-email --url=$USER.42.fr --title="My Awesome Wordpress Website" --admin_user=$USER --admin_password=${PASS_USER} --admin_email=${USER}@student.42lyon.fr
    wp user create --allow-root King king@student.42lyon.fr --role=administrator --user_pass=${PASS_ROOT}
    echo "==> Updating users.. (~2 minutes)"
    wp user update ${USER} --allow-root --user_pass=${PASS_USER}
    wp user update King --allow-root --user_pass=${PASS_ROOT}
    echo "==> Users' update done"

    fi
echo "==> Wordpress is started up."
mkdir -p /run/php/
echo "==> Test of php-fpm:"
php-fpm7.3 -t
echo "==> Runing Wordpress in foreground..."
php-fpm7.3 -F