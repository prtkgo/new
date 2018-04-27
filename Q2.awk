#!/usr/bin/awk
BEGIN { 

}

{
split($3,p,".");
split($5,q,".");
split($5,r,":");

if(p[5] > q[5]){

if(f[$3r[1]] != 1){

T1[$3r[1]]=$1;
f[$3r[1]]=1;

}

T2[$3r[1]]=$1;
ar[$3r[1]]++;
a1[$3r[1]]++;
split($3,y,".");
name1[$3r[1]]=y[1]"."y[2]"."y[3]"."y[4]":"y[5];
split(r[1],y,".");
name2[r[1]$3]=y[1]"."y[2]"."y[3]"."y[4]":"y[5];

	
        if($8 == "seq")
	{
	data1[$3r[1]]++;
	if($9 ~ /:/ ){
		split($9,x,":");
		bt1[$3r[1]] += x[2]-x[1];
		}
	else
	bt1[$3r[1]]++;

	if($10!= "ack"){
	
	if($9 ~ /:/ )
		{
		split($9,x,":");
		rbt1[$3r[1]]+=x[2]-x[1];
		}
	else
	rbt1[$3r[1]]++;
	}
	}
} 
else 
{
if(f[r[1]$3] != 1){

T1[r[1]$3]=$1;
f[r[1]$3] = 1;

}

T2[$3r[1]]=$1
ar[r[1]$3]++
b2[r[1]$3]++;
split($3,y,".");
name2[r[1]$3]=y[1]"."y[2]"."y[3]"."y[4]":"y[5];
split(r[1],y,".")
name1[$3r[1]]=y[1]"."y[2]"."y[3]"."y[4]":"y[5];
	if($8 == "seq")
	{
	data2[r[1]$3]++;
	if($9 ~ /:/ )
		{
		split($9,x,":");
		bt2[r[1]$3]+=x[2]-x[1];
		}	
	else
	bt2[r[1]$3]++;
	if($10 != "ack")
	{
	
	
	if($9 ~ /:/ )
		{
		split($9,x,":");
		rbt2[r[1]$3]+=x[2]-x[1];
		}
	else
	rbt2[r[1]$3]++;
	}
	}
	
}

}
END{
 
for(i in ar)
{

split(T1[i],f,":");
split(T2[i],g,":");
time = (g[2]-f[2])*60 + g[3]-f[3] ;

print "\n"
print "Connection (A = " name1[i] ", B = " name2[i] ")"; 
print "------------------------------------------------------"
print "\n A-->B\n";
print a1[i]+0" "data1[i]+0" "bt1[i]+0" "rbt1[i]+0" "(bt1[i]-rbt1[i]+0)/time;
print "\n B-->A\n";
print  b2[i]+0" "data2[i]+0" "bt2[i]+0" "rbt2[i]+0" "(bt2[i]-rbt2[i]+0)/time;
}

}

