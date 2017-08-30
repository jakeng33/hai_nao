a=int(input("enter your first integer:"))
b=int(input("enter your second integer:"))+1
c=0  

for i in range(a,b):
    if i%2==1:
        c=c+i
        i= i+2

        
print(c)
