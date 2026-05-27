<?php
error_reporting(0);

$CONF = $TMPL = array();

// The MySQL credentials
$CONF['host'] = 'DB_HOST';
$CONF['user'] = 'DB_USERNAME';
$CONF['pass'] = 'DB_PASSWORD';
$CONF['name'] = 'DB_NAME';

// The Installation URL
$CONF['url'] = 'https://cerenyaep.serv00.net/';

// The Notifications e-mail
$CONF['email'] = 'notifications@example.com';

// The themes directory
$CONF['theme_path'] = 'themes';

// The plugins directory
$CONF['plugin_path'] = 'plugins';

$action = array('admin'      => 'admin',
        'feed'      => 'feed',
        'settings'    => 'settings',
        'messages'    => 'messages',
        'post'      => 'post',
        'recover'    => 'recover',
        'profile'    => 'profile',
        'notifications'  => 'notifications',
        'search'    => 'search',
        'group'      => 'group',
        'page'      => 'page',
        'info'      => 'info'
        );

define('COOKIE_PATH', preg_replace('|https?://[^/]+|i', '', $CONF['url']).'/');
?>