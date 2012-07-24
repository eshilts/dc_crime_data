# DC Crime Data

A package with DC's crime data from 2006-01-01 through 2012-07-17.

## Installation instructions

1. Download from github:

        git clone git://github.com/eshilts/dc_crime_data.git

1. Build and install

        cd dc_crime_data
        bin/build.sh
        R CMD INSTALL dccrimedata_0.1.tar.gz # version number may be off

1. Load and use

        library(dccrimedata) 
        crime_data <- load_crime_data_by_ward()

## Updating crime data

1. Visit the [DC crime data search] [crime_data_search] page
1. Select Other Geographic Area or Point
1. Select _Wards_ from the drop down box
1. Select each ward in turn (1 - 8)
1. Click _Other_ option button
1. Set From: date to 01/01/2006 (earliest date available)
1. Click the _Search_ button
1. Click the red _Download Crime Data_ link
1. Click the red _Check all_ link
1. Click the _Get Data_ button
1. Save the resulting file as wardX.csv in the data directory.


[crime_data_search]: http://crimemap.dc.gov/CrimeMapSearch.aspx "DC Crime Data Searchable Site"
