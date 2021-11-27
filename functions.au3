;Main script functions (functions.au3 file)
;Author:  Gabriel Schuck

;Place the mouse and click where the "Add pack" menu appears
func menu1()
    $voiceeditor_disabled=true
    find_window() ;If not, puts the program window into focus
    mainscreen()
    mouseclick("left",395,22)
    speech("Add pack: Use arrow keys to navigate")
endfunc

;Place the mouse and click where the "Edit Pack" menu appears
func menu2()
    $voiceeditor_disabled=true
    find_window()
    mainscreen() ;If another screen is appearing in the software, try to go back to the main screen
    mouseclick("left",419,22)
    speech("Edit pack:  Use arrow keys to navigate")
endfunc

;Place the mouse and click where the "Add Install Target" menu appears
func menu3()
    $voiceeditor_disabled=true
    find_window()
    mainscreen()
    mouseclick("left",143,89)
    speech("Add install target: Use arrow keys to navigate")
endfunc

;Place the mouse and click where the "Add Content" menu appears
func menu4()
    $voiceeditor_disabled=true
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
    $voiceeditor_disabled=true
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
    $voiceeditor_disabled=true
    find_window()
    mainscreen()
    mouseclick("left",1872,22)
    speech("Midi settings:  use tab to navigate")
endfunc

;Try to focus the list of imported packs. Once focused, you can move around the table with the up, down, right and left arrows.
;Unfortunately, nothing is reported by the screen reader. The solution is to delete the item with the delete key to read the message with NVDA object navigation to know what it is about
func packs_list()
    $voiceeditor_disabled=true
    find_window()
    mainscreen()
    mousemove(1056,294)
    mouseclick(1056,294,3)
    speech("Packs list: Table with rows and columns")
endfunc

;Try to focus the list of pack contents. Once focused, you can move around the table with the up, down, right and left arrows.
;Unfortunately, nothing is reported by the screen reader. The solution is to delete the item with the delete key to read the message with NVDA object navigation to know what it is about
func contents_list()
    $voiceeditor_disabled=true
    find_window()
    mainscreen()
    mouseclick("left",1056,804,3)
    speech("Contents list: Table with rows and columns")
endfunc

;Place the mouse and click In the option to generate the installation file of the selected packs
func generate_cpi_file()
    $voiceeditor_disabled=true
    find_window()
    mainscreen()
    mouseclick("left",91,125)
    speech("Generating pack instalation file, please wait...")
    $color=0
    while ($color<>15592941)
        $color=pixelgetcolor(1663,20,$handle)
        sleep(800)
    wend
    ;Wait for the save window to appear and keep clicking with the mouse where the "Save as Pack Installation File" button usually appears
    while not winactivate("Save as Pack Installation File")
        soundplay(@windowsdir&"\media\ring10.wav",1)
        sleep (10)
        mouseclick("left",1663,20)
    wend
    speech ("Done. You can now save the file");
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
    if not voiceeditor_activated() then
        speech("Please open some unprotected pack content in voice editor first")
    else
    $voiceeditor_disabled=false
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

;Check if the Voice Editor screen is activated
func voiceeditor_activated()
    $color=pixelgetcolor(1823,17)
    if ($color=16777215)then
    $voiceeditor_disabled=true
        return false
    else
    $voiceeditor_disabled=false
        return true
    endif
endfunc

;Mouse over the volume control inside the voice editor screen. Value can be adjusted with up and down arrows, page up/down
func volume()
    $voiceeditor_disabled=false
    if not voiceeditor_activated() then
        speech ("Please open some pack content in voice editor first")
    else
        mouseclick ("left",839,125,1,0)
        speech ("Volume: Use up and down arrows, page up and page down to adjust")
    endif
endfunc

;Mouse over the pan control inside the voice editor screen. Value can be adjusted with up and down arrows, page up/down
func pan()
    $voiceeditor_disabled=false
    if not voiceeditor_activated() then
        speech ("Please open some pack content in voice editor first")
    else
    mouseclick ("left",839,170,1,0)
        speech ("Pan: Use up and down arrows, page up and page down to adjust")
    endif
endfunc

;Mouse over the "Key on delay" control inside the voice editor screen
func key_on_delay()
    $voiceeditor_disabled=false
    if not voiceeditor_activated() then
        speech ("Please open some pack content in voice editor first")
    else
        mouseclick ("left",843,391,1,0)
        speech ("Key on delay: Use up and down arrows, page up and page down to adjust")
    endif
endfunc

;Mouse over the tuning control inside the voice editor screen
func tuning()
    $voiceeditor_disabled=false
    if not voiceeditor_activated() then
        speech ("Please open some pack content in voice editor first")
    else
        mouseclick("left",460,438,1,0)
        speech ("Tuning: Use up and down arrows, page up and page down to adjust")
    endif
endfunc

;Display the general tab
func general()
    ;Activate the "common" screen if necessary
    common_activated()
    if not $voiceeditor_disabled then
        $active_tab="general"
        $p=stringsplit($voiceeditor_commontabs[1][0],",",2)
        $posx=$p[0]
        $posy=$p[1]
        ;Disables the last marked tab to prevent clicking the mouse in the wrong place
        disable_alltabs()
        mouseclick("left",$posx,$posy,1,0)
        sleep(10)
        $color=pixelgetcolor($posx,$posy,$handle)
        if $color<>8882055 then
            speech ($voiceeditor_commontabs[0][0]&":  Use alt+1 to alt+0 to choose and adjust the parameters of this tab")
        else
            speech ($voiceeditor_commontabs[0][0]&" disabled. Press control+shift+g to enable it")
        endif
        ;Alt+1 to alt+0 to adjust the parameters of this tab
        for $count=0 to 9
            hotkeyset("!"&$count,notimplemented)
        next
    endif
endfunc

;Display the portamento details tab
func portamento_details()
    ;Activate the "common" screen if necessary
    common_activated()
    if not $voiceeditor_disabled then
        $active_tab="portamento details"
        $p=stringsplit($voiceeditor_commontabs[1][1],",",2)
        $posx=$p[0]
        $posy=$p[1]
        ;Disables the last marked tab to prevent clicking the mouse in the wrong place
        disable_alltabs()
        mouseclick("left",$posx,$posy,1,0)
        sleep(10)
        $color=pixelgetcolor($posx,$posy,$handle)
        if $color<>8882055 then
            speech ($voiceeditor_commontabs[0][1]&":  Use alt+1 to alt+0 to choose and adjust the parameters of this tab")
        else
            speech ($voiceeditor_commontabs[0][1]&" disabled. Press control+shift+g to enable it")
        endif
    endif
endfunc

func controllers()
    common_activated()
    if not $voiceeditor_disabled then
        $active_tab="controllers"
        $p=stringsplit($voiceeditor_commontabs[1][2],",",2)
        $posx=$p[0]
        $posy=$p[1]
        disable_alltabs()
        mouseclick("left",$posx,$posy,1,0)
        sleep(10)
        $color=pixelgetcolor($posx,$posy,$handle)
        if $color<>8882055 then
            speech ($voiceeditor_commontabs[0][2]&":  Use alt+1 to alt+0 to choose and adjust the parameters of this tab")
        else
            speech ($voiceeditor_commontabs[0][2]&" disabled. Press control+shift+g to enable it")
        endif
    endif
endfunc

func sounds()
    common_activated()
    if not $voiceeditor_disabled then
        $active_tab="sounds"
        $p=stringsplit($voiceeditor_commontabs[1][3],",",2)
        $posx=$p[0]
        $posy=$p[1]
        disable_alltabs()
        mouseclick("left",$posx,$posy,1,0)
        sleep(10)
        $color=pixelgetcolor($posx,$posy,$handle)
        if $color<>8882055 then
            speech ($voiceeditor_commontabs[0][3]&":  Use alt+1 to alt+0 to choose and adjust the parameters of this tab")
        else
            speech ($voiceeditor_commontabs[0][3]&" disabled. Press control+shift+g to enable it")
        endif
    endif
endfunc

func effects()
    common_activated()
    if not $voiceeditor_disabled then
        $active_tab="effects"
        $p=stringsplit($voiceeditor_commontabs[1][4],",",2)
        $posx=$p[0]
        $posy=$p[1]
        disable_alltabs()
        mouseclick("left",$posx,$posy,1,0)
        sleep(10)
        $color=pixelgetcolor($posx,$posy,$handle)
        if $color<>8882055 then
            speech ($voiceeditor_commontabs[0][4]&":  Use alt+1 to alt+0 to choose and adjust the parameters of this tab")
        else
            speech ($voiceeditor_commontabs[0][4]&" disabled. Press control+shift+g to enable it")
        endif
    endif
endfunc

func eq()
    common_activated()
    if not $voiceeditor_disabled then
        $active_tab="eq"
        $p=stringsplit($voiceeditor_commontabs[1][5],",",2)
        $posx=$p[0]
        $posy=$p[1]
        disable_alltabs()
        mouseclick("left",$posx,$posy,1,0)
        sleep(10)
        $color=pixelgetcolor($posx,$posy,$handle)
        if $color<>8882055 then
            speech ($voiceeditor_commontabs[0][5]&":  Use alt+1 to alt+0 to choose and adjust the parameters of this tab")
        else
            speech ($voiceeditor_commontabs[0][5]&" disabled. Press control+shift+g to enable it")
        endif
    endif
endfunc


func disable_alltabs()
find_window()
    if not $voiceeditor_disabled then
        for $count=0 to ubound($voiceeditor_commontabs,2)-1
        if $voiceeditor_commontabs[0][$count]<>$active_tab then
            $p=stringsplit($voiceeditor_commontabs[1][$count],",",2)
            $px=$p[0]
            $py=$p[1]
            $color=pixelgetcolor($px,$py,$handle)
            if($color=4534392) then mouseclick ("left",$px,$py,1,0)
        endif
        sleep (10)
        next
    endif
endfunc

func common_activated()
    if voiceeditor_activated() then
        $color=pixelgetcolor(108,54)
        if($color= 14145495) then
            mouseclick("left",108,54,1,0)
        endif
    else
        speech("Please open some unprotected pack content in voice editor first")
    endif
endfunc

func notimplemented()
speech ("Not implemented yet")
endfunc
