module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0:2 = call @inputs() : () -> (tensor<2x3x9x10xf16>, tensor<3x3x4x5xf16>)
    %1 = call @expected() : () -> tensor<2x3x6x6xf16>
    %2 = stablehlo.convolution(%0#0, %0#1) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[0, 0], [0, 0]], lhs_dilate = [1, 1], rhs_dilate = [1, 1], reverse = [0, 0]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#stablehlo<precision DEFAULT>, #stablehlo<precision DEFAULT>]} : (tensor<2x3x9x10xf16>, tensor<3x3x4x5xf16>) -> tensor<2x3x6x6xf16>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<2x3x6x6xf16>, tensor<2x3x6x6xf16>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<2x3x9x10xf16>, tensor<3x3x4x5xf16>) {
    %0 = stablehlo.constant dense<"0x68BBC945184116BD23430636D8BB1F3E70C51F2E814074B27EBD3D430E443A4002C7F3BD17C0943DE0410AC3B645A6441ABEDD402442504070B8154305BD06C2463ABAC68B3833C418BD24C01639A8BF062EE63F13427EC1564341BD104644B7143BA039CF414CC1ACC0583558BD9BC1F43ECCB813C73A43C5424AC585C4F9BCD940AB408D3FB73CCDAF8432023F05C82EC5D5AE61B006C13ABECEC2FBB8A5BA96BE703B30BC972181BA6D3E9141EAC0BA3D73A4E240DBC0CC337A446F47393BE3C457BD10B7E2C174AC7F44844119BE973EA33CCCBA36BD2CC103C0F84318C0F73FA9432E3C384331C6E93B733CB2B155C211BC06C0863CE5ACF1C0DB327F3E013FB83C3CC0DC3FD542343C02B13AC0A9BABDC5933EDBBE1BBB1041BF3EB3ACB33DEEBEF4403DC339C520BA253A18BE51C0CA45E536BBBC9A3C47C1BC3FA44241C0A64646C67AC1733B37BDC9C377C08136C7419DC24B45883808450138FD43662336B97F44733D5A3B7A40CA3A07C4AEBEA5BF3CC4DDC236BCBE4090BE0B43033EC440A6BF173918B890C29B3D8DBF64C16344BBBC9E36D33F133DD041BD442539F4B2C2C0E13C9B3E3EBE453EA24445C397BDF23D23440CC20C3B13AE72327B45333FE73F64C582412DC3D93A663DCE3F8040024250BDE8C05AC28240F9C0BD42E13084C38134C5C1A3C181BF833A1EBC80C193C4AB3550B9464302C403B964C4E2C114BC3D4409442ABDF9BB12AAEA4387B8A33D3F404EB183381EB32CC480C1F23DB535C9C000489FB3FEC39EC06A3C194186C1D7C502C6103FABBB9039E1C13E416841D9B7AF4497BCA4C491B5841DDB40A43847BDE73DD8C244C69241E041462914ACAAB07022F1C12F3EC83940B55DC1AABC81C063B76BAE90343241EBBF7B3D51C1C73DEBBF44BD97C50434ACB75A46143E20C5A839D045C14290B9B43F7EC33642DD46223DF1C54B36B040EB3A2D3CB23ED9B5233EC93988BF1B44C6C2CF2D3140F73C8840534558B955C011BE2B45F93A29C449422EC23A4194C4C4B91DC60C388EBD2444A734EC316543DC42EDC1793D0CB9A6BAF13C6C3CC141B0C3F2BF1D38F8BD783DC4C2B33EEABE1A42C1BFB9BF47C1353A29433BBCA237DE4015476FB6AF3870C0ACB423443BAFA7B9E24427C3B539E33C2DC174453FB467B8A745E9430641BF3F71C01EC3834027C3213DFD463541CA451247F43FB842E141A73AFAC199BD6F44934028C12B3EBCBD3ABD9441344015B991BC10BC14C907BCCAC4FEA486BFF4C2734718407FC3C63E6CC3723E5BBA95C3FD3C7DBC41C3013F7E46E0B5953709C095C40B3F4ABC69C67441383C6C3C5AB4E94093445A3A324016B55FBFF0BC0A428BAE753FB2C2CE379DBA91BCCD4028460E3C0A422AB7E0C13231C2BFB0C442C3783C343C9A3B092E1CBA5FC05F4006BE56A48BBDCA34CE443944A7446DAF4BC45B3486BEFABA183B9AC39ABD763B8E4006BF52BDE5B5EBBEC6B81FC60F38C93BAA3C7A44E5BC9BBD93C34340AEC6"> : tensor<2x3x9x10xf16>
    %1 = stablehlo.constant dense<"0xD83F0DC03C336E32DCBFA6BA6F3074BE0D459545FA40A741B03DEC45623C7A442CB7EAC66C3EE23831C5223D6EBE0F3D5B4458BC033E08B83D41FB39B6BE5FACB238EBC34EC0894661C47146AC341D42FD3D32B96ABDF840983D4A43F1C49EC2E6C386B5A83E1B3F893C863CBFC4BA42BC44F740623DC94001C2D2C262339CB5FABCFF44B83904BD17C5DF40F540764635445DC46B3AEFBA7938ED403C2A8EC04F46BA41CDC4B94191C8D8C31AB0FE4123BCFABC4EC42C417FBA0C40C1B49FB7264319C432B336C080BD06C476B64FC0A0340F3C5FBD47C6794235C34DC2B7414D3CCBB80B3BBABDA6BB9BB919C5D230A6445ABDDEB73D437640FEBD39BCB4B1E43ED6C23A4890C3BEC4A3BD2F3AB8BDCC32AE4536BF8AC0EAC30B4840C02FB8F4BE1AC5AD451CC15E40D5C459B583C4CA4268C26E4447BEDEBD07456B430E44CEBCD52F73B55044B9B84C44AA408BC5A3C4B84168C4FF4789BD0B40A03402447444D9BDC3BF60BF"> : tensor<3x3x4x5xf16>
    return %0, %1 : tensor<2x3x9x10xf16>, tensor<3x3x4x5xf16>
  }
  func.func private @expected() -> tensor<2x3x6x6xf16> {
    %0 = stablehlo.constant dense<"0x25D2825730D3CCD22450984641D6584F4E4ECED226D36ED777CC6B5072CE3E54745065D3DD50BBCBB7D4BDD07DC42B435BD699CE21D698D423D130C59752B354D64F3A574FD40649ABD2ACD52A510758A156BE5621D385C947D057D0F3CDC0C93253F8D52F55ECD6AB54F448C7C931CFBB4C173BFDD5AC5530D398D46C4EEB520CCBCB56CB42B5D62BCC19CD6A5420D024CF94D3D051A955E7CAA423FD555FCE4BD0DED645583ED869BD3951D955A436F556F1D58650B0CF12CC1BD4DDD394BCB9CE3B4E0DCC66C53C4EF2CC9D5842D377C5814897CF96CBD15490D7E7D4BFCD41D07850C6CBCB5834CA03509AB95CD4745325CE3F4F32D5B657795079D0D8D4F7D2AC559B4AEA5223CDAFD03B51E44DA24ADE4C8B5157C879CC4351945206CCBDCE1C5BCAD484D7A2CA8454F6CA18D59A4ECB53ADD494532B550ACD11D708547FD6F54A7BD1494D2AC1A7D450D43BD531CB684ADA535F5373CD0CC430DB86D24D40B1D050590D532A4B8DD367D11B5631CA0351865029D499D2F9528A51D5530F4D6E571454A5D13249555386CBF553FA4CC8589F574BC14E463ECEF4D1F554FB523FD599D42CD7FAD4EA5181D44AD4"> : tensor<2x3x6x6xf16>
    return %0 : tensor<2x3x6x6xf16>
  }
}
