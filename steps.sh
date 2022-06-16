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

# 11 -> 12
# bandit11
# The password for the next level is stored in the file data.txt, 
# where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

cat data.txt | tr [a-zA-Z] [n-za-mN-ZA-M]
# 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu

# 12 -> 13
# bandit12
# The password for the next level is stored in the file data.txt,
#  which is a hexdump of a file that has been repeatedly compressed. 
#  For this level it may be useful to create a directory under /tmp in which you can work using mkdir. 
#  For example: mkdir /tmp/myname123.
#  Then copy the datafile using cp, and rename it using mv (read the manpages!)

mkdir /tmp/outputs
cd /tmp/outputs
cp ~/data.txt /tmp/outputs
xxd -r data.txt out1 
file out1 
# out1: gzip compressed data, was "data2.bin", last modified: Thu May  7 18:14:30 2020, max compression, from Unix
mv out1 out1.gz
gunzip -d out1.gz 
file out1
# out1: bzip2 compressed data, block size = 900k
bzip2 -d out1
# bzip2: Can't guess original name for out1 -- using out1.out
ile out1.out 
# out1.out: gzip compressed data, was "data4.bin", last modified: Thu May  7 18:14:30 2020, max compression, from Unix
mv out1.out out2.gz
gunzip -d out2.gz
file out2
#out2: POSIX tar archive (GNU)
tar -xvf out2
file data5.bin
# data5.bin: POSIX tar archive (GNU)
tar -xvf data5.bin
file data6.bin
# data6.bin: bzip2 compressed data, block size = 900k
bzip2 -d data6.bin
file data6.bin.out 
# data6.bin.out: POSIX tar archive (GNU)
tar -xvf data6.bin.out
file data8.bin 
# data8.bin: gzip compressed data, was "data9.bin", last modified: Thu May  7 18:14:30 2020, max compression, from Unix
mv data8.bin data8.bin.gz
gunzip -d data8.bin
file data8.bin 
# data8.bin: ASCII text
# 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL

# 13 -> 14
# bandit13
# The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. 
# For this level, you don’t get the next password, but you get a private SSH key 
# that can be used to log into the next level. 
# Note: localhost is a hostname that refers to the machine you are working on

ssh localhost -lbandit14 -i sshkey.private
cat /etc/bandit_pass/bandit14
# 4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e

# 14 -> 15
# bandit14
# The password for the next level can be retrieved by submitting 
# the password of the current level to port 30000 on localhost.

nc localhost 30000
4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e
# BfMYroe26WYalil77FoDi9qh59eK5xNr

# 15 -> 16
# bandit15
# The password for the next level can be retrieved by submitting the password of the current 
# level to port 30001 on localhost using SSL encryption.

# Helpful note: Getting “HEARTBEATING” and “Read R BLOCK”? 
# Use -ign_eof and read the “CONNECTED COMMANDS” section in the manpage.
#  Next to ‘R’ and ‘Q’, the ‘B’ command also works in this version of that command…
openssl s_client -connect  localhost:30001
# cluFn7wTiGryunymYOu4RcffSxQluehd

# 16 -> 17
# bandit16

# The credentials for the next level can be retrieved by submitting the password of 
# the current level to a port on localhost in the range 31000 to 32000. 
# First find out which of these ports have a server listening on them. 
# Then find out which of those speak SSL and which don’t. There is only 1 server that
# will give the next credentials, 
# the others will simply send back to you whatever you send to it.

nmap -sV -p 31000-32000 localhost
echo "cluFn7wTiGryunymYOu4RcffSxQluehd" | openssl s_client -quiet -connect localhost:31790
# cluFn7wTiGryunymYOu4RcffSxQluehd

# 17 -> 18
# bandit17

# There are 2 files in the homedirectory: passwords.old and passwords.new. 
# The password for the next level is in passwords.new and is the only line 
# that has been changed between passwords.old and passwords.new

# NOTE: if you have solved this level and see ‘Byebye!’ when trying to log into bandit18, 
# this is related to the next level, bandit19

diff passwords.new passwords.old
# kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd

# 18 -> 19
# bandit18

# The password for the next level is stored in a file readme in the homedirectory. 
# Unfortunately, someone has modified .bashrc to log you out when you log in with SSH.
ssh bandit.labs.overthewire.org -p 2220 -lbandit18 "bash"
# or 
ssh bandit.labs.overthewire.org -p 2220 -lbandit18 "cat readme"
# IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x