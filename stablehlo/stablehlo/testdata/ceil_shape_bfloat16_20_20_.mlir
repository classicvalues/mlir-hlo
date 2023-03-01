module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<20x20xbf16>
    %1 = call @expected() : () -> tensor<20x20xbf16>
    %2 = stablehlo.ceil %0 : tensor<20x20xbf16>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<20x20xbf16>, tensor<20x20xbf16>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> tensor<20x20xbf16> {
    %0 = stablehlo.constant dense<"0x92C0A6BFBCC0413FAABF973FA0BFD93EB4C03940D93FA7BFC3BF5F40B63F5440D93E38C0A83DBA3F61C060404ABE7640923FABC0EDBF473CAEC07EBF34BEFBBF59C08A40A340A73F2CC017405DC022BF773FE93F8DBF83BF0140D3BF1EBFB9BF3340C94049BE2E401840BCBF8D3FEC3FCBC041BFC93F22C0B33F323D14C09D3FD73FF0BF313FD340923FE93E2B40FA40804052409BBFB840D33FFABEECBFFCBF01C0054091C07F407740DE3E3A40A3BFFCBEC93FDD3F9940073FF9BFB3C0A5BE7A3F89400240573F4E4012C0E0BF6EC09340C1BF274094C064C0A1C012400F406C3FB3BF2FBE20BFC33F31402E401CC08640B53F72BFCB406540A5BF304026C03240E2BFB2C05A40A8BF95C0933E44401CC0AB400FC0AFC01EC0164022407DC098BF5C40B3C006BD33C0274014406DBF23C01F4011404CC036C083C060C0B33E5EC03BC09F3E0AC008C0064047BF573F433F7EBF8EC034408A3DA240E5BFD53F133F8A3F8DC01A400DC131C08D3FCCBE3E3F963FD2C0D3BE0AC0924083BE723F9D40123FA3BE4FC0114095BF4940F8BF424005C13F40703F34C0FD3FCF3F423FBDBF2F4087C084BF8EBE67BFB4C0DB4036C0053FAC40D140DD4027C04B40793CE8BE983F19BFBAC00D40DEBE6CC01940ADBFEFBF4FBF173EC33FA33DDF3FDBBE273FAA403D40673F02C057BF22C0964003C066BF7D3FD63EA4C0074099BE94C05E4042C0904016C07DBFBFBF8DBD53C01E40544035404BC01140194023BF1140883E89BF0A40A1BFBA3F37BF84C09A40B23F20BF583F9340C7C0104005BFB7C07CBF81BF8340CBBEF6BF554092BFEEBF7D4050C03140FABF5A40FF3E14C038409DBFDB40C0C04E40CF3EBB3F84C00B402C408FBF2F405E3F8C40D6BEE840A740AD4040C098BF8140C2BDFCBF9FBEFEBEDA3F9EBF194043C0623E1FBF18BD78C06CC0BC3F79C0FABF0E40B63FBCC042402A406F3FDF3FC2BFDF3E9ABF87BFD340E7BE8240D640893F453F143F9740C6BF863E153F503F224038C0B7C0E4BF6E40233F8A405FC0D14050BED13FD4BFF0BFE53F89405DC032C0863F4AC0D63FF3BF87C004400640933F294012BFE7BED0401D4051C0A4BE4FC043BE7D4082400640"> : tensor<20x20xbf16>
    return %0 : tensor<20x20xbf16>
  }
  func.func private @expected() -> tensor<20x20xbf16> {
    %0 = stablehlo.constant dense<"0x80C080BFA0C0803F80BF004080BF803FA0C04040004080BF80BF804000408040803F00C0803F004040C08040008080400040A0C080BF803FA0C00080008080BF40C0A040C040004000C0404040C00080803F004080BF80BF404080BF008080BF4040E04000804040404080BF00400040C0C00080004000C00040803F00C00040004080BF803FE0400040803F404000418040804080BFC0400040008080BF80BF00C0404080C080408040803F404080BF008000400040A040803F80BFA0C00080803FA0404040803F804000C080BF40C0A04080BF404080C040C0A0C040404040803F80BF0080008000404040404000C0A04000400080E040804080BF404000C0404080BFA0C0804080BF80C0803F804000C0C04000C0A0C000C04040404040C080BF8040A0C0008000C040404040008000C04040404040C000C080C040C0803F40C000C0803F00C000C040400080803F803F008080C04040803FC04080BF0040803F004080C0404000C100C000400080803F0040C0C0008000C0A0400080803FA040803F008040C0404080BF804080BF804000C14040803F00C000400040803F80BF404080C080BF00800080A0C0E04000C0803FC040E040E04000C08040803F008000400080A0C04040008040C0404080BF80BF0080803F0040803F00400080803FC0404040803F00C0008000C0A04000C00080803F803FA0C04040008080C0804040C0A04000C0008080BF008040C040408040404040C04040404000804040803F80BF404080BF0040008080C0A04000400080803FA040C0C040400080A0C0008080BFA040008080BF804080BF80BF804040C0404080BF8040803F00C0404080BFE040C0C08040803F004080C04040404080BF4040803FA04000800041C040C04040C080BFA040008080BF00800080004080BF404040C0803F0080008040C040C0004040C080BF40400040A0C080404040803F004080BF803F80BF80BFE0400080A040E0400040803F803FA04080BF803F803F803F404000C0A0C080BF8040803FA04040C0E0400080004080BF80BF0040A04040C000C0004040C0004080BF80C0404040400040404000800080E040404040C0008040C000808040A0404040"> : tensor<20x20xbf16>
    return %0 : tensor<20x20xbf16>
  }
}
