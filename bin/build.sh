#!/bin/sh
./bin/clean.sh &&\
./bin/roxygenize.R &&\
R CMD build . &&\
R CMD check *.tar.gz
