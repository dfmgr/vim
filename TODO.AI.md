# TODO.AI.md

## install.sh — script-lint findings (2026-09-27)

Found by the `script-lint` agent across three passes. NEW findings (UUOC,
missing `grep --`, commented-out code, line length, `run_postinst`/
`connect_test`/`verify_url` naming, `basename` UUOC) were fixed directly.
Remaining pre-existing findings, not touched this session:

- line 69: `exit 90` — outside standard exit-code ranges (0-2, 64-78,
  128-143); candidate replacement `78` (EX_CONFIG) or `69`
  (EX_UNAVAILABLE)
- line 87: `__get_exit_status()` assigns `s=` without `local`
- line 96: `__kill_process_id()` assigns `pid=` without `local`
- 24x SC2086 unquoted expansions (`__cmd_exists $1`, `__silent_start $1`,
  `exit ${1:-4}`, `return $getRunStatus`, `exit ${EXIT:-...}`)
- line 92 SC2015: `__symlink()` uses `A && B || C` — C can run when A
  succeeds
- lines 28, 31, 32, 38 SC2034: `VERSION`, `RUN_USER`, `SCRIPT_SRC_DIR`,
  `REPORAW` appear unused
- line 27/133: `APPNAME` assigned twice to `"vim"` — harmless, redundant
