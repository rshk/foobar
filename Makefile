VIRTUALENV = virtualenv

all: info install_with_pip install_with_pip_editable install_setuppy install_setuppy_editable

info:
	@echo "------------------------------------------------------------"
	@echo "    Printing information"
	@echo "------------------------------------------------------------"
	@echo "Python version:     $(shell python --version 2>&1 | cut -d' ' -f2)"
	@echo "PIP version:        $(shell pip --version 2>&1 | cut -d' ' -f2)"
	@echo "Setuptools version: $(shell python -c 'import setuptools; print setuptools.__version__')"

install_with_pip:
	@echo "------------------------------------------------------------"
	@echo "    Installing with pip"
	@echo "------------------------------------------------------------"
	$(VIRTUALENV) ./.venv-with-pip
	-./.venv-with-pip/bin/pip install --allow-external pygpgme --allow-unverified pygpgme .

install_with_pip_editable:
	@echo "------------------------------------------------------------"
	@echo "    Installing with pip -e"
	@echo "------------------------------------------------------------"
	$(VIRTUALENV) ./.venv-with-pip-editable
	-./.venv-with-pip-editable/bin/pip install --allow-external pygpgme --allow-unverified pygpgme .

install_setuppy:
	@echo "------------------------------------------------------------"
	@echo "    Installing with setup.py install"
	@echo "------------------------------------------------------------"
	$(VIRTUALENV) ./.venv-setuppy-editable
	-./.venv-setuppy-editable/bin/python setup.py install

install_setuppy_editable:
	@echo "------------------------------------------------------------"
	@echo "    Installing with setup.py develop"
	@echo "------------------------------------------------------------"
	$(VIRTUALENV) ./.venv-setuppy-editable
	-./.venv-setuppy-editable/bin/python setup.py develop

clean:
	rm -rf ./.venv-*
	rm -rf dist build *.egg-info
