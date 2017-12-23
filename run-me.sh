#!/bin/bash -xe

test -r fpdf*.tar.gz || pip download fpdf
test -r bitcoin*.tar.gz || pip download bitcoin
sudo apt-get install -y python-dev libjpeg-dev libjpeg8-dev libpng3 libfreetype6-dev python python-imaging python-qrcode  python-pil python-pdfrw
rundir="/tmp/mspw-pdf"
mkdir -p "$rundir"
test -d "$rundir"/bitcoin-1.1.42 || ( zcat bitcoin*.tar.gz | ( cd "$rundir" && tar -xvf - ) )
test -d "$rundir"/fpdf-1.7.2 || ( zcat fpdf*.tar.gz | ( cd "$rundir" && tar -xvf - ) )
cp mspw-pdf.py light2.jpg "$rundir"
cd "$rundir"
PYTHONPATH=./bitcoin-1.1.42:./fpdf-1.7.2 python ./mspw-pdf.py
