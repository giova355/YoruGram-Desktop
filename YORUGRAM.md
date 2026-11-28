# YoruGram Desktop — Foundation

Unofficial Telegram Desktop fork based on 7.4.6. Upstream license and copyright remain intact. Initial Windows x64 changes: app identity, executable name, Windows resource branding and icon, separate default app-data and portable directory. Internal Qt artwork, custom settings and wallpapers still need integration. Test CI disables upstream auto-updates and crash reporting. Never point the explicit -workdir option at an existing Telegram profile. Coexistence and runtime behavior require testing.

## Build
The Windows workflow on `yoru/foundation` uses upstream dependency preparation and builds Debug with MSVC 14.44. Pushes and default manual runs select the upstream `TDESKTOP_API_TEST` mode. These credentials are limited to testing. The GitHub Actions artifact for this mode contains `YoruGram.exe`, `LICENSE`, `LEGAL`, and `SHA256.txt`. Use an authorized test account for sign-in tests.

For a build with your project's Telegram API credentials, add `YORU_API_ID` and `YORU_API_HASH` as repository Actions secrets. Set the repository Actions variable `YORU_CI_PROJECT_API` to `true` to use them on the next push to `yoru/foundation`. Unset the variable to return to the upstream test API. If the workflow supports manual runs on the default branch, use **Build with the project's Telegram API credentials** for a single run. Credentialed builds upload artifacts only when the repository is private.

For a local build, clone this fork and its recursive submodules into the build folder described in [the upstream Windows build instructions](docs/building-win.md). In the x64 Native Tools Command Prompt with MSVC 14.44 and Windows SDK 10.0.26100.0, run from the repository root:

```bat
call Telegram\build\prepare\win.bat skip-release
cd Telegram
call configure.bat x64 -D TDESKTOP_API_TEST=ON -D DESKTOP_APP_DISABLE_AUTOUPDATE=ON -D DESKTOP_APP_DISABLE_CRASH_REPORTS=ON
cmake --build ..\out --config Debug --target Telegram --parallel
```

The executable is expected at `out/Debug/YoruGram.exe`. Use `TDESKTOP_API_TEST=OFF` with your project's API ID and hash for a local credentialed build. Keep credentials out of source control. Production signing, an installer, and independent updates are pending.

The welcome screen identifies YoruGram as an independent client using the Telegram API. Broadcast channel creation checks the proposed title and description for explicit calls to real violence and explicit offers to share recordings of real killings. Fictional horror, comics, anime and age labels can pass this local check. Telegram's rules apply to all channels, including those created outside YoruGram.

The workflow builds an unsigned test installer after the Windows launch check and compares its installed executable to the tested file before uploading it. The installer uses its own per-user installation path and shortcuts.

Windows uses its own application ID, notification activator and shortcuts. The client leaves URL handler registration to an explicit request. CI runs the test executable with a fresh `APPDATA` and checks its window and data directory.
