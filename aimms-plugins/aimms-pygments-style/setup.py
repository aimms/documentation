# -*- coding: utf-8 -*-
from distutils.core import setup
import setuptools
import sys


_version = '2020.07.8'
_packages = ['style']

_short_description = "aimms-pygments-style is a colorful style for Pygments, especially adapted for AIMMS language"


_install_requires = [
    'pygments>=2'
]

setup(
    name='aimms-pygments-style',
    url='https://gitlab.com/ArthurdHerbemont/aimms-pygments-style',
    author='Arthur Herbemont',
    author_email='arthur.dherbemont@aimms.com',
    description=_short_description,
    version=_version,
    packages=_packages,
    install_requires=_install_requires,
    license='GPLv2',
    keywords='pygments syntax highlighting',
    entry_points={
        'pygments.styles': [
            'aimmslexer = style:AimmsLexerStyle',
        ]
    }
)
