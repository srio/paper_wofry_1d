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
cp ../iucr.cls .
cp ../harvard.sty .
cp ../siunitx.sty .
cp ../siunitx-abbreviations.cfg .

cp -r ../figures .

cp main.tex main.tex.orig

# biblio
# sed -e "s.^\\\\bibliography{references}.\\\\input{paper-hierarchical\.bbl}." paper-hierarchical.tex -i
pdflatex main.tex
bibtex main
sed -e "s.\\\\bibliographystyle.\\% \\\\bibliographystyle.g" main.tex -i
sed -e "s.^\\\\bibliography{references}.\\% \\\\bibliography{references}." main.tex -i
sed -e "s.^\\\\end{document}.\\% \\\\end{document}." main.tex -i
cat ../main.bbl >> main.tex
echo "\end{document}" >> main.tex


# figure 1
cp figures/fig1.pdf ./figure1.pdf
sed -e "s/figures\/fig1.pdf/figure1.pdf/" main.tex -i

# figure 2
cp figures/fig2.pdf ./figure2.pdf
sed -e "s/figures\/fig2.pdf/figure2.pdf/" main.tex -i

# figure 3
cp figures/wofrydeformation.png ./figure3.png
sed -e "s/figures\/wofrydeformation/figure3/" main.tex -i

# figure 4
cp figures/fig4.pdf ./figure4.pdf
sed -e "s/figures\/fig4.pdf/figure4.pdf/" main.tex -i

# figure 5
cp figures/scan_peak_vs_negative_radius.png ./figure5a.png
cp figures/scan_peak_vs_positive_radius.png ./figure5b.png
sed -e "s/figures\/scan_peak_vs_negative_radius.png/figure5a.png/" main.tex -i
sed -e "s/figures\/scan_peak_vs_positive_radius.png/figure5b.png/" main.tex -i

# figure 6
cp figures/scan_peak_vs_cos50.png ./figure6a.png
cp figures/scan_peak_vs_cos30.png ./figure6b.png
sed -e "s/figures\/scan_peak_vs_cos50.png/figure6a.png/" main.tex -i
sed -e "s/figures\/scan_peak_vs_cos30.png/figure6b.png/" main.tex -i

# figure 7
cp figures/grating.png ./figure7a.png
cp figures/intensity_grating.png ./figure7b.png
sed -e "s/figures\/grating.png/figure7a.png/" main.tex -i
sed -e "s/figures\/intensity_grating.png/figure7b.png/" main.tex -i

# figure 8
cp figures/intensity2Duncorrected.png ./figure8a.png
cp figures/intensity2Dcorrected.png ./figure8b.png
sed -e "s/figures\/intensity2Duncorrected.png/figure7a.png/" main.tex -i
sed -e "s/figures\/intensity2Dcorrected.png/figure7b.png/" main.tex -i


rm -rf figures

sed -e "s/documentclass/documentclass[preprint]/" main.tex -i

pdflatex main.tex
pdflatex main.tex
okular main.pdf
#
