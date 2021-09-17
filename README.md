## How to build

Building is straightforward, you will need LaTeX and Git.
The following command will create a local copy of the source code for you.

`git clone https://github.com/anton-petrunin/metric-geometry.git`

To make pictures go to `tex/mppics/` in the created folder and run `mpost`

`cd tex/mppics/`<br/>
`mpost pic`<br/>
`cd ../..`<br/>

For *complete lectures*, go to the created folder and run `pdflatex`, `biber` and `makeindex` few times:

`cd tex/`<br/>
`pdflatex lectures`<br/>
`makeindex lectures`<br/>
`biber lectures`<br/>
`pdflatex lectures`<br/>

For *Pure metric geometry* and *Metric geometry on manifolds* do the same for `pure-metric.tex` and `metrics-on-manifolds.tex`
To get arXiv.tar with all needed files do

`tar -cvf arXiv.tar --files-from list-of-files-pure-metric.txt`<br/>
`tar -cvf arXiv.tar --files-from list-of-files-mnfld.txt`
