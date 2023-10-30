from matplotlib import pyplot as plt
x = [i for i in range(1, 11)]
y1 = [402.187643, 426.253530, 383.574177, 464.896340, 422.945551, 431.494569, 427.941790, 421.652016, 423.205825, 437.171560]
y2 = [789.810315, 777.943148, 752.485582, 741.397758, 764.998383, 750.071294,  673.454417, 742.471516, 751.698530, 743.259278]
plt.rcParams["font.size"] = 18
plt.plot(x, y1, marker = "x", color = "orange")
plt.plot(x, y2, marker = "o", color = "red")
for i in range(len(x)):
	plt.annotate("{0:.3f}".format(y1[i]), (x[i], y1[i]), textcoords = "offset points", xytext = (0, 5), ha = "center")
	plt.annotate("{0:.3f}".format(y2[i]), (x[i], y2[i]), textcoords = "offset points", xytext = (0, 5), ha = "center")
plt.xlim(0, len(x) + 1)
plt.ylim(350, 850)
plt.legend(["$n = 256$", "$n = 320$"])
plt.rcParams["font.size"] = 20
plt.xlabel("Number")
plt.ylabel("Time consumption (s)")
plt.rcParams["figure.dpi"] = 1200
plt.rcParams["savefig.dpi"] = 1200
print("sum(y1) / len(y1) = {0:.6f} / {1} = {2:.9f}".format(sum(y1), len(y1), sum(y1) / len(y1)))
print("sum(y2) / len(y2) = {0:.6f} / {1} = {2:.9f}".format(sum(y2), len(y2), sum(y2) / len(y2)))
plt.show()
plt.close()