# DC Crime Data

A package with DC's crime data from 2006-01-01 through 2012-07-17.

## About the data

### Data history

Last updated:  2012-07-17
Earliest data: 2006-01-01

### Data dictionary

You can find crime definitions [here] [crime_data_definitions] .

I include a data dictionary in the form of a csv file. This will need to be updated because it currently mixes variables definitions and variable value definitions.

#### Cleaning the data

* 105 XBLOCK coordinates from Ward 5 have XBLOCK coordinates that are two orders of magnitude off.
** `crime_dat$XBLOCK[crime_dat$XBLOCK > 40000000] <- crime_dat$XBLOCK[crime_dat$XBLOCK > 40000000] / 100`
* 2 YBLOCK coordinates are an order of magnitude off
** 1423925.0 is divided by 10
** 1742951.8 is divided by 10 and the first two digits are transposed
* Several others are too low, need to investigate

#### Map coordinates

Location is approximated to the center of the street block. Values are in the Maryland State Plane meters NAD 83 map projection.

#### Sexual assault disclaimer

Sexual assualt data is not available before 2009.

## Setup

Setup instructions to get the data or update the package.

### Installation instructions

1. Download from github:

        git clone git://github.com/eshilts/dc_crime_data.git

1. Build and install

        cd dc_crime_data
        bin/build.sh
        R CMD INSTALL dccrimedata_0.1.tar.gz # version number may be off

1. Load and use

        library(dccrimedata) 
        crime_data <- load_crime_data_by_ward()

### Updating crime data

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


[crime_data_search]: http://crimemap.dc.gov/CrimeMapSearch.aspx "DC crime data searchable site"
[crime_data_definitions]: http://crimemap.dc.gov/CrimeDefinitions.aspx "DC crime data definitions"
