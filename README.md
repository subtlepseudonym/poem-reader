## Poem-Reader

This is an attempt to pull down short poems from Medium and play them via TTS.

I've found that Medium has very little regularity in the formatting of its posts (duh) so it's been an odd journey.  Mostly I've used pup to parse html in the command line (much like jq for json) and filter to the elements I want (or seem like they'll contain the content I'm interested in).  Then, I pass the (more or less) extracted poetry to gtts-cli to be converted to an .mp3 file via the google tts api.

I had much more luck with the posts on medium.com/tag/poetry than I did on medium.com/tag/poetry/latest, but it seems that's the price of a glut of new content.
