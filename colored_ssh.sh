#!/bin/bash
BACK=$4
FORE=$5
setterm -term linux -back ${BACK:='default'} -fore ${FORE:='default'} -clear
ssh -p ${3} -l ${1} ${2};setterm -term linux -back default -fore default;clear 
