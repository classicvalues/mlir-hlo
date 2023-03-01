module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<0> : tensor<1xi32>
    %1:2 = call @inputs() : () -> (tensor<1x125xui32>, tensor<1xui32>)
    %2 = call @expected() : () -> tensor<1x125xui32>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<ui32>, %arg1: tensor<ui32>):
      %5 = stablehlo.maximum %arg0, %arg1 : tensor<ui32>
      stablehlo.return %5 : tensor<ui32>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0], inserted_window_dims = [1], scatter_dims_to_operand_dims = [1]>, unique_indices = true} : (tensor<1x125xui32>, tensor<1xi32>, tensor<1xui32>) -> tensor<1x125xui32>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<1x125xui32>, tensor<1x125xui32>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<1x125xui32>, tensor<1xui32>) {
    %0 = stablehlo.constant dense<"0x0200000002000000010000000000000005000000020000000100000000000000010000000100000005000000000000000000000003000000020000000700000002000000000000000000000003000000020000000000000001000000010000000100000001000000020000000200000004000000000000000300000002000000030000000100000000000000000000000000000000000000010000000200000001000000000000000000000002000000010000000200000003000000030000000100000001000000010000000300000001000000000000000100000002000000000000000000000001000000000000000100000000000000020000000400000001000000030000000200000003000000020000000000000002000000020000000200000003000000010000000300000005000000000000000100000005000000030000000100000004000000070000000600000003000000040000000600000001000000050000000100000002000000020000000000000003000000010000000000000000000000010000000100000001000000010000000300000000000000040000000000000002000000020000000000000001000000050000000100000000000000050000000500000001000000010000000600000005000000000000000000000005000000010000000400000001000000"> : tensor<1x125xui32>
    %1 = stablehlo.constant dense<8> : tensor<1xui32>
    return %0, %1 : tensor<1x125xui32>, tensor<1xui32>
  }
  func.func private @expected() -> tensor<1x125xui32> {
    %0 = stablehlo.constant dense<"0x0800000002000000010000000000000005000000020000000100000000000000010000000100000005000000000000000000000003000000020000000700000002000000000000000000000003000000020000000000000001000000010000000100000001000000020000000200000004000000000000000300000002000000030000000100000000000000000000000000000000000000010000000200000001000000000000000000000002000000010000000200000003000000030000000100000001000000010000000300000001000000000000000100000002000000000000000000000001000000000000000100000000000000020000000400000001000000030000000200000003000000020000000000000002000000020000000200000003000000010000000300000005000000000000000100000005000000030000000100000004000000070000000600000003000000040000000600000001000000050000000100000002000000020000000000000003000000010000000000000000000000010000000100000001000000010000000300000000000000040000000000000002000000020000000000000001000000050000000100000000000000050000000500000001000000010000000600000005000000000000000000000005000000010000000400000001000000"> : tensor<1x125xui32>
    return %0 : tensor<1x125xui32>
  }
}
