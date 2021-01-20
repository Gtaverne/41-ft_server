<?php
/**
 * Il s'agit d'un template assez standard complété avec les keys nécessaires
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */


/* MySQL settings */
define( 'DB_NAME',     'wordpress' );
define( 'DB_USER',     'root' );
define( 'DB_PASSWORD', '' );
define( 'DB_HOST',     'localhost' );
define( 'DB_CHARSET',  'utf8' );
define( 'DB_COLLATE',  '' );


/* MySQL database table prefix. */
$table_prefix = 'wp_';


/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         'qI<Vp_6_iq?D#|(DNor/a4GC;,As;v^r-CNy6llbJ2zHMA-T3YOmX]e1|<h)@|T`');
define('SECURE_AUTH_KEY',  'pQ/0dQr|r1!*Da^VrQ(FNAQE1|{iQ-4~tU5cZd<)ecAni,0HTPgOMke|-/afNe--');
define('LOGGED_IN_KEY',    ':Z^K)v;w#aUJCKu5pB`{I7fe~,5T!u}~}P7Q=L9rjT*@l us&|*;t8%lrd-:>@.k');
define('NONCE_KEY',        'q=3,Y$/>uc4waR4c|8h>Wyk9U>7/Mf?,*^s*F1GoVJn1_p-ff [)7*lD&*Rk!vy7');
define('AUTH_SALT',        'Uv|dV?AC7=Y*?.%AA]LBVl%}upi3}sxG@t+AWVs5*Q`P_l~a81?dBP!dG)49VdxA');
define('SECURE_AUTH_SALT', ',9%8F;IsM:d@=d5/T*9M3-}[7>4~ay+r|rm9*yB0j#^r8T-Wu`YQxrlch+7- ]w8');
define('LOGGED_IN_SALT',   'I/W;~@u26O;1+(zD(Ty4|Xvt;/0ZT$!FYk,Du5@?+G>N3g0ZYb-@[>)}ju)VnO<^');
define('NONCE_SALT',       's3tP5F66m-KAq(i>mbJMJC[luio_+!+=)NJy{VvxmfSe!ijU+YwNG0I;VGPD>s?D');

/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
