## Simple-Ynab
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/spuder/simple-ynab?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
A simple ruby script to convert the csv provided by simple.com to something that ynab can understand

Currently it must be executed from the command line. Maybe someday it will have a GUI

### Installation

    $ gem install simple-ynab

### Usage

    $ simple-ynab ~/Downloads/foo.csv

A csv file will then be created in the same directory with the following name


     ~/Downloads/foo.csv.simple.csv

- Optionally open the new csv in excel to remove all previous months entries  
- Import into Ynab (make sure to choose the corect date format)



