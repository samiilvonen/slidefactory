#!/bin/bash

# m4_ignore(
echo "This is just a script template, not the script (yet) - pass it to 'argbash' to fix this." >&2
exit 11  #)Created by argbash-init v2.9.0
# ARG_OPTIONAL_BOOLEAN([self-contained], s, [Generate self-contained html document])
# ARG_OPTIONAL_BOOLEAN([debug], d, [Debug the pandoc command line])
# ARG_OPTIONAL_SINGLE([theme], t, [Name of the theme], [csc-2019])
# ARG_OPTIONAL_SINGLE([mathjax], , [Mathjax path or url], [https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS_HTML-full])
# ARG_OPTIONAL_SINGLE([output], o, [Name of the output file], [output.html])
# ARG_POSITIONAL_SINGLE([inputfile], [Input md file], [input.md])
# ARG_DEFAULTS_POS
# ARG_HELP([This script converts a pandoc markdown document into a revealjs html presentation])
# ARGBASH_GO

# [ <-- needed because of Argbash, do not remove

orig_root=$(pwd)
script_root=$(dirname ${BASH_SOURCE[0]})

pushd $script_root

if [[ "x$_arg_self_contained" == "xon" ]] ; then
    selfcontained="--self-contained"
else
    selfcontained=""
fi

outputfile="$(basename $_arg_inputfile .md).html"

cmd="pandoc \
$orig_root/$_arg_inputfile \
--verbose \
-t revealjs \
-V revealjs-url=reveal.js \
-V width=1920 \
-V height=1080 \
-V history=true \
-V center=false \
-V controls=false \
-V transition=none \
--template=theme/${_arg_theme}/template.html \
-V theme=${_arg_theme} \
-V backgroundTransition=none \
--mathjax=${_arg_mathjax} \
--lua-filter=filter/background-image.lua \
--resource-path=.:${orig_root} \
${selfcontained} \
-o $orig_root/$outputfile"

if [[ "x$_arg_debug" == "xon" ]] ; then
    echo "$cmd"
fi

eval "$cmd"
popd

# ] <-- needed because of Argbash, do not add anything beyond this
