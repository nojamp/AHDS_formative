#!/bin/bash

DATADIR='../../data'

# Save participants with accelorometer data to a variable
ls -l $DATADIR/derived/accel | cut -f9 -d ' ' | sed 's/accel-//g' | sed 's/.txt//g' > $DATADIR/derived/accel-ids.txt
