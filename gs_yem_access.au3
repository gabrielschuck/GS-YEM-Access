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
;Two-dimensional array with the tab list of the voice editor's "common" screen, with their respective mouse positions
global $voiceeditor_commontabs=[["general","portamento details","controllers","sounds","effects","eq"],["568,56","568,85","568,114","568,143","568,172","568,201"]]
global  $voiceeditor_disabled=true, $active_tab=""
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
hotkeyset("^q",bie)
hotkeyset("^!v",volume)
hotkeyset("^!p",pan)
hotkeyset("^!t",tuning)
hotkeyset("^!k",key_on_delay)
hotkeyset("^+g",general)
hotkeyset("^+p",portamento_details)
hotkeyset("^+c",controllers)
hotkeyset("^+s",sounds)
hotkeyset("^+e",effects)
hotkeyset("^+q",eq)
wend
