#!/bin/bash

source h2o_venv/bin/activate || source h2o_venv/Scripts/activate

python3 h2o_chat/h2ogpt/generate.py --base_model=TheBloke/zephyr-7B-beta-GGUF --prompt_type=zephyr --max_seq_len=4096
