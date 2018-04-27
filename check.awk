#!/usr/bin/awk

BEGIN{
 cntc=0
 cnts=0
 x=0
 
}
{

if( $0 ~ /\/\// ){if(x==0) cntc++ }
if( $0 ~ /\/\*/ ){x=1}
if( $0 ~ /".*\/\*.*"/){x=0}
if( $0 ~ /\/\/.*\/\*/){x=0}
if( $0 ~ /".*\/\/.*"/){if(x==0) cntc-- }
if( $0 ~ /".*".*\/\*/){cnts++}
if( $0 ~ /".*"/){if(x==0) cnts++}
if( $0 ~ /^.*\/\/.*".*".*$/){if(x==0) cnts--}
if( $0 ~ /^.*$/){if(x==1) cntc++}
if( $0 ~ /\*\//){ x=0 }
if( $0 ~ /\*\/.*".*"/){ cnts++ }    
    
    



}
END{
print "Number of Comments = "cntc
print "Number of Strings = "cnts
}

