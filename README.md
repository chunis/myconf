**myconf** is my ~/.files, mainly about bash config and vim config, with
some small shell and python scripts. I put it here to make it easier for
me to setup them at other Linux machines.
The setup is very easy. Just change to the /path/to/myconf, then run:
**./setup.sh**. It will backup some ~/.files with current date as their
suffix, and create links to the files in myconf/dot_files. Then you just
run '**source ~/.bashrc**' to enable all the new configs.
