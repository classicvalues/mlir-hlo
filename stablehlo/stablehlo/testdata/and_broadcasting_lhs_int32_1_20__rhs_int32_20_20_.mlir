module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0:2 = call @inputs() : () -> (tensor<1x20xi32>, tensor<20x20xi32>)
    %1 = call @expected() : () -> tensor<20x20xi32>
    %2 = stablehlo.broadcast_in_dim %0#0, dims = [0, 1] : (tensor<1x20xi32>) -> tensor<20x20xi32>
    %3 = stablehlo.and %2, %0#1 : tensor<20x20xi32>
    %4 = stablehlo.custom_call @check.eq(%3, %1) : (tensor<20x20xi32>, tensor<20x20xi32>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<1x20xi32>, tensor<20x20xi32>) {
    %0 = stablehlo.constant dense<[[6, 0, 2, 0, 1, 0, 0, 1, 2, 0, 4, 1, 1, -1, 0, 2, 0, -4, -2, 0]]> : tensor<1x20xi32>
    %1 = stablehlo.constant dense<"0x05000000FEFFFFFF0000000000000000FEFFFFFF0000000000000000000000000100000001000000FFFFFFFF0000000003000000FFFFFFFF0500000002000000FAFFFFFFFFFFFFFF030000000400000000000000000000000400000002000000040000000200000001000000010000000200000001000000FFFFFFFF0000000000000000FFFFFFFFFBFFFFFFFFFFFFFF02000000010000000000000001000000FEFFFFFF00000000FBFFFFFFFAFFFFFF00000000FFFFFFFF000000000000000001000000FEFFFFFF00000000FFFFFFFFFEFFFFFF0000000004000000FBFFFFFF00000000F8FFFFFF00000000FDFFFFFFFFFFFFFF04000000FCFFFFFFFFFFFFFF01000000FFFFFFFF00000000FFFFFFFFFEFFFFFF03000000FDFFFFFF000000000200000002000000FCFFFFFF00000000FFFFFFFF040000000000000006000000FCFFFFFF0000000001000000FAFFFFFF00000000FDFFFFFF000000000100000002000000FFFFFFFFFFFFFFFF04000000FDFFFFFF04000000FFFFFFFFFEFFFFFF00000000FFFFFFFFFEFFFFFFFAFFFFFFFAFFFFFF00000000FEFFFFFF00000000FBFFFFFF01000000FCFFFFFFFBFFFFFFFCFFFFFFFEFFFFFF010000000100000001000000040000000200000007000000040000000400000002000000FEFFFFFFFCFFFFFF00000000FDFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFEFFFFFF00000000000000000000000004000000FBFFFFFF0200000001000000030000000200000001000000FFFFFFFF0000000006000000FBFFFFFF02000000FDFFFFFFFFFFFFFFFDFFFFFF03000000FEFFFFFF00000000000000000000000007000000FAFFFFFF00000000FFFFFFFFFFFFFFFFFEFFFFFF000000000200000002000000FBFFFFFF020000000100000000000000010000000400000001000000FBFFFFFFFCFFFFFF000000000100000003000000FBFFFFFF0000000000000000FAFFFFFF0100000002000000FFFFFFFFFCFFFFFF00000000FDFFFFFF04000000FFFFFFFFFDFFFFFF00000000FBFFFFFF0000000000000000000000000000000000000000FBFFFFFF000000000000000005000000FCFFFFFF05000000F8FFFFFFFAFFFFFF0100000000000000FDFFFFFF01000000FEFFFFFF030000000000000003000000FFFFFFFFFEFFFFFFFEFFFFFF00000000FCFFFFFF0000000001000000FDFFFFFF0200000000000000FFFFFFFF00000000FFFFFFFF030000000100000001000000FBFFFFFF000000000000000002000000FEFFFFFFFFFFFFFF00000000FFFFFFFF0200000000000000FDFFFFFFFDFFFFFFFEFFFFFFFFFFFFFF0300000003000000FDFFFFFFFFFFFFFF00000000FEFFFFFF01000000000000000400000004000000FEFFFFFF0200000002000000FAFFFFFFFDFFFFFF08000000FFFFFFFF0000000000000000FFFFFFFF00000000FDFFFFFF000000000200000003000000FFFFFFFF00000000FDFFFFFF000000000100000003000000FDFFFFFF00000000FFFFFFFFFDFFFFFF0000000000000000FEFFFFFF0400000000000000FBFFFFFFFDFFFFFF01000000FEFFFFFF00000000020000000100000000000000FFFFFFFFFFFFFFFFFFFFFFFF0300000000000000FEFFFFFF020000000200000003000000010000000300000003000000FDFFFFFF00000000FCFFFFFF0B00000000000000FCFFFFFF0100000003000000FCFFFFFFFBFFFFFFFFFFFFFF00000000FDFFFFFFFBFFFFFF0000000000000000FBFFFFFF0100000006000000FFFFFFFF0100000001000000FDFFFFFF0400000003000000FFFFFFFF0000000001000000FDFFFFFFFFFFFFFF01000000FFFFFFFFFDFFFFFF020000000000000000000000020000000000000001000000FBFFFFFF0100000000000000FFFFFFFF00000000FCFFFFFF00000000FBFFFFFF0100000001000000000000000000000000000000FBFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF0200000002000000FEFFFFFF0000000001000000000000000000000002000000FFFFFFFFFEFFFFFF0100000000000000FEFFFFFFFCFFFFFF0500000001000000030000000400000002000000000000000300000001000000FDFFFFFFFEFFFFFF0000000000000000FCFFFFFF0000000000000000FCFFFFFF0000000005000000000000000200000002000000FEFFFFFFFEFFFFFFFCFFFFFFFBFFFFFFFEFFFFFF0100000003000000FCFFFFFF0200000001000000"> : tensor<20x20xi32>
    return %0, %1 : tensor<1x20xi32>, tensor<20x20xi32>
  }
  func.func private @expected() -> tensor<20x20xi32> {
    %0 = stablehlo.constant dense<"0x04000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000001000000FFFFFFFF000000000200000000000000FCFFFFFF020000000000000000000000000000000000000000000000000000000000000000000000010000000200000000000000040000000000000000000000FFFFFFFF0000000002000000000000000000000000000000000000000600000000000000020000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000200000000000000F8FFFFFF000000000000000006000000000000000000000000000000010000000000000000000000010000000200000000000000040000000000000000000000020000000000000000000000000000000400000000000000000000000400000000000000000000000000000000000000000000000000000001000000020000000000000004000000000000000100000004000000000000000200000000000000FCFFFFFFFEFFFFFF000000000200000000000000020000000000000001000000000000000000000001000000000000000000000000000000010000000100000004000000000000000200000000000000040000000200000000000000040000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000200000000000000020000000000000000000000FEFFFFFF000000000600000000000000020000000000000001000000000000000000000000000000000000000000000000000000010000000000000000000000000000000200000000000000000000000200000000000000020000000000000000000000000000000100000000000000000000000100000000000000000000000000000001000000010000000000000000000000020000000000000000000000FEFFFFFF00000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000004000000F8FFFFFF00000000000000000000000000000000000000000000000000000000000000000100000002000000000000000400000000000000000000000000000000000000000000000000000000000000FEFFFFFF000000000600000000000000000000000000000001000000000000000000000000000000020000000000000000000000010000000000000000000000000000000000000000000000FCFFFFFF02000000000000000400000000000000000000000000000001000000000000000000000000000000020000000000000000000000000000000100000008000000000000000000000000000000FCFFFFFF0000000000000000000000000000000002000000000000000000000000000000000000000100000002000000000000000000000001000000010000000000000000000000020000000000000000000000FAFFFFFF00000000000000000000000000000000000000000100000000000000000000000100000002000000000000000000000000000000000000000200000000000000000000000000000000000000FCFFFFFF000000000400000000000000000000000000000001000000000000000000000001000000020000000000000004000000010000000000000000000000000000000000000000000000FCFFFFFF00000000000000000400000000000000020000000000000000000000000000000000000001000000000000000000000004000000000000000000000000000000000000000000000000000000F8FFFFFF000000000000000006000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000001000000FFFFFFFF000000000200000000000000FCFFFFFF00000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000000000010000000000000002000000000000000200000000000000FCFFFFFFFEFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000200000000000000040000000000000000000000FBFFFFFF000000000000000000000000FCFFFFFF0200000000000000"> : tensor<20x20xi32>
    return %0 : tensor<20x20xi32>
  }
}
