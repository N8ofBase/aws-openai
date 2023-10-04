SHELL := /bin/bash

init: $(.env)
	pre-commit install
	python3.11 -m venv .venv
	. .venv/bin/activate
	echo -e "OPENAI_API_ORGANIZATION=PLEASE-ADD-ME\nOPENAI_API_KEY=PLEASE-ADD-ME" >> .env
	pre-commit install

activate:
	. .venv/bin/activate
	pip install -r requirements.txt

lint:
	terraform fmt -recursive
	pre-commit run --all-files
	black ./terraform/python/
