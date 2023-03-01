module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<1> : tensor<2x1xi32>
    %1:2 = call @inputs() : () -> (tensor<3x5x40xf32>, tensor<3x5x2xf32>)
    %2 = call @expected() : () -> tensor<3x5x40xf32>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>):
      %5 = stablehlo.maximum %arg0, %arg1 : tensor<f32>
      stablehlo.return %5 : tensor<f32>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0, 1], inserted_window_dims = [2], scatter_dims_to_operand_dims = [2], index_vector_dim = 1>, unique_indices = false} : (tensor<3x5x40xf32>, tensor<2x1xi32>, tensor<3x5x2xf32>) -> tensor<3x5x40xf32>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<3x5x40xf32>, tensor<3x5x40xf32>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<3x5x40xf32>, tensor<3x5x2xf32>) {
    %0 = stablehlo.constant dense<"0xC5C2A4402B103540A19EA13F7936ABC0D676D53FA70C1C400F2AD83F0B3629C0B5CFE2C0F59CFD3F50F0FF3F1DC6E2BF78909A3FA363903F8931AA3F837492C0CF278540E79AC3BF8E9525406BD4DABF0D503840E28EB0BF6FA8463FF1243E40038280BFEAC5D0BD851009C0A0EB843FF06109BFF2C430C0B15D394097E20EC0949CCA40C5E6A040462BF63FC3716BBFEC698340E7CC803D8436983FB49DA940BF5B94C0976E1B3E3BE0963F2EA5BDBD5846A6BD83D5053F012829C0E864F83E59976EC0158DC5BE8B0A5540C013BE3F83B6FE3E2696D2BF673730C0F9B1A9BE1BA490C002421B40FB0372400FF3373F59B601C02A16D9BD484CCF3F94D4384077A5D93F3C2113C048CC193FB2D335BFF5347ABFE3199F3F0ED5B0401FA6EBBFC67A0E408DF78040668246C075190F400785B9BF767C4940D46168BF78F000402EA41240F94C3740595C8D3F8660E03F422DBBC0A949E740E8AF7FC010F9C13F84950EC0278C95BF771B8A3FC2E460C0F62E1240A1E09E3FEF145B40F805F63F53B3EB40E2C43EBF437DBE3FE94787BF135AEBBFCC358F3E1FA4A6BF7C00DDBF7EF282C0C45A384040CBEEBFF5F889BFCE3C1AC03A66F33ED5BC0DC050ED10C044F55DBF678345C048B9893F94A4A23F7E1295BF13912FC067AE313F0717863FD29998407E84723F79D0EFBF0A2686C00EC528C0F7F28FBF4C2848BF2693B740ACB82F3F8845BE3EB9FAFF3DCBF08C3F9A73D23FC7FC24C0140AD34075CA813F222EA3402A91A6407DC39F408168273FADBAE0BF9E4DD2C004858F40980E1D408E9332C0163D8340F0BF2440AB57E740B1C70FC06ADABBC07EDC6FBD91906240B6318D402F9B2041862697BF5FC2F940360BC0C0B161213FED4BB2BFA4E8F13FFCFD31BF3EFC923EAA9B963EF26607405F355EBED7CD18409F8875C0AE86CDC027D03F40B28371C0B0E15F3C3E4C16C049F6A04024F861402EE374BE6BFDFA40EDE5913FBDB777BF54B69F409D7A05C06CE298C038A2393FB8A1CEC00E536B401A8BEA3F278AB8BEF41C8A3F69A336BE8355AFC0082E1140AD9F6D40674C0B400943D0BF803F3140E6971C403740F93FEE3F26C044DFA940FD7D13C01C7E993F87125EBF2BB3B6C09B74A9BF71DB61C0B637CABFCF5915C15EEDE73F0B171AC0ECE9AD3E0F458B3E89277A40C8A313C0DFCA6E40CBF7A4BF4B414F40C8DADF3FD25DD740B6CDA5C0A03FA23E83B8603E400D0EC088A87B3F0070B23F2BA6EA3E7208C0C0EB63A13D2AD540C0F81062C01B4C9A3FDE47753E120C4E4062A2E83E0E3EC74050336E3E4195F640D223BD3F4EE4AC3F817740BF96AF2F3F71BFE1BEEA9A274003590DBF8FB7C6C03D6189C00ACBC0C0DFA02BBF872512C06403974031CF1D40CEA70B405C0A12C03D1F99405C793F401FB138C0CDD1C53FD497AE40B5FA62C0074293BF4D17B4BFA94D2FC012788DC0A8D10BC065FDBE3FA5E2873DD7C6033F4967A6C030F01F40E9418840C992A04005D17A3F89E998BF7CB2C93CB952A93E78EA26C02B31824038B861BF706938C02FCE8DBFF6FEAA407ED12C4085D610C00CE8163FA6482FC07AFB154034C5D33EDCA82CBF4AFCE73F78D3EC3A667E64403EB4B7BECBE899BE6929413F0046073F2BC541C06BEF07BF9A7066406A7E8A3F550C6A3F1509B53E466660C08690B44032567B3D75D007BF6549653F71BFFC3C62381E40B41398409EB6F13E2F13203F64381FC03FBE3E40868225C0817832C09A488EBE3F81C3C00E8D7AC02A00C33F5C178ABF5D6320406A17E83FDE6487C06BF6F2BF9E4F643E2BCE8DBF7EBC1B3E4BDFA13F522855C0CD6F21409B8A8140CAADCD40A000333F3E6FE83F839D7E4018B80AC07DCD283EB9A44D3DF76452C0EC7C37C058103ABFD0F40A400FC546404670D13F24F4EF40270EDABFD45488408D4231BFD29957C08163253FF63B403EF6B491C08EC2CC3EBF3DD5C0528A9D3D4EB692BF505ABB406428D13EEAABF2BEDB2802BF538939C03F63953F23F8F33F2D5D1BC01354994098DBBABF3958E1BFD8FBB23F015D8540529839BE47A04F40E8088ABE8F4AABBF812CA04018A2B1BF5A9E0FC1B5EA7940087BCCBFA64508C1BAEF0E3E2B43263F989174C0BE71223FBDE583BF602A6AC03A387740B36C8B406DC72BC049CAAEC018BA6D4014EADD3E47B4AEC0408757C0B22A3C3FE3A5B73FEFBBB140A3391CC09B03BB3B80661340D26E273E748875405EFA39401C544E401688A03EBC2344BF14A27C401552C2404DF3963E438223C036362CBFFA483B40461FAAC01DE27F3E06BF83C0E8240940323664BFA6B42C3F5105143F1EA9B3C07497F9BF144851C05A4A50BEC4D9E43FA7F5883FB5CB41C0997885BF4CD5563E3E514FBEBC0753C03E37D5BF7292AEBEDA44B6BFC2C0C1BF219D95C0C2015C3E1AE2A4BF279FEA40C7C64F40E348E93E181E55C0F0AC1CC083A0053F11D701404C79594031D9FE3F781C12C048E1A4C0B05720C07B058B3F967ADD3FE2220E4064647F407CF784BF263C8A4071E6CE3EEBA805405943CA3EF0E7454002DDE5BF2D08B63F7CC5CDBDA22F83BF8EBA0D406CF153C0452E88C097310540578BC1401C80E83FA066B93F36A4D3BFBE67E93E67FABE40A66D19C09DEB6040A3A37D3F5F6CA73E06CE154024ACB34006908C3EE445A13FC68DC6BEBD25EBBED0B8C1BEB38F0D41A9134AC08BEC42C0EBE49FC01983E7BF51150940564E6D4053A3013D162CD73F5B9465C0B3BB9AC04D1EB8C0BD7BCA3FE024C940B34BF8BEBBF036402C9A0E40DDBBBA408F7C7540BE7C2640F82F3EC0102434BDE5A60640D8B1E8BF90DDAD40BEACC8400BD55BBFB318EABF0376523FF6ABE53F121D744007F319C07316CEBF2DBF95BFA491F6C0A4D802C0C10BA4BE96D831C00F849A400B13463FC10201C0749782C01BAA3F3E9F960C4042784AC0E26B6FC0F8E9BFBF11759E3EC8B4CBBFE23C30C0F8D574BE88246DC02E2C3640912679403757084038F3963CBD47DC3F9ECAF6BFD813804026B99EC00A868D3ED16C83BFF42EE63FC2077B40784A08C0F5612E40CB9BDE3EB5891540D1AA9CC07BAE083F2094A43F8233783F65729DBFF2FA60C033602540E6C166BF75C2B2BE7FD43EC024B7A0BE1DE663C073B3AABF0F3BECBE0A862C3F6E01B3C02F9B8DBFF8356F3F637606C0D289AE3E992212BF2EB48D3EA72605C0BB38B73F704E7EBF53DB2140EFAEE3BF08AB9C3FBE42A2BF962D60BF9A7DEF3EC2B9FE3EB617FFBFCAF8F23FEB3B223F3D96DD3F94B8984016D699BFAA261DC09E34F83D9FED2840F04AC6C063BFDDBFBD769140C4A839BEBF61CE3D9495A6C0A022A640EDD93F4074C4293FF7D61FBE"> : tensor<3x5x40xf32>
    %1 = stablehlo.constant dense<[[[7.50803661, 3.86079717], [-0.313153088, 6.40586615], [-0.664600193, -0.742903948], [-0.086251676, -0.901926994], [-2.61716938, 0.844201624]], [[1.07515502, -0.201830685], [1.72838163, -1.66086316], [-3.76990271, 1.1908282], [0.0575358495, 3.0133245], [2.23718524, -3.16113257]], [[-7.44928312, -1.79697275], [-5.47873688, -3.98000479], [6.463410e-01, 0.841596722], [-2.37171745, 4.86224556], [0.0059759859, 3.1240921]]]> : tensor<3x5x2xf32>
    return %0, %1 : tensor<3x5x40xf32>, tensor<3x5x2xf32>
  }
  func.func private @expected() -> tensor<3x5x40xf32> {
    %0 = stablehlo.constant dense<"0xC5C2A440D641F040A19EA13F7936ABC0D676D53FA70C1C400F2AD83F0B3629C0B5CFE2C0F59CFD3F50F0FF3F1DC6E2BF78909A3FA363903F8931AA3F837492C0CF278540E79AC3BF8E9525406BD4DABF0D503840E28EB0BF6FA8463FF1243E40038280BFEAC5D0BD851009C0A0EB843FF06109BFF2C430C0B15D394097E20EC0949CCA40C5E6A040462BF63FC3716BBFEC698340E7CC803D8436983FB49DA940BF5B94C0DBFCCC403BE0963F2EA5BDBD5846A6BD83D5053F012829C0E864F83E59976EC0158DC5BE8B0A5540C013BE3F83B6FE3E2696D2BF673730C0F9B1A9BE1BA490C002421B40FB0372400FF3373F59B601C02A16D9BD484CCF3F94D4384077A5D93F3C2113C048CC193FB2D335BFF5347ABFE3199F3F0ED5B0401FA6EBBFC67A0E408DF78040668246C075190F400785B9BF767C4940D46168BF78F000402EA41240F94C3740595C8D3F8660E03F422DBBC0A949E740E8AF7FC010F9C13F84950EC0278C95BF771B8A3FC2E460C0F62E1240A1E09E3FEF145B40F805F63F53B3EB40E2C43EBF437DBE3FE94787BF135AEBBFCC358F3E1FA4A6BF7C00DDBF7EF282C0C45A384040CBEEBFF5F889BFCE3C1AC03A66F33ED5BC0DC050ED10C044F55DBF678345C048B9893F94A4A23F7E1295BF13912FC067AE313F0717863FD29998407E84723F79D0EFBF0A2686C00EC528C0F7F28FBF4C2848BF2693B740ACB82F3F8845BE3EB9FAFF3DCBF08C3F9A73D23FC7FC24C0140AD34075CA813F222EA3402A91A6407DC39F408168273FADBAE0BF9E4DD2C004858F40980E1D408E9332C0163D8340F0BF2440AB57E740B1C70FC06ADABBC07EDC6FBD91906240B6318D402F9B2041862697BF5FC2F940360BC0C0B161213FED4BB2BFA4E8F13FFCFD31BF991D583FAA9B963EF26607405F355EBED7CD18409F8875C0AE86CDC027D03F40B28371C0B0E15F3C3E4C16C049F6A04024F861402EE374BE6BFDFA40EDE5913FBDB777BF54B69F409D7A05C06CE298C038A2393FB8A1CEC00E536B401A8BEA3F278AB8BEF41C8A3F69A336BE8355AFC0082E1140AD9F6D40674C0B400943D0BF803F3140E6971C403740F93FEE3F26C044DFA940FD7D13C01C7E993F87125EBFAE9E893F9B74A9BF71DB61C0B637CABFCF5915C15EEDE73F0B171AC0ECE9AD3E0F458B3E89277A40C8A313C0DFCA6E40CBF7A4BF4B414F40C8DADF3FD25DD740B6CDA5C0A03FA23E83B8603E400D0EC088A87B3F0070B23F2BA6EA3E7208C0C0EB63A13D2AD540C0F81062C01B4C9A3FDE47753E120C4E4062A2E83E0E3EC74050336E3E4195F640D223BD3F4EE4AC3F817740BF96AF2F3F71BFE1BEEA9A27409C3BDD3F8FB7C6C03D6189C00ACBC0C0DFA02BBF872512C06403974031CF1D40CEA70B405C0A12C03D1F99405C793F401FB138C0CDD1C53FD497AE40B5FA62C0074293BF4D17B4BFA94D2FC012788DC0A8D10BC065FDBE3FA5E2873DD7C6033F4967A6C030F01F40E9418840C992A04005D17A3F89E998BF7CB2C93CB952A93E78EA26C02B31824038B861BF706938C02FCE8DBFF6FEAA407ED12C4085D610C00F6D983FA6482FC07AFB154034C5D33EDCA82CBF4AFCE73F78D3EC3A667E64403EB4B7BECBE899BE6929413F0046073F2BC541C06BEF07BF9A7066406A7E8A3F550C6A3F1509B53E466660C08690B44032567B3D75D007BF6549653F71BFFC3C62381E40B41398409EB6F13E2F13203F64381FC03FBE3E40868225C0817832C09A488EBE3F81C3C00E8D7AC02A00C33F5C178ABF5D6320406A17E83FDE6487C04FDA40409E4F643E2BCE8DBF7EBC1B3E4BDFA13F522855C0CD6F21409B8A8140CAADCD40A000333F3E6FE83F839D7E4018B80AC07DCD283EB9A44D3DF76452C0EC7C37C058103ABFD0F40A400FC546404670D13F24F4EF40270EDABFD45488408D4231BFD29957C08163253FF63B403EF6B491C08EC2CC3EBF3DD5C0528A9D3D4EB692BF505ABB406428D13EEAABF2BEDB2802BF538939C03F63953F23F8F33F0B2E0F401354994098DBBABF3958E1BFD8FBB23F015D8540529839BE47A04F40E8088ABE8F4AABBF812CA04018A2B1BF5A9E0FC1B5EA7940087BCCBFA64508C1BAEF0E3E2B43263F989174C0BE71223FBDE583BF602A6AC03A387740B36C8B406DC72BC049CAAEC018BA6D4014EADD3E47B4AEC0408757C0B22A3C3FE3A5B73FEFBBB140A3391CC09B03BB3B80661340D26E273E748875405EFA39401C544E401688A03EBC2344BF14A27C401552C2404DF3963E438223C036362CBFFA483B40461FAAC01DE27F3E06BF83C0E8240940323664BFA6B42C3F5105143F1EA9B3C07497F9BF144851C05A4A50BEC4D9E43FA7F5883FB5CB41C0997885BF4CD5563E3E514FBEBC0753C03E37D5BF7292AEBEDA44B6BFC2C0C1BF219D95C0C2015C3E1AE2A4BF279FEA40C7C64F40E348E93E181E55C0F0AC1CC083A0053F11D701404C79594031D9FE3F781C12C048E1A4C0B05720C07B058B3F967ADD3FE2220E4064647F407CF784BF263C8A4071E6CE3EEBA805405943CA3EF0E7454002DDE5BF2D08B63F7CC5CDBDA22F83BF8EBA0D406CF153C0452E88C097310540578BC1401C80E83FA066B93F36A4D3BFBE67E93E67FABE40A66D19C09DEB6040A3A37D3F5F6CA73E06CE154024ACB34006908C3EE445A13FC68DC6BEBD25EBBED0B8C1BEB38F0D41A9134AC08BEC42C0EBE49FC01983E7BF51150940564E6D4053A3013D162CD73F5B9465C0B3BB9AC04D1EB8C0BD7BCA3FE024C940B34BF8BEBBF036402C9A0E40DDBBBA408F7C7540BE7C2640F82F3EC0102434BDE5A60640D8B1E8BF90DDAD40BEACC8400BD55BBFB318EABF0376523FF6ABE53F121D744007F319C07316CEBF2DBF95BFA491F6C0A4D802C0C10BA4BE96D831C00F849A400B13463F84979B40749782C01BAA3F3E9F960C4042784AC0E26B6FC0F8E9BFBF11759E3EC8B4CBBFE23C30C0F8D574BE88246DC02E2C3640912679403757084038F3963CBD47DC3F9ECAF6BFD813804026B99EC00A868D3ED16C83BFF42EE63FC2077B40784A08C0F5612E40CB9BDE3EB5891540D1AA9CC07BAE083F2094A43F8233783F65729DBFF2FA60C033602540E6C166BF75C2B2BE7FD43EC024B7A0BE1DE663C020F147400F3BECBE0A862C3F6E01B3C02F9B8DBFF8356F3F637606C0D289AE3E992212BF2EB48D3EA72605C0BB38B73F704E7EBF53DB2140EFAEE3BF08AB9C3FBE42A2BF962D60BF9A7DEF3EC2B9FE3EB617FFBFCAF8F23FEB3B223F3D96DD3F94B8984016D699BFAA261DC09E34F83D9FED2840F04AC6C063BFDDBFBD769140C4A839BEBF61CE3D9495A6C0A022A640EDD93F4074C4293FF7D61FBE"> : tensor<3x5x40xf32>
    return %0 : tensor<3x5x40xf32>
  }
}
