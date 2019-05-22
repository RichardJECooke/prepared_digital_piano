<Cabbage>
form caption("Richard's prepared digital piano") size(800, 300), colour(58, 110, 182), pluginid("def1")
keyboard bounds(18, 42, 762, 190) ;left top right bottom
</Cabbage>
<CsoundSynthesizer>
	<CsOptions>
		; Select audio/midi flags here according to platform
		;-odac  -F  midichn_advanced.mid ;;;reatime audio out and midifile in
		-n -d -+rtmidi=NULL -M0 -m0d --midi-key=4 --midi-velocity=5
		;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
		; For Non-realtime ouput leave only the line below:
		; -o fluidEngine.wav -W ;;; for file output any platform
	</CsOptions>
	<CsInstruments>
; http://www.csounds.com/manual/html/index.html

;- Region: SYSTEM SETTINGS
		sr = 44100
		ksmps = 32
		nchnls = 2 //1=left. 2=left and right
		0dbfs  = 1

;- Region: CONSTANTS
		gi_MidiEventType_NoteOff init 128
		gi_MidiEventType_NoteOn init 144
		gi_MidiEventType_Bend init 224

;- Region: INITIALIZATION
		; load soundfont
		giPianoSoundfont = fluidEngine() ; start fluidsynth engine
		iSoundfontNumber = fluidLoad("pianoSoundfont.sf2", giPianoSoundfont, 1)    ;or try a the procedural wurlitzer: https://csound.com/docs/manual/fmwurlie.html
		fluidProgramSelect(giPianoSoundfont, 1, iSoundfontNumber, 0, 0)   ; engine, channel, soundfont, bank, preset

		;make sure that all channels and programs are assigned to instrumentMidiReader
		massign(0, 1)
        pgmassign(0, 1)

;- Region: INSTRUMENT MIDI READER
		instr 1, instrumentMidiReader
			kMidiEventType, kMidiEventChannel, kMidiEventData1, kMidiEventData2 midiin
			iKey = p4
			iVelocity = p5
			fluidNote(giPianoSoundfont, 1, iKey, iVelocity)
		endin

;- Region: INSTRUMENT PIANO
		instr 2, instrumentPiano
			aLeft, aRight fluidOut giPianoSoundfont
			outs(aLeft, aRight)
		endin
	</CsInstruments>
	<CsScore>
		f0 z ;runs for 7000 years
		i 2 0 z //activate instrument 1 now: instrument number, start time, duration
		e //end of score
	</CsScore>
</CsoundSynthesizer>

;- Region: OBSOLETE STUFF

;mididefault	60, p3 ; default duration of 60 -- overridden by score.
;midinoteonkey p4, p5 ; channels MIDI input to pfields.

;if (kMidiEventType == gi_MidiEventType_NoteOn) then
;	printks "kstatus= %d, kchan = %d, \\tnote#  = %d, velocity = %d \\tNote ON\\t\\n", 0, kMidiEventType, kMidiEventChannel, kMidiEventData1, kMidiEventData2
;endif
