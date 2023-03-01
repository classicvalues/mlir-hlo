module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<20x30xui8>
    %1 = call @expected() : () -> tensor<20x30xui8>
    %2 = stablehlo.constant dense<1> : tensor<ui8>
    %3 = stablehlo.broadcast_in_dim %2, dims = [] : (tensor<ui8>) -> tensor<20x30xui8>
    %4 = stablehlo.custom_call @check.eq(%3, %1) : (tensor<20x30xui8>, tensor<20x30xui8>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> tensor<20x30xui8> {
    %0 = stablehlo.constant dense<"0x000102010003020107010302010002010105010204000305020001040202030200040001030301030500040203000503020405010100010501020304010302030200040300020700010400040300030003020404000000030600040200020302000100000100040401010101050005040406000104030000050103000103010502020401040606030201030400000107050305030202050201060200030002040304030002000200000000020201000101020201010502000104000201050104000603030202010302030100010001020202010101010203060204000202020202010204000203050001010006020003030102010304000604030002000203000203040103010000020201030202020001010204010901020000020001010302000003020201000400020103040404020007010002000103010301040002030102000101030105020100010000000100000000030002020001050406000100050006000302000301010707020101000103010102050200000404070002010200010004010000050202010000040000010004000701030000020100030500010200010202080202040004030202050403010000020101030103010100000507020205000302030200020001010002010302020003020200020000040100030601040205040201000405030103010001000405030202030206030204000105020006030300010107040603020100040200000000020004020100000205040404030402030302050503030000000000020101040204000504010002000201010300010303000301020104020401010304030402000203010202"> : tensor<20x30xui8>
    return %0 : tensor<20x30xui8>
  }
  func.func private @expected() -> tensor<20x30xui8> {
    %0 = stablehlo.constant dense<1> : tensor<20x30xui8>
    return %0 : tensor<20x30xui8>
  }
}
