#!/bin/bash
try(){
	expected="$1"
	input="$2"

	./Mcc2 "$input" > tmp.s
	gcc -o tmp tmp.s
	./tmp
	actual="$?"

	if [ "$actual" = "$expected" ]; then
		echo "$input => $actual"
	else
		echo "$input => $expected expected, but got $actual"
		exit 1
	fi
}

try 0 0
try 42 42
try 21 "5+20-4"
try 21 " 5 + 20 - 4 "
try 47 "5+6*7"
try 15 "5*(9-6)"
try 4  "(3+5)/2"
try 10 "-2+12"
try 15 "-(-3*+5)"

echo OK
