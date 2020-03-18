FROM ubuntu:18.04

ARG PYTHON_VERSION

# Set env
ENV PYENV_ROOT="/root/.pyenv" \
	PATH="/root/.pyenv/shims:/root/.pyenv/bin:${PATH}" \
	PIPENV_YES=1 \
	PIPENV_DONT_LOAD_ENV=1 \
	LC_ALL="C.UTF-8" \
	LANG="en_US.UTF-8"

# Install basic packages
RUN apt-get update -y \
	&& apt-get install -y \
		curl \
    git \
    build-essential \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libssl-dev \
    libsqlite3-dev \
    libffi-dev \
	&& curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash


# Install python
RUN pyenv install $PYTHON_VERSION
RUN pyenv global $PYTHON_VERSION
RUN pyenv rehash
RUN pip install pipenv

RUN mkdir /tmp/workdir
COPY Pipfile Pipfile.lock .python-version /tmp/workdir/
WORKDIR /tmp/workdir

RUN pipenv install --deploy --ignore-pipfile

CMD ["/bin/bash"]
