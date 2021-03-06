#!/bin/sh

set -o errexit

# Install modern pip with new resolver:
pip install 'pip>=20.3'

# install test requirements
pip install -r requirements.txt


# create a cache directory
mkdir -p .cache/bare
cd .cache/bare

# create the project using the default settings in cookiecutter.json
cookiecutter ../../ --no-input --overwrite-if-exists $@
cd project_name


# Install Python deps
pip install -r requirements/local.txt

# stop the build if there are Python syntax errors or undefined names
flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics || { echo "ERROR: Generated project has syntax errors"; exit 1; }

# run the project's tests
echo "Running pytest:"
pytest || { echo "ERROR: Pytest report some issues"; exit 1; }

echo "Checking missing migrations:"
# return non-zero status code if there are migrations that have not been created
python manage.py makemigrations --dry-run --check || { echo "ERROR: there were changes in the models, but migration listed above have not been created and are not saved in version control"; exit 1; }

