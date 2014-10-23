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

#=========================================================================================
# 0. Set constants for entire file (if any) 
#=========================================================================================

#=========================================================================================
# 1. Initial error trap for number of arguments (must be four)
#=========================================================================================
if [ ! $# == 6 ]; then
    echo "$0 <Input file> <Min lat> <Max lat> <Min lon> <Max lon> <Local output path>"
    exit
fi

#=========================================================================================
# 2. Store argument variables in local variables
#=========================================================================================
InputFile="$1"
MinLat="$2"
MaxLat="$3"
MinLon="$4"
MaxLon="$5"
OutputPath="$6"

cat $InputFile | awk '{ print "ncks -O -d,lat,"$MinLat","$MaxLat" -d,lon,"$MinLon","$MaxLon" "$1" "$1}' | sed -e "s/\/glade\/p\/cesm0005\/CESM-CAM5-BGC-LE\/atm\/proc\/tseries\/daily\/PRECT\/b\.e11\./\~\/$OutputPath\/GB_subset/2"
     
    
