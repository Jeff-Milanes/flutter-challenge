# coding_challenge

## Challenge
Write the following application in Flutter/Dart:

User logs in either with Facebook API, Gmail, and Firebase Auth for Login. No need to create User Registration for Firebase auth.

Upon successful login, user can do the following:

Display his location on a map, then by pressing a button, should be routed to a random location within 10 kilometers of his location. User has the option to see the turn by turn navigation on the screen.

Using another widget, user can also browse and read current newsfeeds.

Another widget, create a calculator that does the MDAS operation with parenthesis (e.g.  7+2(4-2) /2 = 9 ) 

No need to add logout logic.
				 

Use BloC (flutter BloC or Hive) for state management on the map widget (feature a).

### Note 

.env is exposed since this app will serve as a demo and most of the API's are free to use.

please add the `key.properties` inside android folder and place the keystore in the file to use the firebase auth.

for more info regarding installation you can send me an email at hello@jeffmilanes.com

### App Screenshot

![Login Screenshot](https://github.com/Jeff-Milanes/flutter-challenge/blob/main/assets/screenshots/Screenshot_Login.png?raw=true)

![Map Location Screenshot](https://github.com/Jeff-Milanes/flutter-challenge/blob/main/assets/screenshots/Screenshot_MapLocation.png?raw=true)

![News Feed Screenshot](https://github.com/Jeff-Milanes/flutter-challenge/blob/main/assets/screenshots/Screenshot_NewsFeed.png?raw=true)

![Calculator Screenshot](https://github.com/Jeff-Milanes/flutter-challenge/blob/main/assets/screenshots/Screenshot_Calculator.png?raw=true)


### Code Gen 
`
flutter pub run build_runner build --delete-conflicting-outputs
`

### Credentail

username: test@test.com
password: password