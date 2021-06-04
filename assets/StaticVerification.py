#! /usr/bin/python3

from pathlib import Path
import sys

successFlag = 0;

for path in Path('src').rglob('*.ts'):
	
	file = open(path, "r")
	nameLine = file.readline().upper()
	idLine = file.readline().upper()
	file.close()
	
	if "NAME:" not in nameLine or "ID:" not in idLine:
		print("FAILED: Name and ID not found in " + path.name)
		successFlag = 1
	else:
		print("SUCCESS: Found name and ID in " + path.name)

print(successFlag)
sys.exit(0)
