# Add TeX to path if not already included
if [[ :$PATH: != *:"/usr/texbin":* ]]
then
    export PATH="$PATH:/usr/texbin"
fi

if [[ :$PATH: != *:"/Library/TeX/texbin":* ]]
then
    export PATH="$PATH:/Library/TeX/texbin"
fi

export TEXMFHOME=$(kpsewhich -var-value TEXMFHOME)
