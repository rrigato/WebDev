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

Step 10) Right Click on your project in the netbeans ide and select 'Change Email/Password'. Enter the google email and password you used to create the google developer account in step 1)

Step 11) You need to add the C:\Program Files\apache-maven-3.3.9-bin (1)\apache-maven-3.3.9\bin and C:\Program 
Files\Java\jdk1.7.0_79\bin to your PATH environment variables. To do this on Windows go to Control Panel -> Settings -> Advanced System
Settings -> Environment Variables. Where the bins are located might differ on your local path  depending on where you downloaded them into.

Step 12) Open file explorer and go to where you downloaded the google app engine sdk. Enter the bin directory. 

Step 13) Right click on appcfg.cmd and open it with notepad ++. Find the line that has:

`java -Xmx1100m -cp "%~dp0\..\lib\appengine-tools-api.jar" com.google.appengine.tools.admin.AppCfg %*`

Above this line change the directory to where your java jdk bin is located by doing the following:

```cd C:\Program Files\Java\jdk1.7.0_79\bin```

Make sure you have the correct path to your jdk.
