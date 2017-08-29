###*The test 4 consists of the following steps: <br />

_ Call stats from package scipy to perform T-test <br />
_ Call numpy to transform a list into an aray, making it possbile to perform T-test <br />
_ Create def test4 to save RAM <br />
_ Create 2 empty lists, one for storing group 1's GC contents, the other for group 2's GC contents. <br />
_ The for loop is jsut similar to the previous test, except this time GC contents are divided into 2 groups: 1 and 2, which is appended to the empty lists at the top. <br />
_ arr1 and arr2 are performed to transform list of GC contents of both group in arrays <br />
_ Finally t-test is performed through ttest, the parameter equal_var is set False as the variance of both group is unknown. <br />


###*To run the program, please follow the syntax: <br />
python3 test4.py lcl.fasta lcl.txt
