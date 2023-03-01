module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0 = call @inputs() : () -> tensor<20x20xcomplex<f32>>
    %1 = call @expected() : () -> tensor<20x20xcomplex<f32>>
    %2 = chlo.atan %0 : tensor<20x20xcomplex<f32>> -> tensor<20x20xcomplex<f32>>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<20x20xcomplex<f32>>, tensor<20x20xcomplex<f32>>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> tensor<20x20xcomplex<f32>> {
    %0 = stablehlo.constant dense<"0xA9D8C43FA75A023E995F23C0845015C0DDD2A940BE47DC3C0FB622BF36ED2F4037B0154000A68340E0D021BE354A2E403148CBBF03D099BFFDB4C13FDEA38CC01B915F40B6C7573F629B0FBFD9A227BF6556AB403BD0993FBCE4D33E2303153E2C5FA9BF47C6E2BFFAF35B3FA8D72D40424AE43FC39117C06C6F3FC067469140F3A2B3407132883FADE783BF9F6B03C090D70D40B58E893FCDCA36C0DE9F5ABF7D180D40226FD7BB94818AC0EDD4764005471C400A72454070CCB23FCE1DAF40F1E1F53FA845D0BF857EA9405C355A4052817EC0AA7552C0C5A617C06723E4BF561FB3BF7FC0CCBF38C88EBF318DDF40C69F2A4099F41BC09B90AEC0C9AC5140E9FEA2BF136687C084B00CC075FCCBC0067282BFB443CBC0BA337FC05B154840308D28C0B043D7BD468CAA3F498DD13F271E3F3FEB93334095EC44BF180AB93F92F931BE38F50BBF43084BC03D8EB0C03F15E13F632D49BFD7884A40D06F9FC0AD1C8940922D1BBF6566393F955722C04E39B3BF07742040B8CB80BFB7AD84C0235C85C004F3FBBD16BA1EBF3FA05B401A6A37403E45B33ED28D6BBF8C0AB7BF14CB76403B15333FA3E251BF9326A2C0D9E3CEBFB8DFDE3FBAD70A407146483F8278CB3F40959DBE500F76C02A6A8E40235085C010702FBFF26071405F4BF8BEC32185C0712349BFBC8C0740004EDD3FD5D4C43EFFB478BE4B6695C03947DEBDCA7893402D0F59BF37368840765207C0A064C6C03EE66ABF86A0474095F23BC0AA709640D49091BEF9C2C14091F782C0D6F2BCC04EA8FD3F9E0FE03F42A11FBDB8DA87C0E5066EC0C69E314055C941404E2284C0D46FE940457F47C0114C50407458B13ED30AA940447844C056145F40ECDC2ABFA7D23EC0E6A4393EB3035BBE6A7C2E4065FE4B3F1C4507C1D0D6ED3F66B685406263C2C0ACC6AABF6AA275C0616891C0C55F4440573E16C05C1920BE0ED606C00EB987C0618C51BC7A919E3D20254740092748C0830AC93FC8228D3F4288DC3FAD2D95C0AF35BCC002090240B9BD96BFD04E623E8028E23EB21A2CBF52AE88C0BD21313E4A21103EFEB89ABFE6EB04C0605F8A401B5F13BF5BDA24C0DC76C1C0B4784E40E6BB5CBFC13955C0E6F043402B750641DC2397405CD89EBF85264640F96960C0EB118FC09246A240BB0730C090973040FC7717402815A8C07D21D9BF4CB93B40B421874077D77EC01E1F87BE1CC3CDBFDC800140812A93BFF3FE5240C7B1954034025DC0672238BF5E6D9840E2C436BFE86795407D51DC3FA52D2AC0510BB6BE7CE5A04039D8BABF2B7C0CC0537E813F31440640F878D3BE53759FC0D60A2EC02FEC37C04808C53E0E0B88C0B8A3B4BE04AF7ABF579CAE40031BE4BD68B324C0C2FF19C0BB2CD5C0E4696940F520A9409EE6A9BF3FB7E03E699762BFCB4B60BD5573C53DD07B85407EBE44404EA8BB3FB9D039C091AEBD40BC2540404F89373F0776A9BE81798B3FAE81333CE4ACAB405F370341627E33BFD2547A3FEA0FF9BE5AC6A8BF3FD6A63E7C6F5C3F39BD643F88430540739904C1C7C264C091AFCEBFA925B4C0F7EFA13F4E7F2940274A8ABE77DCA5BF0948FF3F5E58AD3F8EAAADBF60101CBF6EF8F63D0E8D8A3E7BB5A0405FA99FC0FE53E13AD513E93F0128593FAA77434027C765BFACBF7CC0B1C5F53FA4E32EC0405400C0C5FB3BC0665CFDBFCE7D85BF4B29AA40F248423F620B9EC0F84ABFBFE737A33FC05F21C0227327C0F1B16140502B063F00A721BFCE941D4058F70540027F9EBFE775204002524AC0E7B68A3FA571FA3F07FF36407BBF63C08802A140AFB2813FACD99F3FF6D837C005123C3E7AA773C053099D40C4F7A5403595B5BFC9253BC07E4EE8C08A94AFBFFF75A93F9519EBBFDAB06240F621C7BF190DD9BFEF66A03EEFD6A73F667855C045F15E40442FA5BA20328BC019F0514081D2763F94167840C70FA74031CE5FC099690A4135F602C039B5F03F9F8B7A40C8C72B409BBF76C022B5EC3FFE64A9BE3DBF46BF0355E43F6A282AC0B8866F3E48B81D403D5CEABF7827DF3F6679054091EA284038FD01BFD37ECBBEB67D89BF050989400E6B5340DB4F2EBF0E77A3C0A1414E4012F8D73E20615BBF4E57843EF5F592C02A4E0540775B3BC091E9A3C0E3A9AF3EFAFE323FE94C42407F21B93F45D8603F2BF188403E5B9EBF588C61C049365F3FF098CBC0B05234C08832CD3FDB7702BEFF719ABF8AA8133F3AB7334044034940EF322DC0913C8DC09BF3C63D42AB00C0582DB4BF4C7CFABEC2F770407DDE973FD00974C0CCEEBBBF00FEEEBFC952C7BDAECFC4C00244234074854CBFF3A210C0C5567440083B58C08AB170BE36F6DABE73DF4040B1B3933ED7DA37BEA6F9B840CF48BBBF0EA9B83F14516ABFE93405BF8B05D7405DF43E3F845C8D403B886D3F2461354084BB35C0C00284C0A5F3923FAEA4BA40A0C388BE311887403C2D0BC0BA24C6409A55E6C0EEBC1F40F412CA3DBD9D82C0FB0C9340437D5DC09D677C4043A9ECBF916C21C05C8507C08EF76FC0307A94C0FB10053FE6608FC0FB4C06BF3C238B3F3707DD3FEE1545BF6F09BFC08AC2B140824CCDBF8E14E2407398593FF0F1723FC73D98BF43E7853F16AE37C0B05B27BF7E65E3C07CBF9F3F3335B03F541E193EC56B6040E248153FB4E066BE002883BF49B790C0A08C294090FE8BBE4F70EC3E0C936640C28DE6BF019528C0C64E9FC046BDC24058B032C08839C3C07BB589BDCE03D3BF3637B1409CDEEEBFA8A2D73FAFFCB4BFC519673FC17EC03FAD44C0C0A589563F1B3D6AC0735261409CE6D1BF9BFEA7BF32A6A33F24E341C09E57233FD20CAEBF5020FFBF10FBD93FA2F45ABFCE5AC43D7A479CBDE21FCF4065474F4016256040EE1026C097B308C1B55821C00C5D4040FA56F2BF97288C40185411403C3FAEC0A0F89FBF363499BF8D7BC73F7A24F2BFCBD7993F8065AFBD6ECC13BF61247340DF550B4187D7A3C02C2DAFBF90FA0CBFB538A0BFABE8F040BB8315402EA878C0478E64409D9DEC3F3E4F44BF5EBD3240B933234053641EC01EC0A73F8E08EDBFCA575BBE1299B6406625763E44F79A3D99247F40685142C07D04A83F981EAC3E3F202D406B87CAC02CCFFFBF95F7793F8F9F2940BC22153F299F43BE073989C089A2FF3F982C64405A9835BFA96DBFC0FFF5E2C0EDD05740DC5B3FC0360BC940E27281BE1633F83FD09C5FC052D220BFB24D47406733783E3561853F559A8EC0CE029BC0BB7E04BFB9A4A4BF226D2C403933B63FE2032C3F11A63D4096949540C4811440A1E398C05A3D61C0DD13F53FA022B03F47068F40C24BE43F467AECBD36F332C0380A5DC06FD0F9BE8521933FFD2B10BF7DB0E5C0FA1133BED546A23EF5170440055FA4C084986040AC9A4AC006FE5FC08EFDBEBD4F8719BE77E602C072B95840284515C05070E63E11924EBFDA9C1B4065A067C0349DA43FBD511CBF0F1CFEC04D1A65C0CBC72FC08666A640C2CE7A404410ACBF840A813E4AD4D03F6D41C1C0EE5300BF4D4C3BC067A032C04C50F53FC673F13F1B695240603CE63FAB373B40C481BABFC937784009BF91C0DFFEDBBFEA0F6240E9986CC0CB06813F936009C0AD02A3BE4060A23EECCE8A3F12B55240DE6AFABF203FAA3F5AFBA440EA33303F994F9D3FEEE036C038943040AB149CBD34DA6BBFBC90D4BE6168283FD29CC93F37B2EB40ABF393BEF53C673F2A21AA3ED995A8C01FB9EC3E08405C3F5CEB33403B9CC4BFD3B59CC076D74DBFA1A2A8BF0AE849C04A41DE3E757828BFBBF1F44063160CBD314991404201C3403F1D08406DD1AD40913089BF46313AC08A98CCBF87C2FC3ED29A1CC083D2203D95C9B940ADB63440353F1BC08301D03F01FDF23D2C93993F070F113FD171533FD850CF40310137C0BD4605C061C6FCBECDEE893FBC3C47C0B4D5214043D7E83F2BD97FBE5BE629C07891163ED5EC1640F23E8EC066779940093DC23F6F829E40C6DB9340F074963FDF9A863D90866E40AA0E41C0435A5BC0457D32402EABBDBFC49EAFBF561308BF64BE613F774C0240F6EDCD40D066874089C84A3E568C05BFC09CC43FB2AB04BF96CE7240F5774ABF27AB0CBFFB07B03F454332C0439556C09BC885BFF2A67D3C8D57E4BEBCDE40C074BFC93FB0EC95BFBFBC6FC0B53751C0B721E6BFE8FCC6C0EE3618402F0022C0B9ED1540C6705BC0DB90C1406AE083BFB8C36440C7DC20C0D29B88BEB5EEE0BE8C76C4BF9BF286C02E5B8140919AB83E733180C0DCD8A7BFA69EAA40BE876940ED3E56C03164CA3FEBACD6C05E6346BF03FAD13FD459C5C000D935400FA19DC0DBF75CBF3F810B40F4744E40ED292ABFD0AE4EBEA19BB94042AFFABE6F9A6F4063AEAFBEDD4806C020EA943F9FA4AD40A2909FBFDA8CC23E48A2E83FC67AFDBE4083A4C08649CF3FED8458403145BFBFBE6B8E4014A6FEBFF6CBDDBF03DBCEBEF461EDBE9058AB3E1DC26640D9F84340F4EA35BF4619AB40A5569C3F"> : tensor<20x20xcomplex<f32>>
    return %0 : tensor<20x20xcomplex<f32>>
  }
  func.func private @expected() -> tensor<20x20xcomplex<f32>> {
    %0 = stablehlo.constant dense<"0xA9167F3F7C801A3D2A29ADBF40FF40BE1039B13F83B0713A2880BDBFF7F1B63E4249BB3F86183C3E99ECC5BFED5FC43EB29B94BF723287BE70BABF3FDF2252BED41DA73FE55E793D624A2CBFB4C3F9BEEA80B23F66841E3DCA37CC3EE012FF3DA5D3A2BFAB17B2BEF7E5B93FEAD0AF3E3A94AD3F662987BE91D8BBBF44DD1C3E023EB33FE5B5013DFC54ACBFB14EC8BE31109B3F26CF203EC0F1A0BFC0B1B2BD178E923FE10A93BA7774B8BF1B1FE83D6B3EB43F5C7C493E7B4AC33F9912313E3822A13F9D0274BE17F4B73F1149AD3D9ECDB5BF5489F8BDB116A6BF355B43BE4A0B9EBF268BA9BE2427C6BFE9CC0F3E3464AE3FA75939BEA8CFB7BFA412A33D6351C0BFE77360BE33C1C2BF3B2B10BEB2D5C5BFB4501EBEF20DB5BF5494F43DCCAB9ABF56C058BCDA049F3F1B84B13ED85EBC3FFD7BAF3E62A399BFE691073F84C174BE3F2015BFC8DEBEBFEC780BBEC48B8E3FE5A931BE6A3ABD3FF93412BE193EAC3F260BFCBC15CDB93F48FBC0BE9675B1BFC77F9B3EF49BC1BF259C6CBE1FF1AABFB94CDBBBE1FAC1BFF411943EFC9C9E3F25E9193D20AD97BFAF79F0BE7684A93F74942F3D80EDC4BFC73447BE4225A2BF11FE943E39A5963FDB7A013EAFB7823FCFC0AFBD98A8BABFA9D4023E6AA2ABBFF55E15BDC85EA83FAAA700BDFCD1ABBF096F2ABD4AFCA33F1ACF5D3E8012C53E88725ABE3111AEBFE0EC9BBB4B8BAE3F298E17BDFC05B13F0193B9BD6E03B5BF2DBFBABCACF9B23F3E6F20BE6953AE3FAAF848BCA987BA3FA3379BBDAAADB5BF57AA4C3D98A5863FA3121DBC3EE0B7BF87E9EBBD8A87B33F38A4343E9D77C1BF6AA4D43D2413B5BF3F8E213EF86BC73FB951433E4680B6BF2574233E28E6BEBF706CA8BE1FF43F3EA4D456BEEA019F3FA4DBB53DEFABBABF3DA2C83C961EBF3FEE6FE4BD8C28BEBF25BF70BE59AAB5BFD7FECC3D8AB095BF2720C4BC9FA2BCBFB73042BEDFCC52BC30DC9E3D3E41B43FC8AA21BE69C4913FF0E2823E69D2BF3F509942BE27B7B5BF1041523D2E7A60BF5DE7BB3DC069183F45A712BF2DABABBFB50F133C932BA73FE01C8BBFFE1FBDBFA610413E8DDCBCBFE302C5BEDA98B8BF069B8A3DD9F7BEBF7A2093BE651CC43FAF9FD73DB2F8AF3F1D404DBD9C9CB63FB52222BE746DBCBF42F6E13D2A60B1BFA0EE353EDEB7BF3F3C9022BED906B5BF9B95823E43E1B83FF65BEFBD204AB5BF450E30BF9796993F720240BE40F5BB3F4CBC113E6A4EA6BFE5025CBD281EAF3F5EF7F1BC0219B13F8DA8893DE5AB9BBF851E32BD72C7B13FFB2F53BDDAEC99BF24131C3E8CAA913F53F198BD2C4AB5BF0524A9BD95D39EBF28F1273D2EADABBFA29C96BC3BDAC4BF078F373E8488C6BFA478D1BE53D1C2BF5C7508BE8D95BD3F3DEC023EE33D75BFE5D81C3ECDB139BF996CFBBC574FC83F1F357A3E266CA73FF1BFF23D7B62C0BF778E0B3E83CCA13FF7568C3D7B067FBF8AEB683FEE02C93FFC20413E0AA4B93F111E27BC6FA4553F251E74BE38BE70BF91D3EE3D46F16F3FD6D8DF3E7D5DC53F4742E9BDB68AABBFE785CCBD5E97B3BF6C62173D4D3B9B3FEF0109BD508FA8BFEC21B13E6165963F2CC4A9BE145D0DBF3CFFB33DEFA2C73F83044E3E3EBEAFBF2E218B38ADFF903FE384333E1E56A33F098FA6BD95F6AEBF2A3EC43D3351AABF19732ABE46F0AABF57211ABE2F5DC4BF76413B3EB103C53FE20D4DBE276195BF8F3C953E78FBAFBF9CEF45BE625EA63F89E01C3D7C84BABF30F6CA3E5BE89B3FC0DF3FBE74C4B43F177144BEB14CA93FD952C73ECA19B73F8F2B2DBE08DFB03FB210183D7262B73F799397BE1553C73F6B5A89BE06A7BC3FEA1DCF3D989AB6BF60998EBE7720B8BF4955CABC818CA43F214BB1BE0605AB3F3523CABDCB4286BFA3D3A23DF01DBB3F1F7F86BE7D47A53F873DC9B8C036B6BFF763DE3D04DBC03FEED37C3E1E1BB83FDEB1B2BD9318BB3F43A9D1BCA5C7BB3F0B62553E4F18B93F83FA31BE39EB8A3F63AD96BD7882A8BF1B89F63E4D4C9BBFA525EC3CC02FA73F4AD53BBEB616A93F64AC8B3E320B9C3F62337EBD73E778BF9D9A53BF1B39B63F764DE33DB1A7C5BFDB4D47BEEC1BA33F3CAC153D76473ABF5332173EB60BB2BFDFC1A23D4816BEBF2AB016BEDE6D063F54DA2A3FCEFEA63F053BF53D73DDC23FFB0A693ECEFABCBFEB0D83BE4B4AC63FEE2C1FBE9ED2A6BF4183123E0563A9BFEC5E8DBF48EBBE3F0C2FB53E5E5FB13F921C1DBE1E8EACBFA25B9B3B7ADC9DBF3D6C59BE0067C4BFC2B8883E5FFCBE3F232978BE7BF6A4BFC4D6A2BE47B9C8BFFFF027BE29B89C3F357ECBBDDBDEB9BFF961463EE961A4BF7D7C9ABC5276C2BF0860AC3ECDF5933EABE62ABE1366B43FC84C24BD09188A3FCDA081BE1790C7BFA395183ED310C43F63C8643E6F48BA3F7BE3A63E5B3DBABF19B827BEE4C9C43F7A632A3EEC09C7BFC12A763E0878C2BF94DA133E683DB9BF61922D3D8A41C83F32EA7FBE4F36B73F76D0D2BDF697AE3F01CEBFBD40C2AABFEA813FBEC065BBBF19C204BE47A0C53FA01965BE759F7DBF41EE323F45878D3F375333BE9985BDBF7E18AA3D6514C5BF3C8B0A3EE407763F4245EA3EDEB588BF51F3AF3EF9EB9FBF58648BBD9CAFB7BFF0D8C03CCA3B723FB5AC523D1459A63FB7972F3D6D3365BF307E8CBF4BFDB3BF43D1C03DD4ABA7BE83CDE63E2EC5AC3FCA60D9BD7431BEBF3EE220BEF8B9B73F73C77ABDB144B4BF0F90E6BAA391C2BF24002B3E6CE9A1BFB5C87E3E6B0989BFA0AE833EC0EBC33F267421BE95EAC03F7E7F87BE2864AB3F76C5D3BD1A5C93BF9940AC3E72BAA1BFCB1C783DF831A8BF9C47ABBE1FA28E3F1E7946BEA6E2C43DCF249BBD6144B93FC5B9793D354FB13F4FF807BED051BBBFD8AD00BD1A81AA3FDD3412BE4615B23F8886B93D8EEBB2BF7F3C1FBDC7799CBF8898C23EE8C298BF305A583EA72102BEDD2D26BFB2A0C33F26D5C53D40EEB1BF114941BD71528FBFFAD42BBF639BB93F8ED7173D1E08B7BF7A73013E7836903F361722BE989EAF3FE66A313E76FBA0BF3E761C3E3B3C8ABF3CA844BD9EE4B23FF550EA3B7169C83F6C2D833E08F8A5BF99DAE43D0965C23FCDD8C23E8EC2B6BFDE2E36BDE798B73F09A6AD3E3F1D0A3F860312BED0A4B0BFFEB1B03D433EA73F67184DBD251FC0BF3F49A8BDDF8EB33FA6A013BE9BE3B43F7964CCBB17D6B83F332A60BE1A46C0BF9F8FA23E36296E3F24E5873F60C7BBBFDE7DE3BD4B1D93BF204430BFF727A43F7385113EB2B4BE3F5147A93E2A27B33FD5DAA93D98A1B7BF6B99C9BD585A9C3F3DF2643E4585B03F3651983D36E6C6BF8E2BBFBE749BA5BF351118BD05BC6B3FEF8569BE775AB7BF00175ABB2121BD3F68A0023F0E09B8BF18F5B63DDF8BB6BF0DEC1EBEF0C0C2BD764F19BECFA2B7BFC3095D3EA8A496BF8AA08B3DDDFDB6BF9463C33EE50DAABF96B6A83D66CFC7BFB3DB00BEF563B2BFFFB406BE484FB93FFDFCBA3DDE2471BFE7B2B53D5B99C33FA9021FBEA7E5C0BF0BF7AFBE22B2A9BF2FBC223EE574B73FDE236A3E6E78B43FBBE57C3E9CA5BDBF9A98693E0AA3B0BF23738FBD2A88B73FF1130FBE2EBFAE3F1BA7C5BE5967ACBEA743963EA19EBC3F2AA68E3E82ED9BBF13E65A3EA8F1B03F6424C93C7764B73F53FB98BEEC949C3F7BE610BC08884ABFE6895FBEDA83A23FDA630E3FA3D0B73F6721ABBB17D8433F4631383E7339B1BF9FCA823CDEE3BA3FD6C4AA3E5F57C1BF41EB3FBE8AF891BF3F7F05BF8665A2BFCFEA1F3D489CC7BFE687053EB8D6C8BFD548653E456CB63FC4E34C3D4C96B23FACE70ABD4B63A7BF6E8A0BBE841FBD3F7EB8D2BE85E8C83F1124323E1A93AE3FF58A2DBE17AC823FAD27053D135A703FAC595F3E7386C63FA7AE1C3E538EABBF901B23BE6DE17ABF06E5393FAE02B0BF5C3A1C3E4A80893FEC226BBD0B109BBFE758953C8ACDBC3F5A0134BE0001B13F585E6D3DCB28BB3F1081CC3D64E45D3F3DE3E13C4125B43F359503BE4361B2BFAEB90E3E9B0298BFC3CB9ABE564B50BF70A4233FC93AC33F9E51113E626AAB3F324C2B3C3AA6A4BF19F01E3F3A37C4BFE15F873EEA3143BF9CD4A5BE835BB53FB6A194BEAEDEA6BFD2DDA1BD7E489E3CAC81F5BE7CE2A7BFB73D033E54BEBEBF827E7CBEF113ABBF8EC2FBBDD52BB7BFEBB9573D3C39ADBFEDED423E35DBBFBF3F22003E66E0BEBFFE7A863EC60499BF182B14BD4909A8BF4E0C28BFF91AB9BFF1FEEF3D0D06C63F4E6681BEAB51C3BFBEA8363EB5CEB53FA48809BE75B7C43FB56911BEC400A3BF12E3003FACFAB7BFA443783D4924B0BF6C2108BDC1F1B53F507B583E098D19BF04040FBE285BB33FAB0766BC8DE6A73F9DDDB9BC92CA9ABFF1D9373EAED8B23F92E41FBD36CBB53F2C05133F5398C6BF37C747BE5883B93FDA8D773E3608C0BFA59F503E0264A3BF4AD66EBE4237EABEAEDDD0BE6787C53F6C66903E156DA23F568486BD7982B23F054C213D"> : tensor<20x20xcomplex<f32>>
    return %0 : tensor<20x20xcomplex<f32>>
  }
}
