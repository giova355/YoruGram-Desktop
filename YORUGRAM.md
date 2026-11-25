# YoruGram Desktop — Foundation

Unofficial Telegram Desktop fork based on 7.4.6. Upstream license and copyright remain intact. Initial Windows x64 changes: app identity, executable name, Windows resource branding and icon, separate default app-data and portable directory. Internal Qt artwork, custom settings and wallpapers still need integration. Test CI disables upstream auto-updates and crash reporting. Never point the explicit -workdir option at an existing Telegram profile. Coexistence and runtime behavior require testing.

## Build
Enable Actions on this fork and add your own YORU_API_ID and YORU_API_HASH repository secrets. Do not commit credentials. The Windows workflow on yoru/foundation uses upstream dependency preparation and a single x64 Debug build. Firebase is not needed. See docs/building-win.md for prerequisites. Test artifact should contain YoruGram.exe, LICENSE and SHA256.txt. Production signing, installer and independent updates are not implemented. Other upstream workflows are unchanged; keep unnecessary workflows disabled in fork settings. No build or runtime success is asserted until CI and device tests pass.
