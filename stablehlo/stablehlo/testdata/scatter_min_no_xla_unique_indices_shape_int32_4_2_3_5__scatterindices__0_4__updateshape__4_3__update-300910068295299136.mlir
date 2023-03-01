module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<[0, 4]> : tensor<2xi32>
    %1:2 = call @inputs() : () -> (tensor<4x2x3x5xi32>, tensor<4x3xi32>)
    %2 = call @expected() : () -> tensor<4x2x3x5xi32>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<i32>, %arg1: tensor<i32>):
      %5 = stablehlo.minimum %arg0, %arg1 : tensor<i32>
      stablehlo.return %5 : tensor<i32>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0, 1], inserted_window_dims = [1, 3], scatter_dims_to_operand_dims = [1, 3]>, unique_indices = true} : (tensor<4x2x3x5xi32>, tensor<2xi32>, tensor<4x3xi32>) -> tensor<4x2x3x5xi32>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<4x2x3x5xi32>, tensor<4x2x3x5xi32>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<4x2x3x5xi32>, tensor<4x3xi32>) {
    %0 = stablehlo.constant dense<"0x0100000001000000000000000000000000000000FDFFFFFFFDFFFFFF000000000400000000000000FEFFFFFF02000000FFFFFFFF04000000000000000000000001000000FFFFFFFF01000000FFFFFFFFFEFFFFFF0000000002000000FEFFFFFFFEFFFFFF03000000FEFFFFFFF9FFFFFF0000000000000000FEFFFFFF03000000FCFFFFFF000000000000000001000000FBFFFFFF020000000300000000000000FEFFFFFF00000000FDFFFFFFFEFFFFFF00000000FFFFFFFF02000000FFFFFFFF04000000FDFFFFFFFFFFFFFF01000000FFFFFFFF0000000000000000FEFFFFFF0000000003000000FDFFFFFFF9FFFFFF01000000FDFFFFFFFCFFFFFF00000000FFFFFFFF00000000FFFFFFFF04000000FAFFFFFFFFFFFFFFFFFFFFFFFCFFFFFF00000000FCFFFFFF00000000FEFFFFFF000000000100000003000000020000000000000003000000FCFFFFFF0000000002000000FFFFFFFFFBFFFFFF04000000020000000100000000000000020000000200000000000000FAFFFFFF0500000000000000FBFFFFFFFFFFFFFF04000000000000000000000001000000050000000000000000000000FFFFFFFFFEFFFFFF0000000002000000FDFFFFFF04000000FBFFFFFFFBFFFFFF01000000FEFFFFFFFFFFFFFFFCFFFFFF0100000000000000"> : tensor<4x2x3x5xi32>
    %1 = stablehlo.constant dense<[[0, -3, 2], [-1, 0, 1], [-2, -4, -4], [0, 3, 5]]> : tensor<4x3xi32>
    return %0, %1 : tensor<4x2x3x5xi32>, tensor<4x3xi32>
  }
  func.func private @expected() -> tensor<4x2x3x5xi32> {
    %0 = stablehlo.constant dense<"0x0100000001000000000000000000000000000000FDFFFFFFFDFFFFFF0000000004000000FDFFFFFFFEFFFFFF02000000FFFFFFFF04000000000000000000000001000000FFFFFFFF01000000FFFFFFFFFEFFFFFF0000000002000000FEFFFFFFFEFFFFFF03000000FEFFFFFFF9FFFFFF0000000000000000FEFFFFFF03000000FCFFFFFF00000000FFFFFFFF01000000FBFFFFFF020000000300000000000000FEFFFFFF00000000FDFFFFFFFEFFFFFF00000000FFFFFFFF02000000FFFFFFFF04000000FDFFFFFFFFFFFFFF01000000FFFFFFFF0000000000000000FEFFFFFF0000000003000000FDFFFFFFF9FFFFFF01000000FDFFFFFFFCFFFFFF00000000FEFFFFFF00000000FFFFFFFF04000000FAFFFFFFFCFFFFFFFFFFFFFFFCFFFFFF00000000FCFFFFFFFCFFFFFFFEFFFFFF000000000100000003000000020000000000000003000000FCFFFFFF0000000002000000FFFFFFFFFBFFFFFF04000000020000000100000000000000020000000200000000000000FAFFFFFF0500000000000000FBFFFFFFFFFFFFFF03000000000000000000000001000000050000000000000000000000FFFFFFFFFEFFFFFF0000000002000000FDFFFFFF04000000FBFFFFFFFBFFFFFF01000000FEFFFFFFFFFFFFFFFCFFFFFF0100000000000000"> : tensor<4x2x3x5xi32>
    return %0 : tensor<4x2x3x5xi32>
  }
}
