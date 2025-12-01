lepta=document.getElementById("lepta")
sms=document.getElementById("sms")
mb=document.getElementById("mb")
res=document.getElementById("res")
sub =document.getElementById("sub")
let sum = 0;
let extrasms=0; let extrakliseis=0; let extramb=0;
sub.addEventListener('click',()=>{
    console.log("submit clicked")
    
    if (lepta.value > 300) {
        extrakliseis = (lepta.value-300)*60 * 0.0031 
    }
    if (sms.value>200){
        extrasms = (sms.value-200)*0.5
    }
    if(mb.value>1000){
        extramb=(mb.value-1000)*0.03
    }
    sum=20+extrakliseis+extramb+extrasms
    console.log("\nthe sum is: "+sum)
    res.value=sum
}) 
