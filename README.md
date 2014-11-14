[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/spuder/simple-ynab?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Simple-Ynab

A simple ruby script to convert the csv provided by simple.com to something that ynab can understand

Supported Os's
- Mac OSX
- Linux

### Installation

    $ gem install simple-ynab

### Usage

Convert entire CSV file  

    $ simple-ynab ~/Downloads/foo.csv
    
Convert and save only last 30 days of transactions

    $ simple-ynab -d 30 ~/Downloads/foo.csv
    
View detailed debugging information

    $ simple-ynab -v ~/Downloads/foo.csv
   
Convert and use YNAB date format (See known issues below)

    $ simple-ynab -y ~/Downloads/foo.csv

or for more options:

    $ simple-ynab --help

A csv file will then be created in the same directory with the following name

    ~/Downloads/foo.simple.csv


----
Export CSV from Simple.com
![](http://cl.ly/image/1d0N2n2q2g1o/download/Screenshot%202014-11-11%2009.27.39.png)

----
Import into YNAB
![](http://cl.ly/image/1U2J1n413K18/Screenshot%202014-11-11%2012.06.40.png)


### Known issues

Duplicate Transactions when using`-y` or `--ynab_date`

> YNAB has a bug where if you previously import transactions containing the date in one syntax, and then import a csv with a different date syntax, YNAB will consider them as different transactions. (Even if they are identical in every other way)

Workaround:

> Open the CSV file and change the dates to match the format that your bank normally uses (e.g YYYY/MM/DD