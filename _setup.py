"""python setup.py build sdist"""
from setuptools import setup, find_packages

setup(
    name='packaging_test',
    version='0.0.0',
    packages=find_packages(),
    #include_package_data=True,
    author="Keith P. Johnson",
    author_email="keithpjohnsonsoftware@gmail.com",
    description='Practice packaging',
    license='MIT',
    install_requires=[
        "numpy"
    ],
    setup_requires=[
        "wheel"
    ]
)