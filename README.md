ProctorScript
=============

What is this?
-------------
ProctorScript is a script written to help administrators keep track of who's doing what on their machines.  This script allows administrators to configure an INI file with preset options so that a user can access them easily, while computer information is recorded to a log file.

Of course, that's the ideal of this script.  In theory, it would work without any issue, but in practice, this script can be avoided entirely.  It's a good-will effort to keep track of users using an account that has to be shared out for multiple uses.  For example, users may need access to a computer but no specific login account for them exists, so they must use a guest account.  With this script, an admin can record the user's first and last name, plus their general intention on the machine using the guest account.

The log file records info, such as the date the account was logged in, the first and last name of the person, the computer name and what version of Windows it was running, IP addresses, and the option the user selected in the launcher.

Why use it?
-----------
If users have their own individual login, there's no point in using this script, really.  If you share a general login, however, you may want to know who's using it, when, and why.  This script also forces a message to show up when run, and the user must accept the message or be logged out.

Comments?  Questions?  Suggestions?
-----------------------------------
Feel free to email me if you need any help using the script, or if you have any suggestions or comments regarding the script.  My email is listed in the ProctorScript.ahk file.

Credits
-------
QRes was created by Anders Kjersem and is Copyright © 2003 Anders Kjersem.

CHANGELOG
---------
```
1.0.0
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