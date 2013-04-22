A xbox 360 controller wrapper for love 0.8.0

This wrapper has been tested with;

* The xbox 360 wireless receiver
* xbox 360 wireless controller

This wrapper has not been tested with, but will most likely work with;

* xbox 360 wired controller
* xbox wired controller

*Please report with an issue if these work or do not work for you!*

Tested with;

* Ubuntu 12.04 w/ xboxdrv via the `ppa:grumbel/ppa`
* Arch Linux w/ xboxdrv via the AUR
* OS X w/ Tattiebogle
* Windows Vista Ultimate w/ msft drivers

Known Bugs;

For some reason, windows drivers (xbox official and directX) combine LT and RT into one axis, basically making concurrency usage trash. While dong will register the triggers independently with correct values (compared to linux & OS X), dong will only be able to use one at a time.
