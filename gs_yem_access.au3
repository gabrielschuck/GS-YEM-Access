;GS-YEM-Access: A script to make Yamaha Expansion Manager software more accessible to blind people
;Author:  Gabriel Schuck
;Includes
#include "msgboxconstants.au3"
#include "speech.au3"
#include "resolution.au3"
#include "install.au3"
#include "functions.au3"
opt("mousecoordmode",2)
opt("pixelcoordmode",2)
;Global variables
$instruments_ini=@localappdatadir&"\yamaha\expansion manager\instruments.ini"
;Preventing multiple instances of the script
$processes=processlist(@scriptname)
for $count=1 to $processes[0][0]
next
if $count >2 then
    msgbox($mb_OK+$MB_ICONEXCLAMATION,"Atention!","Script already running.")
    exit
endif
;Take the window handle
$handle=winwaitactive("Yamaha Expansion Manager")
;Checks whether execution takes place from compiled script. If so, sounds and dlls should be found in @tempdir; otherwise the necessary files are in the same source code directory
if not @compiled then
    soundplay("intro.wav")
else
    soundplay(@tempdir&"\intro.wav")
endif
sleep(1000)
;Detects the screen resolution configured on the system
$screen_resolution=_desktop_resolution()
if @error then ;The text scale is probably greater than 100%
    msgbox($MB_SYSTEMMODAL,"Warning","Couldn't identify the screen resolution. Please change the text scale to 100% and try again.");
    exit
    ;Check if user is using required resolution (for now 1920 X 1080)
elseif $screen_resolution<>"1920 x 1080" then
    msgbox($mb_systemmodal,"Atention!","To use this script you need full hd resolution (1920 x 1080)")
    exit
endif
;No more checks. Let's go
speech("Gs yem access. Welcome! Script created by Gabriel Schuck")
if not fileexists($instruments_ini) and winactivate($handle) then
    msgbox($mb_systemmodal,"Warning","You need to import your instrument info file. Press f3 in the Yamaha Expansion Manager window to do this")
endif
;List of allowed shortcut keys
while true
    hotkeyset("{f1}",menu1)
    hotkeyset("{f2}",menu2)
    hotkeyset("{f3}",menu3)
    hotkeyset("{f4}",menu4)
    hotkeyset("{f5}",menu5)
    hotkeyset("{f6}",packs_list)
    hotkeyset("{f7}",contents_list)
    hotkeyset("{f8}",midi_settings)
    hotkeyset("{f9}",audio_settings)
    hotkeyset("{f10}",generate_cpi_file)
hotkeyset("^i",instrument_information)
    hotkeyset("^q",bie)
wend
