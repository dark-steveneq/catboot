# CatBoot
Simple, yet beautiful bootloader for Open Computers inspired by SmartEFI

## What the hell is(or rather was) SmartEFI
SmartEFI was a wonderful fork of MineOS EFI with neat QoL features such at different themes and ability to boot into any other OS if I recall correctly, but it appears that it got taken off the MineOS App Store, which is a bit sad. 

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
