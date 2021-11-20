func speech ($text="",$interrupt=false)
    if (not @compiled) then
        $dll = dllopen("universalspeech.dll")
    else
        $dll = dllopen(@tempdir&"\universalspeech.dll")
    endif
    if $interrupt=true then dllcall($dll, "int:cdecl", "speechSayA", "str",$text, "int", 1)
    if $interrupt=false then dllcall($dll, "int:cdecl", "speechSayA", "str",$text, "int", 0)
    dllclose($dll)
endfunc
