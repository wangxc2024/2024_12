import numpy as np
import mne
import os
from mne.datasets import multimodal


file_name = 'local_data_raw.fif'
raw = mne.io.read_raw_fif( file_name , allow_maxshield=True)
# read data /.fif from local file

print(raw)
print(raw.info)

raw.compute_psd(fmax=50).plot(picks="data", exclude="bads")
raw.plot(duration=5, n_channels=30)

# set up and fit the ICA
ica = mne.preprocessing.ICA(n_components=20, random_state=97, max_iter=800)
ica.fit(raw)
ica.exclude = [1, 2]  # details on how we picked these are omitted here
ica.plot_properties(raw, picks=ica.exclude)
