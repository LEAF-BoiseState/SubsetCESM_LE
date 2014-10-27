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
# 1. Initial error trap for number of arguments (must be four)
#===============================================================================
if [ ! $# == 9 ]; then
    echo "$0 <Min lat> <Max lat> <Min lon> <Max lon> <Local output path>"
    exit
fi

#===============================================================================
# 2. Store argument variables in local variables
#===============================================================================
MinLat="$1"
MaxLat="$2"
MinLon="$3"
MaxLon="$4"
CESM_LE_BasePath="$5"
CESM_AddPath="$6"
OutputBasePath="$7"
CESM_LEvar="$8"
CESM_Domain="$9"

#===============================================================================
# 3 Create the command to execute and run it
#===============================================================================
InputPath=$CESM_LE_BasePath$CESM_Domain$CESM_AddPath$CESM_LEvar
ListCommand="ls -1 "$InputPath"/b.e11* > InputFile_"$CESM_LEvar
bash -c "$ListCommand"

OutputPath=$OutputBasePath$CESM_LEvar

cat InputFile_"$CESM_LEvar" | awk -v AwkMinLat="$MinLat" -v AwkMaxLat="$MaxLat" -v AwkMinLon="$MinLon" \
    -v AwkMaxLon="$MaxLon" '{ print "ncks -O -d lat,"AwkMinLat","AwkMaxLat" -d lon,"AwkMinLon","AwkMaxLon" "$1" "$1}' | sed \
    -e "s,"$InputPath","$OutputPath",2" | sed -e "s,b.e11,GBss.b.11,2" | sh;
