#%%

import pandas as pd
import matplotlib as plt
import numpy as np

# print("Hello Deloitte-HDSI Program!")

df = pd.read_csv("job_family_role.csv")

# print(df.dtypes)
# df.dropna(subset = ["job_family"], axis = 0, inplace = True)

# df.dropna(subset = ["count_id_indexed"], axis = 0, inplace = True)

df.drop(df[(df["count_id_indexed"] == '\\N')].index, inplace = True)

df["count_id_indexed"] = df["count_id_indexed"].astype("float")

# df[df.get("count_id_indexed") == "N"]

# df_grp_jobfam = df.groupby("job_family")

# df_grp_date = df.groupby('post_date').count()

df_grp_date = df.groupby('post_date').mean()

plot1 = df_grp_date.plot(kind = 'line', y = 'count_id_indexed')

plt.pyplot.show()

# print(df_grp_date) 

# print(df["count_id_indexed"].max())

# print(df.iloc[2].get('count_id_indexed').type)

# print(df)



# %%
