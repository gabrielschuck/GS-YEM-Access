#include "msgboxconstants.au3"
#include "speech.au3"
#include "resolution.au3"
#include "install.au3"
#include "functions.au3"
opt("mousecoordmode",2)
opt("pixelcoordmode",2)
$handle=winwaitactive("Yamaha Expansion Manager")
if not @compiled then
    soundplay("intro.wav")
else
    soundplay(@tempdir&"\intro.wav")
endif
sleep(1000)
$screen_resolution=_desktop_resolution()
if @error then
    $question=    msgbox($MB_YESNO,"Warning","Couldn't identify the screen resolution. You can continue, but resolution other than recommended (1920 X 1080) may cause the script to not work correctly. Do you wish to continue?")
    if ($question=7) then exit
elseif $screen_resolution<>"1920 x 1080" then
    msgbox($mb_systemmodal,"Atention!","To use this script you need full hd resolution (1920 x 1080)")
    exit
endif
speech("Gs yem access. Welcome! Script created by Gabriel Schuck")
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
wend
