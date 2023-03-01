module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0:2 = call @inputs() : () -> (tensor<20x20xi32>, tensor<1x20xi32>)
    %1 = call @expected() : () -> tensor<20x20xi32>
    %2 = stablehlo.broadcast_in_dim %0#1, dims = [0, 1] : (tensor<1x20xi32>) -> tensor<20x20xi32>
    %3 = stablehlo.xor %0#0, %2 : tensor<20x20xi32>
    %4 = stablehlo.custom_call @check.eq(%3, %1) : (tensor<20x20xi32>, tensor<20x20xi32>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<20x20xi32>, tensor<1x20xi32>) {
    %0 = stablehlo.constant dense<"0xFEFFFFFF010000000100000000000000F7FFFFFFFFFFFFFFFBFFFFFF01000000FCFFFFFFFFFFFFFFFFFFFFFF0100000001000000000000000500000001000000FEFFFFFF0100000001000000FCFFFFFF00000000FDFFFFFF0200000000000000FEFFFFFF0100000007000000FBFFFFFFFFFFFFFF0000000000000000FCFFFFFFFFFFFFFF020000000200000000000000FFFFFFFF00000000FBFFFFFFFBFFFFFF00000000FFFFFFFFFDFFFFFF04000000FEFFFFFFFDFFFFFFFFFFFFFFFFFFFFFF050000000100000000000000FFFFFFFFFDFFFFFF0400000004000000FFFFFFFF0000000001000000030000000000000000000000FBFFFFFF05000000FEFFFFFFFEFFFFFFFDFFFFFF00000000FFFFFFFF01000000000000000000000004000000FEFFFFFFFEFFFFFF0000000004000000FEFFFFFFFDFFFFFF03000000FDFFFFFF0100000002000000000000000200000001000000010000000100000000000000060000000000000000000000FDFFFFFFFDFFFFFFFFFFFFFFFEFFFFFF04000000010000000000000000000000FFFFFFFF0000000004000000FEFFFFFF00000000000000000000000001000000FFFFFFFF0000000002000000FFFFFFFF000000000300000004000000FEFFFFFF030000000000000000000000FBFFFFFF01000000FCFFFFFFFDFFFFFFFCFFFFFFFDFFFFFF03000000030000000000000004000000010000000200000000000000FFFFFFFFFFFFFFFF0000000002000000FDFFFFFF020000000200000004000000FBFFFFFFFFFFFFFF0200000001000000FAFFFFFFFBFFFFFFFFFFFFFFFDFFFFFF0000000001000000FAFFFFFFFFFFFFFF01000000FEFFFFFF0000000000000000010000000000000000000000FFFFFFFF02000000FFFFFFFF08000000FEFFFFFFFFFFFFFF0500000004000000FFFFFFFFFEFFFFFF00000000FFFFFFFF000000000300000002000000FEFFFFFF000000000000000000000000050000000400000001000000FFFFFFFF0400000002000000FDFFFFFFFDFFFFFF00000000040000000100000000000000FFFFFFFF01000000FCFFFFFF01000000FCFFFFFF0000000001000000000000000200000007000000FFFFFFFFFEFFFFFF030000000000000000000000FEFFFFFF02000000040000000000000000000000FDFFFFFFFFFFFFFF00000000020000000000000000000000020000000000000003000000FCFFFFFFFEFFFFFFFFFFFFFF02000000FEFFFFFF07000000FFFFFFFF01000000FCFFFFFFFEFFFFFFFEFFFFFFFDFFFFFF0000000002000000000000000000000002000000000000000000000000000000FFFFFFFFFBFFFFFF0400000004000000040000000000000005000000FCFFFFFF00000000FFFFFFFF01000000FEFFFFFF020000000000000002000000FFFFFFFF01000000010000000000000000000000FBFFFFFF00000000010000000200000002000000010000000000000002000000FBFFFFFFFFFFFFFF0200000000000000FFFFFFFF06000000FBFFFFFFFEFFFFFFF9FFFFFF02000000FAFFFFFF0200000002000000FEFFFFFF01000000030000000000000000000000FFFFFFFF00000000FAFFFFFF000000000500000000000000FEFFFFFF04000000FFFFFFFF040000000000000002000000FFFFFFFFFCFFFFFF00000000FEFFFFFFFEFFFFFF00000000FEFFFFFF00000000FFFFFFFFFEFFFFFFFEFFFFFF050000000500000001000000000000000100000000000000FEFFFFFF0400000004000000FDFFFFFF03000000FDFFFFFF05000000F9FFFFFFFFFFFFFF0000000004000000FFFFFFFF03000000FDFFFFFF0400000000000000FEFFFFFF000000000400000000000000050000000000000004000000FDFFFFFF01000000FFFFFFFFFEFFFFFFFFFFFFFF0000000000000000FDFFFFFF0000000004000000030000000400000000000000FEFFFFFFFFFFFFFF0000000000000000FEFFFFFF00000000FBFFFFFF00000000000000000200000001000000FFFFFFFFFFFFFFFF0300000001000000FAFFFFFFFEFFFFFFFBFFFFFF00000000FCFFFFFF0000000004000000FFFFFFFFFFFFFFFFFEFFFFFF000000000000000001000000FBFFFFFF0000000002000000FEFFFFFF04000000FFFFFFFF0100000001000000010000000400000002000000FDFFFFFFFFFFFFFF000000000000000006000000FFFFFFFFFCFFFFFF03000000FDFFFFFF0200000000000000FCFFFFFF"> : tensor<20x20xi32>
    %1 = stablehlo.constant dense<[[-2, -2, 3, 0, 0, -4, 0, 0, -2, 0, 4, -1, -3, 1, 0, 1, 4, 2, -2, -3]]> : tensor<1x20xi32>
    return %0, %1 : tensor<20x20xi32>, tensor<1x20xi32>
  }
  func.func private @expected() -> tensor<20x20xi32> {
    %0 = stablehlo.constant dense<"0x00000000FFFFFFFF0200000000000000F7FFFFFF03000000FBFFFFFF0100000002000000FFFFFFFFFBFFFFFFFEFFFFFFFCFFFFFF010000000500000000000000FAFFFFFF03000000FFFFFFFF01000000FEFFFFFF030000000100000000000000FEFFFFFFFDFFFFFF07000000FBFFFFFF0100000000000000040000000300000002000000030000000200000001000000FBFFFFFF020000000500000006000000FEFFFFFF01000000FEFFFFFF04000000FEFFFFFF01000000FFFFFFFFFFFFFFFFFBFFFFFF010000000400000000000000000000000500000004000000FEFFFFFF0400000003000000FDFFFFFFFDFFFFFFFEFFFFFF0500000006000000FEFFFFFFFEFFFFFF0100000000000000FFFFFFFFFFFFFFFF0000000004000000FBFFFFFF03000000FFFFFFFF0000000005000000FAFFFFFFFFFFFFFFFDFFFFFF00000000FFFFFFFFFCFFFFFF030000000200000001000000FDFFFFFF0100000000000000F8FFFFFF00000000040000000200000000000000FEFFFFFFFEFFFFFF050000000500000002000000FEFFFFFF02000000FEFFFFFFFAFFFFFFFDFFFFFF0000000000000000FCFFFFFF01000000FFFFFFFFFEFFFFFF02000000FBFFFFFFFFFFFFFFFEFFFFFF05000000FEFFFFFF02000000040000000200000005000000FCFFFFFF0200000003000000FFFFFFFFFDFFFFFF03000000FFFFFFFF0000000004000000FFFFFFFF020000000400000000000000020000000100000002000000FCFFFFFF0600000000000000FAFFFFFF0600000001000000FCFFFFFF02000000FAFFFFFFFBFFFFFF03000000FDFFFFFF00000000FFFFFFFFFAFFFFFFFBFFFFFFFEFFFFFF03000000010000000000000000000000040000000200000001000000FFFFFFFF01000000F6FFFFFFFDFFFFFFFFFFFFFF05000000F8FFFFFFFFFFFFFFFEFFFFFFFEFFFFFFFFFFFFFF04000000FCFFFFFFFFFFFFFFFFFFFFFF00000000010000000400000007000000FAFFFFFFFCFFFFFF01000000FAFFFFFF01000000FDFFFFFFFDFFFFFFFCFFFFFF0400000001000000FEFFFFFFFFFFFFFF0500000003000000FCFFFFFFFDFFFFFF00000000000000000400000000000000F9FFFFFF0200000000000000FDFFFFFF0300000000000000FEFFFFFFFEFFFFFF0400000000000000FEFFFFFFFDFFFFFFFBFFFFFFFFFFFFFFFFFFFFFF0100000000000000030000000400000001000000020000000300000001000000FCFFFFFFFDFFFFFF07000000FFFFFFFFFDFFFFFFFCFFFFFFFEFFFFFF00000000FDFFFFFF04000000FDFFFFFFFDFFFFFF01000000020000000100000004000000020000000100000006000000FAFFFFFFFAFFFFFF0700000000000000050000000000000000000000FFFFFFFFFFFFFFFFFEFFFFFF06000000FFFFFFFFFFFFFFFFFEFFFFFF0100000000000000040000000200000005000000FDFFFFFFFFFFFFFFFCFFFFFF010000000100000000000000FEFFFFFFFBFFFFFFFFFFFFFFFCFFFFFF00000000FBFFFFFFF9FFFFFF06000000FFFFFFFFF9FFFFFF03000000FEFFFFFF00000000FCFFFFFF03000000FFFFFFFFFDFFFFFF0300000000000000FFFFFFFFFCFFFFFFFAFFFFFF00000000FBFFFFFF00000000FAFFFFFFFBFFFFFF02000000050000000000000003000000FBFFFFFFFEFFFFFFFEFFFFFF0300000000000000FEFFFFFFFDFFFFFF00000000FFFFFFFF02000000FEFFFFFF05000000FBFFFFFF0100000004000000FEFFFFFFFDFFFFFFFFFFFFFF0400000005000000F9FFFFFF0100000003000000F8FFFFFF07000000010000000300000004000000FFFFFFFFFFFFFFFFFDFFFFFF04000000FEFFFFFFFEFFFFFF04000000FBFFFFFFFDFFFFFF040000000000000005000000F9FFFFFF03000000010000000300000001000000FEFFFFFF03000000FDFFFFFF00000000F8FFFFFF0300000004000000FEFFFFFFFEFFFFFFFBFFFFFFFFFFFFFFFDFFFFFFFFFFFFFF00000000FAFFFFFF0400000002000000FCFFFFFFFCFFFFFF01000000010000000000000001000000FAFFFFFF02000000FBFFFFFF000000000200000000000000000000000000000002000000FFFFFFFF000000000100000005000000F9FFFFFFFEFFFFFFFFFFFFFF00000000FAFFFFFFFCFFFFFF0100000001000000FDFFFFFF040000000200000003000000FFFFFFFF04000000FFFFFFFFFBFFFFFFFEFFFFFFFCFFFFFF02000000F9FFFFFF00000000FEFFFFFF01000000"> : tensor<20x20xi32>
    return %0 : tensor<20x20xi32>
  }
}
