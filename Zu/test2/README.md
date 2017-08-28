The test 2 consists of the following steps:

_ Create the def statement test2 to solve the probelm and save memory (RAM)
_ Read the input fasta content
_ Create 2 empty dictionaries, one for storing header and GC contents, the other for storing header and sequence length
_ The for loop is used to split headers and their sequences respectively, each header's gc contents and length is calculated and then stored in the 2 empty dictionaries. The fasta_content[1:] is used to remove the empty element '' in the first position of the list.
_ Finally, the maximal gc content, length, average gc, average length are calculated through methods and functions such as max(), .values(), sum()
