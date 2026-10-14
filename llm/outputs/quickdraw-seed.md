Patch: `quickdraw-seed.patch` (against yippee-fun/quickdraw main at 1709218, `git am` applies it).
Not filed anywhere - this is the text to open the PR with when it is time.

---

Title: Print the seed, read it from SEED and expose it to tests

`qt` already takes `--seed` and shuffles files and tests with it, but the seed is never printed,
so when a run fails because of ordering, or because of data a test generated, there is nothing to
replay it with unless you happened to pass `--seed` up front. There is also no way for a test to
get at the seed: it lives in a private ivar of `$quickdraw_runner`, and `Kernel#rand` is not seeded
at all. Property and fuzz tests that generate their inputs therefore produce different inputs on
every run regardless of `--seed`, and a failure they find cannot be reproduced.

This prints the seed in the summary line (`Passed: 70 | Failed: 0 | Errors: 0 | Seed: 1234`), takes
it from `SEED=` as well as from `--seed` (like minitest does), exposes it as `Quickdraw.seed`, and
calls `Kernel.srand(seed)` before the test files load. Test files are loaded in the parent before
the workers fork, so anything generated at load time is the same in every worker and replays
exactly from the seed.

I know #61 got closed because the seed does not make the scheduling deterministic - which worker
and thread picks up which test still varies, and that is #49. But the seed still pins down
everything that is _not_ scheduling: the shuffled order of the test list and every input derived
from it. For generated tests that is the part that matters, and today it is lost. The
deterministic-scheduling mode from #49 can build on this without changing the interface.

Ran quickdraw's own suite (474 passing), and checked that `SEED=1` twice gives the same `rand`
output at load time while `SEED=2` and `--seed 7` give different ones.
