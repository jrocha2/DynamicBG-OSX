# DynamicBG-OSX

This applet works by effectively running a screensaver in the background of your desktop to simulate a dynamic background effect. At this point in time, this takes a few steps on the user's part:
- Find a screensaver (either in the form of a .qtz or .saver file)
- Place this file in the folder at the path `/Library/Screen\ Savers/`
- In System Preferences, set the desired background to be your screensaver, even if you tell it to start "Never"

That's it! From here the app will do the rest as you can toggle the background on and off from the status bar. You probably figured out that this method means your background will be the same as your screensaver, but it's a small price to pay at this point.  

####Resource Usage
Running a screensaver can be more computer intensive the more complex it is, so just keep that in mind when choosing a screensaver as a background. Naturally, older computers will require a larger percentage of the CPU. The example background above consistently uses about 2% of the CPU on my 2013 Retina MacBook Pro. 

####Helpful Link(s)
I used this to convert a GIF to a screen saver, and since videos can be easily converted to GIFs, this opens up a lot of possible backgrounds  
http://www.brandonsga.com/technical/2014/06/create-screensaver-animated-gif-mac-osx-mountain-lion
