with open("in", "r") as f:
	with open("out", "w") as out:
		result = " ".join(f.read().split())
		out.write(result)
		print(result)