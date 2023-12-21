#!/bin/bash

# create a directory for the project
mkdir h2o_chat
cd h2o_chat

# install virtualenv
pip3 install virtualenv

# create a virtual environment
python3 -m venv h2o_venv

# activate the virtual environment (platform-independent)
source h2o_venv/bin/activate || source h2o_venv/Scripts/activate

# set extra repositories for pip, OS dependant
if [ "$(uname)" == "Darwin" ]; then
    export PIP_EXTRA_INDEX_URL="https://download.pytorch.org/whl/cpu"
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    set PIP_EXTRA_INDEX_URL="https://download.pytorch.org/whl/cu118"
else
    export PIP_EXTRA_INDEX_URL="https://download.pytorch.org/whl/cu118"
fi

# clone the repository
git clone https://github.com/h2oai/h2ogpt.git
cd h2ogpt

# install required packages
pip3 install --upgrade pip
pip3 install llama-cpp-python
pip3 install librosa soundfile wavio DocTR LangChain
pip3 install --no-cache-dir -r requirements.txt
pip3 install --no-cache-dir -r reqs_optional/requirements_optional_langchain.txt
pip3 install --no-cache-dir -r reqs_optional/requirements_optional_gpt4all.txt
pip3 install --no-cache-dir -r reqs_optional/requirements_optional_langchain.urls.txt
# warning: GPL license:
pip3 install -r reqs_optional/requirements_optional_langchain.gpllike.txt

# generate and run the model
python3 generate.py --base_model=TheBloke/zephyr-7B-beta-GGUF --prompt_type=zephyr --max_seq_len=4096