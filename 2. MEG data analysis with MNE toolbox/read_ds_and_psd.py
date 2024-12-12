import numpy as np
import mne
import os
from mne.datasets import multimodal
import matplotlib.pyplot as plt
import pandas as pd
from mne import combine_evoked
from mne.minimum_norm import apply_inverse
from mne.datasets.brainstorm import bst_auditory
from mne.io import read_raw_ctf
import locale
from pathlib import Path

locale.setlocale(locale.LC_ALL, "en_US")
dir = Path('P:\Desktop\MNE2023\\S01_AEF_20131218_01.ds')
# local ctf data




# Load data

raw = mne.io.read_raw_ctf(dir, preload=True)
#raw.crop(130, 160).load_data()  # just use a fraction of data for speed here
#raw.resample(300, npad="auto")
# read data /.ds from local file

print(raw)
print(raw.info)
txt = open("mneinfo_2_822.txt", "w").write(str(raw.info))


raw.compute_psd(fmax=1200).plot(picks="data", exclude="bads")
#raw.plot(duration=5, n_channels=30)

plt.show()