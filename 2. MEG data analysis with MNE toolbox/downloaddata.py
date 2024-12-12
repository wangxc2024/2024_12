import numpy as np
import mne

# %%
# Loading data
# ^^^^^^^^^^^^
#
# MNE-Python data structures are based around the FIF file format from
# Neuromag, but there are reader functions for :ref:`a wide variety of other
# data formats <data-formats>`. MNE-Python also has interfaces to a
# variety of :ref:`publicly available datasets <datasets>`, which MNE-Python
# can download and manage for you.
#
# We'll start this tutorial by loading one of the example datasets (called
# ":ref:`sample-dataset`"), which contains EEG and MEG data from one subject
# performing an audiovisual experiment, along with structural MRI scans for
# that subject. The `mne.datasets.sample.data_path` function will automatically
# download the dataset if it isn't found in one of the expected locations, then
# return the directory path to the dataset (see the documentation of
# `~mne.datasets.sample.data_path` for a list of places it checks before
# downloading). Note also that for this tutorial to run smoothly on our
# servers, we're using a filtered and downsampled version of the data
# (:file:`sample_audvis_filt-0-40_raw.fif`), but an unfiltered version
# (:file:`sample_audvis_raw.fif`) is also included in the sample dataset and
# could be substituted here when running the tutorial locally.

sample_data_folder = mne.datasets.sample.data_path()
sample_data_raw_file = (
    sample_data_folder / "MEG" / "sample" / "sample_audvis_filt-0-40_raw.fif"
)
raw = mne.io.read_raw_fif(sample_data_raw_file)

import matplotlib.pyplot as plt
import numpy as np
from mne.datasets.brainstorm import bst_auditory
from mne.io import read_raw_ctf
from mne.preprocessing import annotate_muscle_zscore

import mne
from mne.io import read_raw_ctf
import os
import shutil
from pathlib import Path

# 定义文件路径
data_path = bst_auditory.data_path()
raw_fname = data_path / "MEG" / "bst_auditory" / "S01_AEF_20131218_01.ds"

# 定义目标文件夹
destination_folder = Path('P:\Desktop')

# 复制文件
shutil.copy(raw_fname, destination_folder)





raw = read_raw_ctf(raw_fname, preload=False)


# 假设你有一个名为 raw 的 MNE 数据对象
# raw = ...

file_name = 'S01_AEF_20131218_01.ds'
save_path = ""  # 设置保存路径
raw.save(file_name, overwrite=True, save_format='ds', save_path=save_path)


#np.save('sample_audvis_filt-0-40_raw.fif')
print(raw)
print(raw.info)



