module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<[[1], [0], [1]]> : tensor<3x1xi32>
    %1:2 = call @inputs() : () -> (tensor<3xf16>, tensor<3xf16>)
    %2 = call @expected() : () -> tensor<3xf16>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<f16>, %arg1: tensor<f16>):
      %5 = stablehlo.multiply %arg0, %arg1 : tensor<f16>
      stablehlo.return %5 : tensor<f16>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<inserted_window_dims = [0], scatter_dims_to_operand_dims = [0], index_vector_dim = 1>, unique_indices = false} : (tensor<3xf16>, tensor<3x1xi32>, tensor<3xf16>) -> tensor<3xf16>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<3xf16>, tensor<3xf16>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<3xf16>, tensor<3xf16>) {
    %0 = stablehlo.constant dense<[4.312500e+00, 5.576170e-01, 2.347660e+00]> : tensor<3xf16>
    %1 = stablehlo.constant dense<[-1.315430e+00, -2.533200e+00, 3.261720e+00]> : tensor<3xf16>
    return %0, %1 : tensor<3xf16>, tensor<3xf16>
  }
  func.func private @expected() -> tensor<3xf16> {
    %0 = stablehlo.constant dense<[-1.092190e+01, -2.392580e+00, 2.347660e+00]> : tensor<3xf16>
    return %0 : tensor<3xf16>
  }
}
