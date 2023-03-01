module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<[[[0, 1], [2, 3]], [[4, 0], [1, 2]]]> : tensor<2x2x2xi32>
    %1:2 = call @inputs() : () -> (tensor<5x6x7xi16>, tensor<5x2x2xi16>)
    %2 = call @expected() : () -> tensor<5x6x7xi16>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<i16>, %arg1: tensor<i16>):
      %5 = stablehlo.multiply %arg0, %arg1 : tensor<i16>
      stablehlo.return %5 : tensor<i16>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0], inserted_window_dims = [1, 2], scatter_dims_to_operand_dims = [1, 2], index_vector_dim = 2>, unique_indices = true} : (tensor<5x6x7xi16>, tensor<2x2x2xi32>, tensor<5x2x2xi16>) -> tensor<5x6x7xi16>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<5x6x7xi16>, tensor<5x6x7xi16>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<5x6x7xi16>, tensor<5x2x2xi16>) {
    %0 = stablehlo.constant dense<"0xFDFFFAFF04000000FFFF08000100FFFF0400FFFF01000200FDFFFFFFFDFF0100FFFF000002000300FAFFFEFF010000000100FFFF0400FDFFFFFF000006000500050002000000FFFF020002000000FEFFFCFFFCFFFCFFFFFF000002000200020002000000010002000000010001000100FFFFFFFF0000FEFFFFFFFFFF000004000100010000000000FDFF030000000500040000000300FFFF020000000500000000000500FBFF010000000000FBFFFFFFFFFF01000100FEFF0200FEFF02000000010000000000FDFFFEFF01000000FEFF0100010000000300FEFFFDFF0000FEFFFAFF000003000100FFFF01000000FBFFFEFF0300FFFFFEFF0100000000000000FFFFFDFFFEFF0400FEFF0200FEFF00000200FCFFFFFFFFFFFFFF0400FEFFFFFF0100FCFF0300FEFFFCFFF9FF02000000010000000400040000000200FDFF0000020001000300000000000000FEFFFEFFFFFF0400FFFF0100FFFFFFFF0600FFFF0600FDFFFFFF00000000000000000000FFFF0000FAFF0400FCFFFFFF0200FFFFFBFFFFFFFCFFFDFFFEFF00000200FDFF05000000FEFFFFFFFBFF0600030001000000FDFF"> : tensor<5x6x7xi16>
    %1 = stablehlo.constant dense<[[[6, 0], [1, 1]], [[-1, 0], [0, 0]], [[1, 1], [0, -6]], [[0, -1], [0, 3]], [[2, -1], [-2, 1]]]> : tensor<5x2x2xi16>
    return %0, %1 : tensor<5x6x7xi16>, tensor<5x2x2xi16>
  }
  func.func private @expected() -> tensor<5x6x7xi16> {
    %0 = stablehlo.constant dense<"0xFDFFDCFF04000000FFFF08000100FFFF0400FFFF01000200FDFFFFFFFDFF0100FFFF000002000300FAFFFEFF010000000100FFFF0400FDFFFFFF000006000500050002000000FFFF020002000000FEFFFCFFFCFFFCFF0100000002000200020002000000010000000000010001000100FFFFFFFF00000000FFFFFFFF000004000100010000000000FDFF030000000500040000000300FFFF020000000500000000000500FBFF010000000000FBFFFFFFFFFF01000100FEFF02000C0002000000010000000000FDFFFEFF01000000FEFF0100010000000300FEFFFDFF0000FEFF0000000003000100FFFF01000000FBFFFEFF0300FFFFFEFF0100000000000000FFFFFDFFFEFF0400FEFF0200FEFF00000200FCFFFFFFFFFFFFFF0400FEFF01000100FCFF0300FEFFFCFFF9FF02000000010000000000040000000200FDFF0000020001000300000000000000FEFFFEFFFFFF0800FFFF0100FFFFFFFF0600FFFF0600FDFFFFFF00000000000000000000FFFF0000FAFF0400FCFFFFFF0200FFFFFBFFFFFFFCFFFDFF040000000200FDFF05000000FEFFFFFFFBFF0600030001000000FDFF"> : tensor<5x6x7xi16>
    return %0 : tensor<5x6x7xi16>
  }
}
