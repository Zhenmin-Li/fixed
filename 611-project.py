import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

tv = pd.read_csv("derived_data/tv.csv")

plt.plot(tv.iloc[:, 7], tv.iloc[:,12], 'o')

m, b = np.polyfit(tv.iloc[:, 7], tv.iloc[:, 12], 1)

plt.plot(tv.iloc[:, 7], m*tv.iloc[:, 7] + b)

plt.xlabel('Release Year')
plt.ylabel('Number of Seasons')
plt.title('Plot of Number of Seasons by Release Year')

plt.savefig("Artifacts/python_fig.png")