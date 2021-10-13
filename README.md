# oneVPL Docker

# Requirements: 11th generation Intel Core CPU, Ubuntu 20.04.

# Execution:
* Start Docker
`docker build -t onevpl1`
`docker run --privileged -it onevpl1`
* Set environments
`source /opt/intel/oneapi/setvars.sh`
* Run samples
`cd bin \n./sample_decode h265 -i ../examples/content/cars_128x96.h265`