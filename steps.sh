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