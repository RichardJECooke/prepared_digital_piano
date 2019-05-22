# prepared_digital_piano

A digital piano. First I tried csound, but it was too hard so I switched to PD. They are in two separate folders.

## Pure data

Use Puredata vanilla, > v 0.49. 
Help - Find external - ceammc (to get fluid~ soundfont object). If that doesn't work then use the 0.49 pd installer with ceammc to get the fluid~ soundfont library to run: https://github.com/uliss/pure-data/releases/tag/v2019.04?fbclid=IwAR2CpRkCcTN6iize5l1l8hZFyPnqQWfTPLu_tUhf0qaF-BudrW87SSpYyu4

File - Preferences - Paths - Add externals/ceammc folder to the path so PD can see the fluid~ object (or just use declare -lib ceammc object)

### Signal flow

Distortion in velocity
Pitch bend on velocity over time
Reverse double time same pitch on release
Tremolo on global timing always
kick on low bass, Brass on bass, woodwind on mid, bells on top, strings on duration
Echo inverse to number of notes per 500ms
Reverb on chord thickness
Shimmer (high pass + random) on all notes off
Filter?
Loop record, loop stop

# TODO
- use clone to replace copy and paste notes
- use other instrument soundfonts

### Notes
Piano midi pitches: 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108

### Links

Saturation plugin found here: https://forum.pdpatchrepo.info/topic/10589/saturation-abstraction
Compressor: https://github.com/gllmAR/pd-compressor

## Csound
A prepared digital piano built in CSound &amp; Cabbage - in the csound folder (gave up, too hard)

## Forum posts

Purr Data fluid~ library not working: https://git.purrdata.net/jwilkes/purr-data/issues/540
and fluid~ issue: https://github.com/pd-l2ork/pd/issues/49

ceammc library discussion for Pure Data on Facebook: https://www.facebook.com/groups/puredata/?multi_permalinks=10156604729329495&notif_id=1556808241980969&notif_t=feedback_reaction_generic



