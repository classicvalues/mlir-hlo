module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<[[0, 1], [2, 3]]> : tensor<2x2xi32>
    %1:2 = call @inputs() : () -> (tensor<5x6x7xbf16>, tensor<2x7xbf16>)
    %2 = call @expected() : () -> tensor<5x6x7xbf16>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<bf16>, %arg1: tensor<bf16>):
      %5 = stablehlo.maximum %arg0, %arg1 : tensor<bf16>
      stablehlo.return %5 : tensor<bf16>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [1], inserted_window_dims = [0, 1], scatter_dims_to_operand_dims = [0, 1], index_vector_dim = 1>, unique_indices = true} : (tensor<5x6x7xbf16>, tensor<2x2xi32>, tensor<2x7xbf16>) -> tensor<5x6x7xbf16>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<5x6x7xbf16>, tensor<5x6x7xbf16>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<5x6x7xbf16>, tensor<2x7xbf16>) {
    %0 = stablehlo.constant dense<"0x44C0BBBE413F9DBF8FBDA2BF78BEB1BF913E8D3F0B4005BE50BED3BFAA3F603FDF3F16C09B3E5D3E13C06FBF32C0BC3FAC3F5AC0234068C03DC0E0BE48402A3FA740CB3F2C407C3FA13FCBBC11402C402EC0F43F0AC0EB3F6B40D5BF243D5C40854099BF32405F3F56C00CC00B3F463FB63F15C01A4070BF913FC6BE7A3F8B3F4140C53C1240A33F1BC004C0853FA33F21C0BA3F744081BF70BF144097BFEE3F4A4041C0B8406240014039BF9CC00D40BEBE1E408D407AC0A1400A3FCCBF21BF3AC046BFC73F4C407E4073BFEF3FD33F3140FC4025C093C01740E93F1540FE3F3740D6BF843E24BF3240B7BEA1BFDC40CE40694009C000BF484059BF5BBFDB3F41C02D40EABFBA3FCABFB2C0883D57C02CBF0ABE6BC04D40B0C0FCBF8E4019410EC009C0C7409F3FA1BF09C0BA4094406C400F4087C0153FD53FEF407340ECBF89C0424093BEB2BFE3BFA5404EBF4F3EE5BF5C3F693F2F3FB53EA8BF8FBF40BF8CBFC7C0674016BF883DA1BF89BF22BFBBBD8EC020405AC02BC0A1C0693E8340E2BFC53E873FEB3F8A3F123ED5BEC44051402540CFBEBB3E353F943E684082C01A40B6BF"> : tensor<5x6x7xbf16>
    %1 = stablehlo.constant dense<[[-3.000000e+00, 5.000000e+00, 5.375000e+00, -4.531250e+00, 6.343750e+00, -8.250000e+00, 1.542970e-01], [4.843750e+00, -4.343750e+00, 3.339840e-01, -6.500000e+00, -3.656250e+00, -6.062500e+00, 1.828130e+00]]> : tensor<2x7xbf16>
    return %0, %1 : tensor<5x6x7xbf16>, tensor<2x7xbf16>
  }
  func.func private @expected() -> tensor<5x6x7xbf16> {
    %0 = stablehlo.constant dense<"0x44C0BBBE413F9DBF8FBDA2BF78BEB1BFA040AC400B40CB4050BE1E3EAA3F603FDF3F16C09B3E5D3E13C06FBF32C0BC3FAC3F5AC0234068C03DC0E0BE48402A3FA740CB3F2C407C3FA13FCBBC11402C402EC0F43F0AC0EB3F6B40D5BF243D5C40854099BF32405F3F56C00CC00B3F463FB63F15C01A4070BF913FC6BE7A3F8B3F4140C53C1240A33F1BC004C0853FA33F21C0BA3F744081BF70BF144097BFEE3F4A4041C0B8406240014039BF9CC00D40BEBE1E408D407AC0A1400A3FCCBF21BF3AC046BFC73F4C407E4073BFEF3FD33F3140FC4025C0AB3E1740E93F1540FE3F3740D6BF843E24BF3240B7BEA1BFDC40CE40694009C000BF484059BF5BBFDB3F41C02D40EABFBA3FCABFB2C0883D57C02CBF0ABE6BC04D40B0C0FCBF8E4019410EC009C0C7409F3FA1BF09C0BA4094406C400F4087C0153FD53FEF407340ECBF89C0424093BEB2BFE3BFA5404EBF4F3EE5BF5C3F693F2F3FB53EA8BF8FBF40BF8CBFC7C0674016BF883DA1BF89BF22BFBBBD8EC020405AC02BC0A1C0693E8340E2BFC53E873FEB3F8A3F123ED5BEC44051402540CFBEBB3E353F943E684082C01A40B6BF"> : tensor<5x6x7xbf16>
    return %0 : tensor<5x6x7xbf16>
  }
}
