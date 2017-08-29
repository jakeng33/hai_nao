import sys
import matplotlib as mp
import matplotlib.pyplot as plt

def test5(fasta_input):
	fasta_content = open(fasta_input).read().strip().split(">")
	group1_gc = []
	group2_gc = []

	for item in fasta_content[1:]: #Remove the first empty element
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

	data = [group1_gc,group2_gc]
	fig,ax = plt.subplots(figsize=(10,6))
	ax.set_title('Difference in GC contents rate between 2 groups')
	ax.set_xlabel('Group')
	ax.set_ylabel('GC')
	bp = ax.boxplot(data)
	plt.show()
			
test5(*sys.argv[1:])
