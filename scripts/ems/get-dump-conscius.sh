#!/bin/bash

BKP_CONSCIUS=$1

clear

echo "################################"
echo "     Select Conscius Version   "
echo "      1 - Exit                  "
echo "      2 - 2.2.2                 "
echo "      3 - 2.2.3                 "
echo "      4 - 2.2.4                 "
echo "      5 - 2.2.5                 "
echo "      6 - 2.2.6                 "
echo "      7 - 2.3.0                 "
echo "      8 - 2.3.1                 "
echo "      9 - 2.3.2                 "
echo "     10 - 2.4.0                 "
echo "     11 - 2.5.0                 "
echo 
echo
echo
echo "Version: "
read VERSION

case $VERSION in
	1) exit 0 ;;
	2) SSL_BKP_VERSION="adkj12038190iaojcj0810u222" ;;
	3) SSL_BKP_VERSION="adkj12038190iaojcj0810u223" ;;
	4) SSL_BKP_VERSION="adkj12038190iaojcj0810u224" ;;
	5) SSL_BKP_VERSION="adkj12038190iaojcj0810u225" ;;
        6) SSL_BKP_VERSION="adkj12038190iaojcj0810u226" ;;
        7) SSL_BKP_VERSION="adkj12038190iaojcj0810u230" ;;
        8) SSL_BKP_VERSION="adkj12038190iaojcj0810u231" ;;
        9) SSL_BKP_VERSION="adkj12038190iaojcj0810u232" ;;
       10) SSL_BKP_VERSION="adkj12038190iaojcj0810u240" ;;
       11) SSL_BKP_VERSION="adkj12038190iaojcj0810u250" ;;
	*) echo "INVALID NUMBER!" ;;
esac

openssl aes-256-cbc -d -in $BKP_CONSCIUS -out `pwd`/bkp_conscius.tar.bz2 -pass file:<( echo -n "$SSL_BKP_VERSION")

tar -vxjpf bkp_conscius.tar.bz2

rm -rf bkp_conscius.tar.bz2
