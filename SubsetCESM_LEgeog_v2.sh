#!/bin/bash
# 
# PURPOSE: The purpose of this script is to subset a geographic extent from the output of 
#          Community Earth System Model (CESM) Large Ensemble experiment. The webpage for
#          the CESM LE experiment is here: http://www2.cesm.ucar.edu/models/experiments/LENS
#
# CODER: Lejo Flores
# 
# REVISION:
#	0 - 2014/10/23 (LF)
#
# USAGE: ./SubsetCESM_LEgeog.sh <Input file> <Min lat> <Max lat> <Min lon> <Max lon>
#           SubsetCESM_LEgeog.sh = name of this shell script
#           <Input file>         = name of the input file containing NetCDF files (with full paths) to subset
#           <Min lat>            = minimum (lower) latitude boundary
#           <Max lat>            = maximum (upper) latitude boundary
#           <Min lon>            = minimum (left) longitude boundary
#           <Max lon>            = maximum (right) longitude boundary
#
# ASSUMPTIONS:
#   NetCDF Operators (NCO) are installed on machine

#===============================================================================
# 0. Set constants for entire file (if any) 
#===============================================================================

#===============================================================================
# 1. Store argument variables in local variables
#===============================================================================
MinLat="35.7"
MaxLat="45.4"
MinLon="237.5"
MaxLon="249.1"
CESM_LE_BasePath="/glade/p/cesm0005/CESM-CAM5-BGC-LE/"
CESM_AddPath="/proc/tseries/daily/"
OutputBasePath="/glade/scratch/aflores/CESM_LE_GBsubsets/"

# 3.1 Precipitation
CESM_LEvar="PRECT"
CESM_Domain="atm"
InputPath=$CESM_LE_BasePath$CESM_Domain$CESM_AddPath$CESM_LEvar
ListCommand="ls -1 "$InputPath"/b.e11* > InputFile"
bash -c "$ListCommand"

OutputPath=$OutputBasePath$CESM_LEvar

cat InputFile | awk -v AwkMinLat="$MinLat" -v AwkMaxLat="$MaxLat" -v AwkMinLon="$MinLon" \
    -v AwkMaxLon="$MaxLon" '{ print "ncks -O -d lat,"AwkMinLat","AwkMaxLat" -d lon,"AwkMinLon","AwkMaxLon" "$1" "$1}' | sed \
    -e "s,"$InputPath","$OutputPath",2" | sed -e "s,b.e11,GBss.b.11,2" | sh;

# 3.2 Humidity
CESM_LEvar="QBOT"
CESM_Domain="atm"
InputPath=$CESM_LE_BasePath$CESM_Domain$CESM_AddPath$CESM_LEvar
ListCommand="ls -1 "$InputPath"/b.e11* > InputFile"
bash -c "$ListCommand"

OutputPath=$OutputBasePath$CESM_LEvar

cat InputFile | awk -v AwkMinLat="$MinLat" -v AwkMaxLat="$MaxLat" -v AwkMinLon="$MinLon" \
    -v AwkMaxLon="$MaxLon" '{ print "ncks -O -d lat,"AwkMinLat","AwkMaxLat" -d lon,"AwkMinLon","AwkMaxLon" "$1" "$1}' | sed \
    -e "s,"$InputPath","$OutputPath",2" | sed -e "s,b.e11,GBss.b.11,2" | sh;

# 3.3 Soil moisture
CESM_LEvar="SOILWATER_10CM"
CESM_Domain="lnd"
InputPath=$CESM_LE_BasePath$CESM_Domain$CESM_AddPath$CESM_LEvar
ListCommand="ls -1 "$InputPath"/b.e11* > InputFile"
bash -c "$ListCommand"

OutputPath=$OutputBasePath$CESM_LEvar

cat InputFile | awk -v AwkMinLat="$MinLat" -v AwkMaxLat="$MaxLat" -v AwkMinLon="$MinLon" \
    -v AwkMaxLon="$MaxLon" '{ print "ncks -O -d lat,"AwkMinLat","AwkMaxLat" -d lon,"AwkMinLon","AwkMaxLon" "$1" "$1}' | sed \
    -e "s,"$InputPath","$OutputPath",2" | sed -e "s,b.e11,GBss.b.11,2" | sh;

# 3.4 Average reference height temperature
CESM_LEvar="TREFHT"
CESM_Domain="atm"
InputPath=$CESM_LE_BasePath$CESM_Domain$CESM_AddPath$CESM_LEvar
ListCommand="ls -1 "$InputPath"/b.e11* > InputFile"
bash -c "$ListCommand"

OutputPath=$OutputBasePath$CESM_LEvar

cat InputFile | awk -v AwkMinLat="$MinLat" -v AwkMaxLat="$MaxLat" -v AwkMinLon="$MinLon" \
    -v AwkMaxLon="$MaxLon" '{ print "ncks -O -d lat,"AwkMinLat","AwkMaxLat" -d lon,"AwkMinLon","AwkMaxLon" "$1" "$1}' | sed \
    -e "s,"$InputPath","$OutputPath",2" | sed -e "s,b.e11,GBss.b.11,2" | sh;

# 3.5 Minimum reference height temperature
CESM_LEvar="TREFHTMN"
CESM_Domain="atm"
InputPath=$CESM_LE_BasePath$CESM_Domain$CESM_AddPath$CESM_LEvar
ListCommand="ls -1 "$InputPath"/b.e11* > InputFile"
bash -c "$ListCommand"

OutputPath=$OutputBasePath$CESM_LEvar

cat InputFile | awk -v AwkMinLat="$MinLat" -v AwkMaxLat="$MaxLat" -v AwkMinLon="$MinLon" \
    -v AwkMaxLon="$MaxLon" '{ print "ncks -O -d lat,"AwkMinLat","AwkMaxLat" -d lon,"AwkMinLon","AwkMaxLon" "$1" "$1}' | sed \
    -e "s,"$InputPath","$OutputPath",2" | sed -e "s,b.e11,GBss.b.11,2" | sh;

# 3.6 Maximum reference height temperature
CESM_LEvar="TREFHTMX"
CESM_Domain="atm"
InputPath=$CESM_LE_BasePath$CESM_Domain$CESM_AddPath$CESM_LEvar
ListCommand="ls -1 "$InputPath"/b.e11* > InputFile"
bash -c "$ListCommand"

OutputPath=$OutputBasePath$CESM_LEvar

cat InputFile | awk -v AwkMinLat="$MinLat" -v AwkMaxLat="$MaxLat" -v AwkMinLon="$MinLon" \
    -v AwkMaxLon="$MaxLon" '{ print "ncks -O -d lat,"AwkMinLat","AwkMaxLat" -d lon,"AwkMinLon","AwkMaxLon" "$1" "$1}' | sed \
    -e "s,"$InputPath","$OutputPath",2" | sed -e "s,b.e11,GBss.b.11,2" | sh;

# 3.7 Surface temperature
CESM_LEvar="TS"
CESM_Domain="atm"
InputPath=$CESM_LE_BasePath$CESM_Domain$CESM_AddPath$CESM_LEvar
ListCommand="ls -1 "$InputPath"/b.e11* > InputFile"
bash -c "$ListCommand"

OutputPath=$OutputBasePath$CESM_LEvar

cat InputFile | awk -v AwkMinLat="$MinLat" -v AwkMaxLat="$MaxLat" -v AwkMinLon="$MinLon" \
    -v AwkMaxLon="$MaxLon" '{ print "ncks -O -d lat,"AwkMinLat","AwkMaxLat" -d lon,"AwkMinLon","AwkMaxLon" "$1" "$1}' | sed \
    -e "s,"$InputPath","$OutputPath",2" | sed -e "s,b.e11,GBss.b.11,2" | sh;

# 3.8 Average surface windspeeds
CESM_LEvar="WSPDSRFAV"
CESM_Domain="atm"
InputPath=$CESM_LE_BasePath$CESM_Domain$CESM_AddPath$CESM_LEvar
ListCommand="ls -1 "$InputPath"/b.e11* > InputFile"
bash -c "$ListCommand"

OutputPath=$OutputBasePath$CESM_LEvar

cat InputFile | awk -v AwkMinLat="$MinLat" -v AwkMaxLat="$MaxLat" -v AwkMinLon="$MinLon" \
    -v AwkMaxLon="$MaxLon" '{ print "ncks -O -d lat,"AwkMinLat","AwkMaxLat" -d lon,"AwkMinLon","AwkMaxLon" "$1" "$1}' | sed \
    -e "s,"$InputPath","$OutputPath",2" | sed -e "s,b.e11,GBss.b.11,2" | sh;

