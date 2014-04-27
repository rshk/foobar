from setuptools import setup, find_packages

version = '0.1a'
install_requires = [
    'cliff',
    'pygpgme==0.3.1',  # I want my fork!
]

dependency_links = [
    'https://github.com/rshk/pygpgme/tarball/master#egg=pygpgme-0.3.1',
]

setup(
    name='Foobar',
    version=version,
    packages=find_packages(),
    install_requires=install_requires,
    dependency_links=dependency_links,
    zip_safe=False)
