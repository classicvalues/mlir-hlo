module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0:2 = call @inputs() : () -> (tensor<1x20xf32>, tensor<20x20xf32>)
    %1 = call @expected() : () -> tensor<20x20xf32>
    %2 = stablehlo.broadcast_in_dim %0#0, dims = [0, 1] : (tensor<1x20xf32>) -> tensor<20x20xf32>
    %3 = stablehlo.minimum %2, %0#1 : tensor<20x20xf32>
    %4 = stablehlo.custom_call @check.eq(%3, %1) : (tensor<20x20xf32>, tensor<20x20xf32>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<1x20xf32>, tensor<20x20xf32>) {
    %0 = stablehlo.constant dense<[[1.08225894, -2.64232659, -2.73597956, -0.260272473, 1.20162904, -4.60820055, 3.54514265, 3.03177953, 1.40210569, -1.1874733, -4.15587187, 2.26530695, 5.11865664, 2.37332678, -8.53027057, -1.67391729, -2.95138097, 1.78292692, 0.538767099, 0.583113909]]> : tensor<1x20xf32>
    %1 = stablehlo.constant dense<"0xD2A61240BAE0B13FC6718A4098E0083DA9EBBC400F161CBF09BC83BE07A183C0C96961C0F4B4BABED58C61C00EC1FBBFFBC626C0C1AF80BF3832674069DCE33F5A6796BDE1AD5EBF71C1F5BF55824EC02318014005233C406F0896C020CCD33F016368C079931FBF542101BF722541C02C5338C08652273F177601C0362F52BED576D93FD69377C0861030400A609C3F5F869740DE88C240E38E05405809433F670A41408E9510C06611FDBE9D77473EFBA7A0BF3B952CC021F483BFC3743D409C604E40BF7522403D6BE5BFFAAF723F3D6227409BE1B53EC552F0BFDBDBA5C0EC64A4BF8F09B23F8E7F8D409762ECBFFC043E405E646F40D9BAF1BC9815B43DFC1FDDC0C8993CC0AB448F4085A5EBBF27ED79BFF3749CBFC90B0DC0C245BABEC6B397C0F56CC2BDE9DDE83FECA135BFB1FC1B403612DABFF50F48BFE78839408017CC3F9629AABF4DF4B4BD6A709B3FD5C1573F14CB35BEBCE6A2BE90E57D40C86468C06858B7BF6709064057F62ABF7FBE7CC09EC46CBF1B0667BFA5270AC0CF0B613F24801140FB9588C09193A4BFF6A37FC04A7C1B4017A587C0AECFE7C0D671B2C047375C3F16B9D73EB5CB46C050F8C7C04ACFCA403A6C30C051A634C085AA9C3D33B5D33F79FBD63F426DD23ED55D843FD42F8A3FF7074CC0EBDFAF3E2E05A13F0C8D9BC08F872640072618C0078A4240AB3C47BFE10A623E69F8D0BF53830A41397302C094801A409EBA9AC0E0665640CB136F3E6120F2BEC4CAFABEFE36953FD6BBF83FF37314400BA6554017EC544074AA06404D794FC05C1CAF3F46050EC0E3E493BF11B5653F8345F5BFDEDAE0C0C82A794006D992401E0EC540F32A7FC0B94C42C0936FAAC0FEE666BF64D49CBEE501053F0768C43D3455FEBF5F732A40361FF63F07BDD2BF638F90407A229CC0175C21C05A926DC025806FC059533E40DC531340AB5D21BFE260BE3E23827A407D389EBFE915114103E0C43E1604A9BFD2676C3F603722C019248540FFFBCABF6E4CFEBE789E494011C856C0A0358040408C58BF888D7ABC85ED413F132861BFFDCE0040B8F82FBD5CE135C0462820BF5473FBBF4C1E76402AE427C05B905DBFF6F5B0BEE2BC023FBDF897C09EB5EC3FFEFF7C40F969C3BE11677DBFDF4999C00764873FFAFADE408EAE22C0500EE340D24BC1C0864394BFF71770C0C0B9F53F21D981C07C486EBF1F6106C0135E0B402F4880BFA58F0B3FF36BA7BDCE854EBF141BB0BF0FA53D40F33E8CC0042857BD3B687C3F836489C09727853F26069DBFD7CD45C013A8F43F7204643FEAF619BF152881C01E6609C0F46CD9BF1F31833EE3B88A3FB31A4BC00B2D503ECF630DC0748109BFEE6FA03EB39848C09E316CC051EF08C0A3EB02BEC2270340C8E327BF7264B3BF106A71C04CEC2F409F4D364061FA984037B8F73FA9339C3F889FA3BEADD6F13E6E386A40A3040940878DF1C01B08B1BED35AF7BF87D702C02E68C13F2169A3BF17DEA6C00F2E5240C208DB3EAE970C402A67A0403B4FB9BFC41F45C0353D84C0261A77404DADF63FC9CAC0BF8D144B40A5BE90401058AF4046EDE2BF1643D33FEAF6C83E375396BC57B1FFBF72F1D1BFF5F2D43E3F7F1BBFCBED9C4014325F400F80A23C5E1C5D3FD340F33FE6104D4017E0ADBF70000CC084263EBD9717824084F64440E06B1EC0396CD8C0F562FD3D79CB1B3E285264BF886612C051FEC9C046F119C0C9426E40352D8BBF1CEB26BE79C491404EFE4240AADF06406D25643FF56652C0D68B05BF206865C0C088B1407183BCC030A7EEBFE650583FF909B0C0FF356ABD9BD06840E1F8A4BFD89C1F3E0BB5AABEA49514C03B26BC3F4E1EA0BFA17DBCBF2ABC18C0E222F43FADF64CC07DF4FCBF4D478F3FE5BC84BFA2218340167CA540C528B23F6C9B85C03C58673FFEA176C0AE8F27BFA3C6243FDAAE6740BF00994063213DBF46CD314037CE8B3F4A745BC056FD903F7E8FA73F0E82F8BE0CFFF2BF1C8A0D40CCB388BF0A940D3FFFE91A40886B21BF4EA1643F3F127B3E9E940E4194F4E5BF11742EC0A6D545C0282DCBBFEE36C3C04B457F40BFBD2CBE0036A1C03D4B4D3DE0B9354043C2ABBF51BB9BC0316E813F19C45FC0B9B6E53DE0A506BFEBB90DC00CF94FBFD72455BF2DB943BF1869CC3F81FE593F43D593BFC2AF7D40197487BFE8A2313FC485193E16675A3F2AE1D7BE56B58CC0CC93373F9BB0D93F94C73FBF7AC96140A84E60C08CD086C0CFFEAABF"> : tensor<20x20xf32>
    return %0, %1 : tensor<1x20xf32>, tensor<20x20xf32>
  }
  func.func private @expected() -> tensor<20x20xf32> {
    %0 = stablehlo.constant dense<"0x76878A3FE11B29C04A1A2FC06F4285BEFBCE993F617693C009BC83BE07A183C0C96961C020FF97BFE7FC84C00EC1FBBFFBC626C0C1AF80BFFD7B08C1EC42D6BF6DE33CC0E1AD5EBF71C1F5BF55824EC076878A3FE11B29C06F0896C06F4285BE016368C0617693C0542101BF722541C02C5338C020FF97BFE7FC84C0362F52BED576D93FD69377C0FD7B08C1EC42D6BF6DE33CC0F336E43FA4EC093FF446153F76878A3FE11B29C04A1A2FC06F4285BEFBA7A0BF617693C021F483BFC3743D403378B33F20FF97BFE7FC84C0FAAF723F3D6227409BE1B53EFD7B08C1DBDBA5C06DE33CC08F09B23FA4EC093F9762ECBF76878A3FE11B29C04A1A2FC06F4285BEFC1FDDC0617693C09EE3624085A5EBBF27ED79BFF3749CBFE7FC84C0C245BABEC6B397C0F56CC2BDFD7B08C1EC42D6BF6DE33CC03612DABFF50F48BFF446153F76878A3FE11B29C04A1A2FC06F4285BED5C1573F617693C0BCE6A2BEAD084240C86468C06858B7BFE7FC84C057F62ABF7FBE7CC09EC46CBFFD7B08C1A5270AC06DE33CC0F336E43FFB9588C09193A4BFF6A37FC0E11B29C017A587C0AECFE7C0D671B2C0617693C016B9D73EB5CB46C050F8C7C020FF97BFE7FC84C051A634C085AA9C3D33B5D33FFD7B08C1EC42D6BF6DE33CC0D42F8A3FF7074CC0EBDFAF3E76878A3F0C8D9BC04A1A2FC0072618C0FBCE993F617693C0E10A623E69F8D0BF3378B33F397302C0E7FC84C09EBA9AC0E0665640CB136F3EFD7B08C1EC42D6BF6DE33CC0F336E43FA4EC093FF446153F76878A3FE11B29C04D794FC06F4285BE46050EC0617693C011B5653F8345F5BFDEDAE0C020FF97BFE7FC84C0CAFA1040F32A7FC0B94C42C0FD7B08C1EC42D6BF6DE33CC0E501053F0768C43D3455FEBF76878A3FE11B29C04A1A2FC06F4285BE7A229CC0617693C05A926DC025806FC03378B33F20FF97BFE7FC84C0E260BE3E23827A407D389EBFFD7B08C1EC42D6BF6DE33CC0D2676C3F603722C0F446153FFFFBCABFE11B29C04A1A2FC011C856C0FBCE993F617693C0888D7ABC85ED413F132861BF20FF97BFE7FC84C05CE135C0462820BF5473FBBFFD7B08C12AE427C06DE33CC0F6F5B0BEE2BC023FBDF897C076878A3FE11B29C04A1A2FC011677DBFDF4999C0617693C09EE362408EAE22C03378B33FD24BC1C0E7FC84C0F71770C0C0B9F53F21D981C0FD7B08C11F6106C06DE33CC02F4880BFA4EC093FF36BA7BDCE854EBFE11B29C04A1A2FC0F33E8CC0042857BD617693C0836489C09727853F26069DBFD7CD45C0E7FC84C07204643FEAF619BF152881C0FD7B08C1F46CD9BF6DE33CC0E3B88A3FB31A4BC00B2D503ECF630DC0E11B29C04A1A2FC0B39848C09E316CC0617693C0A3EB02BEC2270340C8E327BF7264B3BFE7FC84C0CAFA10409F4D364096E41740FD7B08C1EC42D6BF6DE33CC0ADD6F13EA4EC093FF446153F878DF1C0E11B29C04A1A2FC087D702C0FBCE993F617693C017DEA6C0AD084240C208DB3E20FF97BFE7FC84C03B4FB9BFC41F45C0353D84C0FD7B08C1EC42D6BF6DE33CC0F336E43FA4EC093FF446153F46EDE2BFE11B29C04A1A2FC06F4285BE57B1FFBF617693C0F5F2D43E3F7F1BBF3378B33F20FF97BFE7FC84C05E1C5D3FD340F33F96E41740FD7B08C170000CC06DE33CC0F336E43FA4EC093FE06B1EC0396CD8C0E11B29C04A1A2FC0285264BF886612C051FEC9C046F119C0AD084240352D8BBF20FF97BFE7FC84C0CAFA1040AADF06406D25643FFD7B08C1EC42D6BF206865C0F336E43F7183BCC030A7EEBFE650583FF909B0C04A1A2FC06F4285BEE1F8A4BF617693C00BB5AABEA49514C03378B33F4E1EA0BFE7FC84C02ABC18C0E222F43FADF64CC0FD7B08C1EC42D6BF6DE33CC0F336E43FA4EC093FF446153F6C9B85C0E11B29C0FEA176C0AE8F27BFA3C6243F617693C09EE3624063213DBF3378B33F20FF97BFE7FC84C056FD903F7E8FA73F0E82F8BEFD7B08C1EC42D6BF6DE33CC00A940D3FA4EC093F886B21BF4EA1643FE11B29C04A1A2FC094F4E5BF11742EC0617693C0282DCBBFEE36C3C03378B33F20FF97BF0036A1C03D4B4D3DE0B9354043C2ABBFFD7B08C1EC42D6BF19C45FC0B9B6E53DE0A506BFEBB90DC00CF94FBFE11B29C04A1A2FC06F4285BE81FE593F617693C09EE36240197487BFE8A2313F20FF97BFE7FC84C02AE1D7BE56B58CC0CC93373FFD7B08C1EC42D6BF6DE33CC0A84E60C08CD086C0CFFEAABF"> : tensor<20x20xf32>
    return %0 : tensor<20x20xf32>
  }
}
