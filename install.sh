#!/bin/bash

mkdir h2o_chat
cd h2o_chat

pip install virtualenv
python -m venv h2o_venv
source h2o_venv/bin/activate

# Windows CUDA / Linux CUDA:
export PIP_EXTRA_INDEX_URL="https://download.pytorch.org/whl/cu118"
# CPU ONLY / M1 / M2:
#export PIP_EXTRA_INDEX_URL="https://download.pytorch.org/whl/cpu"
git clone https://github.com/h2oai/h2ogpt.git
cd h2ogpt

# No cache fixes a lot of install issues that i encountered
pip install --no-cache-dir -r requirements.txt
pip install --no-cache-dir -r reqs_optional/requirements_optional_langchain.txt
pip install --no-cache-dir -r reqs_optional/requirements_optional_gpt4all.txt
pip install --no-cache-dir -r reqs_optional/requirements_optional_langchain.urls.txt
# Warning, GPL license:
pip install -r reqs_optional/requirements_optional_langchain.gpllike.txt
