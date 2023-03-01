module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<32> : tensor<1xi32>
    %1:2 = call @inputs() : () -> (tensor<1x50x3xui16>, tensor<1x3xui16>)
    %2 = call @expected() : () -> tensor<1x50x3xui16>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<ui16>, %arg1: tensor<ui16>):
      %5 = stablehlo.add %arg0, %arg1 : tensor<ui16>
      stablehlo.return %5 : tensor<ui16>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0, 1], inserted_window_dims = [1], scatter_dims_to_operand_dims = [1]>, unique_indices = true} : (tensor<1x50x3xui16>, tensor<1xi32>, tensor<1x3xui16>) -> tensor<1x50x3xui16>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<1x50x3xui16>, tensor<1x50x3xui16>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<1x50x3xui16>, tensor<1x3xui16>) {
    %0 = stablehlo.constant dense<"0x030000000200040005000400030006000600010001000000000005000000020001000100010002000100000002000100020002000200000000000100000001000000010002000100020000000400000000000100050004000000050001000700020000000200000001000200040001000300080000000100010000000400000000000300060004000000000003000200000000000200000005000100020000000000040000000600000000000200000005000000000000000000020003000100000000000300020000000100000000000300050001000100030000000100060003000000010002000000000000000100010004000300000000000000060002000100000002000200000003000300010004000200000004000400000004000100040000000000040002000100"> : tensor<1x50x3xui16>
    %1 = stablehlo.constant dense<[[4, 0, 1]]> : tensor<1x3xui16>
    return %0, %1 : tensor<1x50x3xui16>, tensor<1x3xui16>
  }
  func.func private @expected() -> tensor<1x50x3xui16> {
    %0 = stablehlo.constant dense<"0x030000000200040005000400030006000600010001000000000005000000020001000100010002000100000002000100020002000200000000000100000001000000010002000100020000000400000000000100050004000000050001000700020000000200000001000200040001000300080000000100010000000400000000000300060004000000000003000200000000000200000005000100020000000000040000000600000000000200000005000000000000000000020003000100040000000400020000000100000000000300050001000100030000000100060003000000010002000000000000000100010004000300000000000000060002000100000002000200000003000300010004000200000004000400000004000100040000000000040002000100"> : tensor<1x50x3xui16>
    return %0 : tensor<1x50x3xui16>
  }
}
