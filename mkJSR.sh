#
# script to create the ArXiv submission
#
# please be sure that you run compile.sh in the main directory before running 
# this script, so paper-hierarchical.bbl and the figures/*eps-converted-to.pdf files 
# are created
#

cd /Users/srio/OASYS1.2/paper_wofry_1d
./latex_run_all.sh
rm -rf JSR JSR
mkdir JSR
cd JSR
cp ../main.tex .
cp ../report.bib .
cp ../iucr.cls .
cp ../iucr.bst .
cp ../harvard.sty .
cp ../siunitx.sty .
cp ../siunitx-abbreviations.cfg .

cp -r ../figures .

cp main.tex main.tex.orig

pdflatex main.tex
bibtex main


# figure 1
cp figures/fig1.pdf ./figure1.pdf
mv main.tex tmp1.tex
sed "s/figures\/fig1.pdf/figure1.pdf/" tmp1.tex > main.tex

# figure 2
cp figures/fig2.pdf ./figure2.pdf
mv main.tex tmp2.tex
sed "s/figures\/fig2.pdf/figure2.pdf/" tmp2.tex > main.tex 

# figure 3
cp figures/wofrynodeformation.png ./figure3.png
mv main.tex tmp3.tex
sed "s/figures\/wofrynodeformation/figure3/" tmp3.tex > main.tex

# figure 4
cp figures/fig4.pdf ./figure4.pdf
mv main.tex tmp4.tex
sed "s/figures\/fig4.pdf/figure4.pdf/" tmp4.tex > main.tex

# figure 5
cp figures/scan_peak_vs_negative_radius.pdf ./figure5a.pdf
cp figures/scan_peak_vs_positive_radius.pdf ./figure5b.pdf
mv main.tex tmp5a.tex
sed "s/figures\/scan_peak_vs_negative_radius.pdf/figure5a.pdf/" tmp5a.tex > main.tex
mv main.tex tmp5b.tex
sed "s/figures\/scan_peak_vs_positive_radius.pdf/figure5b.pdf/" tmp5b.tex > main.tex

# figure 6
cp figures/scan_peak_vs_cos50.pdf ./figure6.pdf
mv main.tex tmp6.tex
sed "s/figures\/scan_peak_vs_cos50.pdf/figure6.pdf/" tmp6.tex > main.tex

# figure 7
cp figures/grating.pdf ./figure7a.pdf
cp figures/intensitygrating.pdf ./figure7b.pdf
mv main.tex tmp7a.tex
sed "s/figures\/grating.pdf/figure7a.pdf/" tmp7a.tex > main.tex
mv main.tex tmp7b.tex
sed "s/figures\/intensitygrating.pdf/figure7b.pdf/" tmp7b.tex > main.tex

# figure 8
cp figures/intensity2Duncorrected.pdf ./figure8a.pdf
cp figures/intensity2Dcorrected.pdf ./figure8b.pdf
mv main.tex tmp8a.tex
sed "s/figures\/intensity2Duncorrected.pdf/figure7a.pdf/" tmp8a.tex > main.tex
mv main.tex tmp8b.tex
sed "s/figures\/intensity2Dcorrected.pdf/figure7b.pdf/" tmp8b.tex > main.tex



mv main.tex tmpP.tex
sed "s/documentclass/documentclass[preprint]/" tmpP.tex > main.tex

rm -rf figures tmp*

pdflatex main.tex
pdflatex main.tex
open main.pdf
#
