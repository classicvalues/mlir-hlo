module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0:2 = call @inputs() : () -> (tensor<1x28x1xf32>, tensor<3x1x16xf32>)
    %1 = call @expected() : () -> tensor<1x26x16xf32>
    %2 = stablehlo.convolution(%0#0, %0#1) dim_numbers = [b, 0, f]x[0, i, o]->[b, 0, f], window = {stride = [1], pad = [[0, 0]], lhs_dilate = [1], rhs_dilate = [1], reverse = [0]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#stablehlo<precision DEFAULT>, #stablehlo<precision DEFAULT>]} : (tensor<1x28x1xf32>, tensor<3x1x16xf32>) -> tensor<1x26x16xf32>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<1x26x16xf32>, tensor<1x26x16xf32>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<1x28x1xf32>, tensor<3x1x16xf32>) {
    %0 = stablehlo.constant dense<[[[-3.56352496], [-7.54493713], [-3.89179468], [0.597696722], [1.46750653], [1.23392284], [-6.27112436], [3.5799942], [-3.25140357], [1.37567842], [2.75101113], [-1.69401848], [-1.94272375], [-0.306588084], [-0.714592158], [-0.744587838], [-4.065580e+00], [0.362864166], [-0.60796529], [-2.64055371], [1.3410989], [-0.855015516], [-8.198550e+00], [3.54710126], [-0.704592109], [-3.097940e+00], [-0.726215243], [-0.670310795]]]> : tensor<1x28x1xf32>
    %1 = stablehlo.constant dense<[[[1.74847424, -0.991078615, -3.16322374, 1.50683618, -2.12540126, -0.930532694, -1.11322403, -1.63713658, 0.473258168, 1.4872992, -1.77296484, -5.82414341, 2.719730e+00, -0.58726728, -1.64434755, 0.315147847]], [[3.4784472, -1.10804307, 6.263870e+00, -2.79428148, -3.57917929, -5.70515156, -2.49970627, -7.11087703, 2.74748373, 2.98540831, 1.41832614, -3.46815586, -0.225668743, -1.07660091, -2.77891159, 0.788366436]], [[3.04336429, 0.420321256, 3.71959352, 4.83244467, 1.64316881, 2.6820662, -0.216698349, 2.97011971, -2.12816453, -3.05553722, -5.03270388, -0.412030905, 5.931530e+00, -2.96502542, -2.8054831, -5.04459381]]]> : tensor<3x1x16xf32>
    return %0, %1 : tensor<1x28x1xf32>, tensor<3x1x16xf32>
  }
  func.func private @expected() -> tensor<1x26x16xf32> {
    %0 = stablehlo.constant dense<"0x374731C2C218244150DB49C2AE0146C04578E14116B10F42215DBD4139B43F428E2362C17AEE7EC1CA3F7341A31942427596F8C1080AAE41A0FA164221FB4841BF48C7C174A84041D41CDB3F4B3919409D94F741019EF641F6FB8F41A1342742C39078C1E954C5C15E2B9B4087C6644200C680C1E327DB40645BAC41896007C1D0DB84BEAAF17340B51AAC41D6B4E2BE17B30841D7B78440B14D2140855BCF400DA854C080CE07C1AD74B93E14E99F41F9F400C0BC622DC07B171F3F3D8802C1CA7A1E416B92D9BFD1423E41D7D2304042D98FC058CFB3C02A3C93C0C1F6F7C0642BD83F3BF8BF3F3B06A6C0B24311C1B5D0094181DDB2C0BE5C08C195239CC0F4A243C12DA4AEC060E9A1C1FC54FCC14BB88EC17ECCC9C193FC56C0146CEEC107728B416C39C841FDABF54151E123C13BF005C2F23A834110063C413C480442532D0CC15560E740CEF2EEC11EBB1242B9A4CD41D7EC3042C86C58410DD35442081EC2C18A9ADEC144CBE8C1EA6651413D0CD0413AD092C05656AB40E4EAB4C13C8406C1B6BA613F6C57F14144A90CC2FC799AC0A879BAC156B0A1BF35C7C6C1299A5C4155BA3441DC3C0242BD94CB410B9914C26A8117414AC31741F5FB894104165DBF8903223FFE96D4C18305A941B33EC940CF439741EA05764038C3AA4157AA22C1F35E09C19E0E8FC1E84022C1B90A954163932BC03AF935BF37FF05C1331FEF4065AE3640B913E941B19F9140453AD040F18C23401CAED4BEF1896D40EB4667C0962712C1BC22C4C05C8350411842E540504FF7C04038C6C0FD155DC1D335DA4028F5A3C0ED89D2408ECE5CC151DC78C1EE25ACC136A800C105C4D6C170083D4110F676410ED01F413CD786C1CBADDDC01068A03F99F0A4C0225E324134D6DFC0313FD5BF8650D4C10A5C02BF45773EC08F75F23FCCE8CB3FABD2E23FCA36483FBC0C9F4071CF1F40178C15C18D2D6AC05EFDBE40454BB440BA4E154155712AC168F86C40E46CFEC0B279B23F01CD2041BE663D4137DFD940D5D57A413194AFC0CE3DECC00A3FE53F72D78541C198BFC0FBB47F409EB510412FD204BFA36AD4C0D07CFB3F888EC83FCAC3B0C0ABAB8140E1F5D13FE95E4540813E4F4002C576BEC384CFBF4963D34047C24A41FC3F17C18CBE654002A4C140640E30408835A9C0165E483FECD3C8C0840E04C0742EFE3F035E1740B67D124062CB5740141906BFACE1A0BEDCBF51405D43924014DAA2C0F40D4A40FA8592408527464031B381C1BECF33BE06358CC19C2495C1B7C81FC00CB8BFC09A6A6240DE8AB3C0DC95C8406A301241B85FA541C6B50641E71FCFC1CB695441CC666A416F939D41786E65C151A6AC400F17AEC1EBDE3F4185D7854100E3C641B79B2E4113A7F94139B744C149A865C153B7C8C0104C9241EAB9853F94416F405D1138417FA6A8C0B14AF6C0ECC9574042F34D41C23F21C1D8FBCA40A5AAA83DB5097040FF451140F3C5BB3E07C546C01E852C414A5DB541E0EC6BC1E72B7340673DEC408A970440844318C139BD4BBFF6716CC1523C28C124C83BC07DE17CC00710D83F0BA383C04DDE83400960D94029893C412CA48A3F6B9D68C1FA5404416C0308410B4A4F41AC54C5C054F28240CA0E1AC112174F413E264F41BAD19941D593DF40A60ABE41CF5826C183294EC179AA16C1A656424183B5DC40C9CA46BF8E679240329E10C1BC7623C0DE88453F472A5941CCBA3DC14DBD17BFA097EFC0970169BE1718F8C0A925884005182C4030302E412848314181E448C1F116294023E44040E8399140B5A4CCC11CFA74C06A5F20C216D60CC2033054C13ADF92C1F3F01A400ABBA3C10BBC7B41B5F1C3418EAE1642C0D2BBBF852833C2E288C341975FB941806D24429EBE99C133C3364139D30DC2250C1B4293F5134226556442C96AA541CB778C42ABD4F3C10C5812C2E5B5DFC1D59DFF411084A441992298BF71CD63414903C5C1178284C0C887794065203642ED5CCDC14B976440BCF567C1035AD33E174C5EC192AEEB40477B0C3FCAE6B841A8F30E429238DAC1A5714540A03AB340331771403DAAB5C0062E81C02E41D9C14705F5C0B0B821C163DFF2C06E10C2BF1CF81FC197BECA4027354A4138D804418C8287C11B1C09C1CF8CFB402E219A40998581416B7D63C17DD8744031059FC1BCBB8240FA4636418D0E83418AF80A418134A8416895E9C0C13D01C17099023F245A7241D4CAB0C070DFBC40CAE03C41E8C47F3F6DB91FC18BF76540367730403719BCC0A3500141784CA740D418AD4002EB03411E3B02C04C4797C08CC0FA4088B3A64164CD43C13CD6924032E20F410E93EA3F"> : tensor<1x26x16xf32>
    return %0 : tensor<1x26x16xf32>
  }
}
