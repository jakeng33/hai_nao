The test 1 consists of the following steps:

_ Create the function test1 to solve the problem and save the memory (RAM)
_ Read sequence.fasta and split it into pieces using fasta_content
_ Join the pieces containing sequence only through fasta_sequence (ignore the header)
_ Calculate the length of the sequence through fasta_length
_ Calculate the GC contents through GC_contents
_ Set up a dictionary for genearating the complementary sequence through complement_dict
_ Generate the complementary sequence through complement_seq
_ Due to the convention of reading sequence from 5-end to 3-end, the complementary sequence must be reversed to serve the purpose through reverse_complement_seq
_ Finally, the result is written into the output in the format of txt
