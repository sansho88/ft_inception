<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '42Lyon' );

/** Database username */
define( 'DB_USER', 'tgriffit' );

/** Database password */
define( 'DB_PASSWORD', '42School' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'zsm.w:q/?BUC;k<>Y~] 2/%GA3_+$e7Y%(F7u0EQBtr&}^C(8EF!d3!dV08Yh&ni' );
define( 'SECURE_AUTH_KEY',   'YK(<Vs25[E7F7npo[FHCGn/ms:zf>9y5XQJ/prL*$fqcqH<mVjpGpigm46e>WLPf' );
define( 'LOGGED_IN_KEY',     'DTP|NTD>-kHEjGUmaEyL?u|kkG9J$1H1<DpE!,[nt=ofOi3|t0;K/g qjyczh=%7' );
define( 'NONCE_KEY',         'hq@dO8p2o_`4qZtl-L]!4CE*u!3%X72OoHm+Bt%}DA5TTQLMSGE^SJb<AKVxd./Q' );
define( 'AUTH_SALT',         ']Go?tN5c(;5:?:OeL IsnR5]:UC0h?h+)Y{O``BL5k$c#xkE*ZdPiFddHcPzMYp[' );
define( 'SECURE_AUTH_SALT',  'h#7Zhjn8XgAhl4[$|>CH&W5C%>{Qy8Q>47N$NJzsjGPM>j+GExsEG4mZQmr:5=Uc' );
define( 'LOGGED_IN_SALT',    '_GVcJX(RDp5v }VVkf&I 4</Kw7~6Y9Oh[kw_3!LlM+%/.E0!]qJfHG$k&E^S4$9' );
define( 'NONCE_SALT',        'TpChCI5;?Po_=}=Zvd Xs5BKHAZ v|H8m~p_oCWk)~ZoN,b?#/^2FR&-{qe_cMeH' );
define( 'WP_CACHE_KEY_SALT', 'GbSQ4K|T$fDMNITf+%ph,GhP20IS&(?!Mvp9?g1O>K^:>cmTrN{E2KzYUx/=w8PO' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
