#!/bin/zsh

POEMS_HTML=$(curl -L https://medium.com/tag/poetry/latest 2> /dev/null | pup 'div.postArticle:not(a)')
#POEMS_HTML=$(curl -L https://medium.com/tag/poetry 2> /dev/null)
POEM_LINKS=("${(f)$(echo $POEMS_HTML | pup '.postArticle-readMore a.button attr{href}')}")
POEM_LENGTHS=("${(f)$(echo $POEMS_HTML | pup '.js-postMetaInlineSupplemental span.readingTime attr{title}' | cut -f 1 -d ' ')}")

for ((i=1; i < ${#POEM_LINKS}; i++))
do
	if [[ $POEM_LENGTHS[i] < 3 ]]; then
		POEM=$(curl -L $POEM_LINKS[i] 2> /dev/null)
		POEM_TEXT=$(echo $POEM | pup 'div.section-inner.sectionLayout--insetColumn:not(figcaption) text{}')
		TITLE=$(echo $POEM | pup 'div.section-inner :not([tag="figure"]) .graf--title, .graf--leading text{}')
		echo "Generating .mp3 for -- $TITLE"
		echo "POEM: " $POEM_TEXT[1,30]
		#echo $(echo $POEM | pup 'div.section-inner text{}') | gtts-cli -l "en" -o "$i.mp3" -
	fi
done
