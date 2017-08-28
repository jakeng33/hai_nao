import sys

def test3a(fasta_input,txt_output):

	fasta_content = open(fasta_input).read().strip().split(">")
	result = open(txt_output, 'w')

	header_length_dict = {}
	header_seq_dict = {}

	for item in fasta_content[1:]:
		item = item.strip().split("\n")
		header = item[0]
		seq = ''.join(item[1:])
		seq_length = len(seq)

		header_seq_dict[header] = seq
		header_length_dict[header] = seq_length

	# Sorted by the values from smallest to largest: key = lambda x: x[1]
	# Sorted by the keys from smallest to largest: key = lambda x: x[0]

	for header,length in sorted(header_length_dict.items(), key=lambda x: x[1])[::-1]:
		result.write(">{}\n{}\n\n".format(header,header_seq_dict[header]))

test3a(*sys.argv[1:])
