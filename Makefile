# Install prerelease pytorch with apple silicon support + run the code
#
# prerequisite: brew install uv
#
# NB: Python 3.13 does not work.
# ( https://github.com/kornia/kornia/issues/3054 )

run-mac: .venv/.done
	.venv/bin/python main.py

dep:
	brew install uv sentencepiece

.venv/.done: Makefile requirements.txt
	uv venv --python 3.12
	uv pip install --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cpu
	uv pip install -r requirements.txt
	touch $@
