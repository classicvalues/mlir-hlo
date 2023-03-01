module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<[[[0], [1]], [[2], [3]]]> : tensor<2x2x1xi32>
    %1:2 = call @inputs() : () -> (tensor<5x6x7xbf16>, tensor<5x2x2x7xbf16>)
    %2 = call @expected() : () -> tensor<5x6x7xbf16>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<bf16>, %arg1: tensor<bf16>):
      stablehlo.return %arg1 : tensor<bf16>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0, 3], inserted_window_dims = [1], scatter_dims_to_operand_dims = [1], index_vector_dim = 2>, unique_indices = true} : (tensor<5x6x7xbf16>, tensor<2x2x1xi32>, tensor<5x2x2x7xbf16>) -> tensor<5x6x7xbf16>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<5x6x7xbf16>, tensor<5x6x7xbf16>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<5x6x7xbf16>, tensor<5x2x2x7xbf16>) {
    %0 = stablehlo.constant dense<"0x414031C01140D1BF41C076BFE540ABBF2EBFDDBF90BE063DDA40E4BF7B3E7FC04DC0813FA2C03AC0C23F73405440FFBFEDBFD53F2040EE3F9240213F32403EBF09BFD83EE13F17C0EFBF85C070407C3E6CC0DBBFA93EB63F4CBF1840863E93C04C406E3FA73EB9C0594026BEE3BFE03FC0BE833F70BE55BE40BF5EBF9ABF0E40C03F71C089BEF33F81C0F0BF91C030BFA63FBCBF69400B405B409A3F6BC09EBFC2BFB03F2C409FBF22BEB9BEE3BDFEC03F404CBF29C01FC07BC0DEC0A2409E3FB7C04BC0833F62BF86BED0BF2440B33F083E72BF04C08D4075BFDDC0F0BFD6BF623FB5401C3F2EC09C3FAA3F2EC09CC087BEA1C0AF3F6E409E40BEBF2740973FD4C085BF97BF6BC0F03F9940903FEE3F04409EBF04C0AEBF8B403F3EBBBFD53FDD3FDA3F5540293F01C08F40EC4088C0DDBFEDC0C9BF01401FBE36C060BF5A4037BF4C40DFBF5ABF1AC018C0ED40D840BD40F1BF364032C0FABE31C0764014C072C0D240C93EC8BFB7BF8D3F3FC05D4093C022400D404FC00C3F24C078C07FBF3940C1BFBF3F88BE3A3DBDBF66BE77C0C6C05E3F38C02DC02C3FFC3FE8BFD140D23D3C40"> : tensor<5x6x7xbf16>
    %1 = stablehlo.constant dense<"0x743E523F36C03B3F423F91C08D3F3140AB40B63FD43F8E405C401FC0A8C0B33F874036BFA23F67C0063FB1BF31C0FF3F7440E93E64C075BFE54082405440B0C086C02F40A93E96C0613F0141A44093C081C0874031C0F0BFA13FB8BF863F1AC025BF0D40E3BF61409F40FD3EA640B43F19BFEF3F5C40EE3E57400241A6BFB33F993FE2400E3F9DC0B63F7D40FFBF094079C0D7BF4DBED13FA9C05B40A13F053E2640D13E25BEC93FC9BE47C081C005C0843E904037C0AABF2840D3BD593D1C3E36C065BF08C026C0143F7C40C040BEBF8ABF27405340CBBFC53FEF3F833F0240C63D1D405F40DB3FF33D01C0A14099BF1541D23F3EBF08C0E0C052C084C01C3F3FBFEDBFBC40274024400A402D3F61C02AC094BF10BFAAC0"> : tensor<5x2x2x7xbf16>
    return %0, %1 : tensor<5x6x7xbf16>, tensor<5x2x2x7xbf16>
  }
  func.func private @expected() -> tensor<5x6x7xbf16> {
    %0 = stablehlo.constant dense<"0x743E523F36C03B3F423F91C08D3F3140AB40B63FD43F8E405C401FC0A8C0B33F874036BFA23F67C0063FB1BF31C0FF3F7440E93E64C075BF9240213F32403EBF09BFD83EE13F17C0EFBF85C070407C3E6CC0DBBFE54082405440B0C086C02F40A93E96C0613F0141A44093C081C0874031C0F0BFA13FB8BF863F1AC025BF0D40E3BF61409F40FD3EA640B43F91C030BFA63FBCBF69400B405B409A3F6BC09EBFC2BFB03F2C409FBF19BFEF3F5C40EE3E57400241A6BFB33F993FE2400E3F9DC0B63F7D40FFBF094079C0D7BF4DBED13FA9C05B40A13F053E2640D13E25BEC93F623FB5401C3F2EC09C3FAA3F2EC09CC087BEA1C0AF3F6E409E40BEBFC9BE47C081C005C0843E904037C0AABF2840D3BD593D1C3E36C065BF08C026C0143F7C40C040BEBF8ABF27405340CBBFC53FEF3F833F0240C9BF01401FBE36C060BF5A4037BF4C40DFBF5ABF1AC018C0ED40D840C63D1D405F40DB3FF33D01C0A14099BF1541D23F3EBF08C0E0C052C084C01C3F3FBFEDBFBC40274024400A402D3F61C02AC094BF10BFAAC03A3DBDBF66BE77C0C6C05E3F38C02DC02C3FFC3FE8BFD140D23D3C40"> : tensor<5x6x7xbf16>
    return %0 : tensor<5x6x7xbf16>
  }
}
