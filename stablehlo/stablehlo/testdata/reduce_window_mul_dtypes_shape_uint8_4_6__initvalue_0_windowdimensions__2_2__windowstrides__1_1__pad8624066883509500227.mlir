module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<4x6xui8>
    %1 = call @expected() : () -> tensor<3x5xui8>
    %2 = stablehlo.constant dense<0> : tensor<ui8>
    %3 = "stablehlo.reduce_window"(%0, %2) ({
    ^bb0(%arg0: tensor<ui8>, %arg1: tensor<ui8>):
      %5 = stablehlo.multiply %arg0, %arg1 : tensor<ui8>
      stablehlo.return %5 : tensor<ui8>
    }) {base_dilations = dense<1> : tensor<2xi64>, padding = dense<0> : tensor<2x2xi64>, window_dilations = dense<1> : tensor<2xi64>, window_dimensions = dense<2> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<4x6xui8>, tensor<ui8>) -> tensor<3x5xui8>
    %4 = stablehlo.custom_call @check.eq(%3, %1) : (tensor<3x5xui8>, tensor<3x5xui8>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> tensor<4x6xui8> {
    %0 = stablehlo.constant dense<[[0, 4, 0, 5, 4, 0], [3, 1, 3, 3, 4, 0], [1, 2, 1, 3, 4, 3], [1, 3, 2, 0, 4, 3]]> : tensor<4x6xui8>
    return %0 : tensor<4x6xui8>
  }
  func.func private @expected() -> tensor<3x5xui8> {
    %0 = stablehlo.constant dense<0> : tensor<3x5xui8>
    return %0 : tensor<3x5xui8>
  }
}
