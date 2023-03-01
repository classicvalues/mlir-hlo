module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<20x20xf32>
    %1 = call @expected() : () -> tensor<20x20xf32>
    %2 = stablehlo.floor %0 : tensor<20x20xf32>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<20x20xf32>, tensor<20x20xf32>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> tensor<20x20xf32> {
    %0 = stablehlo.constant dense<"0xFAF92440C078A8BFA89111C082E77E3D273FF43D95610BC067C99F4009BE903EA86A30C0001B883FCB0C4940A58A8D3F728B5FC0D3048240A970563FCB7100C0BF24D53DF83D0C40AB566ABFA43555402D973F40710C08C01339F3405610A03F1213E7BF1575024000846FC0EFB7B3BFB4BEAD3F0CA860BEDFAE5640F61A6C40E69246C0EC4A4340E3B71FC0F5188D3F8B2C7B404B3C61BFE80D3840DB2FCFBE39E7F5BF1B9541C09A3426C006EE9440910AC3BFDCBC2B404F31BEBFD35D833FD3F704402A9C6A40DC374C3F5B21B2C04BEE47C093CBB7BFA95061C0D0FCC3C0825F3BC009EB0E402630D9C099FC524070FADC3FB936463E0E67EF3FC2552340063E58C0EB680040C09325C0ED4D41406485F43F2740B33E66DFE03F26C2824076B7C5C030A771BE3F275140788C08408A8906C0865AFABF7D0D4BC0ADB068C0509F7BC06A46EABE690332C06B6C56C0F32E3CC0FD99B1C0DAC8BC4064AC34406486B83F675A82BF73F215403DEBAA40B7E75D3F61266FC01D789E402F2419C0C39B92401CBB95BF00C724BF73F89C40C1BDF93F98B32240C5172F401A6F01BF89A78CC079573ABEF3911DBE04256D3E06BE9D3F9FD81DBF71C625C06ABF83C0480229407A6362403E430040B1EE01C0E130733E7D343C4005B98BC0B14F81BF56E0BD3F2520D2BF8419E53F87F08940D9883ABF160BC1BFC0EBCD3E0A1A19409CB233BF6062E9BF48AADEBF4DF6E53F1068E13EE72D6C406557BC3F11837E3EABB0C33F4C61053F3CBF9BBEDAD30A40AF99BE3FE8CE8ABF5EFB10401A40ED40CC2F404037D97FBD18E39640987E8340383E4F40B1512A4090F65E3F0F7B26C0621906C1B6B65DC0835291C0FC8BD54032D5F4BF81CA01403CC32F40CF054B4077D976C0964A45C09D93293F3B4C9A4035398BC06D5ACCBFB068C4BF683F454011D36CC000AB0DC097D4C1C03CDBBF3F997A1F405CA1F53F4D9DA2C0E020A0BF756592BF34FE5A40ECF3B4C0A23522C068B75EC02E1D68C0CF744AC00D861C40306216409B8872C04F110B3F73790C40C258C4C0AFCA74BFCBC50440B492F63FD4B5054080E2A7C0C4F7DDBF585DB43E3FBF9DC01DB722C05340FEBF2F0F983F3615743F4232474038310241C76E1840D5B6833E136B6D4039FDAFBDB13BE73F5BA084409503DBBFD1F8E53FCC9F4440087376BE194C0A419F94E3BFA3BEB23F801762BF69807D40A99B033FE39A51C0870B57BFC4AECCBF1E83AABF45B384BDB1AB3F3F443C9C3F0F306BC07059AABFE4F313403966E2403BA552401D7E4F40D45ECABF92A7AD406DB00B3FA32D93C024D22E40FB6D83BE6F9DD83FD682A7402C8588C016D8F43F7945FFC0802E153F93D2613F20C286C03CC31C3E834E0DBF893EDCBE748416BFC86DA740F5824FC016ED5DC05FFFCB3F978DA5C0EB4FD0C0A2317F40750644C0496C2C3E47C6CC3E5DE830C098F5C7BD4743AC40CDCDFBBF09CE5440810AC33FD0EC7AC04628A6C0AC4786C0C7D5903F53D91C40F90CA93DECF206403BE3A640F87B28C0809A313F7FE9C13F7B79BCBFFA665AC068C3E93FAF818640809661BE9D38FEBE888C8E3F721DAD3F9D8350C0DE6B353F93DBB33FE2A0DD400B7E244053F05AC0446EF03E0753024084EAB83F18CFF73FBAD36F3E92E23640707910C0BA93723F3B7D87BF905790C018F49140AC0A3FC024AAAA404A9924C0735883C0B44A243D97E663BFCD284EBEF6EA85C0D106B7BD84E39E4040D8723FD4A957C0A146D13F29C6783F1EF09C3F0B012140EADA693E161BC5BE9BC1A9BF5773E1BF7FA732BC4C1DD0BF3752E33EF8235840EE5B5FC06753C33F9D5BEE3D3E8FD2C02E3B4740241D78C06D15CA3E11D23C40FC767DC005B278BE2CF5223F0E791F3F43DF8FBF842CADBFA132AA400B8FD73F22F72FC07BDB24BFAB488740917A3C3EBA46F73F41F945C07027D03C7F09A63FDAEC81BEC13B72C02FF4984053AA50C02FD78B3FF0047440C19A8E40F40506C004E10B408D3C893F53115C40FBD4D4C0BFD189BF9B41D54032E5BE40A240733FE60FC8BF6F72E9BFEA31BF409D6B68C0EEE873BFD1E0E4BD45C2D6BF005D1340B95D2E403D3C88BD9DCE81C0C31279C01D9BA640848655BFBE626FC0666ACCBF2AC32E3F016B373E3223633FFD7432C08E1FD13F6EBAC7BF37A93E3FB4C698BFBBD43AC09527F6BF56CA5D3F51F15CC0C9435C3FD67507C001186E3F8683EC3F79B68B4089C4123F"> : tensor<20x20xf32>
    return %0 : tensor<20x20xf32>
  }
  func.func private @expected() -> tensor<20x20xf32> {
    %0 = stablehlo.constant dense<"0x00000040000000C0000040C00000000000000000000040C00000804000000000000040C00000803F000040400000803F000080C00000804000000000000040C00000000000000040000080BF0000404000000040000040C00000E0400000803F000000C000000040000080C0000000C00000803F000080BF0000404000004040000080C000004040000040C00000803F00004040000080BF00000040000080BF000000C0000080C0000040C000008040000000C000000040000000C00000803F0000004000004040000000000000C0C0000080C0000000C0000080C00000E0C0000040C0000000400000E0C0000040400000803F000000000000803F00000040000080C000000040000040C0000040400000803F000000000000803F000080400000E0C0000080BF0000404000000040000040C0000000C0000080C0000080C0000080C0000080BF000040C0000080C0000040C00000C0C00000A040000000400000803F000000C0000000400000A04000000000000080C000008040000040C000008040000000C0000080BF000080400000803F0000004000000040000080BF0000A0C0000080BF000080BF000000000000803F000080BF000040C00000A0C0000000400000404000000040000040C000000000000000400000A0C0000000C00000803F000000C00000803F00008040000080BF000000C00000000000000040000080BF000000C0000000C00000803F00000000000040400000803F000000000000803F00000000000080BF000000400000803F000000C0000000400000E04000004040000080BF0000804000008040000040400000004000000000000040C0000010C1000080C00000A0C00000C040000000C0000000400000004000004040000080C0000080C000000000000080400000A0C0000000C0000000C000004040000080C0000040C00000E0C00000803F000000400000803F0000C0C0000000C0000000C0000040400000C0C0000040C0000080C0000080C0000080C00000004000000040000080C000000000000000400000E0C0000080BF000000400000803F000000400000C0C0000000C0000000000000A0C0000040C0000000C00000803F000000000000404000000041000000400000000000004040000080BF0000803F00008040000000C00000803F00004040000080BF00000041000000C00000803F000080BF0000404000000000000080C0000080BF000000C0000000C0000080BF000000000000803F000080C0000000C0000000400000E0400000404000004040000000C00000A040000000000000A0C000000040000080BF0000803F0000A0400000A0C00000803F000000C100000000000000000000A0C000000000000080BF000080BF000080BF0000A040000080C0000080C00000803F0000C0C00000E0C000004040000080C00000000000000000000040C0000080BF0000A040000000C0000040400000803F000080C00000C0C00000A0C00000803F0000004000000000000000400000A040000040C0000000000000803F000000C0000080C00000803F00008040000080BF000080BF0000803F0000803F000080C0000000000000803F0000C04000000040000080C000000000000000400000803F0000803F0000000000000040000040C000000000000000C00000A0C000008040000040C00000A040000040C00000A0C000000000000080BF000080BF0000A0C0000080BF0000804000000000000080C00000803F000000000000803F0000004000000000000080BF000000C0000000C0000080BF000000C00000000000004040000080C00000803F000000000000E0C000004040000080C00000000000000040000080C0000080BF0000000000000000000000C0000000C00000A0400000803F000040C0000080BF00008040000000000000803F000080C0000000000000803F000080BF000080C000008040000080C00000803F0000404000008040000040C0000000400000803F000040400000E0C0000000C00000C0400000A04000000000000000C0000000C00000A040000080C0000080BF000080BF000000C00000004000000040000080BF0000A0C0000080C00000A040000080BF000080C0000000C0000000000000000000000000000040C00000803F000000C000000000000000C0000040C0000000C000000000000080C000000000000040C0000000000000803F0000804000000000"> : tensor<20x20xf32>
    return %0 : tensor<20x20xf32>
  }
}
