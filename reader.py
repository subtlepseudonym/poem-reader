from gtts import gTTS
import sys

tts = gTTS(text=sys.argv[1], lang='en')
tts.save("poem.mp3")

