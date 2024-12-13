import numpy as np
import mne
import os
from mne.datasets import multimodal
import matplotlib.pyplot as plt
from pathlib import Path


file_name = 'transdef_transrest_mf2pt2_passive_raw.fif'
raw = mne.io.read_raw_fif( file_name , allow_maxshield=True)
# read data /.fif from local file

print(raw)
print(raw.info)
txt = open("mneinfo_1_822.txt", "w").write(str(raw.info))


raw.compute_psd(fmax=500).plot(picks="data", exclude="bads")
raw.plot(duration=5, n_channels=30)

plt.show()