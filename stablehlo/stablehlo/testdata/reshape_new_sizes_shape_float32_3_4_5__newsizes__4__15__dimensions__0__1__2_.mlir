module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<3x4x5xf32>
    %1 = call @expected() : () -> tensor<4x15xf32>
    %2 = stablehlo.reshape %0 : (tensor<3x4x5xf32>) -> tensor<4x15xf32>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<4x15xf32>, tensor<4x15xf32>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> tensor<3x4x5xf32> {
    %0 = stablehlo.constant dense<[[[-0.0698628798, 1.08492887, -3.1596489, -1.96837425, -3.04416466], [3.98786235, 6.99231624, 2.60930157, -3.99675298, 3.249690e+00], [-4.11810684, -0.018551534, -2.7366643, -0.271017283, 2.11587739], [6.56415224, 1.74164605, 1.56014502, 1.89901781, 2.62494659]], [[-2.15048814, 0.582237244, -4.17062712, -0.0105792917, -1.01905799], [2.49679971, -1.17171311, -1.56688297, -0.659570395, -2.56351614], [-3.37323761, 2.97991419, -2.29999113, 0.903530061, 1.2734319], [-1.14354312, -5.68730927, 0.32189548, -2.06056547, 1.21533608]], [[0.708649874, 9.545000e-01, -5.61248207, -0.925517201, 0.810774981], [-3.93236542, -0.900167882, 2.42270732, -5.24160051, 0.560082078], [-0.797789275, -0.682269632, -4.60182524, 3.06061649, 4.52987289], [-0.810354888, -4.97543049, -2.08644557, -6.27316856, 2.1953373]]]> : tensor<3x4x5xf32>
    return %0 : tensor<3x4x5xf32>
  }
  func.func private @expected() -> tensor<4x15xf32> {
    %0 = stablehlo.constant dense<[[-0.0698628798, 1.08492887, -3.1596489, -1.96837425, -3.04416466, 3.98786235, 6.99231624, 2.60930157, -3.99675298, 3.249690e+00, -4.11810684, -0.018551534, -2.7366643, -0.271017283, 2.11587739], [6.56415224, 1.74164605, 1.56014502, 1.89901781, 2.62494659, -2.15048814, 0.582237244, -4.17062712, -0.0105792917, -1.01905799, 2.49679971, -1.17171311, -1.56688297, -0.659570395, -2.56351614], [-3.37323761, 2.97991419, -2.29999113, 0.903530061, 1.2734319, -1.14354312, -5.68730927, 0.32189548, -2.06056547, 1.21533608, 0.708649874, 9.545000e-01, -5.61248207, -0.925517201, 0.810774981], [-3.93236542, -0.900167882, 2.42270732, -5.24160051, 0.560082078, -0.797789275, -0.682269632, -4.60182524, 3.06061649, 4.52987289, -0.810354888, -4.97543049, -2.08644557, -6.27316856, 2.1953373]]> : tensor<4x15xf32>
    return %0 : tensor<4x15xf32>
  }
}
