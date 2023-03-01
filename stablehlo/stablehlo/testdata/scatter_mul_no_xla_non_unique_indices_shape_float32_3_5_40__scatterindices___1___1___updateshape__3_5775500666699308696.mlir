module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = stablehlo.constant dense<1> : tensor<2x1xi32>
    %1:2 = call @inputs() : () -> (tensor<3x5x40xf32>, tensor<3x5x2xf32>)
    %2 = call @expected() : () -> tensor<3x5x40xf32>
    %3 = "stablehlo.scatter"(%1#0, %0, %1#1) ({
    ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>):
      %5 = stablehlo.multiply %arg0, %arg1 : tensor<f32>
      stablehlo.return %5 : tensor<f32>
    }) {indices_are_sorted = false, scatter_dimension_numbers = #stablehlo.scatter<update_window_dims = [0, 1], inserted_window_dims = [2], scatter_dims_to_operand_dims = [2], index_vector_dim = 1>, unique_indices = false} : (tensor<3x5x40xf32>, tensor<2x1xi32>, tensor<3x5x2xf32>) -> tensor<3x5x40xf32>
    %4 = stablehlo.custom_call @check.eq(%3, %2) : (tensor<3x5x40xf32>, tensor<3x5x40xf32>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<3x5x40xf32>, tensor<3x5x2xf32>) {
    %0 = stablehlo.constant dense<"0x5967D1BF226BEC3F7BA76D3F5283C3C001DA5CC08C0AAC4081510A4057A02240A14EE3BE4CD8853FC8CD0FC0D6780B40268B493FED0172408B19A7BFBE4535401E9454BFB6F6DBBD4BFF773EDA23E0402F57AC3F17BC183FC9FF92BFDAD6FBBFD36CE2BFEC8B7EC0B7BC86C0C16E9B3F843DF83F559CB53F174AF93F25E959C03C6E7F408C5CA740950E994050D2E83EB0765B3F8AB0C2BF3D95884006F67040F3463CBF6D4DBABF0B9FE4BFD5263EC00C4DB83EBB42263ED11097BFB4B21D40CE59F53F6E78EBBF59B08DC0D7D227C051692F40301CC4C06BD25840A59C4140F4BCED3F4D870E40C5737DC0DDBEA140E827AC40310552BF09B736BE4EAECB406F6AC2BF67859440BFDE8D404BE2843F166EE43F2955AFC08D72FA3F70355640E0DD0DC05EAAEB3F5746E8C0AE828ABDD511B640CA06FDBFD2E204BDD0BC04406AABAABF6F470BC06CD44F3E554B35BF079FE84081ED41C020A604BF3275F23EBF487640670ACF3F5F9FE3C0DF389BC0266E7BBF22B7643FB94D5540C393F23F5C433940929D1F40DA2BE4BF5CD95840E8585B3E3058AEBEC23761C03AD1CC3E58501DBED0A22C3DDB1AD33F36DD60C06A34A13EA487143C2316F5BFA21E4CC0F876B53F659890BEF38ADABE2D9D02405F7D943F3D52474038355B40403AADC05FD85C403E186B3F0E9DFB3F37FC42C04E419C404C02B140758A6E3DBBF49BC07268233E0ACA93BF0EB8BD3F78C2CEBF1F2833C0CE7F31C096F610C061B89FC0B8C6233FDDB21CC07E500DC00FDE99C089E2A4BFAA005D4013A02440F822E1BF9DB3FEBF3FC40D3F9E800EBF1D48EB3D1B858F3F76F4163DCC67A23F7DC41BC07CDF6F403626F03FB3BDBDC09CE516BD13DE5640E9297BC0CAD8B2BDFE6F60BD651CBCBE026291BF6435E7406DE479BE59693A3EFECAA9BD2482CCC012FF5C4010F694C07EDD28C026F0A0BFA7BF70C003F42040C06B8440F73F993F87BB2D41CC952ABF1632F23FDAD6EC3FCB0CBD3FCD177740E26F0FC031ABB3BF50B2823F564541C0C1DA8740C0BF41BF9F6DA6BFEB75364039F3CB40E4982CC0BAB07A40A8E5B13FCB9BCEC0208A00C09769B0402203813FEDBAB9BF6B8A3E40A5380F40AD497540C5CC4C40A6945A4069EFA13F26A8374065057540E396AFC0AFCD67C009E2ACBE2C497B3FC97B34C038EB263F64B693C0FDA65F4005D9BB3F5E2434403283EFBF10FB073F6333C9BFB04D4E3FA94B69C044AB7C3FF64D31BFB08147C0298C3140C7E3AD3FEA08ED3F9408F43CF01415C0555794BF719290C00F70A43F8DD7803F7D537EC00AC237C0472A2240DC423BC07FDA20400D462940D2BC0CC0A58EF93F8A1A70C04CC9DCBF21DBD7BF9E64423FFF5FEC3E3C085ABEF956A0BE057596BF433866C085F7B940AEA406BFD78B8740DD71C2BF7ED7393F691624409A0E23408AFF0B40915586401B81BDBF86E03AC091871EC0CB8910400E9AB53E598914C0FA89673FD8AF93C038DA95BF7D992640EA3987C005F1D84057C4B5408FB7EB3E24D7C03F7F1CA3BF06C60A3F8990AC3F81DE9A3F350E82C00F2BB43F1E03C840C13CCCBFFF51C1BF76A56A3D71E3ED3F8C589340712CD73F6C3616BFD6BB933FE29110C0D43394C015D103BF7D1905C0E9B3CABF6F01A03F783C1E40BC41023F4AA0F4BF35EC3DC0A1C625403F5ACC3F7AB8EBBF45E67EC0ACEE50BFA1DCE0401CBEB23F9CA2B2BF5502B24054D31F40F861E2BF99152DC042DAC5C0BDFC9340DD1B88BE2B3A9E3E28AEC8C0D683E1C072E06F3F7B27C740990E6B3F00125340278FAEC052824340974D053F6E63AE3FED87CEBFE108D640E0A3DB3F96F3A7BFEFF847C0D81C09C004499D3E633495400B508DBFF72EAE3E79DF19C03FC2B23FC9A8144063F928C00DD89340F4A77C3D215CAE408F2352BFB16854C019A2AEC09E5712C0ABA94240F2ECB43F082711C009B4D43FBD58AA3F5288F8BDCE950EC0B66D843E990C0640B764953F78C5C93FD206B73E295D85BFB566E73F85A53C3F8A65254099A8F33FC425AFBF09E2BC3DEB153A407131D8BF1BBFE8BF0D9543C05667A2BF5030353FE9425CBFACD473BF1E4F134087C9EFC0C976D13E23B96DBC4A2E1740A44D5C3F051978C04DC108C05B88E43F59D03EC01FF2B440394499BFD1BDC63F8B8900BFE6536540692B14C068A7C53E3754F73EF78589C0554C723EE343A5BFC7944E4059B5993FEC2F09400A762C40031A2A4025826940E96FD2BFEA50B2BF5D68D3BFC61137404B24E8BFA50B5140919BC3BF984A6DC0B02E89BE3A9669C0CF375FC05DC8BCBEEB1CD5BF576EC83FAE26C1BF022D8AC0413E72C0EF052940CA0389C0C8EDC0C0274956401D21A5BF035E5AC012E29240217BEF3FD34558BFA4F49A3E2D5604C0F8048D3F8EE25940E9207E4043731D3F8CE27EC0C34CA7C00209843FD7C53340AD6689BE2ED8983F5A5F0CBF209249C0C1959A40EF41B63FACDB05C00113773DB7810E40B4BAAEBF676E9D40634E293F76682440BC759FC0096E403F609DE9BEF10E8B3FE4BCEE3F380E8AC0B1F8C43F44DB34C01A7A0BC07F378E40A46EA340ABF38D40FECFB73FFC612A3DB10A843FAE635B40D89D32407FEFBC3D4DAE10C0911515BF374A82C03CE00340D5C4083F6CA000BFD7431EC022ACD2BFE367A2BE93AAB1BF43470D402D404CBF08DD35C00C34ADBF27053A3F132D74BF2F7CF34063045040F1C28ABE33D8E0BE6D6EFD3FBC6B5A40551854C0D15FE23FA895D1404F86423FC32ED2BFCEA3223D259DC7C0F083634093F79F3F62C18940C71BBAC0A2B09C400604FD3FA5249B3F4F912BC0CDBB5BC09E53E1BF06B145C07C5D4640BC0163BF6680123F2B7E2FC02CB67E402A758D3EFF122DC05948A64001298C4062CE3740BACA3AC0A7CB2840B04D4BBE1226A5406D7106406C63A53F80162940F03F37C0C5304CBECCA1D340ED0E80C0B40021C112EA6A40CFDC57406AB040C0843A63C0A6758440DC0639BE48E0D23E5D1B903FC45167C0DFB490C0C4B074C084FD563E87E9ECBF838A843F5DCCEBBFD36BB740572DDD3F0B89713C95978AC0DBA0F3BE543D6CBFF22AA4C02C8BD9BF957B8F4082702540D2AA84BFDEEF58BD048AA9BF7C4D23408A1802C0D7398FC0320B49C065E08DBF5FB51540BBCE0BBF12F7C83FC66B81BE1D0A29C044929ABF4CEF8DC0CC7D05C0EDBAACBFC09F24BF61D7E23F365CD3BF0D131C4052AA25BF0FB382C0B0929240837C21C052FE623FBE8497BFA8E778BF70E6F53F021A214017E98A4020C29B3F9DCE0BC0AA6D03C01B6AB0C0439C703F96E81FC0645533BFBDEF1F40A29D9F3F003E83BFE3466040783FE5BF40FB2AC0B7571F40536216C0"> : tensor<3x5x40xf32>
    %1 = stablehlo.constant dense<[[[0.555985451, -0.932054638], [0.27871868, 2.42967057], [2.14681721, -2.13165522], [-0.785429894, 1.40192568], [5.63768625, -3.85060382]], [[-1.97282672, 1.21990407], [0.76709479, -2.35087562], [-3.8956449, 0.223810911], [-0.880022883, 5.81911945], [-3.360670e+00, -7.48637485]], [[1.21662235, -4.11434793], [-1.79223299, 3.23124433], [1.70358372, -4.29698229], [-1.51731503, 1.90307593], [-2.66366816, -2.19226527]]]> : tensor<3x5x2xf32>
    return %0, %1 : tensor<3x5x40xf32>, tensor<3x5x2xf32>
  }
  func.func private @expected() -> tensor<3x5x40xf32> {
    %0 = stablehlo.constant dense<"0x5967D1BF3E0775BF7BA76D3F5283C3C001DA5CC08C0AAC4081510A4057A02240A14EE3BE4CD8853FC8CD0FC0D6780B40268B493FED0172408B19A7BFBE4535401E9454BFB6F6DBBD4BFF773EDA23E0402F57AC3F17BC183FC9FF92BFDAD6FBBFD36CE2BFEC8B7EC0B7BC86C0C16E9B3F843DF83F559CB53F174AF93F25E959C03C6E7F408C5CA740950E994050D2E83EB0765B3F8AB0C2BF3D95884006F67040F3463CBF76537CBF0B9FE4BFD5263EC00C4DB83EBB42263ED11097BFB4B21D40CE59F53F6E78EBBF59B08DC0D7D227C051692F40301CC4C06BD25840A59C4140F4BCED3F4D870E40C5737DC0DDBEA140E827AC40310552BF09B736BE4EAECB406F6AC2BF67859440BFDE8D404BE2843F166EE43F2955AFC08D72FA3F70355640E0DD0DC05EAAEB3F5746E8C0AE828ABDD511B640CA06FDBFD2E204BDD0BC04406AABAABF42581F416CD44F3E554B35BF079FE84081ED41C020A604BF3275F23EBF487640670ACF3F5F9FE3C0DF389BC0266E7BBF22B7643FB94D5540C393F23F5C433940929D1F40DA2BE4BF5CD95840E8585B3E3058AEBEC23761C03AD1CC3E58501DBED0A22C3DDB1AD33F36DD60C06A34A13EA487143C2316F5BFA21E4CC0F876B53F659890BEF38ADABE2D9D02405F7D943F3D52474038355B40403AADC05FD85C40DE6E81BF0E9DFB3F37FC42C04E419C404C02B140758A6E3DBBF49BC07268233E0ACA93BF0EB8BD3F78C2CEBF1F2833C0CE7F31C096F610C061B89FC0B8C6233FDDB21CC07E500DC00FDE99C089E2A4BFAA005D4013A02440F822E1BF9DB3FEBF3FC40D3F9E800EBF1D48EB3D1B858F3F76F4163DCC67A23F7DC41BC07CDF6F403626F03FB3BDBDC09CE516BD13DE5640E9297BC0CAD8B2BDFE6F60BD651CBCBEB040C5416435E7406DE479BE59693A3EFECAA9BD2482CCC012FF5C4010F694C07EDD28C026F0A0BFA7BF70C003F42040C06B8440F73F993F87BB2D41CC952ABF1632F23FDAD6EC3FCB0CBD3FCD177740E26F0FC031ABB3BF50B2823F564541C0C1DA8740C0BF41BF9F6DA6BFEB75364039F3CB40E4982CC0BAB07A40A8E5B13FCB9BCEC0208A00C09769B0402203813FEDBAB9BF6B8A3E40A5380F40AD4975401871F6C0A6945A4069EFA13F26A8374065057540E396AFC0AFCD67C009E2ACBE2C497B3FC97B34C038EB263F64B693C0FDA65F4005D9BB3F5E2434403283EFBF10FB073F6333C9BFB04D4E3FA94B69C044AB7C3FF64D31BFB08147C0298C3140C7E3AD3FEA08ED3F9408F43CF01415C0555794BF719290C00F70A43F8DD7803F7D537EC00AC237C0472A2240DC423BC07FDA20400D462940D2BC0CC0A58EF93FAB7ED8404CC9DCBF21DBD7BF9E64423FFF5FEC3E3C085ABEF956A0BE057596BF433866C085F7B940AEA406BFD78B8740DD71C2BF7ED7393F691624409A0E23408AFF0B40915586401B81BDBF86E03AC091871EC0CB8910400E9AB53E598914C0FA89673FD8AF93C038DA95BF7D992640EA3987C005F1D84057C4B5408FB7EB3E24D7C03F7F1CA3BF06C60A3F8990AC3F81DE9A3F350E82C00F2BB43F1E03C8407012B23FFF51C1BF76A56A3D71E3ED3F8C589340712CD73F6C3616BFD6BB933FE29110C0D43394C015D103BF7D1905C0E9B3CABF6F01A03F783C1E40BC41023F4AA0F4BF35EC3DC0A1C625403F5ACC3F7AB8EBBF45E67EC0ACEE50BFA1DCE0401CBEB23F9CA2B2BF5502B24054D31F40F861E2BF99152DC042DAC5C0BDFC9340DD1B88BE2B3A9E3E28AEC8C0D683E1C072E06F3F7B27C740990E6B3F00125340427ADF4152824340974D053F6E63AE3FED87CEBFE108D640E0A3DB3F96F3A7BFEFF847C0D81C09C004499D3E633495400B508DBFF72EAE3E79DF19C03FC2B23FC9A8144063F928C00DD89340F4A77C3D215CAE408F2352BFB16854C019A2AEC09E5712C0ABA94240F2ECB43F082711C009B4D43FBD58AA3F5288F8BDCE950EC0B66D843E990C0640B764953F78C5C93FD206B73E295D85BFB566E73F85A53C3F060A824299A8F33FC425AFBF09E2BC3DEB153A407131D8BF1BBFE8BF0D9543C05667A2BF5030353FE9425CBFACD473BF1E4F134087C9EFC0C976D13E23B96DBC4A2E1740A44D5C3F051978C04DC108C05B88E43F59D03EC01FF2B440394499BFD1BDC63F8B8900BFE6536540692B14C068A7C53E3754F73EF78589C0554C723EE343A5BFC7944E4059B5993FEC2F09400A762C40031A2A4025826940E96FD2BF2325DF405D68D3BFC61137404B24E8BFA50B5140919BC3BF984A6DC0B02E89BE3A9669C0CF375FC05DC8BCBEEB1CD5BF576EC83FAE26C1BF022D8AC0413E72C0EF052940CA0389C0C8EDC0C0274956401D21A5BF035E5AC012E29240217BEF3FD34558BFA4F49A3E2D5604C0F8048D3F8EE25940E9207E4043731D3F8CE27EC0C34CA7C00209843FD7C53340AD6689BE2ED8983F5A5F0CBF209249C0C1959A4058EF03C1ACDB05C00113773DB7810E40B4BAAEBF676E9D40634E293F76682440BC759FC0096E403F609DE9BEF10E8B3FE4BCEE3F380E8AC0B1F8C43F44DB34C01A7A0BC07F378E40A46EA340ABF38D40FECFB73FFC612A3DB10A843FAE635B40D89D32407FEFBC3D4DAE10C0911515BF374A82C03CE00340D5C4083F6CA000BFD7431EC022ACD2BFE367A2BE93AAB1BF43470D402D404CBF08DD35C00C34ADBFF436AAC0132D74BF2F7CF34063045040F1C28ABE33D8E0BE6D6EFD3FBC6B5A40551854C0D15FE23FA895D1404F86423FC32ED2BFCEA3223D259DC7C0F083634093F79F3F62C18940C71BBAC0A2B09C400604FD3FA5249B3F4F912BC0CDBB5BC09E53E1BF06B145C07C5D4640BC0163BF6680123F2B7E2FC02CB67E402A758D3EFF122DC05948A64001298C4062CE3740BACA3AC0A7CB2840B04D4BBE1226A5404A1BC2C06C63A53F80162940F03F37C0C5304CBECCA1D340ED0E80C0B40021C112EA6A40CFDC57406AB040C0843A63C0A6758440DC0639BE48E0D23E5D1B903FC45167C0DFB490C0C4B074C084FD563E87E9ECBF838A843F5DCCEBBFD36BB740572DDD3F0B89713C95978AC0DBA0F3BE543D6CBFF22AA4C02C8BD9BF957B8F4082702540D2AA84BFDEEF58BD048AA9BF7C4D23408A1802C0D7398FC0320B49C0F01ECFC05FB51540BBCE0BBF12F7C83FC66B81BE1D0A29C044929ABF4CEF8DC0CC7D05C0EDBAACBFC09F24BF61D7E23F365CD3BF0D131C4052AA25BF0FB382C0B0929240837C21C052FE623FBE8497BFA8E778BF70E6F53F021A214017E98A4020C29B3F9DCE0BC0AA6D03C01B6AB0C0439C703F96E81FC0645533BFBDEF1F40A29D9F3F003E83BFE3466040783FE5BF40FB2AC0B7571F40536216C0"> : tensor<3x5x40xf32>
    return %0 : tensor<3x5x40xf32>
  }
}
