FROM python:3.8

WORKDIR /opt/workspace

COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /opt/workspace/utils
RUN wget http://horatio.cs.nyu.edu/mit/silberman/nyu_depth_v2/nyu_depth_v2_labeled.mat
RUN python extract_official_train_test_set_from_mat.py nyu_depth_v2_labeled.mat splits.mat ../dataset/nyu_depth_v2/official_splits/
