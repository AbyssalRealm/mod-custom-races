# Patched CoA64 client

`coa64-sequence-bounds.patch` carries the two model-sequence guards that keep the
CoA64 client from crashing on retail animations:

- `CM2Model::FindKey`: an unsigned underflow when the binary search reaches the
  first key (`mid == 0`) no longer walks out of the key array.
- `M2Shared`: a sequence-time or sequence-key chunk whose count does not fit the
  sequence block is rejected instead of read past its end.  The retail centaur
  sequence had 40 keys declared with only 25 present.

Apply the patch to the matching `CustomRacesCoa` client source, then build the
x64 client as usual:

```text
git -C CustomRacesCoa-198 apply ..\mod-custom-races\client-patches\coa64-sequence-bounds.patch
```

AFK Realm ships the built `CoA64.exe` as
`assets/coa64-native/CoA64.zip` (`NativeHd`).  For a new CoA client version,
apply the patch to that version's source, rebuild, and update
`NativeHd.AssetName`, `Sha256`, `ExeSha256`, `SupportedOfficialSha256` and the
supported package version in `src/NativeHd.cs`.
