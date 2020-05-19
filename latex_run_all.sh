rm main.pdf
rm figures/fig1.pdf
rm figures/fig2.pdf
rm figures/fig4.pdf

./fig1.sh
./fig2.sh
./fig4.sh

pdflatex main.tex
bintex main
sleep 1.0
pdflatex main.tex
pdflatex main.tex

open main.pdf
