![Title](/demoFiles/title.png)

![Demo](demoFiles/demo.gif?raw=true) 

This applet works by effectively running a screensaver in the background of your desktop to simulate a dynamic background effect. At this point in time, the main thing the user needs to do is:
- Find a screensaver (either in the form of a .qtz or .saver file)
- Download and use the application

###Download and Run the Application
[Click Here to Download](https://www.dropbox.com/s/9kqybmtmbpjldq0/DynamicBG-OSX.zip?dl=1)

###Installing a New Background
**NOTE:** *If the screensaver is a .saver file, the easiest installation method is usually just to double-click it. If that doesn't work then try the methods below*  
  
In order to install a new background in the correct folder, you can do choose one of two paths:  
#####Menu Option
Selecting the action in the status bar menu uses a Finder window to choose a file. Doing so will prompt you for your password only because moving files into the appropriate folder has strict permissions. This is your computer prompting you to confirm the action, not the program, so your password remains well protected.
#####Manually
If you are more comfortable moving files around yourself:
- Place the screensaver file in the folder at the path `/Library/Screen Savers/`

###Selecting a Background
As of now, you have to work through System Preferences to reliably make sure that your background is set (technically as your screen saver). You can do this by navigating there yourself, or just by selecting the relevant menu option. If you don't see a screensaver there that you installed, try manually installing it just to be sure.   
  

That's it! From here the app will do the rest as you can toggle the background on and off from the status bar. You probably figured out at this point that this method means your background will be the same as your screensaver, but it's a small price to pay I think.

###Setting App to Launch on Startup (Optional)
If you want DynamicBG-OSX to always appear in your status bar when turning on your computer, add it to your login items in
System Preferences. This can be found in *System Preferences -> Users & Groups -> Login Items*. Simply select the '+' symbol and find/select the DynamicBG-OSX application file. Doing this also means that if you had a dynamic background active when you turned off your computer, it will come back just as you left it upon restarting. 

###Resource Usage
Running a screensaver can be more computer intensive the more complex it is, so just keep that in mind when choosing a screensaver as a background. Naturally, older computers will require a larger percentage of the CPU. The example background above consistently uses about 2% of the CPU on my 2013 Retina MacBook Pro. 

###Helpful Link(s)
I used this to convert a GIF to a screen saver, and since videos can be easily converted to GIFs, this opens up a lot of possible backgrounds  
http://www.brandonsga.com/technical/2014/06/create-screensaver-animated-gif-mac-osx-mountain-lion

######Possible Starter Background Recommendations:
- https://github.com/Jonic/WhatColourIsIt-ScreenSaver
- https://github.com/JohnCoates/Aerial
- https://github.com/winterbe/github-matrix-screensaver
- http://fliqlo.com/
  
###MIT License
The MIT License (MIT)

Copyright (c) 2016 John Rocha -- john.rocha5@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
