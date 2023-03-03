module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<[[0], [2]]> : tensor<2x1xi32>
    %1:2 = call @inputs() : () -> (tensor<5xf32>, tensor<2xf32>)
    %2 = call @expected() : () -> tensor<5xf32>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>):
      stablehlo.return %arg1 : tensor<f32>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<inserted_window_dims = [0], scatter_dims_to_operand_dims = [0], index_vector_dim = 1>, unique_indices = false} : (tensor<5xf32>, tensor<2x1xi32>, tensor<2xf32>) -> tensor<5xf32>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<5xf32>, tensor<5xf32>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<5xf32>, tensor<2xf32>) {
    %0 = stablehlo.constant dense<[1.59860659, 1.48412669, 4.1274848, -1.33535647, -0.426129878]> : tensor<5xf32>
    %1 = stablehlo.constant dense<[-2.94463563, 2.25222659]> : tensor<2xf32>
    return %0, %1 : tensor<5xf32>, tensor<2xf32>
  }
  func.func private @expected() -> tensor<5xf32> {
    %0 = stablehlo.constant dense<[-2.94463563, 1.48412669, 2.25222659, -1.33535647, -0.426129878]> : tensor<5xf32>
    return %0 : tensor<5xf32>
  }
}