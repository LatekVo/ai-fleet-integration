#!/bin/bash

source h2o_chat/h2o_venv/bin/activate || source h2o_chat/h2o_venv/Scripts/activate

#python3 h2o_chat/h2ogpt/generate.py --base_model=TheBloke/zephyr-7B-beta-GGUF --prompt_type=zephyr --max_seq_len=4096
python3 h2o_chat/h2ogpt/generate.py --base_model=https://huggingface.co/TheBloke/zephyr-7B-beta-GGUF/resolve/main/zephyr-7b-beta.Q2_K.gguf --prompt_type=zephyr --hf_embedding_model=sentence-transformers/all-MiniLM-L6-v2 --score_model=None --llamacpp_dict="{'n_gpu_layers':10}" --max_seq_len=1024 --enable_tts=False --enable_stt=False