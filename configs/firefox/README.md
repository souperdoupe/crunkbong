# Hardened prefs.js (about:config)

This is best in a new firefox profile, but use it however you wish.

### Usage

Extract and place in ~/.mozilla/firefox/*.default

If you're on Windows, there's a similar folder somewhere else.  Just put 
it there.

### Testing some features
browserleaks.com has several useful pages to check leaked information:

browserleaks.com/ip

browserleaks.com/javascript

browserleaks.com/canvas

browserleaks.com/webrtc

Note that most of the values reported by these websies can be altered or spoofed in about:config (prefs.js values).

### WIP
I'm looking at writing a script that only replaces significant lines.  I could probably implement this whole thing as an add-on, but I lack the expertise; also, note that Mozilla is making significant changes to the way it handles add-ons, whereas simply reading values from prefs.js, a mere file, hasn't changed much in nature.
