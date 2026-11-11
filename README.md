# Overhaul launcher scan

Runs Microsoft Defender over a Balatro Overhaul launcher build on a clean Windows runner before a release goes out.

What the workflow does:

1. Turns Defender back on (GitHub's runners ship with real-time protection off and the whole disk excluded) and updates the signatures.
2. Downloads the launcher zip attached to the `launcher` release of this repo, unpacks it and scans both the zip and the unpacked folder.
3. Creates the Desktop and Start Menu shortcuts with the same PowerShell command the launcher uses, started from `love.exe`, and checks they exist.
4. Starts the launcher for a minute with a software OpenGL driver, takes a screenshot and checks Defender did not stop it.

The result is in the run summary; the screenshot and the raw Defender output are in the run's artifacts.

A server runner is not a home PC: a clean run here is a good sign, not a guarantee.
