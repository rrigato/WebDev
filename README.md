[Website hosted in the google app engine] (http://ryanrigato-1252.appspot.com/)

##Links to d3 source code for this project
The following links will take you directly to the source code for the D3 visualizations within this repository, as it can be difficult 
to navigate if you are unfamiliar with the directory structure of netbeans applications:

#######Visualization 1: [Donut Chart of Mario Video Game Sales] (https://github.com/rrigato/WebDev/blob/master/ryanrigato/web/welcome.jsp)

#######Visualization 2: [Histogram of HS Graduation Rates] (https://github.com/rrigato/WebDev/blob/master/ryanrigato/web/graph1.jsp)

#######Visualization 3: [Bubble Plot of Pokemon Video Game Sales] (https://github.com/rrigato/WebDev/blob/master/ryanrigato/web/graph2.jsp)

#######Visualization 4: [Group Bar Chart of China Labor Union Strikes] (https://github.com/rrigato/WebDev/blob/master/ryanrigato/web/graph3.jsp)

#######Visualization 5: [Heat Map of Batman Versus Superman] (https://github.com/rrigato/WebDev/blob/master/ryanrigato/web/graph4.jsp)

#######Visualization 6: [Stacked Bar Chart of Manga Volumes Sold] (https://github.com/rrigato/WebDev/blob/master/ryanrigato/web/graph5.jsp)

#######Visualization 7: [Line Graph of Kaggle Users] (https://github.com/rrigato/WebDev/blob/master/ryanrigato/web/graph6.jsp)

## WebDev
This repository will be used for web application development. This web application was developed using the java full tech stack
framework. The design pattern used is model view controller (MVC). Connections to a mysql database where made with the jdbc driver.
All visualizations were created using Data Driven Documents (d3.js) a javascript library. 
This web application was was developed using netbeans 8.0.2 with jdk 1.7.0_79 



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

Step 11) You need to add the 

`C:\Program Files\apache-maven-3.3.9-bin (1)\apache-maven-3.3.9\bin` 

and 

`C:\Program Files\Java\jdk1.7.0_79\bin to your PATH environment variables`

To do this on Windows go to Control Panel -> Settings -> Advanced System Settings -> Environment Variables. Where the bins are located might differ on your local path  depending on where you downloaded them into.


**Note That you only have to do steps 12-16 one time**

Step 12) Open file explorer and go to where you downloaded the google app engine sdk. Enter the bin directory. 

Step 13) Right click on appcfg.cmd and open it with notepad ++. Find the line that has:

`java -Xmx1100m -cp "%~dp0\..\lib\appengine-tools-api.jar" com.google.appengine.tools.admin.AppCfg %*`

Above this line change the directory to where your java jdk bin is located by doing the following:

```cd C:\Program Files\Java\jdk1.7.0_79\bin```

Make sure you have the correct path to your jdk.

Step 14) Open a command prompt and change directories until you are in you google appengine sdk bin. Example:

`C:\Program Files\appengine-java-sdk-1.9.32\appengine-java-sdk-1.9.32\bin`

Step 15) Run the following command:

`appcfg update C:\Users\<your-username-here>\Documents\NetBeansProjects\WebApplication1\web`

make sure the second arguement of the command is the path to the netbeans google app engine project you created in step 8).

Step 16) A browser will open with a code that you need to copy and paste in the command line. Your project is now deployed.

Step 17) Anytime you want to deploy changes to your project, right click on the project -> Deploy to Google app engine.

Step 18) your website can be found at the your-google-project-name.blogspot.com
