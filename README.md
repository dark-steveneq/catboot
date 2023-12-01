# CatBoot
Simple, yet beautiful bootloader for Open Computers inspired by SmartEFI

## What the hell is(or rather was) SmartEFI
SmartEFI was a wonderful fork of MineOS EFI with neat QoL features such at different themes and ability to boot into any other OS if I recall correctly, but it appears that it got taken off the MineOS App Store, which is a bit sad.

## Features
- Supports **Plan9K**, **OpenOS**, **MineOS** and possibly **other OSes**
- Uses the *wonderful* [**Catppuccin**](https://github.com/catppuccin/catppuccin) theme
- Ability to select boot medium by using **arrows**, pressing **number keys** or even by **clicking**/**touching** the entry

## Ideas
- Headless mode
- Netbooting
- Built-in MineOS installer (along with ability to install any fork from any Git repo)
- Modembooting
- Custom error handler
- Disk managment

## Instalation
Comming soon when I fix all the bugs in the code

## Building
- Download all the script from the repository to your computer running OpenOS
- Install `crunch` from OPPM
- Optional: Run `drawclude` if you want to include logo and image rendering
- Optional unless you ran `drawclude`: Run `crunch eeprom.lua` or `crunch eeprom.dr.lua` if you've ran `drawclude`
- Flash `eeprom.lua`/`eeprom.cr.lua` or `eeprom.dr.cr.lua` if you've ran `drawclude`. 

## Credits
- [Catppuccin team](https://github.com/orgs/catppuccin/people) for making the theme and the logos
- [mpmxyz](https://github.com/mpmxyz) for creating `crunch`, minifier for Open Computers that makes it possible to fit my scaled down Catppuccin logo in my crappy image "format" 
