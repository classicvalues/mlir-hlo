module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<[3, 2]> : tensor<2xi32>
    %1:2 = call @inputs() : () -> (tensor<4x2x3xui16>, tensor<2xui16>)
    %2 = call @expected() : () -> tensor<4x2x3xui16>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<ui16>, %arg1: tensor<ui16>):
      %5 = stablehlo.maximum %arg0, %arg1 : tensor<ui16>
      stablehlo.return %5 : tensor<ui16>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0], inserted_window_dims = [0, 2], scatter_dims_to_operand_dims = [0, 2]>, unique_indices = true} : (tensor<4x2x3xui16>, tensor<2xi32>, tensor<2xui16>) -> tensor<4x2x3xui16>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<4x2x3xui16>, tensor<4x2x3xui16>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<4x2x3xui16>, tensor<2xui16>) {
    %0 = stablehlo.constant dense<[[[0, 2, 3], [0, 3, 2]], [[1, 1, 2], [0, 0, 2]], [[3, 2, 3], [0, 3, 1]], [[6, 2, 2], [2, 1, 3]]]> : tensor<4x2x3xui16>
    %1 = stablehlo.constant dense<[0, 6]> : tensor<2xui16>
    return %0, %1 : tensor<4x2x3xui16>, tensor<2xui16>
  }
  func.func private @expected() -> tensor<4x2x3xui16> {
    %0 = stablehlo.constant dense<[[[0, 2, 3], [0, 3, 2]], [[1, 1, 2], [0, 0, 2]], [[3, 2, 3], [0, 3, 1]], [[6, 2, 2], [2, 1, 6]]]> : tensor<4x2x3xui16>
    return %0 : tensor<4x2x3xui16>
  }
}
