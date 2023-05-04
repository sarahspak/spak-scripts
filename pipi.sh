#!/bin/bash

# check if pyenv environment is activated - if not, fail
if [ -z "$PYENV_VERSION" ]; then
    echo "pyenv environment not activated"
    exit 1
else echo "$PYENV_VERSION activated"
fi


#
pip install notebook jupyterlab ipython matplotlib pandas numpy plotly

# create jupyter kernel if necessary
if [ ! -d "$PYENV_ROOT/versions/$PYENV_VERSION/share/jupyter/kernels/$PYENV_VERSION" ]; then
    echo "creating jupyter kernel for $PYENV_VERSION"
    python -m ipykernel install --user --name $PYENV_VERSION --display-name $PYENV_VERSION
else echo "jupyter kernel for $PYENV_VERSION already exists"
fi
