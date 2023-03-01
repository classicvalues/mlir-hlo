module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<20x20xi32>
    %1 = call @expected() : () -> tensor<20x20xi32>
    %2 = stablehlo.sign %0 : tensor<20x20xi32>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<20x20xi32>, tensor<20x20xi32>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> tensor<20x20xi32> {
    %0 = stablehlo.constant dense<"0x0300000001000000FFFFFFFFFDFFFFFF02000000FEFFFFFFFCFFFFFF00000000FDFFFFFF0300000004000000010000000100000001000000FEFFFFFFFDFFFFFF0000000000000000FBFFFFFF01000000FFFFFFFFFFFFFFFF00000000FEFFFFFF00000000FFFFFFFF0300000000000000FEFFFFFF0000000003000000FAFFFFFF0100000001000000FDFFFFFFFCFFFFFFFFFFFFFF050000000300000005000000FEFFFFFF0000000002000000FEFFFFFF02000000FEFFFFFF0300000000000000FDFFFFFF0100000003000000FFFFFFFFFDFFFFFF000000000200000000000000FDFFFFFFFEFFFFFFFFFFFFFF0100000001000000FFFFFFFFFEFFFFFFFEFFFFFF05000000000000000000000002000000FEFFFFFF00000000FDFFFFFF020000000100000000000000FFFFFFFFFFFFFFFFFEFFFFFF0600000000000000FFFFFFFF01000000000000000200000002000000000000000100000000000000FCFFFFFF010000000500000002000000FFFFFFFF00000000F9FFFFFFFFFFFFFF020000000500000002000000FEFFFFFFFBFFFFFF0000000000000000000000000200000002000000FDFFFFFF04000000FAFFFFFF010000000400000002000000FCFFFFFFFEFFFFFFFEFFFFFFFDFFFFFFFDFFFFFFF9FFFFFF00000000FFFFFFFFFCFFFFFF00000000FAFFFFFF01000000030000000100000004000000010000000200000000000000FFFFFFFF06000000FBFFFFFF00000000FDFFFFFF0100000003000000FCFFFFFF02000000FFFFFFFF01000000F8FFFFFF00000000FFFFFFFF00000000FFFFFFFF01000000FEFFFFFF06000000020000000200000002000000FFFFFFFF0500000002000000FDFFFFFF01000000010000000000000000000000FCFFFFFFFDFFFFFFFEFFFFFFFFFFFFFFFCFFFFFFFCFFFFFFFFFFFFFF0000000000000000FEFFFFFFFBFFFFFFFFFFFFFF010000000200000000000000FDFFFFFFFFFFFFFF0000000000000000FDFFFFFF0400000001000000FEFFFFFFF9FFFFFFFDFFFFFF0000000000000000FFFFFFFF0100000000000000FFFFFFFFFFFFFFFF0700000005000000FEFFFFFF02000000FEFFFFFFFFFFFFFFFCFFFFFF00000000000000000000000000000000FFFFFFFF00000000FCFFFFFF00000000000000000100000001000000FFFFFFFF0500000000000000FBFFFFFFFDFFFFFFFDFFFFFF0300000000000000FCFFFFFF00000000030000000000000000000000F9FFFFFFFFFFFFFFFBFFFFFF01000000FFFFFFFF0000000004000000000000000000000002000000FCFFFFFF050000000000000002000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFF0000000000000000000000000200000000000000FCFFFFFF010000000100000001000000FFFFFFFFF7FFFFFF0000000002000000040000000000000000000000000000000000000001000000010000000300000000000000FFFFFFFF04000000FCFFFFFFFDFFFFFF0000000000000000FEFFFFFF00000000FFFFFFFF00000000FCFFFFFF000000000000000000000000000000000000000001000000FCFFFFFF01000000FDFFFFFFFBFFFFFFFFFFFFFF000000000100000000000000FDFFFFFFFEFFFFFF0500000000000000010000000200000001000000FEFFFFFFFEFFFFFFFEFFFFFF01000000FFFFFFFFFCFFFFFFFCFFFFFF03000000080000000000000000000000FDFFFFFF00000000FFFFFFFF00000000FBFFFFFF000000000000000002000000FFFFFFFF04000000FDFFFFFFFFFFFFFF030000000400000004000000000000000100000000000000FDFFFFFFFFFFFFFF02000000FEFFFFFF0100000000000000FCFFFFFF04000000FFFFFFFFFBFFFFFF03000000FEFFFFFF00000000FBFFFFFFFEFFFFFFFEFFFFFFFCFFFFFFFDFFFFFF0400000004000000FFFFFFFF03000000FEFFFFFFFCFFFFFF000000000100000004000000FCFFFFFF02000000000000000000000000000000080000000000000000000000000000000000000000000000FAFFFFFF010000000400000002000000000000000100000000000000FFFFFFFF0100000002000000FFFFFFFF060000000000000000000000FFFFFFFF04000000FFFFFFFF00000000FEFFFFFFFEFFFFFF02000000FEFFFFFFFEFFFFFFFFFFFFFF03000000FDFFFFFF0100000000000000FEFFFFFFFBFFFFFF0000000000000000FDFFFFFF01000000FDFFFFFFFCFFFFFFFAFFFFFF00000000"> : tensor<20x20xi32>
    return %0 : tensor<20x20xi32>
  }
  func.func private @expected() -> tensor<20x20xi32> {
    %0 = stablehlo.constant dense<"0x0100000001000000FFFFFFFFFFFFFFFF01000000FFFFFFFFFFFFFFFF00000000FFFFFFFF0100000001000000010000000100000001000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFF01000000FFFFFFFFFFFFFFFF00000000FFFFFFFF00000000FFFFFFFF0100000000000000FFFFFFFF0000000001000000FFFFFFFF0100000001000000FFFFFFFFFFFFFFFFFFFFFFFF010000000100000001000000FFFFFFFF0000000001000000FFFFFFFF01000000FFFFFFFF0100000000000000FFFFFFFF0100000001000000FFFFFFFFFFFFFFFF000000000100000000000000FFFFFFFFFFFFFFFFFFFFFFFF0100000001000000FFFFFFFFFFFFFFFFFFFFFFFF01000000000000000000000001000000FFFFFFFF00000000FFFFFFFF010000000100000000000000FFFFFFFFFFFFFFFFFFFFFFFF0100000000000000FFFFFFFF01000000000000000100000001000000000000000100000000000000FFFFFFFF010000000100000001000000FFFFFFFF00000000FFFFFFFFFFFFFFFF010000000100000001000000FFFFFFFFFFFFFFFF0000000000000000000000000100000001000000FFFFFFFF01000000FFFFFFFF010000000100000001000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFF01000000010000000100000001000000010000000100000000000000FFFFFFFF01000000FFFFFFFF00000000FFFFFFFF0100000001000000FFFFFFFF01000000FFFFFFFF01000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF01000000FFFFFFFF01000000010000000100000001000000FFFFFFFF0100000001000000FFFFFFFF01000000010000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF010000000100000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFF0100000001000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFF0100000000000000FFFFFFFFFFFFFFFF0100000001000000FFFFFFFF01000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000000000000100000001000000FFFFFFFF0100000000000000FFFFFFFFFFFFFFFFFFFFFFFF0100000000000000FFFFFFFF00000000010000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF01000000FFFFFFFF0000000001000000000000000000000001000000FFFFFFFF010000000000000001000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000100000000000000FFFFFFFF010000000100000001000000FFFFFFFFFFFFFFFF0000000001000000010000000000000000000000000000000000000001000000010000000100000000000000FFFFFFFF01000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF000000000000000000000000000000000000000001000000FFFFFFFF01000000FFFFFFFFFFFFFFFFFFFFFFFF000000000100000000000000FFFFFFFFFFFFFFFF0100000000000000010000000100000001000000FFFFFFFFFFFFFFFFFFFFFFFF01000000FFFFFFFFFFFFFFFFFFFFFFFF01000000010000000000000000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF000000000000000001000000FFFFFFFF01000000FFFFFFFFFFFFFFFF010000000100000001000000000000000100000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF0100000000000000FFFFFFFF01000000FFFFFFFFFFFFFFFF01000000FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0100000001000000FFFFFFFF01000000FFFFFFFFFFFFFFFF000000000100000001000000FFFFFFFF01000000000000000000000000000000010000000000000000000000000000000000000000000000FFFFFFFF010000000100000001000000000000000100000000000000FFFFFFFF0100000001000000FFFFFFFF010000000000000000000000FFFFFFFF01000000FFFFFFFF00000000FFFFFFFFFFFFFFFF01000000FFFFFFFFFFFFFFFFFFFFFFFF01000000FFFFFFFF0100000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFF01000000FFFFFFFFFFFFFFFFFFFFFFFF00000000"> : tensor<20x20xi32>
    return %0 : tensor<20x20xi32>
  }
}
