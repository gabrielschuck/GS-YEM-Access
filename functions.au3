func menu1()
    find_window()
    mainscreen()
    mouseclick("left",395,22)
    speech("Add pack: Use arrow keys to navigate")
endfunc

func menu2()
    find_window()
    mainscreen()
    mouseclick("left",419,22)
    speech("Edit pack:  Use arrow keys to navigate")
endfunc

func menu3()
    find_window()
    mainscreen()
    mouseclick("left",143,89)
    speech("Add install target: Use arrow keys to navigate")
endfunc

func menu4()
    find_window()
    mainscreen()
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

func menu5()
    find_window()
    mainscreen()
    $color=pixelgetcolor(418,570,$handle)
    if ($color=16053492)then
        speech("Couldn't open the menu. Check if you imported an unprotected pack and/or create a new pack and try again")
    else
        mouseclick("left",418,570)
        speech("Edit content:  Use arrow keys to navigate")
    endif
endfunc

func midi_settings()
    find_window()
    mainscreen()
    mouseclick("left",1872,22)
    speech("Midi settings:  use tab to navigate")
endfunc

func packs_list()
    find_window()
    mainscreen()
    mousemove(1056,294)
    speech("Packs list: Table with rows and columns")
endfunc

func contents_list()
    find_window()
    mainscreen()
    mouseclick("left",1056,804,2)
    speech("Contents list: Table with rows and columns")
endfunc

func generate_cpi_file()
    find_window()
    mainscreen()
    mouseclick("left",91,125)
    speech("Generating pack instalation file, please wait...")
    $color=0
    while ($color<>15592941)
        $color=pixelgetcolor(1663,20,$handle)
        sleep(800)
    wend
    while not winactivate("Save as Pack Installation File")
        soundplay(@windowsdir&"\media\ring10.wav",1)
        sleep (10)
        mouseclick("left",1663,20)
    wend
    speech ("Done. You can now save the file");
endfunc

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

func audio_settings()
    $color=pixelgetcolor(1823,17)
    if ($color=16777215)then
        speech("Please open some unprotected pack content in voice editor first")
    else
        mouseclick("left",1823,17)
        speech("Audio settings:  Use tabe to navigate")
    endif
endfunc

func mainscreen()
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

func find_window()
    if not winactivate("Yamaha Expansion Manager")then
        msgbox($mb_systemmodal,"Ooops!","Yamaha Expansion Manager not found. please open the program and try again. script finished")
        exit
    endif
endfunc
