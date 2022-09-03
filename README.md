# GS-YEM-Access
A script to make Yamaha Expansion Manager software more accessible to blind people

*Author:  Gabriel Schuck
## Showcase

Yamaha Music has been developing software in recent years to help with the incredible functionality of its musical instruments, especially arranjer keyboards.
Unfortunately, these programs are mostly not fully accessible for use by blind people.
Users in equal conditions to enjoy the same resources face difficulties, as the interface has not been adapted to work perfectly with screen readers (programs that read the displayed information aloud).
It was with this in mind that the idea was born for an accessibility script for Yamaha Expansion Manager, a free desktop application that allows users to install and manage expansion packs, as well as transfer to compatible digital keyboards.
Although some interface elements are accessible with nvda object navigation, this ends up making them impractical to use.
For script development, macro languages (such as Autoit and Macro Recorder) were chosen so that it can work independently of the currently active screen reader.

## Requirements

<ul>
<li>Yamaha Expansion Manager from version 2.8.1 or higher;</li>
<li>Screen resolution 1920 X 1080 (Full HD) and text scale to 100%</li>
<li>Latest version of
<a href="https://www.autoitscript.com/site/autoit/downloads/">autoit </a> installed if you want to run from source code. You can also run an already-compiled version of the script (pre-releases). Visit the Releases section.  </li>
</ul>

## How to use?

Simply run the file "gs_yem_access.au3" from source code.
When the Yamaha Expansion Manager window is in focus, you will hear a sound and a welcome message from your active screen reader.
If you are not using a screen reader, the sapi voice configured by default will be used To speak additional messages.

## What can you do with the script so far?

<ul>
<li>create and import packs</li>
<li>edit pack, where you can export, change LSB bank, rename, change image, etc. I plan to make available little extra hotkey driven utilities that will automatically switch from LSB to packs that require it, like those from <a href="https://prostylemusic.net/">Pro Style Music
</a>. This operation is very difficult for a blind person to do</li>
<li>ADD Content: Compatible sample files. I've been using soundfonts a lot, including creating my own with the help of programs like <a href="https://samplerobot.com/">SampleRobot</a> which is minimally accessible. After saving and generating the CPI of the created pack, you can install it on the keyboard and improve the voice a little, with Release and Reverb parameters.
All this and much more is certainly possible in the Voice Editor. We'll still get there at some point</li>
<li>edit content: Program change, export content as pack, etc</li>
<li>Midi settings: For sending midi data via keyboard</li>
<li>Audio settings: So you can test an unprotected pack in the software itself before sending it to the keyboard. Very useful to avoid unnecessary formatting in expansion memory</li>
<li>know information about the instrument such as model, expansion memory size for voices and audio styles (if any) according to imported n27 file</li>
</ul>

## Usage tips

If you are going to use Yamaha Expansion Manager for the first time, you need to import your instrument info file. Generate the instrument info file directly from your keyboard. It will save to pendrive.
Then, in YEM and with the script activated, use f3 and choose with the arrows the option "import instrument info".
Once that's done, check if everything went well with the control+i shortcut.
You will hear instrument information such as the model and size of the expansion memory for voices and audio styles.

Done! Now you can start importing the desired packs.
Use the f1 key and choose "import pack".
You can import as many packs as you like, as long as you respect your keyboard's expansion memory limit.
At the end, press f10 to generate an installation file for the selected packs. The process may take a while, please be patient.
Meanwhile, a beep sound will be played to indicate that the process is in progress. At the end, press f10 again to save the file.

## Main shortcut keys

<ul>
<li>f1: Opens the "add Pack" menu</li>
<li>f2: Opens the "edit pack" menu</li>
<li>f3: Opens the "install target" menu</li>
<li>f4: Opens the "add content" menu (only for packs created by you and/or unprotected)</li>
<li>f5: Opens the "edit content" menu (only for packs created by you and/or unprotected)</li>
<li>f6: List of imported packs. Use the up, down, left and right arrow keys to navigate the rows and columns of the table</li>
<li>f7: List of contents of the selected pack. Use the up, down, left and right arrow keys to navigate the rows and columns of the table</li>
<li>f8: Configure midi input and output</li>
<li>f9: Set audio output (need to open unprotected pack content in voice editor first)</li>
<li>f10: Generate CPI or PPI file of imported packs</li>
<li>control+i:  Know instrument information according to imported n27 file
<li>ctrl+q: Close the script</li>
</ul>

## Contributing

Any contribution in order to help improve the project is always very welcome!

## Aditional links

<a href="https://www.yamaha.com/">Yamaha Corporation Global </a>
<br>
<a href="https://www.manualsdir.com/manuals/848892/yamaha-expansion-manager.html">Yamaha Expansion Manager Online Manual </a>
<br>
<a href="https://shop.usa.yamaha.com/downloadables">Yamaha Music Soft </a>
