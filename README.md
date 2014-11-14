[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/spuder/simple-ynab?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Simple-Ynab

A simple ruby script to convert the csv provided by simple.com to something that ynab can understand

Currently it must be executed from the command line. Maybe someday it will have a GUI

### Installation

    $ gem install simple-ynab

### Usage

    $ simple-ynab ~/Downloads/foo.csv

or for more options:

    $ simple-ynab --help

A csv file will then be created in the same directory with the following name

    ~/Downloads/foo.simple.csv

- Optionally open the new csv in excel to remove all previous months entries  
- Import into Ynab (make sure to choose the corect date format)

----
Export CSV from Simple.com
![](http://cl.ly/image/1d0N2n2q2g1o/download/Screenshot%202014-11-11%2009.27.39.png)

----
Import into YNAB
![](http://cl.ly/image/1U2J1n413K18/Screenshot%202014-11-11%2012.06.40.png)