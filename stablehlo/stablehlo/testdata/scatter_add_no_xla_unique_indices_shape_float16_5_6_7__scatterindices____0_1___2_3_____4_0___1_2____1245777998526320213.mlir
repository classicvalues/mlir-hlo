module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<[[[0, 1], [2, 3]], [[4, 0], [1, 2]]]> : tensor<2x2x2xi32>
    %1:2 = call @inputs() : () -> (tensor<5x6x7xf16>, tensor<5x2x2xf16>)
    %2 = call @expected() : () -> tensor<5x6x7xf16>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<f16>, %arg1: tensor<f16>):
      %5 = stablehlo.add %arg0, %arg1 : tensor<f16>
      stablehlo.return %5 : tensor<f16>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0], inserted_window_dims = [1, 2], scatter_dims_to_operand_dims = [1, 2], index_vector_dim = 2>, unique_indices = true} : (tensor<5x6x7xf16>, tensor<2x2x2xi32>, tensor<5x2x2xf16>) -> tensor<5x6x7xf16>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<5x6x7xf16>, tensor<5x6x7xf16>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<5x6x7xf16>, tensor<5x2x2xf16>) {
    %0 = stablehlo.constant dense<"0x16C5FBC73CBDD5BC79445C41A1BFAAA4F0BA7DC2FB2E4E3FBFC085448FBB71C12C45A42C93BCED45E5BF10BEA0BD7B3EE6C4B8C03135693A23C448396A3E1A3E15C0A037B03B6FC17D391436DAC233404CBCB437ECC2404353C4B73E413B8D305F44F4416A411E4046C1DCB4A7C21F4095BBE73C60C242BBB0C00D45F7485DAFD5B25CB5553982C4E8C0A03E37C4EB38B8B9323700BEEBBFDD429A334D4128C1603B82BDA245BBC68238DE447D3E2840763BEFBA26C4E23BBCC404C064C19544FBC294B93A3C13B9083F03BEB04385B614C0243AE5406A419A435C41543C43C0A9BF10B87342094023BF1DBC894081C180C53345C941C14446A5A5C16B36673F5C451C3EF8349F3F1244293161421E3D9847F4C51CC47742F9BD2A3C3BC27031DBC4A72FA5C47941E63C913CBCC4CCB7B3BF243ABBC00F3419B858AAAE34E83BA0BC623939406448BB3411C457C3F41C2845D83D81BFECC5244621BC7B4127BC90401938273FAEC014449A3BFF36D6B9532DEEBC25BACDC5B2BFC2449A3CCB42CABF1A342CC4363C40444EC2A2C24D45F540643C2FC485C358BE1046FD45A5BF53B8F43E"> : tensor<5x6x7xf16>
    %1 = stablehlo.constant dense<[[[1.000370e-01, -4.196780e-01], [1.824220e+00, -1.023440e+00]], [[8.139640e-01, 1.101560e+00], [4.809570e-01, -9.204100e-01]], [[-2.458980e+00, -3.730470e-01], [-8.989250e-01, -3.558590e+00]], [[-4.699220e+00, 4.207030e+00], [1.931640e+00, -1.499020e+00]], [[1.282230e+00, -5.742190e+00], [3.283200e+00, -3.837890e+00]]]> : tensor<5x2x2xf16>
    return %0, %1 : tensor<5x6x7xf16>, tensor<5x2x2xf16>
  }
  func.func private @expected() -> tensor<5x6x7xf16> {
    %0 = stablehlo.constant dense<"0x16C5E1C73CBDD5BC79445C41A1BFAAA4F0BA44C4FB2E4E3FBFC085448FBB71C12C458EB593BCED45E5BF10BEA0BD7B3EE6C4B8C03135693AA0C048396A3E1A3E15C0A037B03B6FC17D391436DAC233404CBCB437ECC2704453C4B73E413B8D305F44F4416A418E3C46C1DCB4A7C21F4095BBE73C60C23832B0C00D45F7485DAFD5B25CB5553982C4E8C0A03E78C3EB38B8B9323700BEEBBFDD429A334D4128C1603B82BDA245BBC68238D1407D3E2840763BEFBA26C4E23BBCC491C564C19544FBC294B93A3C13B9083F81BFB04385B614C0243AE5406A419A435C41543C43C0A1C110B87342094023BF1DBC894081C180C53345C941C14446A5A5C16B36B2C15C451C3EF8349F3F12442931614208B39847F4C51CC47742F9BD2A3C3BC26044DBC4A72FA5C47941E63C913CBCC4CCB7B3BF243AF0B60F3419B858AAAE34E83BA0BC623939406448BB3411C457C3F41C28457C4181BFECC5244621BC7B4127BC9040A7C2273FAEC014449A3BFF36D6B9532DFAC625BACDC5B2BFC2449A3CCB42CABF1A342CC4363C88474EC2A2C24D45F540643C2FC485C358BE1046FD45A5BF53B8F43E"> : tensor<5x6x7xf16>
    return %0 : tensor<5x6x7xf16>
  }
}
