from matplotlib import pyplot as plt
x = [i * 100 for i in range(11)]
y1 = [0, 46.295, 92.349, 138.435, 184.457, 230.538, 276.605, 322.671, 368.717, 414.739, 460.785]
y2 = [0, 74.551, 148.682, 222.824, 296.903, 371.008, 445.179, 519.284, 593.380, 667.492, 741.551]
plt.rcParams["font.size"] = 18
plt.plot(x, y1, marker = "x", color = "orange")
plt.plot(x, y2, marker = "o", color = "red")
for i in range(len(x)):
	plt.annotate("{0:.3f}".format(y1[i]), (x[i], y1[i]), textcoords = "offset points", xytext = (0, 5), ha = "center")
	plt.annotate("{0:.3f}".format(y2[i]), (x[i], y2[i]), textcoords = "offset points", xytext = (0, 5), ha = "center")
plt.xlim(0, 1100)
plt.ylim(0, 850)
plt.legend(["$n = 256$", "$n = 320$"])
plt.rcParams["font.size"] = 20
plt.xlabel("Number of keywords")
plt.ylabel("Time consumption (s)")
plt.rcParams["figure.dpi"] = 1200
plt.rcParams["savefig.dpi"] = 1200
print("sum(y1) / len(y1) = {0:.6f} / {1} = {2:.9f}".format(sum(y1), len(y1), sum(y1) / len(y1)))
print("sum(y2) / len(y2) = {0:.6f} / {1} = {2:.9f}".format(sum(y2), len(y2), sum(y2) / len(y2)))
plt.show()
plt.close()