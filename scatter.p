set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
#set terminal postscript eps enhanced color

set key samplen 2 spacing 1 font ",22"

set xtics font ",15"
set ytics font ",15"
set ylabel font ",25"
set xlabel font ",25"

#set format y "10^{%L}"
set xlabel "Number of Elements"
set ylabel "Execution Time"

set ytic auto
set xtic auto


set output "scatter1.eps"
plot 'analyse.txt' every ::0::399 using 1:3 notitle with points pt 1 ps 1.5

set output "scatter2.eps"
plot 'analyse.txt' every ::400::799 using 1:3 notitle with points pt 1 ps 1.5

set output "scatter3.eps"
plot 'analyse.txt' every ::800::1199 using 1:3 notitle with points pt 1 ps 1.5

set output "scatter4.eps"
plot 'analyse.txt' every ::1200::1599 using 1:3 notitle with points pt 1 ps 1.5

set output "scatter5.eps"
plot 'analyse.txt' every ::1600::1999 using 1:3 notitle with points pt 1 ps 1.5

