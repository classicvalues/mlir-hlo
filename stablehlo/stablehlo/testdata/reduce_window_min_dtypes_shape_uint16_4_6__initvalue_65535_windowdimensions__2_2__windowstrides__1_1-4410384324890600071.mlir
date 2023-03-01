module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<4x6xui16>
    %1 = call @expected() : () -> tensor<3x5xui16>
    %2 = stablehlo.constant dense<65535> : tensor<ui16>
    %3 = stablehlo.broadcast_in_dim %2, dims = [] : (tensor<ui16>) -> tensor<ui16>
    %4 = "stablehlo.reduce_window"(%0, %3) ({
    ^bb0(%arg0: tensor<ui16>, %arg1: tensor<ui16>):
      %6 = stablehlo.minimum %arg0, %arg1 : tensor<ui16>
      stablehlo.return %6 : tensor<ui16>
    }) {base_dilations = dense<1> : tensor<2xi64>, padding = dense<0> : tensor<2x2xi64>, window_dilations = dense<1> : tensor<2xi64>, window_dimensions = dense<2> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<4x6xui16>, tensor<ui16>) -> tensor<3x5xui16>
    %5 = stablehlo.custom_call @check.eq(%4, %1) : (tensor<3x5xui16>, tensor<3x5xui16>) -> tensor<i1>
    return %5 : tensor<i1>
  }
  func.func private @inputs() -> tensor<4x6xui16> {
    %0 = stablehlo.constant dense<[[4, 1, 3, 0, 5, 7], [0, 6, 1, 7, 4, 3], [1, 2, 4, 5, 2, 0], [1, 4, 0, 0, 0, 0]]> : tensor<4x6xui16>
    return %0 : tensor<4x6xui16>
  }
  func.func private @expected() -> tensor<3x5xui16> {
    %0 = stablehlo.constant dense<[[0, 1, 0, 0, 3], [0, 1, 1, 2, 0], [1, 0, 0, 0, 0]]> : tensor<3x5xui16>
    return %0 : tensor<3x5xui16>
  }
}
