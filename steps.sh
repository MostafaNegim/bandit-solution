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

# 5 -> 6
# bandit5
# The password for the next level is stored in a file somewhere
# under the inhere directory and has all of the following properties:
#       human-readable
#       1033 bytes in size
#       not executable

find inhere/ ! -executable -size 1033c -exec cat  {} \;
# DXjZPULLxYr17uwoI01bNLQbtFemEgo7

# 6 -> 7
# bandit6

# The password for the next level is stored somewhere on the server and has all of the following properties:

# owned by user bandit7
# owned by group bandit6
# 33 bytes in size

find / -size 33c -user bandit7 -group bandit6 -exec ls -l  {} \;
# HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

# 7 -> 8
# bandit7
# The password for the next level is stored in the file data.txt next to the word millionth

egrep millionth data.txt 
# cvX2JJa4CFALtqS87jk27qwqGhBM9plV

# 8 -> 9
# bandit8
# The password for the next level is stored in the file data.txt
# and is the only line of text that occurs only once

sort data.txt | uniq -u
# UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR

# 9 -> 10
# bandit9
# The password for the next level is stored in the file data.txt in one of the few human-readable strings,
#  preceded by several ‘=’ characters.

strings data.txt | grep '===='
# truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk

# 10 -> 11
# bandit10
# The password for the next level is stored in the file data.txt, which contains base64 encoded data

cat data.txt | base64 --decode
# IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR