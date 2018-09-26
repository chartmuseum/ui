#!/bin/bash

set -e

go build .

godep get

godep save

docker build . -t $1

