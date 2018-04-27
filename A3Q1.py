#!/usr/bin/python

import sys

def tr(base):
   ln=len(base)
   if ln == 1:
      return ord(base[0])-48
   elif ln==2:
      return (ord(base[0]) - 48)*10 + (ord(base[1])-48)


def val(c):
    if (c >= '0' and c <= '9') :
        return ord(c) - 48
    elif c=='-':
        return 0
    else:
        return ord(c) - ord('A') + 10
  
        


def Dec(st, base):
   if ( st.find('.')==-1 ):
     le = len(st)
     power = 1
     num = 0
     i=le-1
     while i >= 0 :

        if val(st[i]) >= base:
           print 'Invalid Input'
           return ' '

        num = num + val(st[i]) * power
        power = power * base
        i=i-1
     
     
     return num
     
   else:
     
     le = st.find('.')
     
     power = 1
     num = 0
     i=le-1
     le1 = len(st) -le-1
     
     while i >= 0 :

        if val(st[i]) >= base:
           print 'Invalid Input'
           return ' '

        num = num + val(st[i]) * power
        power = power * base
        i=i-1

     npow=1.0/base
     j=1
 
     
     while j<=le1 :
        num = num + val(st[j+le])*npow
        
        npow = npow/base
        j=j+1
   
   
   return num



s = sys.argv[1]
ba = sys.argv[2]

temp=tr(base=ba)
ans=Dec(s,temp)
#ans1= ans.rstrip('0')
#ans2= ans1.rstrip('.')
if ans != ' ':
   if s[0]=='-':
      print ("-%.6f" % ans ).rstrip('0').rstrip('.')
   else:
      print ("%.6f" %  ans).rstrip('0').rstrip('.')
  


  
  
    

