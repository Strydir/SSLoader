# SSLoader -also called SGLoader
Load your Steam/Game Shortcuts into a Webpage for use in WindowsMR or just to organize them.




Welcome to my Steam Shortcut/Game Loader!

Download SGLoader.ZIP, NOT the exe!  The exe is not a standalone file.

This is a simplified version of CogentRifter's Home Loader, found here:  https://github.com/CogentHub/HomeLoader.   With his permission, I have modified it for my needs.

I zipped the entire "SGLoader" folder so unzip it to your drive or folder of choice and simply run the exe file.  I suggest making a shortcut to the exe and placing it on your desktop.

At First Start, the program will be using the default Steam installation path.  If you've changed it or added more directories, click on the "Set Steam Folders" button in the lower right.   When you have your Steam Folders set, click the "Scan Steam Libraries" button in the upper right to add your games to the Library.

When the scan is complete, you'll have a list of your games.  The information in the columns is still a wip, but the game and app id's will be accurate.  Click the boxes to select each game,  move down to the bottom left, click the "Choose Tab" button and select between the 4 custom tabs.  Click the "Add to Custom" button to add the selected games to that tab.

Right click to move your game up or down, delete it, or look at the Steam Database for the game (another work in progress).

Once you have your tab set up the way that you like it, go to that tab, click the "All" box in the lower left (NOT the one in the top section) to select your games (deselect it and choose your individual games if you'd like) and press the "Create Game Page" button in the lower left.  This will create your Game WebPage in the Webpage directory of your SGLoader folder.  The file names will all start with "GamePage_".   Your Favorites Tab will be "GamePage_Custom_1" .

Next, go to the tab containing the games that you want and press the "Open Game Page" button to bring up your new page in MS Edge, assuming that Edge is your default browser.  Set each page into Favorites and organize them as you'd like.  If your default browser is NOT MS Edge, then you will have to do it the hard way.  Microsoft has made it impossible to access local html files by commandline.  You will need to open the folder containing the files (press the "Open Folder" button), right click on the one you want and go thru the "Open with... Microsoft Edge" dialog.  Once you've got it open in Edge, set it as a favorite as described.

Once you click your game in the browser, a window will popup asking you if  you wish to launch the "Steam Client Bootstrapper".  This is your browser asking for permission to launch your game: click "yes" and play!  This will launch your game, SteamVR along with it.  If you experience problems, try bringing up SteamVR first, then clicking the game.  Note that SteamVR will be in your new GamePage as well as your games.

That's all there is to it!  I hope it helps!


Known bugs/issues:
1) Information shown in listview columns not accurate.
2) Steamdb page not showing everything.
3) "All" button in top section not working right.
4) Needs Oculus game support.
