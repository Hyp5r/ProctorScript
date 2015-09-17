ProctorScript
=============

What is this?
-------------
ProctorScript is a script written to help administrators keep track of who's doing what on their machines.  This script allows administrators to configure an INI file with preset options so that a user can access them easily, while computer information is recorded to a log file.

Of course, that's the ideal of this script.  In theory, it would work without any issue, but in practice, this script can be avoided entirely.  It's a good-will effort to keep track of users using an account that has to be shared out for multiple uses.  For example, users may need access to a computer but no specific login account for them exists, so they must use a guest account.  With this script, an admin can record the user's first and last name, plus their general intention on the machine using the guest account.

The log file records info, such as the date the account was logged in, the first and last name of the person, the computer name and what version of Windows it was running, IP addresses, and the option the user selected in the launcher.

How do I use this?
------------------
Using this script is easy!  Download the compiled ProctorScript.exe (or use Ahk2Exe to compile one from the source yourself!) and double-click the program.  You'll be greeted with a welcome message and a ProctorScript.ini file will drop where you ran the program.  From there, you'll need to edit the INI file to have the options you want!

At the top of the INI file, there's a Consent section, where you can put a terms of use, computer policy for your institution, etc.  If you'd like, you can use a command switch (-skipconsent) to bypass this screen altogether.

Within the INI file, there are seven options that can be used, Options 1 - 7.  Each one can launch a different program and have the user logoff forcefully once the program is closed.  There's also a special option called Resolution Change Launcher.  If you specify any Link option as "Resolution Change Launcher," you can have the screen resolution change before the program is run, which is great for applications that require lower resolutions!  Of course, if you only need this script for this, you can pass a command switch (-reslauncher) and automatically launch your program that way!

Of course, looking in the INI file and running the program will definitely give you a feel of the program.  Should you get lost, feel free to contact me and I'll gladly help you out!

Why use it?
-----------
If users have their own individual login, there's no point in using this script, really.  If you share a general login, however, you may want to know who's using it, when, and why.  This script also forces a message to show up when run, and the user must accept the message or be logged out.

Comments?  Questions?  Suggestions?
-----------------------------------
Feel free to email me if you need any help using the script, or if you have any suggestions or comments regarding the script.  My email is listed in the ProctorScript.ahk file.

Credits
-------
QRes was created by Anders Kjersem and is Copyright © 2003 Anders Kjersem.

The ProctorScript icon was created by Vecteezy (https://www.iconfinder.com/icons/532707/api_coding_developer_development_man_programming_screen_icon#size=128) and is under the Creative Commons (Attribution-Share Alike 3.0 Unported) license, located at http://creativecommons.org/licenses/by/3.0/.

Changelog
---------
```
1.0.0
  ! More code cleanup.
  ! All third-party references removed.
  ! Official release!
  + ADD: New icon for the EXE file.
  * MODIFY: Resolution Change Launcher (reslauncher.ahk) was rewritten to execute quicker than before.
  * MODIFY: Default setup.ini scrubbed of third-party references.
  * MODIFY: ConsentBG is now killed when an option is submitted.

0.9.0
  ! Complete restructure of the script.
  ! Plenty of code cleanup.
  ! Removal of all work-specific references.
  * MODIFY: The program now installs to the user's Documents folder so standard users do not run into issues.
  * MODIFY: Switch -skiplockdown was changed to -skipconsent.
  * MODIFY: Faded background (ConsentBG) now persists until the application is closed.
  * MODIFY: Window border was removed on the Launcher portion of the script.
  - REMOVE: The -source switch was removed as source is now available via GitHub.
  - REMOVE: Copyrighted images used are now removed, replaced with a placeholder that can be changed out.

Rev.6 Private Test
  * MODIFY: The program now installs to the root of the Windows directory, typically the C:\ drive.  This is due to group	policy settings that disable execution in the AppData directory.
  * MODIFY: The command line switches have been moved in the code to execute after program installation again.  This will (hopefully) fix the flashing window issue when using command line switches in the program.

Rev.5 Private Test
  + ADD: Starting of the -help command switch, which will open a batch file with possible switches and uses.
  * MODIFY: Moved the switch coding to be ahead of the file installation, and call file installation when a switch explicitly needs it.  This prevents the -source command from having two dumps, one into the script directory and one into the %TEMP% directory.
    ! This causes a currently known glitch, where using the other switches will cause the lockdown section to flash	on screen before disappearing.

Rev.4 Private Test
  + ADD: -source command line switch, which dumps the source code into the src folder.

Rev.3 Private Test
  + ADD: Two new command-line switches have been added to the program! -actcompass will automatically launch the ACT Compass script, while -skiplockdown will completely bypass the lockdown portion of the script.
  * MODIFY: Changed the order of file installation so that no supporting files will be added unless the script detects the INI file.
  * MODIFY: Made sure that change.log will always be updated when the program is run.

Rev.2 Private Test
  + MODIFY: Hide the close and minimize buttons on the launcher.

Rev.1 Private Test
  ! Initial Release
```