import sys

def test1(fasta_input, txt_output):
	fasta_content = open(fasta_input).read().strip().split("\n")
	fasta_sequence = ''.join(seq for seq in fasta_content[1:])
	fasta_length = len(fasta_sequence)
	G_content = fasta_sequence.count("G")
	C_content = fasta_sequence.count("C")
	GC_content = (G_content + C_content)/fasta_length
	complement_dict = {"A":"T", "T":"A", "G":"C", "C":"G"}
	complement_seq = ''.join(complement_dict[nu] for nu in fasta_sequence)
	reverse_complement_seq = complement_seq[::-1]

	with open(txt_output, 'w') as result:
		result.write("GC contents: {}\n".format(GC_content))
		result.write("Length: {}\n".format(fasta_length))
		result.write("The reversed complement sequence: {}".format(reverse_complement_seq))

test1(*sys.argv[1:])