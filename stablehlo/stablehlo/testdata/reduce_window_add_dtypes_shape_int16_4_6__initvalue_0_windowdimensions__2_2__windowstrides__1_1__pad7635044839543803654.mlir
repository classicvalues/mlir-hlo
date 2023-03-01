module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<4x6xi16>
    %1 = call @expected() : () -> tensor<3x5xi16>
    %2 = stablehlo.constant dense<0> : tensor<i16>
    %3 = stablehlo.broadcast_in_dim %2, dims = [] : (tensor<i16>) -> tensor<i16>
    %4 = "stablehlo.reduce_window"(%0, %3) ({
    ^bb0(%arg0: tensor<i16>, %arg1: tensor<i16>):
      %6 = stablehlo.add %arg0, %arg1 : tensor<i16>
      stablehlo.return %6 : tensor<i16>
    }) {base_dilations = dense<1> : tensor<2xi64>, padding = dense<0> : tensor<2x2xi64>, window_dilations = dense<1> : tensor<2xi64>, window_dimensions = dense<2> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : (tensor<4x6xi16>, tensor<i16>) -> tensor<3x5xi16>
    %5 = stablehlo.custom_call @check.eq(%4, %1) : (tensor<3x5xi16>, tensor<3x5xi16>) -> tensor<i1>
    return %5 : tensor<i1>
  }
  func.func private @inputs() -> tensor<4x6xi16> {
    %0 = stablehlo.constant dense<[[1, -4, -1, 0, 2, 1], [3, 1, -3, 1, -1, 0], [-2, 4, -1, -2, 4, 0], [4, 0, 1, -1, 2, 7]]> : tensor<4x6xi16>
    return %0 : tensor<4x6xi16>
  }
  func.func private @expected() -> tensor<3x5xi16> {
    %0 = stablehlo.constant dense<[[1, -7, -3, 2, 2], [6, 1, -5, 2, 3], [6, 4, -3, 3, 13]]> : tensor<3x5xi16>
    return %0 : tensor<3x5xi16>
  }
}
