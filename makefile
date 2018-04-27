all:cs251.ex1   

CFLAGS = -I.
LIBS = -lm 

cs251.ex1:prog.o thread_function.o 
	gcc $(CFLAGS) -o cs251.ex1 prog.o thread_function.o $(LIBS) -lpthread
prog.o:prog.c common.h thread_function.o
	gcc $(CFLAGS) -c prog.c -o prog.o $(LIBS) -lpthread
thread_function.o:thread_function.c common.h
	gcc $(CFLAGS) -c thread_function.c -o thread_function.o $(LIBS) -lpthread
report:./cs251.ex1 threads.txt params.txt 
	bash runtest.sh params.txt threads.txt 

 
analyse:./report report.txt params.txt threads.txt
	bash analyse.sh report.txt params.txt threads.txt

an1:./test.py
	python test.py output.txt
anal: an1 analyse
plot: plot1 plot2

plot1:analyse
	gnuplot scatter.p 

plot2:an1 
	gnuplot lineplot.p 

report_latex: 
	pdflatex latexrep.tex
clean:
	rm -f *.o cs251.ex1 output.txt report.txt analyse.txt *.eps *.aux *.log *.pdf
