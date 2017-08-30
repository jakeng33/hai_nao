string=input('Input your string: ')

#cat string de tao list
i= string.split(' ')

#Tao mot dict trong
dct= {}

#Lay tung object trong list i
for k in i:
    
    #Neu chu da xuat hien trong dict thi so luong se +=1
    if k in dct:
        dct[k]+=1

    #Neu khong xuat hien nhieu hon 1 lan thi so luong se = 1
    else:
        dct[k]=1

for obj,val in dct.items():
    print(obj+' '+ str(val))
