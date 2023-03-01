module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<1> : tensor<2x1xi32>
    %1:2 = call @inputs() : () -> (tensor<3x5x40xui8>, tensor<3x5x2xui8>)
    %2 = call @expected() : () -> tensor<3x5x40xui8>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<ui8>, %arg1: tensor<ui8>):
      %5 = stablehlo.maximum %arg0, %arg1 : tensor<ui8>
      stablehlo.return %5 : tensor<ui8>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0, 1], inserted_window_dims = [2], scatter_dims_to_operand_dims = [2], index_vector_dim = 1>, unique_indices = false} : (tensor<3x5x40xui8>, tensor<2x1xi32>, tensor<3x5x2xui8>) -> tensor<3x5x40xui8>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<3x5x40xui8>, tensor<3x5x40xui8>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<3x5x40xui8>, tensor<3x5x2xui8>) {
    %0 = stablehlo.constant dense<"0x040500030205000000000007020300090405030200000101010002010002030701010200000001010201070103070302000103030003030106020300040100040301000008020301000005000201030001050400030400050303010104010106010003000201050000030202020200010000030104000202010201030202000103000300020401030502020206040200000300010201080004070403010200020102000102000103000100040201020201020000060203020404020201040501020203010300040203000201000001010104040101000201020003020101040303000102000505010003010000010800020101010300010102010401000103000104010203000101000102010003020301000201000202020201010400000103000302000004000201030404080203040006030306050100060505030202040000020000040001030205010103010001000200000006000102020104030403020400000602060202030307030204000006010001050300010101000203010100010304010600000001000300010006030000000102020102050000010004030202000100040001040202010000000202020203010100010200000202060001030201000203020203040301010102030302020207040605010000080002070005010002010100020002000104070401000100010102030403070004020102010400040003030006060300000203000202000402030500040500010103000301060100050004000001010106000100010005010503060000020900050103050201010400020402000303000001010300020704040107020302"> : tensor<3x5x40xui8>
    %1 = stablehlo.constant dense<[[[0, 3], [2, 1], [4, 5], [1, 3], [1, 0]], [[1, 5], [3, 6], [1, 2], [1, 0], [3, 5]], [[1, 2], [4, 2], [3, 1], [2, 1], [1, 1]]]> : tensor<3x5x2xui8>
    return %0, %1 : tensor<3x5x40xui8>, tensor<3x5x2xui8>
  }
  func.func private @expected() -> tensor<3x5x40xui8> {
    %0 = stablehlo.constant dense<"0x040500030205000000000007020300090405030200000101010002010002030701010200000001010202070103070302000103030003030106020300040100040301000008020301000005000201030001050400030400050303010104010106010003000201050000030202020200010000030104000202010301030202000103000300020401030502020206040200000300010201080004070403010200020102000102000103000100040201020201020000060203020404020201040501020203010300040203050201000001010104040101000201020003020101040303000102000505010003010000010800020601010300010102010401000103000104010203000101000102010003020301000201000202020202010400000103000302000004000201030404080203040006030306050100060505030202040000020000040001030205010103010001000200000006000102020104030403020400000602060202030507030204000006010001050300010101000203010100010304010600000001000300010006030002000102020102050000010004030202000100040001040202010000000202020203010100010200040202060001030201000203020203040301010102030302020207040605010000080002070005010302010100020002000104070401000100010102030403070004020102010400040003030006060302000203000202000402030500040500010103000301060100050004000001010106000100010005010503060000020900050103050201010400020402000303000001010300020704040107020302"> : tensor<3x5x40xui8>
    return %0 : tensor<3x5x40xui8>
  }
}
