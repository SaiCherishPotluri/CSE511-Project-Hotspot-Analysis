#!/bin/bash -x

sbt clean

rm -r "test/"

JAR_FILE="CSE512-Hotspot-Analysis-Template-assembly-0.1.0.jar"
rm "$JAR_FILE"

rm -r .bsp/

rm -r spark-warehouse/

rm -r target/
