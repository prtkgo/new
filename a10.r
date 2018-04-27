#1
num_samples <- 50000
data <- rexp(num_samples, 0.2)
x <- data.frame(X = seq(1, num_samples , 1), Y = sort(data))
plot(x)

#2
y<-matrix(,nrow=500,ncol=100)

for( i in 1:500){
	for(j in 1:100){
		y[i,j] <- data[(i-1)*100 + j]
	}
}

#3

#PDF
pdata <- matrix(,nrow=5,ncol=100)

for(i in 1:5){
	for(j in 1:100){
        pdata[i,j] = 0    
    }
}

for(i in 1:5){
	for(j in 1:100){
    	val = round(y[i,j], 0);
    	#print(val)
    	if(val <= 100){
        	pdata[i,val] = pdata[i,val] + 1/100; 
		}    
    }
}

xcols <- c(0:99)

for(i in 1:5){
	plot(xcols, pdata[i,], "l", xlab="X", ylab="f(X)")
}

#CDF
cdata <- matrix(,nrow=5,ncol=100)

for(i in 1:5){
	cdata[i,1]<-pdata[i,1]
}

for(i in 1:5){
	for(j in 2:100){
    	cdata[i,j] = cdata[i,j-1] + pdata[i,j]     
    }
}

for(i in 1:5){
	plot(xcols, cdata[i,], "o", col="blue", xlab="X", ylab="F(X)");
}

#Mean & Standard Deviation

mean <- matrix(,nrow=1,ncol=500)
std <- matrix(,nrow=1,ncol=500)

for( i in 1:500){
		mean[1,i]=mean(y[i,])
		std[1,i]=sqrt(var(y[i,]))
}

for(i in 1:5){
	cat ("mean is",mean[1,i],"for Y",i,".\n")
	cat ("standard deviation is",std[1,i],"for Y",i,".\n\n")
}

#4

tab <- table(round(mean[1,]))
plot(tab, "h", xlab="Value", ylab="Frequency")

pdata1 <- rep(0, 100);

for(i in 1:100){
    val1=round(mean[1,i], 0);
    if(val1 <= 100){
       pdata1[val1] = pdata1[val1] + 1/500; 
    }
}

xcols1 <- c(0:99)

plot(xcols1, pdata1, "l", xlab="X1", ylab="f1(X1)")

cdata1 <- rep(0, 100)

cdata1[1] <- pdata1[1]

for(i in 2:100){
    cdata1[i] = cdata1[i-1] + pdata1[i]
}

plot(xcols1, cdata1, "o", col="blue", xlab="X1", ylab="F(X1)");

#5

mean1<-mean(mean[1,])
std1<-sqrt(var((mean[1,])))

cat ("mean is",mean1,"for Z.\n")
cat ("standard deviation is",std1,"for Z.\n\n")

#6

mean_o<-mean(data)
std_o<-sqrt(var((data)))

cat ("mean is",mean_o,"for original distribution.\n")
cat ("standard deviation is",std_o,"for original distribution.\n\n")

cat ("Mean of sample means is very close to the mean for original distribution.\nStandard Deviation for sample means is much smaller than Standard Deviation of original distribution, as expected.\n\n")





























