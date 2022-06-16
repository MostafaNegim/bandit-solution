#!/bin/bash

# 0
ssh -l bandit0 bandit.labs.overthewire.org -p 2220

# 0 -> 1
# bandit0
cat readme
# boJ9jbbUNNfktd78OOpsqOltutMc3MY1

# 1 -> 2
# bandit1
# The password for the next level is stored in a file called - located in the home directory

cat ./-
# CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

# 2 -> 3
# bandit2
# The password for the next level is stored in a file called 
# spaces in this filename located in the home directory
cat spaces\ in\ this\ filename
# UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK

# 3 -> 4
# bandit3
# The password for the next level is stored in a hidden file in the inhere directory.

cat inhere/.hidden
# pIwrPrtPN36QITSp3EQaw936yaFoFgAB

# 4 -> 5
# bandit4
# The password for the next level is stored in the only human-readable file in the inhere directory. 
# Tip: if your terminal is messed up, try the “reset” command.

for file in `ls inhere`; do cat inhere/$file; echo ; done
# koReBOKuIDDepwhWk7jZC0RTdopnAYKh