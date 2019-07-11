# Welcome to SSLoader  

7/11/19 Added Bookshelves and Books for VRToolbox.  Work in progress.

**Attention: Separators have been redone.  If you are updating, delete your old Separators before saving an edit or it will destroy your list!  -If you're using v8.9 or later, you're fine.

Load your Steam Games and Experiences, mp4's, doc's, pdf's (anything that your browser can render), or non-Steam games and experiences into Lists and Webpages for use in WindowsMR, VRToolbox, Oculus(not tested but they should work) or Vive from your Desktop,  or just to organize them.  Using VRToolbox or WindowsMR, you can launch them from in VR, too!

Set your SteamVR Home to VRToolbox, Virtual Desktop, Bigscreen beta or pick your own!





This is a simplified version of CogentRifter's Home Loader, found here:  https://github.com/CogentHub/HomeLoader.   With his permission, I have modified it for my needs.

I zipped the entire "SSLoader" folder so unzip it to your drive or folder of choice and simply run the SSLoader.exe file.  I suggest making a shortcut to the exe and placing it on your desktop.

See the included ReadMe.html file for more details on usage.

Note that if you are using WindowsMR, then you will need to be running at least the Spring 2018 build of Windows10 and write a Registry Key (supplied by Microsoft -but not officially supported; it's part of an upcoming security update).  To write the Key, the program will need Administrative rights so you'll need to restart SSLoader: right click on the exe and click "Run as Administrator".  This only needs to be done once to write it, or, if you choose to delete the Key, later.  The program will tell you if your OS is a late enough version.  Microsoft has different Security Protocols for Edge in VR, this Key gives Edge permission to run those Steam Shortcuts.  Without it, you need to bring up the Desktop app to access your pages.  From the Desktop, the shortcuts will work fine, even in Edge.  Note that at some future time the addition of this Registry Key should not be needed, so try launching your games from an Edge page in VR BEFORE you bother writing the Key.

This program can change your SteamVR Home but you need to be running SteamVR beta.  Click "Settings" and then make your choice from the dropdown menu.  Your choices are SteamVR, VRToolbox, Virtual Desktop, Bigscreen beta or "Other".  If you choose "Other", then you are on your own: if  you choose an exe that is not a VR program, you may have unexpected results.  If you choose a VR program that takes a long time to load, it will make the transition between programs take a while. Don't select an option that you don't have or you may have unexpected results.  If you choose VRToolbox, the dev's included some code to make it possible to launch your programs from the web pages in VRToolbox (in VR). Quite handy.  Make sure that you set it back to SteamVR before moving or removing the program.

At First Start, the program will scan your Registry for your Steam installation and added "Library" locations.  If you change it or add more directories, click on the "Settings" button in the upper right, then click "Set Steam Libraries" and follow the prompts.  From here you can add/delete/ or reset your Libraries.

When it is finished loading for the first time, you will see an empty page.  Click the "Scan Steam Library Folders" at the right.

When the scan is complete, you'll have a list of your games.  You'll also have all of your 2d games and various Steam tools: right click and delete them from your list, if you'd like.  To populate your Custom Tabs, check the boxes to select each game,  move to the right, click the "Choose Tab" button and select between the 6 custom tabs.  Click the "Add to Custom" button to add the selected games to that Tab.  Click the "Rename Tabs" button to customize your Tab labels. Note that you don't have a lot of room so keep the titles short.

Move to that tab and then right click to move your game up or down, delete the entry, find out how many people are playing that game at the moment or look at the Steam Database for the game.  You can also add a Separator.  If you click that, a dialog will pop up asking you to name your Separator.  Note that sorting the list moves all Separators to either the top or bottom of the list.

You can launch your games from SSLoader, or you can create web pages of your Lists. These use larger icons and are accessible in VR if you are using VRToolbox or WMR.  The webpages will launch everything except exe files, unless you are using VRToolbox.  VRToolbox uses code that allows you to launch non-Steam exe's from your webpages so you can launch 3rd party VR Experiences like Star Trek, Titanic or Blade Runner.  

Now to generate your web pages.  If you're using VRToolbox, you'll want to set your SteamVR Home to VRToolbox:  this will tell the software to add the extra code that VRToolbox needs.  Keep in mind that these pages will not work outside of VRToolbox.

Once you have your tab set up the way that you like it, click the "All" box in the upper left to select all of your games in that list, or choose your individual games, and press the "Create Game Page" button.

Once it's created, access it by the "Open Page" button or click the "Open MasterPage" button in the lower right of the main window.  This will give you a page with links to all of your new game pages. It's preset with all of them, so if your link isn't working, then you probably haven't created the page, yet.

If you're using VRToolbox, you can also access the individual pages that you create by clicking the "Open Page" button, but you NEED to press the "Open StartPage" button.  The first time that you do this, it will replace the StartPage that VRToolbox uses as the default "Add Screen" with one that has preset links to your new pages.  Again, if the links don't work then then you haven't created the page, yet.  You'll have access to your pages in VR when you add a "New Screen" in VRToolbox.  Don't forget to resize the page to taste and set the transparency to "alpha".


If you are using WindowsMR, then first you need to enable shortcuts in Edge in VR.  Go into "Settings" and you'll see some information about WMR and your computer.  If your OS fits the criteria, and you're in "Admin" mode, you'll be able to click the "Write Registry Key" button.  Next, you need to make your "MasterPage" a Favorite in MS Edge to get access in VR.  Or you can access the page from your Desktop App but using an Edge page allows you to pin pages of SteamVR games/expererinces where ever you want in CLiffhouse for "one click" access(it's actually two clicks as you always have to wake pages up in WMR).  If you wish, you can navigate to a specific page and make it a favorite for even easier access.  If your default browser is NOT MS Edge, then you will have to do it the hard way.  You can go thru the "Open with... Microsoft Edge" dialog or you can set Edge back as default until you've got your page/s Favorited.


Once you click your game in the browser, a window may popup asking you if  you wish to launch the "Steam Client Bootstrapper".  This is your browser asking for permission to launch your game: click "yes" and play!  This will launch your game, SteamVR along with it.  If you experience problems, try bringing up SteamVR first, then clicking the game.  Note that "SteamVR" will be an entry available to add to your new GamePage as well as your games.

For VRToolbox users, in the "Settings" page, you can use the "Create Singles Page" to create a page of all of your games.  These links will take you to a page that contains ONLY that game/experience.  Resize the page to only show that single icon, then, using the up/down thumbpad buttons, grow or shrink the icon/page to an appropriate size and link and lock it to an Object such as a picture frame or that little "Jetson's" TV.  Once it's locked, you can grow/shrink the object and the icon/shortcut will resize with it.  Place it where ever you'd like and click it to launch your game!  At the moment, "Object Shortcuts" are only usable in VRToolbox.  

VRToolbox now has native support for making SteamVR shortcuts.  I've taken advantage of this to add shortcuts to different objects.  Latest is a Bookshelf with Books made from your Steam shortcuts.  Still a work in progress, but one Bookshelf is complete and I'm working on more.
To use this, make VRToolbox your SteamVR Home, as discussed above, then click the 'Create Objects' button in the upper section. If you choose "BookCase2" then it will bring up a window allowing you to add your games as different books.  Keep adding books until you're happy, then click "Write" to write your new bookshelf and books to the "Objects.room".
*NOTE* you need an alphabet for the book labels, so you will need my utility "WordMaker" in order to have the alphabet needed.  Get it here: https://github.com/Strydir/WordMaker/releases


You can sort your Lists by Name, AppId or Install Drive.  

You can print your Lists by clicking the "Print Page" button.


I hope that you find some use in this little utility.  Let me know if there are any issues!


--Known bugs/issues:
1) Until Revive adds multidrive support, only Oculus games in the default directory will be found.
2) Only tested on Windows10.
3) Only tested at 1080i/p and 4k resolutions.
4) PDF files can crash VRToolbox
5) While 'native' Oculus support has been added, it has not been tested.

-- Working on:
1) Themes -postponed
2) More Book Shelves
3) animation, but it'll be a while




---------------------

SKYMAPS for VRToolbox:
For Skymaps, go to the "Skymaps" folder and download the zip files.  Unzip each file and place the dds files into the VRToolbox "Textures" directory.  They will then be available in game, under the drop down list in the "Settings" window.  If you decide to change the file name, VRToolbox requires the "_360" part of it.


PM me at https://www.reddit.com/message/compose/?to=Stridyr if you have any issues or requests
