#!/bin/bash
# Exportare categorii, produse si combinatii din XML in CSV.
echo "Exportare categorii, produse si combinatii din XML in CSV."
echo "developed by ITManager"
echo "=========================================================="
# export produse.csv
echo "Export produse.csv"
xsltproc xsl/produse.xsl in/en_complete_01_nw.xml > out/produse.csv
# export combinatii_fara_culoare.csv
echo "export combinatii_fara_culoare.csv"
xsltproc xsl/combinatii_fara_culoare.xsl in/en_complete_01_nw.xml > out/combinatii_fara_culoare.csv
# export combinatii_culoare.csv
echo "Export combinatii_culoare.csv"
xsltproc xsl/combinatii_culoare.xsl in/en_complete_01_nw.xml > out/combinatii_culoare.csv
# Done
echo "Done! Fisierele rezultate le gasiti in folderul 'out'"
