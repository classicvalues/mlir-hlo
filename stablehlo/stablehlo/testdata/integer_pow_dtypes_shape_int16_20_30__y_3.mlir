module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<20x30xi16>
    %1 = call @expected() : () -> tensor<20x30xi16>
    %2 = stablehlo.multiply %0, %0 : tensor<20x30xi16>
    %3 = stablehlo.multiply %0, %2 : tensor<20x30xi16>
    %4 = stablehlo.custom_call @check.eq(%3, %1) : (tensor<20x30xi16>, tensor<20x30xi16>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> tensor<20x30xi16> {
    %0 = stablehlo.constant dense<"0xFEFF050000000400FEFF02000400020002000300FDFF02000000FDFFFDFF0300FFFF0500000005000000FFFF000003000000FFFFFBFF0300FEFF0200FFFF0000FDFFFCFF07000000FEFF01000200FFFF0700FDFF05000200FDFFFEFF0000040001000000FFFF00000200FFFFFFFF0000FBFF0100FFFF0300FBFF010007000000FEFFFDFFFFFF000005000400FEFF00000500FFFF0000FDFF0600FEFFFFFF0200FAFF0000FFFF0000FDFF000005000400FDFFFFFF0000FFFF010001000000000005000000FFFF00000500020002000000FCFF0000FCFFFDFF00000100FCFFFFFF00000600FCFFFAFF0300000003000000000005000000060002000000FEFF02000100FDFF00000000FEFFFAFF020002000000020006000000FCFF0000FEFFFFFFFFFF0600010002000100FDFF0000FEFF040000000300FEFF0200FEFFFDFF000000000400FDFF0300FEFF0100030000000300FCFF000000000200000001000200FCFFFFFF000000000600030000000000030007000000FBFF00000200FEFF01000000FCFFFCFF0100020000000200FBFF0000010001000000010000000000FDFFFFFF00000100FFFFFCFF00000300FFFF0000FDFF00000500FDFFFFFF00000200F9FF0000FDFFFDFFFBFFFFFF020003000400000003000000FDFFFEFFFEFF010001000100FFFF0200FBFFFEFF02000000000000000000FEFF00000500FFFFFDFF00000000FBFF02000000FFFF00000000FFFF0200FFFFFCFFFFFF00000000FFFF0000FDFFFCFF01000200FFFFFFFF020000000200FDFF030001000300FFFFFFFFFBFF0100FDFF0500FEFF020002000000FDFF0500FEFFFDFFFFFF0100FFFFFDFF00000100000003000000FFFFFDFF0000FAFF0000FEFF0000020002000000FDFF0000FEFF00000000FEFF030000000000FFFFFDFFFDFF0300FEFF0100000000000000FAFFFDFF040000000000FDFF0000020003000100FEFF0100FDFF0500020000000100FFFFFDFF0300000000000300FDFF0500FFFF02000400FDFF0000FEFFFEFF00000200FEFF02000300050002000400010002000000FBFFFEFF010001000100FBFF01000000FEFFFEFFFEFF040000000100000001000000010002000200FDFF020001000000FEFF0000FEFF0000FFFFFEFF000003000000FDFFFFFF0000FEFF020004000000000000000200000002000100FFFF0000FFFF01000200FAFF05000000FCFF0200FFFF01000300FFFFFBFFFFFF0000FDFFFCFFFCFFFEFF04000000FFFF02000400FAFF0100020000000000060001000000FCFFFBFF0400000001000000FEFFFFFFFFFFFDFF00000000FFFF000000000000FFFF02000000FCFFFEFFFAFFFBFFFDFF0300FFFFFCFFFEFF000000000100FDFF00000100FDFF0000FCFF00000100010000000100FBFFFDFFFEFF010002000300FFFF030003000200FEFF0000050001000400FFFF0000FEFFFDFFFFFF01000400FEFFFEFFFAFF0200FFFF00000000FCFF0200FDFF02000500FCFFFFFFFFFFFEFFFCFFFDFFFBFF00000200FFFFFEFF0100FFFF0000FCFF00000000FFFF0000FDFF020000000400FFFF0300FAFF0100FDFF0100FFFF0000FFFF0000FFFF0000FEFF01000400FFFFFFFF0000020000000000000000000000000000000000F9FF00000200FCFF0200020000000100FDFFFDFF0200FEFF00000000"> : tensor<20x30xi16>
    return %0 : tensor<20x30xi16>
  }
  func.func private @expected() -> tensor<20x30xi16> {
    %0 = stablehlo.constant dense<"0xF8FF7D0000004000F8FF08004000080008001B00E5FF08000000E5FFE5FF1B00FFFF7D0000007D000000FFFF00001B000000FFFF83FF1B00F8FF0800FFFF0000E5FFC0FF57010000F8FF01000800FFFF5701E5FF7D000800E5FFF8FF0000400001000000FFFF00000800FFFFFFFF000083FF0100FFFF1B0083FF010057010000F8FFE5FFFFFF00007D004000F8FF00007D00FFFF0000E5FFD800F8FFFFFF080028FF0000FFFF0000E5FF00007D004000E5FFFFFF0000FFFF01000100000000007D000000FFFF00007D00080008000000C0FF0000C0FFE5FF00000100C0FFFFFF0000D800C0FF28FF1B0000001B00000000007D000000D80008000000F8FF08000100E5FF00000000F8FF28FF0800080000000800D8000000C0FF0000F8FFFFFFFFFFD800010008000100E5FF0000F8FF400000001B00F8FF0800F8FFE5FF000000004000E5FF1B00F8FF01001B0000001B00C0FF000000000800000001000800C0FFFFFF00000000D8001B00000000001B005701000083FF00000800F8FF01000000C0FFC0FF010008000000080083FF0000010001000000010000000000E5FFFFFF00000100FFFFC0FF00001B00FFFF0000E5FF00007D00E5FFFFFF00000800A9FE0000E5FFE5FF83FFFFFF08001B00400000001B000000E5FFF8FFF8FF010001000100FFFF080083FFF8FF08000000000000000000F8FF00007D00FFFFE5FF0000000083FF08000000FFFF00000000FFFF0800FFFFC0FFFFFF00000000FFFF0000E5FFC0FF01000800FFFFFFFF080000000800E5FF1B0001001B00FFFFFFFF83FF0100E5FF7D00F8FF080008000000E5FF7D00F8FFE5FFFFFF0100FFFFE5FF0000010000001B000000FFFFE5FF000028FF0000F8FF0000080008000000E5FF0000F8FF00000000F8FF1B0000000000FFFFE5FFE5FF1B00F8FF010000000000000028FFE5FF400000000000E5FF000008001B000100F8FF0100E5FF7D00080000000100FFFFE5FF1B00000000001B00E5FF7D00FFFF08004000E5FF0000F8FFF8FF00000800F8FF08001B007D000800400001000800000083FFF8FF01000100010083FF01000000F8FFF8FFF8FF400000000100000001000000010008000800E5FF080001000000F8FF0000F8FF0000FFFFF8FF00001B000000E5FFFFFF0000F8FF080040000000000000000800000008000100FFFF0000FFFF0100080028FF7D000000C0FF0800FFFF01001B00FFFF83FFFFFF0000E5FFC0FFC0FFF8FF40000000FFFF0800400028FF0100080000000000D80001000000C0FF83FF4000000001000000F8FFFFFFFFFFE5FF00000000FFFF000000000000FFFF08000000C0FFF8FF28FF83FFE5FF1B00FFFFC0FFF8FF000000000100E5FF00000100E5FF0000C0FF0000010001000000010083FFE5FFF8FF010008001B00FFFF1B001B000800F8FF00007D0001004000FFFF0000F8FFE5FFFFFF01004000F8FFF8FF28FF0800FFFF00000000C0FF0800E5FF08007D00C0FFFFFFFFFFF8FFC0FFE5FF83FF00000800FFFFF8FF0100FFFF0000C0FF00000000FFFF0000E5FF080000004000FFFF1B0028FF0100E5FF0100FFFF0000FFFF0000FFFF0000F8FF01004000FFFFFFFF0000080000000000000000000000000000000000A9FE00000800C0FF0800080000000100E5FFE5FF0800F8FF00000000"> : tensor<20x30xi16>
    return %0 : tensor<20x30xi16>
  }
}
