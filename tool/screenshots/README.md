# Screenshot harness

Renders the main screens headlessly inside `flutter test` (no phone or
emulator) and writes PNGs for design review.

## Run

From the project root (`Flutter/`):

```
C:\flutterSDK\flutter\bin\flutter test --no-pub tool/screenshots/capture_test.dart
```

Use the pinned SDK above (3.44.8), not the `flutter` on PATH. A full run
takes about 10 seconds after compilation. Plain `flutter test` only scans
`test/`, so this never runs as part of the normal suite.

## Output

`build/screenshots/` (git-ignored):

- `<screen>_light.png` / `<screen>_dark.png`: 390x844 logical, rendered at
  2x (780x1688 px), app bar and bottom navigation included.
- `home_landscape_light.png` (844x390) and `home_tablet_light.png`
  (1024x768): the side-rail layouts.
- `report.txt`: one line per capture. `OK`, `WARN` (captured, but the
  framework reported an error such as an overflow; the message is listed) or
  `FAILED` (no PNG).

## What it does

- **Fonts:** loads Roboto and MaterialIcons from the SDK's
  `bin/cache/artifacts/material_fonts`, plus every family in `pubspec.yaml`
  (Quasimoda), straight from disk. Text whose style names no family at all
  (a bare `RichText`, nav-rail labels) gets Roboto just before capture, which
  is what Android supplies. The test's box font would otherwise claim it.
- **Data:** synthetic only (`fixtures.dart`): worker "Amira Ben Salah",
  tenant "acme-logistics", two uploaded documents, three inbox notifications
  (one is a re-verification request).
- **Network:** none. There is no session token, so status calls stop before
  any request. flutter_test answers HTTP with 400, and `NoNetworkOverrides`
  refuses raw sockets (gRPC).
- **Isolation:** one `testWidgets` per screen and theme, so a screen that
  throws costs only its own PNG.

## Known limits

- Screens that load status from the backend show their signed-out state:
  "Not logged in" on Home, Status and Profile.
- Only the first viewport is captured, not the scrolled-off part of long
  screens.
- No system bar insets are simulated (status bar and gesture bar area are
  zero).
- Camera screens (face liveness, document capture, selfie, fingerprint, QR)
  are skipped because their plugins cannot run headless.

## Add a screen

Add a `_Shot('name', () => const MyScreen())` to `_shots` in
`capture_test.dart`. If the screen reads secure storage, add synthetic values
to `demoStorage()` in `fixtures.dart`.
