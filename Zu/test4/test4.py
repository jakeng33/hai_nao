import sys
from scipy import stats
import numpy as np

def test4(fasta_input,txt_output):
	fasta_content = open(fasta_input).read().strip().split(">")
	group1_gc = []
	group2_gc = []

	for item in fasta_content[1:]:
		item = item.strip().split("\n")
		header = item[0]
		seq = ''.join(item[1:])
		seq_length = len(seq)
		g_content = seq.count("G")
		c_content = seq.count("C")
		gc_content = (g_content + c_content)/seq_length
		if "Group1" in header:
			group1_gc.append(gc_content)
		else:
			group2_gc.append(gc_content)

	arr1 = np.array(group1_gc)
	arr2 = np.array(group2_gc)
	ttest = stats.ttest_ind(arr1,arr2,equal_var=False)

	with open(txt_output, 'w') as result:
		result.write("The p-value is: {}".format(ttest[1]))
 
test4(*sys.argv[1:])
