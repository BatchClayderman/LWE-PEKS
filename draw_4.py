from matplotlib import pyplot as plt
x = [i * 100 for i in range(11)]
y1 = [0, 1.405, 2.755, 4.099, 5.448, 6.798, 8.149, 9.499, 10.849, 12.204, 13.549]
y2 = [0, 1.696, 3.295, 4.896, 6.486, 8.090, 9.700, 11.287, 12.897, 14.490, 16.101]
plt.rcParams["font.size"] = 18
plt.plot(x, y1, marker = "x", color = "orange")
plt.plot(x, y2, marker = "o", color = "red")
for i in range(len(x)):
	plt.annotate("{0:.3f}".format(y1[i]), (x[i], y1[i]), textcoords = "offset points", xytext = (0, 5), ha = "center")
	plt.annotate("{0:.3f}".format(y2[i]), (x[i], y2[i]), textcoords = "offset points", xytext = (0, 5), ha = "center")
plt.xlim(0, 1100)
plt.ylim(0, 18)
plt.legend(["$n = 256$", "$n = 320$"])
plt.rcParams["font.size"] = 20
plt.xlabel("Number")
plt.ylabel("Time consumption (ms)")
plt.rcParams["figure.dpi"] = 1200
plt.rcParams["savefig.dpi"] = 1200
print("sum(y1) / len(y1) = {0:.6f} / {1} = {2:.9f}".format(sum(y1), len(y1), sum(y1) / len(y1)))
print("sum(y2) / len(y2) = {0:.6f} / {1} = {2:.9f}".format(sum(y2), len(y2), sum(y2) / len(y2)))
plt.show()
plt.close()