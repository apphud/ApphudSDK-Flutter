# Third-Party Software and License Agreements (Flutter SDK)

Generated at: 2026-05-13T12:00:00Z (UTC)
Source of truth: `pubspec.yaml` + `pubspec.lock` + `example/pubspec.yaml` + `example/pubspec.lock`
SDK version: `3.1.2`

## Scope

- This report covers three groups of dependencies:
  1. SDK runtime dependencies (resolved from the SDK `pubspec.lock`, equivalent to `flutter pub deps --no-dev`).
  2. SDK dev dependencies (direct entries under `dev_dependencies` in the SDK `pubspec.yaml`).
  3. Example app dependencies (direct main and dev entries from `example/pubspec.yaml`); the local `apphud` package is the SDK itself and is excluded.
- Hosted package licenses are detected from LICENSE files inside exact-version package archives from pub.dev.
- `flutter`, `flutter_test`, and `sky_engine` are treated as Flutter SDK components and inherit the Flutter SDK license.
- This is an engineering inventory for due diligence and should be legally verified.

## Changes Since Previous Report (2026-03-05)

- `characters`: `1.4.0` → `1.4.1`
- `material_color_utilities`: `0.11.1` → `0.13.0`
- `meta`: `1.16.0` → `1.17.0`
- Added section: SDK dev dependencies (`analyzer`, `build_runner`, `json_serializable`, `pedantic`, `flutter_test`).
- Added section: Example app dependencies (`cupertino_icons`, `flutter_bloc`, `bloc_concurrency`, `freezed_annotation`, plus example dev: `freezed`, `json_serializable`, `build_runner`, `flutter_test`).

## Summary

Across all sections (entries can repeat across sections, e.g. `flutter_test`, `build_runner`, `json_serializable`):

- Total entries: 22
- `Permissive`: 22
- `Copyleft / reciprocal`: 0
- `Other`: 0
- `Unknown`: 0

Per-section counts (direct entries only for dev/example tables):

| Section | Packages |
|---|---:|
| SDK runtime dependencies | 8 |
| SDK dev dependencies (direct) | 5 |
| Example app dependencies (direct main) | 5 |
| Example app dev dependencies (direct) | 4 |

## Top License Identifiers (across all sections)

- `BSD-3-Clause`: 16
- `MIT`: 5
- `Apache-2.0`: 1

## SDK Runtime Dependency Inventory

| Package | Version | Source | License | License Class | Reference | Notes |
|---|---:|---|---|---|---|---|
| `characters` | `1.4.1` | `pub.dev` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/dart-lang/core/tree/main/pkgs/characters) | manual verification from package archive LICENSE |
| `collection` | `1.19.1` | `pub.dev` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/dart-lang/core/tree/main/pkgs/collection) | manual verification from package archive LICENSE |
| `flutter` | `0.0.0` | `flutter-sdk` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/flutter/flutter/blob/master/LICENSE) | part of Flutter SDK; license inherited from Flutter SDK distribution |
| `json_annotation` | `4.9.0` | `pub.dev` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/google/json_serializable.dart/tree/master/json_annotation) | manual verification from package archive LICENSE |
| `material_color_utilities` | `0.13.0` | `pub.dev` | `Apache-2.0` | `Permissive` | [link](https://github.com/material-foundation/material-color-utilities/tree/main/dart) | license from package archive; file: LICENSE |
| `meta` | `1.17.0` | `pub.dev` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/dart-lang/sdk/tree/main/pkg/meta) | manual verification from package archive LICENSE |
| `sky_engine` | `0.0.0` | `flutter-sdk` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/flutter/flutter/blob/master/LICENSE) | part of Flutter SDK; license inherited from Flutter SDK distribution |
| `vector_math` | `2.2.0` | `pub.dev` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/google/vector_math.dart) | manual verification from package archive LICENSE |

## SDK Dev Dependencies (direct)

Direct entries from `dev_dependencies` in the SDK `pubspec.yaml`. Versions are taken from `pubspec.lock`. Transitive dev-only dependencies are not enumerated here.

| Package | Version | Constraint | Source | License | License Class | Reference | Notes |
|---|---:|---|---|---|---|---|---|
| `analyzer` | `6.4.1` | `^6.4.1` | `pub.dev` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/dart-lang/sdk/tree/main/pkg/analyzer) | manual verification from package archive LICENSE |
| `build_runner` | `2.4.9` | `^2.4.6` | `pub.dev` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/dart-lang/build/tree/master/build_runner) | manual verification from package archive LICENSE |
| `flutter_test` | `0.0.0` | `sdk: flutter` | `flutter-sdk` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/flutter/flutter/blob/master/LICENSE) | part of Flutter SDK; license inherited from Flutter SDK distribution |
| `json_serializable` | `6.8.0` | `^6.2.0` | `pub.dev` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/google/json_serializable.dart/tree/master/json_serializable) | manual verification from package archive LICENSE |
| `pedantic` | `1.11.1` | `^1.11.1` | `pub.dev` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/dart-lang/pedantic) | manual verification from package archive LICENSE; package is discontinued upstream |

## Example App Dependencies (direct main)

Direct entries from `dependencies` in `example/pubspec.yaml`. The local path dependency on `apphud` is the SDK itself and is omitted.

| Package | Version | Constraint | Source | License | License Class | Reference | Notes |
|---|---:|---|---|---|---|---|---|
| `bloc_concurrency` | `0.3.0` | `^0.3.0` | `pub.dev` | `MIT` | `Permissive` | [link](https://github.com/felangel/bloc/tree/master/packages/bloc_concurrency) | manual verification from package archive LICENSE |
| `cupertino_icons` | `1.0.8` | `^1.0.3` | `pub.dev` | `MIT` | `Permissive` | [link](https://github.com/flutter/cupertino_icons) | manual verification from package archive LICENSE |
| `flutter` | `0.0.0` | `sdk: flutter` | `flutter-sdk` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/flutter/flutter/blob/master/LICENSE) | part of Flutter SDK; license inherited from Flutter SDK distribution |
| `flutter_bloc` | `9.1.1` | `^9.1.1` | `pub.dev` | `MIT` | `Permissive` | [link](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc) | manual verification from package archive LICENSE |
| `freezed_annotation` | `3.1.0` | `^3.1.0` | `pub.dev` | `MIT` | `Permissive` | [link](https://github.com/rrousselGit/freezed/tree/master/packages/freezed_annotation) | manual verification from package archive LICENSE |

## Example App Dev Dependencies (direct)

Direct entries from `dev_dependencies` in `example/pubspec.yaml`. Transitive dev-only dependencies are not enumerated here.

| Package | Version | Constraint | Source | License | License Class | Reference | Notes |
|---|---:|---|---|---|---|---|---|
| `build_runner` | `2.8.0` | `^2.8.0` | `pub.dev` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/dart-lang/build/tree/master/build_runner) | manual verification from package archive LICENSE |
| `flutter_test` | `0.0.0` | `sdk: flutter` | `flutter-sdk` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/flutter/flutter/blob/master/LICENSE) | part of Flutter SDK; license inherited from Flutter SDK distribution |
| `freezed` | `3.2.3` | `^3.2.3` | `pub.dev` | `MIT` | `Permissive` | [link](https://github.com/rrousselGit/freezed/tree/master/packages/freezed) | manual verification from package archive LICENSE |
| `json_serializable` | `6.11.1` | `^6.2.0` | `pub.dev` | `BSD-3-Clause` | `Permissive` | [link](https://github.com/google/json_serializable.dart/tree/master/json_serializable) | manual verification from package archive LICENSE |

## Combined TSV Table

The block below is a TSV (tab-separated) representation of all entries above, suitable for pasting into a spreadsheet.

```tsv
Flutter SDK Dependencies												
Dependency Type	Name	Version	Constraint	Resolved Version	Source / Repo	License(s)	License Class	Reference URL	Notes	Original Table	Source Report	
SDK runtime dependency	characters	1.4.1		1.4.1	pub.dev	BSD-3-Clause	Permissive	https://github.com/dart-lang/core/tree/main/pkgs/characters	manual verification from package archive LICENSE	SDK Runtime Dependency Inventory	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK runtime dependency	collection	1.19.1	^1.17.0	1.19.1	pub.dev	BSD-3-Clause	Permissive	https://github.com/dart-lang/core/tree/main/pkgs/collection	manual verification from package archive LICENSE	SDK Runtime Dependency Inventory	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK runtime dependency	flutter	0.0.0	sdk: flutter	0.0.0	flutter-sdk	BSD-3-Clause	Permissive	https://github.com/flutter/flutter/blob/master/LICENSE	part of Flutter SDK; license inherited from Flutter SDK distribution	SDK Runtime Dependency Inventory	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK runtime dependency	json_annotation	4.9.0	^4.9.0	4.9.0	pub.dev	BSD-3-Clause	Permissive	https://github.com/google/json_serializable.dart/tree/master/json_annotation	manual verification from package archive LICENSE	SDK Runtime Dependency Inventory	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK runtime dependency	material_color_utilities	0.13.0		0.13.0	pub.dev	Apache-2.0	Permissive	https://github.com/material-foundation/material-color-utilities/tree/main/dart	license from package archive; file: LICENSE	SDK Runtime Dependency Inventory	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK runtime dependency	meta	1.17.0		1.17.0	pub.dev	BSD-3-Clause	Permissive	https://github.com/dart-lang/sdk/tree/main/pkg/meta	manual verification from package archive LICENSE	SDK Runtime Dependency Inventory	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK runtime dependency	sky_engine	0.0.0	sdk: flutter	0.0.0	flutter-sdk	BSD-3-Clause	Permissive	https://github.com/flutter/flutter/blob/master/LICENSE	part of Flutter SDK; license inherited from Flutter SDK distribution	SDK Runtime Dependency Inventory	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK runtime dependency	vector_math	2.2.0		2.2.0	pub.dev	BSD-3-Clause	Permissive	https://github.com/google/vector_math.dart	manual verification from package archive LICENSE	SDK Runtime Dependency Inventory	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK dev dependency	analyzer	6.4.1	^6.4.1	6.4.1	pub.dev	BSD-3-Clause	Permissive	https://github.com/dart-lang/sdk/tree/main/pkg/analyzer	manual verification from package archive LICENSE	SDK Dev Dependencies (direct)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK dev dependency	build_runner	2.4.9	^2.4.6	2.4.9	pub.dev	BSD-3-Clause	Permissive	https://github.com/dart-lang/build/tree/master/build_runner	manual verification from package archive LICENSE	SDK Dev Dependencies (direct)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK dev dependency	flutter_test	0.0.0	sdk: flutter	0.0.0	flutter-sdk	BSD-3-Clause	Permissive	https://github.com/flutter/flutter/blob/master/LICENSE	part of Flutter SDK; license inherited from Flutter SDK distribution	SDK Dev Dependencies (direct)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK dev dependency	json_serializable	6.8.0	^6.2.0	6.8.0	pub.dev	BSD-3-Clause	Permissive	https://github.com/google/json_serializable.dart/tree/master/json_serializable	manual verification from package archive LICENSE	SDK Dev Dependencies (direct)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
SDK dev dependency	pedantic	1.11.1	^1.11.1	1.11.1	pub.dev	BSD-3-Clause	Permissive	https://github.com/dart-lang/pedantic	manual verification from package archive LICENSE; package is discontinued upstream	SDK Dev Dependencies (direct)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
Example app main dependency	bloc_concurrency	0.3.0	^0.3.0	0.3.0	pub.dev	MIT	Permissive	https://github.com/felangel/bloc/tree/master/packages/bloc_concurrency	manual verification from package archive LICENSE	Example App Dependencies (direct main)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
Example app main dependency	cupertino_icons	1.0.8	^1.0.3	1.0.8	pub.dev	MIT	Permissive	https://github.com/flutter/cupertino_icons	manual verification from package archive LICENSE	Example App Dependencies (direct main)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
Example app main dependency	flutter	0.0.0	sdk: flutter	0.0.0	flutter-sdk	BSD-3-Clause	Permissive	https://github.com/flutter/flutter/blob/master/LICENSE	part of Flutter SDK; license inherited from Flutter SDK distribution	Example App Dependencies (direct main)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
Example app main dependency	flutter_bloc	9.1.1	^9.1.1	9.1.1	pub.dev	MIT	Permissive	https://github.com/felangel/bloc/tree/master/packages/flutter_bloc	manual verification from package archive LICENSE	Example App Dependencies (direct main)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
Example app main dependency	freezed_annotation	3.1.0	^3.1.0	3.1.0	pub.dev	MIT	Permissive	https://github.com/rrousselGit/freezed/tree/master/packages/freezed_annotation	manual verification from package archive LICENSE	Example App Dependencies (direct main)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
Example app dev dependency	build_runner	2.8.0	^2.8.0	2.8.0	pub.dev	BSD-3-Clause	Permissive	https://github.com/dart-lang/build/tree/master/build_runner	manual verification from package archive LICENSE	Example App Dev Dependencies (direct)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
Example app dev dependency	flutter_test	0.0.0	sdk: flutter	0.0.0	flutter-sdk	BSD-3-Clause	Permissive	https://github.com/flutter/flutter/blob/master/LICENSE	part of Flutter SDK; license inherited from Flutter SDK distribution	Example App Dev Dependencies (direct)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
Example app dev dependency	freezed	3.2.3	^3.2.3	3.2.3	pub.dev	MIT	Permissive	https://github.com/rrousselGit/freezed/tree/master/packages/freezed	manual verification from package archive LICENSE	Example App Dev Dependencies (direct)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
Example app dev dependency	json_serializable	6.11.1	^6.2.0	6.11.1	pub.dev	BSD-3-Clause	Permissive	https://github.com/google/json_serializable.dart/tree/master/json_serializable	manual verification from package archive LICENSE	Example App Dev Dependencies (direct)	THIRD_PARTY_SOFTWARE_AND_LICENSES_FLUTTER_SDK.md	
												
```
