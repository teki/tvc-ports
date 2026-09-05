# Aiming cursor progress

Completed: corrected Y/X contract and native pixel-mask phase with four
opcode-byte changes and unchanged addresses. Updated loader CAS hash.

Validation: build.py and verify.py passed; 21 controlled calls of the
assembled plotter in lsqd-aim.rtvcsnap.zip matched expected X/Y, native
address, native plane mask, and Spectrum collision mask. Rebuilt local DSK.

Optional next check: interactive QAOP aiming movement from a fresh load.
The original snapshot still contains the previous resident code.
