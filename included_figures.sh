#! /bin/bash
#
# figure_included.sh
# Copyright (C) 2016 Maël Valais <mael.valais@gmail.com>
#
#


ack '^[^%]*\\includegraphics' | sed "s/^.*{\(.*\)}/\1/g" | sed 's:[\\}]::g'
