VIRTUALENV = virtualenv

all: install_with_pip install_with_pip_editable install_setuppy install_setuppy_editable

install_with_pip:
	@echo -e "\n\n\n------------------------------------------------------------"
	@echo "    Installing with pip"
	@echo -e "------------------------------------------------------------\n\n\n"
	$(VIRTUALENV) ./.venv-with-pip
	-./.venv-with-pip/bin/pip install --allow-external pygpgme --allow-unverified pygpgme .

install_with_pip_editable:
	@echo -e "\n\n\n------------------------------------------------------------"
	@echo "    Installing with pip -e"
	@echo -e "------------------------------------------------------------\n\n\n"
	$(VIRTUALENV) ./.venv-with-pip-editable
	-./.venv-with-pip-editable/bin/pip install --allow-external pygpgme --allow-unverified pygpgme -e .

install_setuppy:
	@echo -e "\n\n\n------------------------------------------------------------"
	@echo "    Installing with setup.py install"
	@echo -e "------------------------------------------------------------\n\n\n"
	$(VIRTUALENV) ./.venv-setuppy-editable
	-./.venv-setuppy-editable/bin/python setup.py install

install_setuppy_editable:
	@echo -e "\n\n\n------------------------------------------------------------"
	@echo "    Installing with setup.py develop"
	@echo -e "------------------------------------------------------------\n\n\n"
	$(VIRTUALENV) ./.venv-setuppy-editable
	-./.venv-setuppy-editable/bin/python setup.py develop

clean:
	rm -rf ./.venv-*
	rm -rf dist build *.egg-info
