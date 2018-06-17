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


# WordPress.org meta plugins(Only in meta environment)
META_PLUGINS=( camptix-attendance camptix-badge-generator camptix-mailchimp email-post-changes-specific-post jquery-ui-css multi-event-sponsors wc-canonical-years wc-fonts wc-post-types wcpt wordcamp-api wordcamp-coming-soon-page wordcamp-dashboard-widgets wordcamp-docs wordcamp-forms-to-drafts wordcamp-mentors wordcamp-organizer-reminders wordcamp-payments wordcamp-payments-network wordcamp-remote-css wordcamp-reports wordcamp-participation-notifier wordcamp-site-cloner wordcamp-qbo-client wporg-profiles-wp-activity-notifier json-rest-api wordcamp-wiki wordcamp-qbo bbpress-network-templates camptix-admin-flags wordcamp-participation-notifier wordcamp-site-cloner wordcamp-qbo-client wporg-profiles-wp-activity-notifier json-rest-api wordcamp-wiki wordcamp-qbo)
for i in "${META_PLUGINS[@]}"
do :
	if [ ! -e /var/www/html/wp-content/plugins/$i ]; then
		svn co https://meta.svn.wordpress.org/sites/trunk/wordcamp.org/public_html/wp-content/plugins/$i/ /var/www/html/wp-content/plugins/$i
	fi;
	wp plugin activate $i
done


# Install campsite-2017
THEME_NAME=campsite-2017
if [ ! -e /var/www/html/wp-content/themes/$THEME_NAME ]; then
	svn co https://meta.svn.wordpress.org/sites/trunk/wordcamp.org/public_html/wp-content/themes/$THEME_NAME/ /var/www/html/wp-content/themes/$THEME_NAME
fi

# Original theme
# if [ ! -e /var/www/html/wp-content/themes/wct2018 ]; then
#	git clone https://github.com/wctokyo2018/wct2018.git /var/www/html/wp-content/themes/wct2018
#fi
#wp theme activate wct2018

