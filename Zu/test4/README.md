###*The test 4 consists of the following steps: <br />

_ Call stats from package scipy to perform T-test <br />
_ Call numpy to transform a list into an aray, making it possbile to perform T-test <br />
_ Create def test4 to save RAM <br />
_ Create 2 empty dictionaries, one for storing group 1 and its GC contents, the other for group 2 and its GC contents. The keys of those dictionariese will be a list to make it convenient for performing T-test according to Scipy syntax. <br />
_ The for loop is jsut similar to the previous test, except this time it will divide GC contents into 2 groups: 1 and 2, each one will lie in its own dictionary at the top. <br />
_ arr1 and arr2 are performed to transform list of GC contents of both group in arrays <br />
_ Finally t-test is performed through ttest, the parameter equal_var is set False as the variance of both group is unknown. <br />


###*To run the program, please follow the syntax: <br />
python3 test4.py lcl.fasta lcl.txt
