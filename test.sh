#!/bin/bash -ex

# Clean all the existing outputs, compilations and results
if [ -d "test/" ]; then rm -r "test/"; fi
JAR_FILE="CSE512-Hotspot-Analysis-Template-assembly-0.1.0.jar"
if [ -f "$JAR_FILE" ]; then rm "$JAR_FILE"; fi
sbt clean assembly

cp "target/scala-2.11/${JAR_FILE}" .

spark-submit "$JAR_FILE" \
  test/output \
  hotzoneanalysis src/resources/point-hotzone.csv src/resources/zone-hotzone.csv \
  hotcellanalysis src/resources/yellow_tripdata_2009-01_point.csv

# Test the answers
diff testcase/hotcell/hotcell-example-answer.csv test/output1/part-*.csv
diff testcase/hotzone/hotzone-example-answer.csv test/output0/part-*.csv
