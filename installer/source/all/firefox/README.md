https://superuser.com/questions/1424478/can-i-hide-native-tabs-at-the-top-of-firefox
about:config -> toolkit.legacyUserProfileCustomizations.stylesheets true

mkdir ~/Library/Application\ Support/Firefox/Profiles/<replace-with-profile-id>.default-release/chrome
cp userChrome.css ~/Library/Application\ Support/Firefox/Profiles/<replace-with-profile-id>.default-release/chrome/userChrome.css
