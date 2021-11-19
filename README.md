# GS-YEM-Access
A script to make Yamaha Expansion Manager software more accessible to blind people

*Author:  Gabriel Schuck
## Showcase

Yamaha Music has been developing software in recent years to help with the incredible functionality of its musical instruments, especially keyboards.
Unfortunately, these programs are mostly not fully accessible for use by blind people.
Users in equal conditions to enjoy the same resources face difficulties, as the interface has not been adapted to work perfectly with screen readers (programs that read the displayed information aloud).
It was with this in mind that the idea was born for an accessibility script for Yamaha Expansion Manager, a free desktop application that allows users to install and manage expansion packs, as well as transfer to compatible digital keyboards.
Although some interface elements are accessible with nvda object navigation, this ends up making their use not very practical.

## Requirements
<ul>
<li>Yamaha Expansion Manager from version 2.8.1 or higher;</li>
<li>Screen resolution 1920 X 1080 (Full HD)</li>
<li>Latest version of
<a href="https://www.autoitscript.com/site/autoit/downloads/">autoit </a> installed if you want to run from source code</li>
</ul>

## How to use?

Simply run the file "gs_yem_access.au3".
When the Yamaha Expansion Manager window is in focus, you will hear a sound and a welcome message from your active screen reader.
If you are not using a screen reader, the sapi voice configured by default will be used.

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
<li>ctrl+q: Close the script</li>
</ul>

## Contributing
Any contribution in order to help improve the project is always very welcome!
