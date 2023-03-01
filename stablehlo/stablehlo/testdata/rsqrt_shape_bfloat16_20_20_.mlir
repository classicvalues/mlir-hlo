module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<20x20xbf16>
    %1 = call @expected() : () -> tensor<20x20xbf16>
    %2 = stablehlo.rsqrt %0 : tensor<20x20xbf16>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<20x20xbf16>, tensor<20x20xbf16>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> tensor<20x20xbf16> {
    %0 = stablehlo.constant dense<"0x80BF94C00DC03CC010C021BF4BBF0AC0993F28C086C0B8BEEB3F063E50C0A2BFAB3AC93FC540283FBE3FCD4041409BBC89BFDCBF2BC019409940A43FDD3F993F2CBF35C0DBBF853F2F3C59C08EBF9240933FAEC04B40033EB8BF25C05CBF86BFB1BF3140C2BF99C00FC0473F93BF5BC0014022C0AABF55BF123F40C0AA3E2BC0AC40F23FD4BFD0BF43C0F9BF983F19403140014067BE8440AA3FB9BF3C402B4023C0E5BF32BF01C05AC0FD3F1AC08840E9BFAABF1ABE81C0EDC086BE5DBE1540C7BFE0BE673F88408D3E43BDD9BF3DBFC8BE3DC01BBE293F31BFB13FC8C054C0843DF8BF814008C097BFCA3E3B40373F0D40E4BF393FAABF254072C0DBBF993F53C0A5BF883FAABFA8C0B03F3D400B408CC0A74047BFF6BE8AC06FC01B3FCFBF893F9840D0BE7BBF074052409440793D42C08CBFA0C0953FB73FFB3D74BEF9BE203FD2C06BC08CBF07C09BBFD83F2B3F7CBF4640FE3F66BD463F863F284060400F40C73FBFC0BF40AB3E54404440A1BF934022C093BF16C0B1401740ACBF93C04EBEB53C234067BFC53F153E9F3E4C3E16C07FBF2E4035408E40BA3F1C3E8A3EC43F36BF3CC034408FC07A40FEBEB13F8740ACBFA4C04740B2C092C06B407BBF4740CDC083BEA73F8E40933F26408FC060405240773FE0BF144075C015408AC0AFC0113E6AC05CC0DDC05740B4C035C064C0E3BF9EBF09C09D403EBE15C046405FBF9DC0BBBFBDBF51C014BFEF3F84BFF8BFD3BFF4BF86BF484003C04C40723F523F2D40B3C0EB3FD23F1CC07A40B0BF7A40F0BF1140CB401AC029BFE8BF2DC02AC073BFACC0DEBF973FBA3E563FD8C078C034BFBBBD72402CC06240A0C069C0EEC08640803FDEBFAE40933F2AC01B4037BF453F894088C0013D3DBF3B40DA40143E9EBF743F4840EFBF33BDDE405E3FA4BE9FC03540B53E873FAA3FCB3EC5BF4FBF12400C40D7BFD23F133F19C085C00BBFFABF24C011400140B1BFAAC0D040943F8EBE264004400B40ED3FFDBFE03F6C40AE408B3DFB4042C061BE3C4056BF3EBF5E3FCD40F23D7D406F3FE43F6C40C13E5FC0EE3BA5C0903E993F4E406ABD7E408E4059BF7B40DE3F9D3FEC3FD7BF904019BCF8BFA9BF213F673E6D400740"> : tensor<20x20xbf16>
    return %0 : tensor<20x20xbf16>
  }
  func.func private @expected() -> tensor<20x20xbf16> {
    %0 = stablehlo.constant dense<"0xC0FFC0FFC0FFC0FFC0FFC0FFC0FFC0FF6A3FC0FFC0FFC0FF3D3F3140C0FFC0FFDD414C3FCE3E9E3F523FCA3E133FC0FFC0FFC0FFC0FF263FEA3E623F433F6A3FC0FFC0FFC0FF7B3F1B41C0FFC0FFF03E6F3FC0FF103F3340C0FFC0FFC0FFC0FFC0FF1A3FC0FFC0FFC0FF913FC0FFC0FF343FC0FFC0FFC0FFA93FC0FFDE3FC0FFDD3E3A3FC0FFC0FFC0FFC0FF6B3F263F1A3F343FC0FFFC3E5E3FC0FF153F1D3FC0FFC0FFC0FFC0FFC0FF363FC0FFF83EC0FFC0FFC0FFC0FFC0FFC0FFC0FF283FC0FFC0FF873FF83EF43FC0FFC0FFC0FFC0FFC0FFC0FF9E3FC0FF5A3FC0FFC0FF7C40C0FFFF3EC0FFC0FFCC3F163F973F2C3FC0FF973FC0FF1F3FC0FFC0FF6A3FC0FFC0FF783FC0FFC0FF5A3F153F2E3FC0FFE03EC0FFC0FFC0FFC0FFA43FC0FF773FEB3EC0FFC0FF303F0D3FEE3E8240C0FFC0FFC0FF6D3F563F3740C0FFC0FFA23FC0FFC0FFC0FFC0FFC0FF453F9D3FC0FF123F363FC0FF923F7A3F1E3F093F2B3F4D3FC0FFD23EDD3F0D3F123FC0FFEF3EC0FFC0FFC0FFDA3E273FC0FFC0FFC0FFD740203FC0FF4E3F2840E63F0F40C0FFC0FF1B3F183FF33E543F2440F73F4F3FC0FFC0FF193FC0FF023FC0FF5A3FF93EC0FFC0FF113FC0FFC0FF063FC0FF113FC0FFC0FF603FF33E6F3F1F3FC0FF093F0D3F823FC0FF283FC0FF283FC0FFC0FF2A40C0FFC0FFC0FF0C3FC0FFC0FFC0FFC0FFC0FFC0FFE73EC0FFC0FF123FC0FFC0FFC0FFC0FFC0FFC0FF3B3FC0FFC0FFC0FFC0FFC0FF113FC0FF0F3F843F8D3F1C3FC0FF3D3F483FC0FF023FC0FF023FC0FF2A3FCB3EC0FFC0FFC0FFC0FFC0FFC0FFC0FFC0FF6C3FD43F8C3FC0FFC0FFC0FFC0FF043FC0FF083FC0FFC0FFC0FFFA3E803FC0FFDC3E6F3FC0FF243FC0FF923FF73EC0FFB440C0FF163FC43E2840C0FF833F113FC0FFC0FFC23E893FC0FFC0FF183FD73F793F5E3FCB3FC0FFC0FF293F2D3FC0FF483FA93FC0FFC0FFC0FFC0FFC0FF2A3F343FC0FFC0FFC93E6E3FC0FF1F3F323F2E3F3C3FC0FF423F053FDC3E7640B73EC0FFC0FF153FC0FFC0FF893FCA3E3A40013F843F403F053FD03FC0FF3C41C0FFF13F6A3F0F3FC0FF013FF33EC0FF013F423F673F3D3FC0FFF13EC0FFC0FFC0FFA13F0740053F303F"> : tensor<20x20xbf16>
    return %0 : tensor<20x20xbf16>
  }
}
