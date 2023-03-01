module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0:2 = call @inputs() : () -> (tensor<20x20xui32>, tensor<20x20xui32>)
    %1 = call @expected() : () -> tensor<20x20xui32>
    %2 = stablehlo.subtract %0#0, %0#1 : tensor<20x20xui32>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<20x20xui32>, tensor<20x20xui32>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<20x20xui32>, tensor<20x20xui32>) {
    %0 = stablehlo.constant dense<"0x00000000020000000200000002000000000000000300000000000000000000000200000002000000000000000100000001000000040000000000000001000000010000000000000000000000030000000100000001000000000000000300000005000000050000000200000001000000000000000200000006000000020000000100000001000000000000000400000000000000010000000300000000000000040000000100000002000000040000000200000000000000040000000200000000000000010000000100000003000000020000000000000002000000060000000300000002000000010000000000000004000000010000000100000002000000010000000400000001000000010000000000000005000000060000000000000006000000000000000400000002000000000000000400000001000000050000000000000003000000020000000200000005000000000000000400000000000000020000000200000002000000000000000500000004000000030000000100000002000000010000000600000004000000000000000000000000000000040000000100000001000000000000000300000000000000010000000100000001000000070000000200000002000000020000000000000003000000020000000100000007000000010000000000000005000000050000000300000003000000000000000000000001000000010000000100000001000000040000000100000002000000010000000100000001000000010000000100000002000000030000000200000003000000000000000000000001000000010000000400000002000000010000000300000000000000000000000000000002000000000000000200000001000000030000000000000000000000000000000100000003000000020000000200000000000000000000000000000000000000010000000000000002000000020000000300000006000000010000000400000001000000000000000000000007000000030000000200000001000000000000000200000000000000020000000100000002000000000000000000000002000000030000000500000005000000030000000100000000000000050000000100000003000000010000000000000002000000050000000000000001000000000000000200000003000000000000000100000001000000050000000100000003000000020000000300000002000000030000000000000003000000000000000100000004000000040000000000000000000000000000000100000000000000000000000000000004000000060000000200000000000000000000000100000006000000020000000400000005000000030000000300000005000000000000000600000001000000030000000500000002000000010000000200000001000000010000000000000004000000000000000200000001000000060000000300000004000000000000000300000002000000030000000100000000000000000000000200000001000000000000000100000001000000010000000200000003000000000000000100000001000000040000000400000001000000000000000200000006000000000000000300000003000000010000000000000000000000010000000400000004000000020000000400000002000000040000000200000000000000000000000400000001000000010000000300000003000000010000000100000003000000030000000300000003000000030000000400000006000000020000000100000004000000010000000200000000000000010000000100000000000000000000000700000002000000010000000100000002000000020000000200000001000000030000000000000000000000010000000100000002000000000000000000000004000000020000000300000002000000010000000200000005000000020000000100000005000000030000000400000003000000000000000100000002000000030000000200000003000000060000000100000001000000000000000100000000000000000000000200000002000000000000000200000000000000020000000300000002000000020000000200000000000000010000000100000002000000000000000200000002000000010000000100000000000000040000000000000001000000020000000400000000000000"> : tensor<20x20xui32>
    %1 = stablehlo.constant dense<"0x03000000050000000200000002000000020000000200000000000000000000000300000001000000020000000400000003000000000000000400000000000000010000000000000001000000050000000400000003000000020000000600000001000000010000000200000000000000020000000100000004000000000000000400000000000000010000000400000003000000020000000600000000000000000000000300000001000000000000000100000004000000010000000000000006000000000000000100000002000000020000000200000000000000000000000000000000000000010000000700000001000000040000000500000000000000040000000400000003000000040000000300000002000000010000000300000000000000000000000000000000000000000000000000000005000000050000000000000005000000070000000600000003000000020000000300000000000000000000000000000001000000010000000200000002000000010000000300000000000000020000000300000001000000010000000200000000000000000000000200000004000000050000000200000001000000000000000000000002000000000000000400000000000000010000000000000001000000020000000000000001000000030000000500000002000000000000000200000001000000000000000100000003000000010000000100000001000000000000000200000000000000030000000300000002000000060000000100000004000000040000000100000002000000040000000200000002000000020000000000000000000000030000000000000001000000010000000000000002000000000000000200000002000000020000000300000007000000050000000000000000000000000000000200000005000000030000000200000001000000010000000200000002000000010000000200000002000000000000000000000001000000000000000100000002000000010000000100000001000000030000000200000004000000020000000000000000000000020000000000000001000000020000000000000003000000000000000100000000000000050000000700000005000000020000000500000006000000020000000300000001000000000000000400000000000000010000000000000001000000000000000200000001000000000000000000000003000000030000000500000000000000020000000000000002000000050000000300000000000000010000000100000001000000000000000000000000000000030000000300000002000000010000000100000002000000050000000100000001000000020000000100000003000000010000000400000005000000000000000000000008000000000000000000000004000000010000000000000003000000000000000000000003000000020000000100000002000000010000000000000000000000000000000500000002000000030000000400000001000000050000000100000002000000010000000100000001000000040000000000000003000000000000000000000000000000000000000400000006000000080000000000000000000000000000000000000001000000010000000100000001000000030000000400000003000000020000000000000003000000010000000200000000000000010000000000000003000000060000000200000006000000030000000300000003000000030000000200000003000000010000000600000001000000000000000200000002000000020000000200000003000000010000000100000001000000000000000000000000000000010000000400000004000000000000000100000002000000030000000000000003000000010000000200000001000000000000000400000001000000010000000100000000000000020000000000000000000000040000000200000003000000000000000100000001000000030000000300000003000000040000000200000002000000010000000400000001000000020000000300000002000000040000000000000002000000040000000100000003000000020000000300000002000000010000000000000000000000020000000600000000000000010000000200000000000000030000000300000001000000050000000000000000000000"> : tensor<20x20xui32>
    return %0, %1 : tensor<20x20xui32>, tensor<20x20xui32>
  }
  func.func private @expected() -> tensor<20x20xui32> {
    %0 = stablehlo.constant dense<"0xFDFFFFFFFDFFFFFF0000000000000000FEFFFFFF010000000000000000000000FFFFFFFF01000000FEFFFFFFFDFFFFFFFEFFFFFF04000000FCFFFFFF010000000000000000000000FFFFFFFFFEFFFFFFFDFFFFFFFEFFFFFFFEFFFFFFFDFFFFFF04000000040000000000000001000000FEFFFFFF010000000200000002000000FDFFFFFF01000000FFFFFFFF00000000FDFFFFFFFFFFFFFFFDFFFFFF0000000004000000FEFFFFFF010000000400000001000000FCFFFFFF0300000002000000FAFFFFFF01000000000000000100000000000000FEFFFFFF0200000006000000030000000200000000000000F9FFFFFF03000000FDFFFFFFFCFFFFFF02000000FDFFFFFF00000000FEFFFFFFFDFFFFFFFDFFFFFF0300000005000000FDFFFFFF060000000000000004000000020000000000000004000000FCFFFFFF0000000000000000FEFFFFFFFBFFFFFFFCFFFFFF02000000FEFFFFFF0100000000000000020000000200000001000000FFFFFFFF030000000200000002000000FEFFFFFF02000000FFFFFFFF0300000003000000FFFFFFFFFEFFFFFF0000000004000000FFFFFFFFFDFFFFFFFBFFFFFF01000000FFFFFFFF0100000001000000FFFFFFFF07000000FEFFFFFF02000000010000000000000002000000000000000100000006000000FEFFFFFFFBFFFFFF0300000005000000010000000200000000000000FFFFFFFFFEFFFFFF00000000000000000000000004000000FFFFFFFF02000000FEFFFFFFFEFFFFFFFFFFFFFFFBFFFFFF00000000FEFFFFFFFFFFFFFF0100000001000000FCFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF0400000002000000FEFFFFFF03000000FFFFFFFFFFFFFFFF00000000000000000000000000000000FFFFFFFF01000000FDFFFFFFF9FFFFFFFBFFFFFF01000000030000000200000000000000FBFFFFFFFDFFFFFFFEFFFFFFFFFFFFFF00000000FEFFFFFF0000000001000000010000000400000001000000040000000000000000000000FFFFFFFF05000000020000000100000000000000FDFFFFFF00000000FCFFFFFF000000000100000002000000FEFFFFFF000000000100000001000000050000000200000003000000000000000000000000000000FAFFFFFFFEFFFFFFFFFFFFFFFBFFFFFFFCFFFFFF03000000FDFFFFFF0000000000000000FEFFFFFF03000000FFFFFFFF010000000000000005000000FFFFFFFF020000000200000003000000FFFFFFFF00000000FBFFFFFF03000000FEFFFFFF0100000002000000FFFFFFFFFDFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000000000000400000003000000FFFFFFFFFEFFFFFFFFFFFFFF0000000004000000FDFFFFFF0300000004000000010000000200000002000000FFFFFFFF02000000FCFFFFFF0300000005000000FAFFFFFF0100000002000000FDFFFFFF0000000000000000010000000000000002000000FEFFFFFF040000000200000002000000FFFFFFFF030000000200000003000000FCFFFFFFFEFFFFFFFDFFFFFFFEFFFFFF00000000FBFFFFFF00000000FFFFFFFF000000000100000002000000FCFFFFFF01000000FEFFFFFF04000000040000000100000000000000FEFFFFFF00000000F8FFFFFF03000000030000000100000000000000FFFFFFFF000000000300000003000000FFFFFFFF00000000FFFFFFFF0200000002000000FDFFFFFFFFFFFFFF0200000001000000000000000300000000000000FBFFFFFFFFFFFFFFFDFFFFFF00000000000000000000000000000000020000000300000001000000FBFFFFFF030000000100000000000000FEFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFF060000000100000001000000010000000200000001000000FEFFFFFFFDFFFFFF03000000FFFFFFFFFEFFFFFFFEFFFFFF01000000FFFFFFFFFFFFFFFFFEFFFFFF0300000002000000FFFFFFFF01000000000000000100000005000000000000000100000005000000FFFFFFFF020000000000000000000000000000000100000000000000FFFFFFFF0000000002000000FFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFEFFFFFFFFFFFFFF00000000FCFFFFFF02000000FEFFFFFFFEFFFFFF02000000FFFFFFFF00000000FFFFFFFFFEFFFFFF000000000100000002000000FEFFFFFFFCFFFFFF0200000000000000FFFFFFFF0000000001000000FDFFFFFF00000000FDFFFFFF0400000000000000"> : tensor<20x20xui32>
    return %0 : tensor<20x20xui32>
  }
}
