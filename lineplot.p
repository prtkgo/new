#set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set terminal postscript eps enhanced color

set key samplen 2 spacing 1.5 font ",22"

set xtics font ",15"
set ytics font ",15"
set ylabel font ",25"
set xlabel font ",25"

set xlabel "Number of Elements"
set ylabel "Average Execution Time"


set ytic auto
set xtic auto

set key bottom right

set output "average.eps"
plot 'output.txt' every ::0::3 using 1:3 title "thread 1" with linespoints, \
     '' every ::4::7 using 1:3 title "thread 2" with linespoints pt 5 lc 5,\
     '' every ::8::11 using 1:3 title "thread 3" with linespoints lc 4,\
     '' every ::12::15 using 1:3 title "thread 4" with linespoints lc 3,\
     '' every ::16::19 using 1:3 title "thread 5" with linespoints lc 2

