module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<2x3xui16>
    %1 = call @expected() : () -> tensor<2x3xui16>
    %2 = stablehlo.bitcast_convert %0 : (tensor<2x3xui16>) -> tensor<2x3xui16>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<2x3xui16>, tensor<2x3xui16>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> tensor<2x3xui16> {
    %0 = stablehlo.constant dense<[[0, 0, 1], [4, 0, 3]]> : tensor<2x3xui16>
    return %0 : tensor<2x3xui16>
  }
  func.func private @expected() -> tensor<2x3xui16> {
    %0 = stablehlo.constant dense<[[0, 0, 1], [4, 0, 3]]> : tensor<2x3xui16>
    return %0 : tensor<2x3xui16>
  }
}
