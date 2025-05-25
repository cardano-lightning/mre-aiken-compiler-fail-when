use aiken/fuzz

pub fn testing_fuzzer() -> Fuzzer<(Option<ByteArray>, Option<(Int, Int)>)> {
  // Both cases fail:
  let opt_ba: Option<ByteArray> = Some(#"00")
  // let opt_ba = None
  let receipt: Option<(Int, Int)> = Some((8, 8))
  fuzz.constant((opt_ba, receipt))
}

test test_testing_fuzzer((ba, intint) via testing_fuzzer()) {
  // Adjust this so it fails
  ba == None && intint == Some((0, 0))
}
