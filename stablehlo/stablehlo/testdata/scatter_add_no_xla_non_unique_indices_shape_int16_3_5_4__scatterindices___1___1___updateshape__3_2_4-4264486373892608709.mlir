module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<1> : tensor<2x1xi32>
    %1:2 = call @inputs() : () -> (tensor<3x5x4xi16>, tensor<3x2x4xi16>)
    %2 = call @expected() : () -> tensor<3x5x4xi16>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<i16>, %arg1: tensor<i16>):
      %5 = stablehlo.add %arg0, %arg1 : tensor<i16>
      stablehlo.return %5 : tensor<i16>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0, 2], inserted_window_dims = [1], scatter_dims_to_operand_dims = [1], index_vector_dim = 1>, unique_indices = false} : (tensor<3x5x4xi16>, tensor<2x1xi32>, tensor<3x2x4xi16>) -> tensor<3x5x4xi16>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<3x5x4xi16>, tensor<3x5x4xi16>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<3x5x4xi16>, tensor<3x2x4xi16>) {
    %0 = stablehlo.constant dense<[[[1, 5, 1, 0], [8, 0, -1, -5], [1, -3, -6, -1], [3, -9, 0, -2], [-4, 1, 0, -2]], [[3, 0, 0, 3], [5, 0, -3, -1], [0, 9, 6, 2], [0, 3, 0, 3], [1, 2, 2, 1]], [[-2, 4, 2, 1], [-1, -1, -1, -2], [0, 2, -1, 1], [-5, -3, 1, 2], [5, 0, 3, -1]]]> : tensor<3x5x4xi16>
    %1 = stablehlo.constant dense<[[[0, 2, 5, -1], [-1, 2, 1, 0]], [[1, 0, -1, 0], [2, 1, -5, 5]], [[2, 1, 0, -3], [4, 2, 7, 1]]]> : tensor<3x2x4xi16>
    return %0, %1 : tensor<3x5x4xi16>, tensor<3x2x4xi16>
  }
  func.func private @expected() -> tensor<3x5x4xi16> {
    %0 = stablehlo.constant dense<[[[1, 5, 1, 0], [7, 4, 5, -6], [1, -3, -6, -1], [3, -9, 0, -2], [-4, 1, 0, -2]], [[3, 0, 0, 3], [8, 1, -9, 4], [0, 9, 6, 2], [0, 3, 0, 3], [1, 2, 2, 1]], [[-2, 4, 2, 1], [5, 2, 6, -4], [0, 2, -1, 1], [-5, -3, 1, 2], [5, 0, 3, -1]]]> : tensor<3x5x4xi16>
    return %0 : tensor<3x5x4xi16>
  }
}
