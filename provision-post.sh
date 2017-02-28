#!/usr/bin/env bash

set -ex

cd /var/www/html

# Road mU-plugins
if [ ! -e /var/www/html/wp-content/plugins/mu-plugins ]; then
	svn co https://meta.svn.wordpress.org/sites/trunk/wordcamp.org/public_html/wp-content/mu-plugins/ /var/www/html/wp-content/mu-plugins
fi


# SVN plugins(May be not hosted on WP.org)
SVN_PLUGINS=( camptix-network-tools email-post-changes tagregator )

for i in "${SVN_PLUGINS[@]}"
do :
	if [ ! -e /var/www/html/wp-content/plugins/$i ]; then
		svn co https://plugins.svn.wordpress.org/$i/trunk /var/www/html/wp-content/plugins/$i
	fi;
	wp plugin activate $i
done

# Install Camptix
if [ ! -e /var/www/html/wp-content/plugins/camptix ]; then
	git clone https://github.com/Automattic/camptix.git /var/www/html/wp-content/plugins/camptix
fi
wp plugin activate camptix

# Install redux
if [ ! -e /var/www/html/wp-content/themes/wordcamp-base-v2 ]; then
	svn co https://meta.svn.wordpress.org/sites/trunk/wordcamp.org/public_html/wp-content/themes/wordcamp-base-v2/ /var/www/html/wp-content/themes/wordcamp-base-v2
fi

# Original theme
if [ ! -e /var/www/html/wp-content/themes/wct2017 ]; then
	git clone https://github.com/wctokyo2017/wct2017.git /var/www/html/wp-content/themes/wct2017
fi
wp theme activate wct2017

