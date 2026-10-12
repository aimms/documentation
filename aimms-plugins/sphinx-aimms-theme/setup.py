from distutils.core import setup
import setuptools
import sys


setup(
    
    name = "sphinx_aimms_theme",
    version = '0.1.47',
    license = "MIT",
    packages= ['sphinx_aimms_theme'],
    url = "https://github.com/aimms/sphinx-aimms-theme",
    description = 'AIMMS theme for Sphinx',
    long_description='Please refer to https://github.com/aimms/sphinx-aimms-theme#readme',
    author = "AIMMS User Support",
    author_email = "support@aimms.com",

    
    entry_points = {
        'sphinx.html_themes': [
            'sphinx_aimms_theme = sphinx_aimms_theme',
        ]        
    },
    install_requires=[
       'sphinx',
       'sphinx_rtd_theme',
    ],
    package_data={'sphinx_aimms_theme': [
        'theme.conf',
        '*.html',
        'static/aimms_css/*.*',
        'static/*.*',
        'static/icons/*.*'
    ]},
    include_package_data=True,

)
