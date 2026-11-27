# ICS 2401 – Compiler Construction Assignment I

This repository contains the LEX programs and build resources for the three text-processing tasks in Assignment I.

## Tasks

1. **Word and character count** – `wordcount.l`
2. **Replace `abc` with `ABC`** – `replace_abc.l`
3. **Recognise 20 specified verbs** – `recognize_verbs.l`

## Important note about the LEX source files

The `.l` files currently included are **reference implementations** reproduced from Appendix A of the Build and Execution Guide. They were used to verify the Flex/GCC build process. They are not a substitute for the final versions prepared by the teammates responsible for each task.

Before submitting the group's final repository, compare these files with the final versions supplied by Linet, Nicolas and Gabriella, and replace the reference files where necessary.

## Requirements

- Flex
- GCC
- GNU Make (optional, for the `Makefile`)
- Linux or another environment with compatible Flex/GCC tools

The accompanying guide was tested on Ubuntu 24.04 LTS, Flex 2.6.4 and GCC 13.3.0.

### Install on Ubuntu

```bash
sudo apt update
sudo apt install -y flex gcc build-essential
```

Check the installations:

```bash
flex --version
gcc --version
make --version
```

## Build all programs

From the repository root:

```bash
make
```

Alternatively:

```bash
chmod +x build_all.sh
./build_all.sh
```

Build one program:

```bash
make wordcount
make replace_abc
make recognize_verbs
```

Remove generated C files and executables:

```bash
make clean
```

## Run the programs

```bash
./wordcount < inputs/wc_in.txt
./replace_abc < inputs/rep_in.txt
./recognize_verbs < inputs/verbs_in.txt
```

## Expected sample results

### Word count

```text
Words: 8
Total characters in words: 28
```

### ABC replacement

Input occurrences of the lowercase string `abc` are replaced with uppercase `ABC`. The matching is case-sensitive.

### Verb recognition

The reference implementation reports complete-word matches from the specified verb list. Its sample input produces four matches: `is`, `has`, `been` and `go`.

## Repository contents

```text
.
├── README.md
├── wordcount.l
├── replace_abc.l
├── recognize_verbs.l
├── Makefile
├── build_all.sh
├── .gitignore
├── inputs/
│   ├── wc_in.txt
│   ├── rep_in.txt
│   └── verbs_in.txt
└── docs/
    └── Build_and_Execution_Guide.pdf
```

## Build and execution documentation

See [`docs/Build_and_Execution_Guide.pdf`](docs/Build_and_Execution_Guide.pdf) for the compilation pipeline, command reference, troubleshooting guidance, build automation and verification notes.
