function tex-install-custom()
{
    rm $TEXMFHOME/tex/latex/*.sty
    rm $TEXMFHOME/tex/latex/*.sty
    ln -s $HOME/Developer/N4M3Z/LaTeX-core/*.sty $TEXMFHOME/tex/latex
    ln -s $HOME/Developer/N4M3Z/LaTeX-core/*.cls $TEXMFHOME/tex/latex
}
