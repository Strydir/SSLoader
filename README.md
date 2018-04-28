# Welcome to SSLoader
Load your Steam Games and Experiences into Webpages for use in WindowsMR, VRToolbox, Oculus(not tested but they should work) or Vive from your Desktop,  or just to organize them. 

Set your SteamVR Home to VRToolbox, Virtual Desktop or Bigscreen beta (or back).




Welcome to my Steam Shortcut Loader!



This is a simplified version of CogentRifter's Home Loader, found here:  https://github.com/CogentHub/HomeLoader.   With his permission, I have modified it for my needs.

I zipped the entire "SSLoader" folder so unzip it to your drive or folder of choice and simply run the SSLoader.exe file.  I suggest making a shortcut to the exe and placing it on your desktop.

Note that if you are using WindowsMR, then you will need to be running at least the Spring build of Windows10 and write a Registry Key (supplied by Microsoft -but not officially supported; it's part of an upcoming security update).  To write the Key, the program will need Administrative rights so you'll need to restart SSLoader: right click on the exe and click "Run as Administrator".  This only needs to be done once to write it, or if you choose to delete the Key later.  The program will tell you if your OS is has a late enough version.  Microsoft has different Security Protocols for Edge in VR, this Key gives Edge permission to run those Steam Shortcuts.  Without it, you need to bring up the Desktop app to access your pages.  From the Desktop, the shortcuts will work fine, even in Edge.

At First Start, the program will be using the default Steam installation path.  If you've changed it or added more directories, click on the "Set Steam Folders" button in the upper right.   When you have your Steam Folders set, click the "Scan Steam Library Folders" button to add your games to the Library.

When the scan is complete, you'll have a list of your games.  You'll also have all of your 2d games and various Steam tools: right click and delete them from your lists, if you'd like.  Check the boxes to select each game,  move to the right, click the "Choose Tab" button and select between the 4 custom tabs.  Click the "Add to Custom" button to add the selected games to that tab.

Move to that tab and then right click to move your game up or down, delete it, or look at the Steam Database for the game.


If you're using VRToolbox, you'll want to set your SteamVR Home to VRToolbox:  this will tell the software to add the extra code that VRToolbox needs.  These pages will not work outside of VRToolbox.

Once you have your tab set up the way that you like it, click the "All" box on the right (NOT the one in the top section) to select your games (deselect it and choose your individual games if you'd like) and press the "Create Game Page" button.


When you have your pages created, press click the "Create MasterPage" button. You only do this once.  Once it's created, access it by the "Open MasterPage" button in the lower right.  This will give you a page with links to all of your new game pages. It's preset with all of them, so if your link isn't working, then you probably haven't created the page, yet.

If you're using VRToolbox, then you'll press the "Change VRToolbox StartPage" button.  Again, you'll only do this once.  This will replace the StartPage that VRToolbox uses as the default "Add Screen" with one that has preset links to your new pages.  Again, if the links don't work then then you haven't created the page, yet.  You'll have access to your pages when you add a new screen in VRToolbox.  Don't forget to resize the page to taste and set the transparency to "alpha".

If you are using WindowsMR, then first you need to enable shortcuts in Edge in VR.  Click the "WindowsMR" button in the top section and follow the prompts to write the needed Key that gives Steam urls permission.  Next, you need to make your "MasterPage" a Favorite in MS Edge to get access in VR.  Or you can access the page from your Desktop App but using an Edge page allows you to pin pages of SteamVR games/expererinces where ever you want in CLiffhouse for "one click" access(it's actually two clicks as you always have to wake pages up in WMR).  If you wish, you can navigate to a specific page and make it a favorite for even easier access.  If your default browser is NOT MS Edge, then you will have to do it the hard way.  You can go thru the "Open with... Microsoft Edge" dialog or you can set Edge back as default until you've got your page/s Favorited. I intend to add a "Copy url to Clipboard" button soon, but space for buttons is getting tight.


Once you click your game in the browser, a window may popup asking you if  you wish to launch the "Steam Client Bootstrapper".  This is your browser asking for permission to launch your game: click "yes" and play!  This will launch your game, SteamVR along with it.  If you experience problems, try bringing up SteamVR first, then clicking the game.  Note that "SteamVR" will be an entry in your new GamePage as well as your games.

If you're using VRToolbox, you can use the "Create TVCuts Page" to create a page of all of your games.  These links will take you to a page that contains ONLY that game/experience.  Resize the page to only show that single icon, then, using the up/down thumbpad buttons, grow or shrink the icon/page to an appropriate size and link and lock it to an Object such as a picture frame or that little "Jetson's" TV.  Once it's locked, you can grow/shrink the object and the icon/shortcut will resize with it.  Place it where ever you'd like and click it to launch your game!

I hope that you find some use in this little utility.  Let me know if there are any issues!


Known bugs/issues:
1) Progress bars need work: they don't update properly for the scans.
2) In "Add Game" sequence, your icon will be a "default" icon unless you choose an icon from the default system directory.
3) Icons in the list view need to be fixed. Icons on GamePages are fine.
4) Needs Oculus game support.
5) Only tested on Windows10.
6) Only tested at 1080i/p and 4k resolutions.


---------------------

SKYMAPS for VRToolbox:
For Skymaps, go to the "Skymaps" folder and download the zip files.  Unzip each file and place the dds files into the VRToolbox "Textures" directory.  They will then be available in game, under the drop down list in the "Settings" window.  If you decide to change the file name, VRToolbox requires the "_360" part of it.
