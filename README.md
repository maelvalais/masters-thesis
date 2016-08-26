This repository contains the latex source of my master's thesis for the M2 Research in Computer science and Telecommunications, specialty Operations Research at ENAC, Toulouse.

To help me managing the ~95 figures of this report, I wrote two shell
scripts:

- `included_figures.sh` looks for the figures included in my tex files and
  helps me know which figures are included and which ones aren't. I use it in
  addition to git.

```
./included_figures.sh helps you know which files are included (using includegraphics{})
in .tex of the current folder. This can be useful for managing figures.
Usage:
    ./included_figures.sh [--tex | --git | --git-only | --tex-only]
By default, the --tex option will be assumed.
Options:
    --tex       Return .pdf, .jpg or .png figure that are included using
                includegraphics{} (I didn't include .git as pdflatex doesn't
                support it).
    --git       Return .pdf, .jpg or .png figures already tracked by git.
    --tex-only  Return .pdf, .jpg or .png figures that are included in your
                .tex but not tracked in git
    --git-only  Return .pdf, .jpg or .png that are tracked by git but are not
                included in any .tex.
Examples:
  1) Add untracked and update already tracked figures in includegraphics{}
    ./included_figures.sh | xargs git add
  2) Remove from git the files that are not includegraphics{} anymore
    ./included_figures.sh --git-only | xargs git add
```

- `rm_unused_figures.sh` moves the not included figures in a different
  folder. Useful when adding many .jpg, .png or .pdf as figures at once
  before even knowing which figures you are actually going to include. Helps
  me keep my master's thesis project clean.

```
./mv_unused_figures.sh moves the .pdf, .jpg or .png that are present in your
project but that aren't included in any of your .tex.
Usage:
    ./mv_unused_figures.sh [-m] [–s] [--move [folder]]
Options:
    -m               Display figures that are going to be moved
    -s               Display figures that are going to stay
    --move [folder]  Launch the move process to the --move folder
                     By default, the moveto folder is _figures.
By default, lists both moving and staying files.
Examples:
1) First, check that the figures that are going to be moved are correct:
    ./mv_unused_figures.sh -m
2) Second, you can launch the move process
    ./mv_unused_figures.sh --move _figures
```
