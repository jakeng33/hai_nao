f = open('rosalind_ini5.txt')
for n,line in enumerate(f):
    if n%2==1:
        print (line)
f.close()
