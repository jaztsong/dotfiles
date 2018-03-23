#!/usr/bin/gnuplot
set terminal pdfcairo dashed  color enhanced size 3.25,1.75 font "Arial,12" 
set output ''

# set timefmt "%H:%M"
# set xdata time
# set format x "%H:%M"

# set xtics "",""
set lmargin 6
set rmargin 3
set tmargin 1
set bmargin 2

set ylabel "" offset 2,0
set xlabel "" offset 0,1
set xtics font ",10"
set ytics font ",10"
# set format x "%.1f"
# set style arrow 7 nohead ls 0 lw 3
# set arrow 1 from 0.0,0.0 to 10,10 as 7
# set arrow 1 from 0.1,0.1 to 8,8 as 7
# set object rectangle from 0,0 to 11,11 
# set xtics  ("Above" 12,"1" 1,"3" 3,"5" 5,"7" 7,"9" 9, "11" 11)
plot
