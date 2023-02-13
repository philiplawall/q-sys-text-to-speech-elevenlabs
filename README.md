# Open Source Text to Speech for Q-SYS

![MIT License](https://img.shields.io/badge/license-MIT-green)&nbsp;![9.4.3](https://img.shields.io/badge/tested%20on-9.4.3-blue)&nbsp;![9.4.3](https://img.shields.io/badge/tested%20on-9.6.0-blue)&nbsp;![Downloads](https://img.shields.io/github/downloads/jasonkrasavage/q-sys-text-to-speech/total.svg)

![Q-SYS Logo](q-sys_logo_transparent_bg.png)
![ElevenLabs Logo](ElevenLabsLogo.png)

This plugin was developed to be a free and open-source method to leverage ElevenLabs Text to Speech API. This plugin has been deployed under an MIT license, so you are free to reuse, distribute and profit from this code. You must generate a valid ElevenLabs API key to use this plugin, and once you do you will be subject to ElevenLabs own pricing for API usage. See the next session below for help on generating your own ElevenLabs API key. The cost is very cheap, and currently at the time of development is the following:

(pricing is per month)

- 0$: 10000 characters per month, no custom voices
- 5$: 30000 characters per month, up to 10 custom voices
- 22$: 100000 characters per month, up to 30 custom voices
- 99$: 500000 characters per month, up to 60 custom voices
- 330$: 2000000 characters per month, up to 120 custom voices

Audio files are only generated when you press the generate button. They are stored locally on the core in 1 of the 10 slots. When played back, the API is not used, and after converting your strings of text to audio, and saving them in the slots, the API key can happily be removed, and the core does not need access to the internet. I would advise deploying the plugin to shared environments in this manner so your API key cannot be abused by a third party.

If you have any problems or suggestions for improvements, please open an issue [here](https://github.com/philiplawall/q-sys-text-to-speech-elevenlabs/issues).

## Generate a ElevenLabs API Key

- Create a Account on [beta.elevenlabs.io](https://beta.elevenlabs.io)
- Click on you Profile in the top right, select Profile and copy the API Key.
