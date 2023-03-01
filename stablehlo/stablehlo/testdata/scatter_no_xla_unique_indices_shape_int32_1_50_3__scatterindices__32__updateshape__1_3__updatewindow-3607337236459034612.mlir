module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<32> : tensor<1xi32>
    %1:2 = call @inputs() : () -> (tensor<1x50x3xi32>, tensor<1x3xi32>)
    %2 = call @expected() : () -> tensor<1x50x3xi32>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<i32>, %arg1: tensor<i32>):
      stablehlo.return %arg1 : tensor<i32>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0, 1], inserted_window_dims = [1], scatter_dims_to_operand_dims = [1]>, unique_indices = true} : (tensor<1x50x3xi32>, tensor<1xi32>, tensor<1x3xi32>) -> tensor<1x50x3xi32>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<1x50x3xi32>, tensor<1x50x3xi32>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<1x50x3xi32>, tensor<1x3xi32>) {
    %0 = stablehlo.constant dense<"0x0000000000000000040000000300000005000000FEFFFFFFFAFFFFFF0000000005000000FAFFFFFF01000000090000000000000001000000FFFFFFFFFEFFFFFF0200000004000000FFFFFFFF00000000FFFFFFFF000000000000000000000000FEFFFFFF00000000FBFFFFFFFCFFFFFF02000000FEFFFFFF05000000000000000100000002000000FEFFFFFF00000000FDFFFFFF030000000300000002000000FFFFFFFFFCFFFFFFFDFFFFFFFAFFFFFFFFFFFFFF010000000200000001000000FBFFFFFFFCFFFFFF010000000200000002000000FEFFFFFF04000000FDFFFFFF01000000FFFFFFFFFFFFFFFF00000000000000000000000000000000FFFFFFFFFEFFFFFF010000000000000000000000050000000600000002000000FFFFFFFF0000000001000000FFFFFFFFFFFFFFFF0000000004000000FCFFFFFFFFFFFFFF0300000000000000FEFFFFFF000000000000000001000000FFFFFFFFFFFFFFFFFCFFFFFF04000000FBFFFFFF0300000000000000030000000000000004000000070000000000000004000000FFFFFFFF01000000FCFFFFFFFBFFFFFFFEFFFFFFFDFFFFFF01000000FEFFFFFFFFFFFFFF05000000020000000100000008000000FFFFFFFF01000000000000000200000003000000FFFFFFFF00000000FDFFFFFF01000000FFFFFFFF02000000FFFFFFFFFDFFFFFFFFFFFFFFFFFFFFFF00000000FDFFFFFF000000000000000001000000FFFFFFFF01000000FEFFFFFF03000000040000000000000000000000FFFFFFFFFFFFFFFFFDFFFFFF00000000FEFFFFFF01000000FCFFFFFF030000000300000000000000FEFFFFFF"> : tensor<1x50x3xi32>
    %1 = stablehlo.constant dense<[[3, -8, -3]]> : tensor<1x3xi32>
    return %0, %1 : tensor<1x50x3xi32>, tensor<1x3xi32>
  }
  func.func private @expected() -> tensor<1x50x3xi32> {
    %0 = stablehlo.constant dense<"0x0000000000000000040000000300000005000000FEFFFFFFFAFFFFFF0000000005000000FAFFFFFF01000000090000000000000001000000FFFFFFFFFEFFFFFF0200000004000000FFFFFFFF00000000FFFFFFFF000000000000000000000000FEFFFFFF00000000FBFFFFFFFCFFFFFF02000000FEFFFFFF05000000000000000100000002000000FEFFFFFF00000000FDFFFFFF030000000300000002000000FFFFFFFFFCFFFFFFFDFFFFFFFAFFFFFFFFFFFFFF010000000200000001000000FBFFFFFFFCFFFFFF010000000200000002000000FEFFFFFF04000000FDFFFFFF01000000FFFFFFFFFFFFFFFF00000000000000000000000000000000FFFFFFFFFEFFFFFF010000000000000000000000050000000600000002000000FFFFFFFF0000000001000000FFFFFFFFFFFFFFFF0000000004000000FCFFFFFFFFFFFFFF0300000000000000FEFFFFFF000000000000000001000000FFFFFFFFFFFFFFFFFCFFFFFF04000000FBFFFFFF030000000000000003000000000000000400000003000000F8FFFFFFFDFFFFFFFFFFFFFF01000000FCFFFFFFFBFFFFFFFEFFFFFFFDFFFFFF01000000FEFFFFFFFFFFFFFF05000000020000000100000008000000FFFFFFFF01000000000000000200000003000000FFFFFFFF00000000FDFFFFFF01000000FFFFFFFF02000000FFFFFFFFFDFFFFFFFFFFFFFFFFFFFFFF00000000FDFFFFFF000000000000000001000000FFFFFFFF01000000FEFFFFFF03000000040000000000000000000000FFFFFFFFFFFFFFFFFDFFFFFF00000000FEFFFFFF01000000FCFFFFFF030000000300000000000000FEFFFFFF"> : tensor<1x50x3xi32>
    return %0 : tensor<1x50x3xi32>
  }
}
