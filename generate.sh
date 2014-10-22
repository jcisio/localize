#!/bin/sh
# Dossier de travail
DIR=.
LOCALE=vi
DRUSH=`which drush`

#############
# Version 7
#############
# Telechargement Drupal
$DRUSH dl drupal-7 -q --drupal-project-rename=drupal7 --destination=/tmp
# Detection de version
VERSION=`$DRUSH status drupal-version --format=list -r /tmp/drupal7`
# Recuperation + copie de la trad de la version
wget http://ftp.drupal.org/files/translations/7.x/drupal/drupal-$VERSION.$LOCALE.po --output-document=/tmp/drupal-$VERSION.$LOCALE.po --quiet
cp /tmp/drupal-$VERSION.$LOCALE.po /tmp/drupal7/profiles/minimal/translations/
cp /tmp/drupal-$VERSION.$LOCALE.po /tmp/drupal7/profiles/standard/translations/
rm /tmp/drupal-$VERSION.$LOCALE.po
mv /tmp/drupal7 /tmp/drupal-$VERSION

# Tarball
tar cpzf $DIR/drupal-7-$LOCALE.latest.tar.gz --directory /tmp drupal-$VERSION
rm -r /tmp/drupal-$VERSION

#############
# Version 6
#############
# Telechargement Drupal
$DRUSH dl drupal-6 -q --drupal-project-rename=drupal6 --destination=/tmp
# Detection de version
VERSION=`$DRUSH status drupal-version --format=list -r /tmp/drupal6`
# Recuperation + copie de la trad de la version
wget http://ftp.drupal.org/files/translations/6.x/drupal/drupal-$VERSION.$LOCALE.po --output-document=/tmp/drupal-$VERSION.$LOCALE.po --quiet
mkdir /tmp/drupal6/profiles/default/translations
cp /tmp/drupal-$VERSION.$LOCALE.po /tmp/drupal6/profiles/default/translations/vi.po
rm /tmp/drupal-$VERSION.$LOCALE.po
mv /tmp/drupal6 /tmp/drupal-$VERSION

# Tarball
tar cpzf $DIR/drupal-6-$LOCALE.latest.tar.gz --directory /tmp drupal-$VERSION
rm -r /tmp/drupal-$VERSION

exit
