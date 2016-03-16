# WebDev
This repository will be used for web application development



###Deploying to Google App Engine
Step 1) Create a [google developer account](https://cloud.google.com/free-trial/): Starts with a 60 free trial

Step 2) Make sure you are using the the java 7 jdk. I used netbeans 8.0.2 for this project.

Step 3) Download the [google app engine sdk](https://cloud.google.com/appengine/downloads).  Make sure you download the appropriate java sdk.

Step 4) Download the latest google app engine [netbeans plugins](https://code.google.com/archive/p/nb-gaelyk-plugin/downloads).

Step 5) Create a new application within the google developer account you just created.

Step 6) Inside your netbeans ide, Add the google app engine plugins. Go to Tools -> Plugins -> Downloaded and browse for the plugins downloaded in step 4). Add all .nbm files and then click install.

Step 7) Go to services -> Servers -> add server -> Google App engine server. This adds the google app engine server.

Step 8) Create a new google app engine project. Select create new project -> java web -> web application -> title your application -> google app engine.

Step 9) Go to web pages -> WEB_INF -> appengine-web.xml in you project directory. Insert the application name you created in step 5) in the application xml tags and save the file <application>your-appengine-name-here</application>

Step 10)
