;Main script functions (functions.au3 file)
;Author:  Gabriel Schuck

;Place the mouse and click where the "Add pack" menu appears
func menu1()
    find_window() ;If not, puts the program window into focus
    mainscreen()
    mouseclick("left",395,22)
    speech("Add pack: Use arrow keys to navigate")
endfunc

    ;Place the mouse and click where the "Edit Pack" menu appears
func menu2()
    find_window()
    mainscreen() ;If another screen is appearing in the software, try to go back to the main screen
    mouseclick("left",419,22)
    speech("Edit pack:  Use arrow keys to navigate")
endfunc

    ;Place the mouse and click where the "Add Install Target" menu appears
func menu3()
    find_window()
    mainscreen()
    mouseclick("left",143,89)
    speech("Add install target: Use arrow keys to navigate")
endfunc

    ;Place the mouse and click where the "Add Content" menu appears
func menu4()
    find_window()
    mainscreen()
    ;Verify if there is any open pack or if the pack is not protected by color checking
    $color=pixelgetcolor(394,570,$handle)
if ($color=16053492)then
        speech("Please create a new pack first or import an unprotected pack")
    elseif ($color=12698049)then
        speech("This pack is protected and cannot be modified")
    else
        mouseclick("left",394,570)
        speech("Add content: Use arrow keys to navigate")
    endif
endfunc

    ;Place the mouse and click where the "Edit Content" menu appears
func menu5()
    find_window()
    mainscreen()
    ;Check if the open pack is not of the protected type. If so, the menu cannot be opened
    $color=pixelgetcolor(418,570,$handle)
    if ($color=16053492)then
        speech("Couldn't open the menu. Check if you imported an unprotected pack and/or create a new pack and try again")
    else
        mouseclick("left",418,570)
        speech("Edit content:  Use arrow keys to navigate")
    endif
endfunc

    ;Place the mouse and click where the "Midi Settings" menu appears
func midi_settings()
    find_window()
    mainscreen()
    mouseclick("left",1872,22)
    speech("Midi settings:  use tab to navigate")
endfunc

;Try to focus the list of imported packs. Once focused, you can move around the table with the up, down, right and left arrows.
;Unfortunately, nothing is reported by the screen reader. The solution is to delete the item with the delete key to read the message with NVDA object navigation to know what it is about
func packs_list()
    find_window()
    mainscreen()
    mousemove(1056,294)
    mouseclick(1056,294,3)
    speech("Packs list: Table with rows and columns")
endfunc

;Try to focus the list of pack contents. Once focused, you can move around the table with the up, down, right and left arrows.
;Unfortunately, nothing is reported by the screen reader. The solution is to delete the item with the delete key to read the message with NVDA object navigation to know what it is about
func contents_list()
    find_window()
    mainscreen()
    mouseclick("left",1056,804,3)
    speech("Contents list: Table with rows and columns")
endfunc

;Place the mouse and click In the option to generate the installation file of the selected packs
func generate_cpi_file()
    find_window()
    mainscreen()
    mouseclick("left",91,125)
    speech("Generating pack instalation file, please wait...")
    $color=0
    while ($color<>15592941)
        $color=pixelgetcolor(1663,20,$handle)
        beep(700,50)
        sleep(1000)
    wend
    speech ("Done. You can now save the file.  Press f10 again");
    while not winactivate("Save as Pack Installation File")
        hotkeyset("{f10}",save)
    wend
endfunc

func save()
        mouseclick("left",1663,20)
endfunc

;This needs no comments...
func bie()
    if not @compiled then
        soundplay("fim.wav")
else
        soundplay(@tempdir&"\fim.wav")
    endif
    sleep(1000)
    speech("Bie")
    exit
endfunc
;Try to move and click the mouse on the option to configure audio output. Useful when creating a pack to test new voices. The voice editor must be open for the option to be found
func audio_settings()
    $color=pixelgetcolor(1823,17)
    if ($color=16777215)then
        speech("Please open some unprotected pack content in voice editor first")
    else
        mouseclick("left",1823,17)
        speech("Audio settings:  Use tabe to navigate")
    endif
endfunc

func mainscreen() ;To bring up the main screen whenever necessary
    $color=pixelgetcolor(1887,17,$handle)
    if ($color=16777215)then
        mouseclick("left",1887,17,2)
    else
        $color=pixelgetcolor(91,21,$handle)
        if ($color<>6571407)then
            mouseclick("left",91,21)
            sleep(800)
        endif
    endif
    return
endfunc


func find_window() ;Puts the window always in focus
    if not winactivate("Yamaha Expansion Manager")then
        msgbox($mb_systemmodal,"Ooops!","Yamaha Expansion Manager not found. please open the program and try again. script finished")
        exit
    endif
endfunc
