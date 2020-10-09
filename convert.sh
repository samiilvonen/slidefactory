#!/bin/bash

# Created by argbash-init v2.9.0
# ARG_OPTIONAL_BOOLEAN([self-contained],[s],[Generate self-contained html document])
# ARG_OPTIONAL_BOOLEAN([debug],[d],[Debug the pandoc command line])
# ARG_OPTIONAL_SINGLE([theme],[t],[Name of the theme],[csc-2019])
# ARG_OPTIONAL_SINGLE([mathjax],[],[Mathjax path or url],[https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS_HTML-full])
# ARG_OPTIONAL_SINGLE([output],[o],[Name of the output file],[output.html])
# ARG_POSITIONAL_SINGLE([inputfile],[Input md file],[input.md])
# ARG_DEFAULTS_POS()
# ARG_HELP([This script converts a pandoc markdown document into a revealjs html presentation])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.9.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}


begins_with_short_option()
{
	local first_option all_short_options='sdtoh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_inputfile="input.md"
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_self_contained="off"
_arg_debug="off"
_arg_theme="csc-2019"
_arg_mathjax="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS_HTML-full"
_arg_output="output.html"


print_help()
{
	printf '%s\n' "This script converts a pandoc markdown document into a revealjs html presentation"
	printf 'Usage: %s [-s|--(no-)self-contained] [-d|--(no-)debug] [-t|--theme <arg>] [--mathjax <arg>] [-o|--output <arg>] [-h|--help] [<inputfile>]\n' "$0"
	printf '\t%s\n' "<inputfile>: Input md file (default: 'input.md')"
	printf '\t%s\n' "-s, --self-contained, --no-self-contained: Generate self-contained html document (off by default)"
	printf '\t%s\n' "-d, --debug, --no-debug: Debug the pandoc command line (off by default)"
	printf '\t%s\n' "-t, --theme: Name of the theme (default: 'csc-2019')"
	printf '\t%s\n' "--mathjax: Mathjax path or url (default: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS_HTML-full')"
	printf '\t%s\n' "-o, --output: Name of the output file (default: 'output.html')"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-s|--no-self-contained|--self-contained)
				_arg_self_contained="on"
				test "${1:0:5}" = "--no-" && _arg_self_contained="off"
				;;
			-s*)
				_arg_self_contained="on"
				_next="${_key##-s}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-s" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-d|--no-debug|--debug)
				_arg_debug="on"
				test "${1:0:5}" = "--no-" && _arg_debug="off"
				;;
			-d*)
				_arg_debug="on"
				_next="${_key##-d}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-d" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-t|--theme)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_theme="$2"
				shift
				;;
			--theme=*)
				_arg_theme="${_key##--theme=}"
				;;
			-t*)
				_arg_theme="${_key##-t}"
				;;
			--mathjax)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_mathjax="$2"
				shift
				;;
			--mathjax=*)
				_arg_mathjax="${_key##--mathjax=}"
				;;
			-o|--output)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_output="$2"
				shift
				;;
			--output=*)
				_arg_output="${_key##--output=}"
				;;
			-o*)
				_arg_output="${_key##-o}"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	test "${_positionals_count}" -le 1 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect between 0 and 1, but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_inputfile "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash

#  <-- needed because of Argbash, do not remove

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
-s \
--resource-path=${orig_root} \
${selfcontained} \
-o $orig_root/$outputfile"

if [[ "x$_arg_debug" == "xon" ]] ; then
    echo "$cmd"
fi

eval "$cmd"
popd

#  <-- needed because of Argbash, do not add anything beyond this
# ] <-- needed because of Argbash
