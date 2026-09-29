# Practical Work №2 — Bash and System Calls

## Variant B

## Goal

The goal of this practical work is to practice Bash scripting and investigate how user programs interact with the operating system kernel through system calls.

## report.sh

The script accepts a directory and log level (`ERROR` or `WARN`).

Example:

```bash
./report.sh data ERROR
## Strace analysis

Для анализа системных вызовов была выполнена команда:

```bash
strace -f -o trace.txt python3 hello.py data/log01.txt
\
