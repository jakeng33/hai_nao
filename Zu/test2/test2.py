import sys

def test2(fasta_input,txt_output):
	fasta_content = open(fasta_input).read().strip().split(">")
	gc_dict = {}
	length_dict = {}

	for item in fasta_content[1:]:
		item = item.strip().split("\n")
		header = item[0]
		seq = ''.join(item[1:])
		seq_length = len(seq)
		g_content = seq.count("G")
		c_content = seq.count("C")
		gc_content = (g_content + c_content)/seq_length
		gc_dict[header] = gc_content
		length_dict[header] = seq_length

	max_gc = max(gc_dict.values())
	gc_average = sum(gc_dict.values()) / len(gc_dict.values())

	max_length = max(length_dict.values())
	length_average = sum(length_dict.values()) / len(length_dict.values())

	with open(txt_output, 'w') as result:
		result.write("The longest sequence: {}\n".format(max_length))
		result.write("The average sequence length: {}\n".format(length_average))
		result.write("The greatest GC content: {}\n".format(max_gc))
		result.write("The average GC content: {}\n".format(gc_average))
 
test2(*sys.argv[1:])