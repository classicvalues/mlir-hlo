module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<20x30xbf16>
    %1 = call @expected() : () -> tensor<20x30xbf16>
    %2 = stablehlo.multiply %0, %0 : tensor<20x30xbf16>
    %3 = stablehlo.multiply %0, %2 : tensor<20x30xbf16>
    %4 = stablehlo.custom_call @check.eq(%3, %1) : (tensor<20x30xbf16>, tensor<20x30xbf16>) -> tensor<i1>
    return %4 : tensor<i1>
  }
  func.func private @inputs() -> tensor<20x30xbf16> {
    %0 = stablehlo.constant dense<"0x85BC51BF9DBE423FA43F6F3F8F3EA3BEFCBE164067C0064080BFD6C026C0A54054C08C3FDEBFC53FAA3F7DC03A4001411A409DC01140E93FC74058BE0CC00A3F0DC003BF2FBF7FC06EBF623F9D3D4540D7BFC13C1340843E2AC009C0A9C005C017400CC1023ED73FAFC04F3FC33F3EBFA1BFC9BF7B3FC53F01BF1BBF1CBFEBBF02C06F3F09C00D3F5BBFAC40AF4033C004402ABF8240AF3F9F3B2CBEE4BF78BF88BFDF3FB13FF0C0CE3E6340DA3FE7BFCCC013405AC0813F5B4032C0273FB03F2BC090405640E9402B40BA406240433F0E40764076C0FC3F0EBEC23C1FC0E53F1CC09F40F1BF3A4047BFF2BF29C0123FA9C062BDAB3E0FC0C63F9FBF07407DC058C04140ABBE48C0D3BE9EC09AC08A404CBEEEBFB0BE87C0AAC0983FE0BD94C07A3E7F3F6C3F414091C04C3FC14090C0983E5E40E43E52C0C63DE5C03F40C93FD63FDD3F5940A040A23FD93FFABFCC3F90BFDDBFC440C5C00EC189BEBEBF94BF3EC00CC09FBFBFC0EDC0BC3F9FBFCA40974039405BC072C03740B1C0AF3FA5C0053F13BF4F40154027402040A5BF7140524083C03840A8C0AFBF004081C08CBF11BF91BF913F903FDC3FCE3FBBC06B40CD40DBBF14BF494027C0A14055BE1440E6BE93C027C0BBBFD4C06640ABBF1940B4C0D8BF30C02AC08340024023C03E4049405140013FAD3F69C06A40444044BFCEBFBB3F76C07A40B83FFA3F87C067C0B1408D403C40C2C0A33F104042C07FBFC7BE8FBE77C0E140AE3FAD3EA5BDE1BEF6BF213F793D90405FBF813F09C050BD19C0B0BF15C014C099BF274057C08340DC3FB9C0A93F6AC0C7BF1D4010C01CC0CD3F23C0AC3FD83EFABFA53FA2C09F40C23F51C0433F1940843ED13E563F05C012401F3FC6BFDF3F03C04EBDB6BF4ABF3340A9BF243FFBBF9BBF92C025BF8DC04840813F10402F3FF53ED43ECC401840174096406F3F633F9FC0B9C0D1C0D7407640963FFD407540A83FA23FD6BFC0C005BF4640E9BEABBFBAC0B53F9E3F50BFB8BFD0BE4DC0C440B94049BFE6BF1BC0E73F4E3F16C096C000C0553F27BE8C3F073F1E40323F3E40B3402B40BEBF9BBF1E3E9BBFA6BF03C09740A2BF81BE89C021C043C0933EB540B8406EBE39C0294007BEBD3E953F9740B23E223E674046C057C0D1BF323FE4402E407A40B0BF88C038BFD23FE9BF47C094C0A43E1F414EC0EC3F614087C0C93CD6BFBA3E8E3F08C006C0753E1FC0F6BF2A40014053C0BF3F7C405CBFEE3F833F6E4014BFA94017C0C13F9940294031C07F409DBFC4C089C088BF273FAC3FD93EC04059BE62402CC0BFBF47BEF03F28C0E13F563FD83FB2C025C0083D2B40B73FE53F733F8240B53E38BF084017BFD9BF54BD3540F7BFF73FA5C0C3380C40EA3E26BF54C02D4030C088C0BD3FC4406940C9409FC077BFC6BE8FC01A401E3F01C037C0013F554044BF87409FBE8EC0A5BF2CC0CEC0483D9DC01B4093C082407BBF7740A53FAB40CBC07D40853F3C3F723F943FBA3F914023409740243FA439F4BFB4BEB8C0C33FD53F1B4097BF98C0493F0E40CF3F47BC544014BF7540AFBFAC40C1BFA9BE0840E43F7240BBBF47BF8EBF5A3FA8C0973E1540F83F903FCBBF88C0893F733F03C07DBFA6C0CA400B401BC0E3BFBF3D5140EB3EF83F89C057BFCF3F8BC0BF3EEDBD1DC0BB400F3DA2BFE2BE2BBE8EBE17C069C0"> : tensor<20x30xbf16>
    return %0 : tensor<20x30xbf16>
  }
  func.func private @expected() -> tensor<20x30xbf16> {
    %0 = stablehlo.constant dense<"0x8FB60CBFEDBCDF3E0740503FB33C04BDF4BD4E413CC2134180BF96C38BC1094312C2A73FA7C06A40164077C2C44103445F41EDC23A41C14071431ABC27C1213E2BC109BEA3BE7DC24DBF313FED39EA4198C05C3742418C3C96C11DC113C30FC1524127C4063B984023C3073F6340D1BEFFBF78C0713F6A4003BE64BE68BEC6C006C1503F1DC12B3E20BF1B432343AFC10C4196BE86422340F6339BBBB5C068BF99BFA9402940D3C3863D32429E40BCC082C342411EC2833F2042ACC18E3E264098C1B6421642C143984144433142E33E2F41634263C2F4402FBB5F3776C1B74068C1F642D6C0C441F1BED8C093C13E3E13C331B9183D33C16D40F6BF164177C21AC2DC4118BDF4C18FBDF1C2DFC2A14202BCCDC026BD96C216C3D63FACBAC6C26E3C7D3F493FDC41BAC2023F5C43B6C2D63C2742B53D0DC26D3AB7C3D54178409640A5401C42FA4202409C40EEC08240B6BFA5C066436AC32FC49DBC51C0C6BFD1C127C1F6BF55C3CBC34B40F6BF7B43D242C24120C258C2BB4129C3234009C30F3E42BE074249418E417A4109C056420D4289C2BE4110C323C0004183C2A7BF3ABEBABFBA3FB63FA240864048C346428343A0C046BEF8418EC1FF4213BC4641BABDC2C28EC148C092C33A4218C05B4132C39AC0A6C196C18942064184C1D141F8410C42033E1E4041C24442E641E6BE86C0484063C26E423E40EE4096C23CC22943AB42CB415FC304403641DFC17DBF71BDB3BC66C2AE4321401E3D09BAAEBDE3C07F3E6B39B64229BF833F1DC109B95BC126C049C146C1DBBF8E4118C28942A24042C3134044C271C06D4136C168C1834084C11B409A3DEEC0094002C3F6425F400CC2E33E5B418C3C8C3D163F0FC13E41763E6DC0A94009C106B937C0FBBEAF4113C0873EF1C0E4BFBEC289BEABC2F441833F3641A33EE03D923D824356415241CE42503F323FF6C242C38CC398436342CE3FF74360421040024096C058C30FBEED41C1BD18C044C33540F13F09BF3EC089BD03C266434243F8BEBAC064C1BC40063F4EC1CEC200C1133F8EBBA73F163E7141AC3ED1412F43984151C0E4BF713BE4BF0BC009C1D24202C083BC9DC27FC1E3C1C23C35433E434DBCC2C1934116BB4F3DC93FD2422C3D823B3C42EDC118C28CC0AC3EB543A1416E4226C099C2BEBE8D40C1C0F1C1C6C2073D764406C2C9402E4296C2783796C0443DAF3F19C113C1603C76C1E3C0964103410FC25540744222BFCD40893F4D4246BE134352C15C40DB429341A9C17D42EDBF66C39DC299BF8E3E1B409C3D58431CBC31429BC155C0F1BBD34090C1AE40163F9A402CC389C1193898413B40B7405B3F8642353DBEBE194152BE9CC012B9B541E6C0E64009C3632B2741C43D8BBE12C29E41A6C199C24F40664341427843F6C266BF6DBDB3C25F41713E03C1BBC1033E1342E6BE9642F6BCAFC209C09BC186C3F438EDC26441C2C2864271BF6642094018437FC377428F3FCB3E583FC63F4440BA428441D242873E072EDEC032BD3EC3634093406441D2BFD6C2F83E2F418740F1B5124246BE604223C01B435CC013BD1941B540584248C0F1BEAFBF1E3F10C3D23C4941E840B63F7FC099C29D3F5B3F09C177BF0BC37B43244164C1B2C0553A0C42C63DE8409DC218BF8740A4C2553DCBBA6DC14843333802C0B1BD98BBAFBC52C141C2"> : tensor<20x30xbf16>
    return %0 : tensor<20x30xbf16>
  }
}
