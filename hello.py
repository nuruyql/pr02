#!/usr/bin/env python3
import sys
import os

if len(sys.argv) != 2:
    print(f"Usage: python3 {sys.argv[0]} <file>")
    sys.exit(1)

filename = sys.argv[1]

if not os.path.isfile(filename):
    print(f"Error: file '{filename}' does not exist")
    sys.exit(1)

with open(filename, "rb") as f:
    data = f.read()

print(f"File size: {len(data)} bytes")

