**The test 5 is performed the same as the test 4 except that the package matplotlib is called to draw the boxplot. <br />**

The input data will be a list containing 2 sub-lists: one list of GC contents from group 1, the other comes from group 2. The input data can also be arrays. <br />

Next, the **plt.subplots(figsize=(10,6))** is set to modify the size of the graph, returning a tuple consisting of 2 values. The first value is assigned to fig to draw the frame of the graph, the second value is assigned to the ax (axis). In this case the x-axis has the value of 10 while the y-axis has the value of 6. <br />

As the name suggests, the ax.set_title, ax.set_xlabel and ax.set_ylabel are called to annotate the graph. <br />

Finally, the boxplot is sketched through bp = ax.boxplot(data), which is visualized through plt.show(). <br /> 

**To run the program, please follow the syntax: <br />**
python3 test5.py lcl.fasta
