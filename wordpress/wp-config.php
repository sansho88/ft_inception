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
define( 'AUTH_KEY',          'ksjD|9!yv&9~m$*i4eYQHxn/J7*(M8W?WLZwt^8Av(@nlI>8=@T5X>!rI.OVr>3y' );
define( 'SECURE_AUTH_KEY',   '(w/Eu:D_$BvbdK%+LyQHpi/2_Sc%=0_lrWOCrdWuthqnIJR$G N-^Xmq3{|^6S;z' );
define( 'LOGGED_IN_KEY',     '.8)M$i`(l{*g8g;0@8]mV,{t(~&XDd~i(N<%cI<D $,ycs}_;a<X4x9M;KSnPp^z' );
define( 'NONCE_KEY',         'zOI(Q@r-`6If>ov{Uz{$o/pxe<P dqhtd@~@0tN)<[Ja_tp%IAY55;8i6`+j.)s?' );
define( 'AUTH_SALT',         '|^J[PcQ)j2R4[DDE@d)[m%i6BKZqJH8Lhp}DhlkRBVUra0d_uJ~S:rp #}@[SF!E' );
define( 'SECURE_AUTH_SALT',  '}wV=MQrhIHQck@vyem<twVH:J*ZhT]:H7Doyw&dFBE_rKkLZn,)aEk@/t/81!ECe' );
define( 'LOGGED_IN_SALT',    ':gA%%>oa^3eeFu:.+t@+j4BaKt/UVu*m<tP$c3SJJA$)y#hQTz RKo:}+MYt;JTN' );
define( 'NONCE_SALT',        'aN5w){`A;m~<VoxaFs^jV8e.ukl>1>|C%MKWg{`.A8jsoX`:oWJ/nb<z5#.@%}l&' );
define( 'WP_CACHE_KEY_SALT', '[=zjLT64jj %GNn@:!_3}t-3oMGKyMn`<[4Szc7_0Yc]v?<n 6LAK_)V{nj)C<E@' );


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
