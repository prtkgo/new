from subprocess import call

f = open('analyse.txt','r')
str = f.read()

s = str.split('\n');
sum = 0
avg=0
f1 = open('output.txt','w+')

for j in range(0,20):
	for i in range(0,100):
		s1 = s[i+j*100].split(' ')
		#print i+100*j
		#print s1[0]
		#print s1[1]
		#print sum
		sum = sum + int(s1[2])
	avg = sum/100	
	#print avg
	f1.write("%s %s %s\n" % (s1[0],s1[1],avg))
	sum=0
	avg=0


f.close()
f1.close()

