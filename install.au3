;Simple script that encapsulates the files needed to run the compiled version. Such files are extracted into temporary folder for better organization
fileinstall("dolapi.dll",@tempdir&"\dolapi.dll")
fileinstall("fim.wav",@tempdir&"\fim.wav")
fileinstall("intro.wav",@tempdir&"\intro.wav")
fileinstall("jfwapi.dll",@tempdir&"\jfwapi.dll")
fileinstall("nvdacontrollerclient.dll",@tempdir&"\nvdacontrollerclient.dll")
fileinstall("saapi32.dll",@tempdir&"\saapi32.dll")
fileinstall("universalspeech.dll",@tempdir&"\universalspeech.dll")
fileinstall("universalspeech.tlb",@tempdir&"\universalspeech.tlb")
