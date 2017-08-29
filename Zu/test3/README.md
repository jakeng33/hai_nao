**The test3a consists of the following steps: <br />**

_ Create the function test3a to solve the problem and save RAM <br />
_ Read the fasta sequence <br />
_ Create the output txt file <br />
_ Create 2 empty dictionaries, one for storing header and its length, the other for header and its sequence <br />
_ The for loop is used to generate headers and theirs sequences respectively. Each header's sequence and length will be stored in the 2 empty dictionaries. <br />
_ Taking advantage of the dictionary consisting of header and its length, we sort by values using sorted(dict.items(), key=lambda x: x[1]). The result will be a list containing multiple couples of tuples ranked by values from smallest to greatest. Now we put [::-1] at the end to reverse the order according to the problem from greatest to smallest. <br />
_ Finally, we put the header into header-sequence dictionary to get the desired result. <br />

The test3b is performed the same as test3a, except the each sequence is replace by the reversed complementary sequence to meet the convetion of reading Nucleotide. <br />

**To run the program, please follow the syntax: <br />**
python test3a.py lcl.fasta lcl_a.txt <br /> 
python test3b.py lcl.fasta lcl_b.txt
