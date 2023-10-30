from matplotlib import pyplot as plt
x = [i * 10 for i in range(11)]
y1 = [0, 0.257, 0.436, 0.629, 0.821, 1.026, 1.194, 1.365, 1.596, 1.784, 1.937]
y2 = [0, 0.430, 0.769, 1.097, 1.461, 1.781, 2.078, 2.378, 2.737, 3.069, 3.424]
plt.rcParams["font.size"] = 18
plt.plot(x, y1, marker = "x", color = "orange")
plt.plot(x, y2, marker = "o", color = "red")
for i in range(len(x)):
	plt.annotate("{0:.3f}".format(y1[i]), (x[i], y1[i]), textcoords = "offset points", xytext = (0, 5), ha = "center")
	plt.annotate("{0:.3f}".format(y2[i]), (x[i], y2[i]), textcoords = "offset points", xytext = (0, 5), ha = "center")
plt.xlim(0, 110)
plt.ylim(0, 4)
plt.legend(["$n = 256$", "$n = 320$"])
plt.rcParams["font.size"] = 20
plt.xlabel("Number of users")
plt.ylabel("Time consumption ($10^4$s)")
plt.rcParams["figure.dpi"] = 1200
plt.rcParams["savefig.dpi"] = 1200
print("sum(y1) / len(y1) = {0:.6f} / {1} = {2:.9f}".format(sum(y1), len(y1), sum(y1) / len(y1)))
print("sum(y2) / len(y2) = {0:.6f} / {1} = {2:.9f}".format(sum(y2), len(y2), sum(y2) / len(y2)))
plt.show()
plt.close()