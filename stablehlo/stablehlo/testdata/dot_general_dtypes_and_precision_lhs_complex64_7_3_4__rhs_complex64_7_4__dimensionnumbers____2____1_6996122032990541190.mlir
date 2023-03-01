module @jit_testcase {
  func.func public @main() -> tensor<i1> {
    %0:2 = call @inputs() : () -> (tensor<7x3x4xcomplex<f32>>, tensor<7x4xcomplex<f32>>)
    %1 = call @expected() : () -> tensor<7x3xcomplex<f32>>
    %2 = "stablehlo.dot_general"(%0#0, %0#1) {dot_dimension_numbers = #stablehlo.dot<lhs_batching_dimensions = [0], rhs_batching_dimensions = [0], lhs_contracting_dimensions = [2], rhs_contracting_dimensions = [1]>, precision_config = [#stablehlo<precision DEFAULT>, #stablehlo<precision DEFAULT>]} : (tensor<7x3x4xcomplex<f32>>, tensor<7x4xcomplex<f32>>) -> tensor<7x3xcomplex<f32>>
    %3 = stablehlo.custom_call @check.eq(%2, %1) : (tensor<7x3xcomplex<f32>>, tensor<7x3xcomplex<f32>>) -> tensor<i1>
    return %3 : tensor<i1>
  }
  func.func private @inputs() -> (tensor<7x3x4xcomplex<f32>>, tensor<7x4xcomplex<f32>>) {
    %0 = stablehlo.constant dense<[[[(-0.0164603163,0.18213664), (6.85391188,0.917525291), (-0.248676077,-1.41984034), (-2.09775352,1.64188063)], [(8.77272415,2.10074568), (5.42228413,0.733952045), (3.98618603,3.7920692), (1.47142136,-2.37598586)], [(2.25140047,-2.91143274), (2.585020e-01,-1.76537168), (-1.97041571,-4.51007366), (-0.715976477,0.787962794)]], [[(-5.00615835,1.84154785), (-0.23434861,5.749360e-02), (0.912370741,-3.44911337), (-4.28070736,-1.2914362)], [(-5.16662502,-0.595933557), (1.35395229,-4.23118448), (-0.590940952,1.13349414), (1.47532725,2.567530e+00)], [(1.962330e+00,-0.81849122), (1.87825215,2.86276674), (1.75885415,0.294148356), (-1.28985012,0.848247051)]], [[(1.79600251,-2.17921758), (5.12436342,2.14217234), (-5.64032936,-0.691277385), (6.84983492,2.81602693)], [(1.95831096,-1.38176954), (2.7004652,-1.57104838), (-2.45139456,2.05167103), (4.94364119,4.28096819)], [(-0.29843244,-1.43243861), (2.34785628,-1.01366544), (3.07701302,-1.89307916), (-0.811336815,-0.0178306047)]], [[(4.33615685,1.34947515), (-1.84072888,-0.982733726), (-0.588516355,0.621471881), (0.643717467,-2.14073849)], [(-2.73191166,-4.50527573), (-4.04083824,-0.841638922), (0.684921085,0.914618849), (0.133563265,-0.465844035)], [(-2.71310019,-0.106858358), (1.13972068,-2.39741564), (-3.43882203,2.71690822), (3.03330255,-0.162381127)]], [[(2.81263471,5.48611307), (3.27268147,-0.374169648), (1.77456594,3.42813087), (0.212577805,3.29264975)], [(-2.07382536,-4.20794439), (0.167512208,6.878630e-01), (0.917156636,1.56255889), (-0.621105611,1.88747907)], [(-0.417967826,-9.10442543), (-4.85065365,-4.06018591), (-4.94884205,-0.769259512), (-3.31284237,-1.33032441)]], [[(-0.558966696,2.80484748), (-2.1437552,-2.55374026), (-6.73742247,0.782515764), (-0.319204271,-2.16783285)], [(-7.93706846,-3.733150e+00), (0.0930430591,-4.24577332), (-0.7099182,-1.92841566), (-0.151359066,1.44509089)], [(-0.67013061,4.80700636), (-2.52815819,-2.69487262), (1.67900407,0.958972334), (4.87718773,6.98429489)]], [[(-1.31922972,1.70639718), (1.20799899,1.07501042), (-4.51210213,2.93901944), (1.53660011,-0.122724295)], [(0.154393286,3.21194077), (1.43987417,1.12181842), (-3.65472269,1.39784062), (-1.06188607,-1.51272714)], [(-1.24827778,2.15648365), (-0.724931598,2.01875401), (-0.565878153,-3.34012508), (-0.664221168,-1.74147248)]]]> : tensor<7x3x4xcomplex<f32>>
    %1 = stablehlo.constant dense<[[(3.7066052,1.7508173), (-2.34988713,1.27316213), (-0.180840522,-0.0130790789), (-1.402180e-01,-1.28517818)], [(-2.411930e+00,4.75396395), (3.1238811,1.91952825), (2.22378278,-2.8637259), (0.940585494,0.686594069)], [(-0.651149094,-0.819881856), (-0.789198875,2.03396559), (-2.22479773,-1.16173315), (3.21309614,-1.76424396)], [(-1.52332067,2.1858077), (1.29805636,3.7497642), (5.8851614,0.0618312843), (1.86945808,-1.83823359)], [(0.155619532,5.1771512), (-5.30330849,2.69312787), (1.13749123,-2.61771488), (-5.79774237,-1.9056536)], [(1.26281917,0.910137593), (1.89820063,0.954443991), (2.01838064,0.218678296), (-2.96268106,4.54863119)], [(-1.60316896,-1.66981637), (3.36202812,4.0734539), (4.11141539,-6.92449474), (-2.87196755,3.72189283)]]> : tensor<7x4xcomplex<f32>>
    return %0, %1 : tensor<7x3x4xcomplex<f32>>, tensor<7x4xcomplex<f32>>
  }
  func.func private @expected() -> tensor<7x3xcomplex<f32>> {
    %0 = stablehlo.constant dense<[[(-15.2233267,9.94213199), (11.2316542,26.0290356), (16.4930019,-0.721155763)], [(-8.51066589,-42.9476929), (29.2027626,-26.1024952), (2.4884038,19.3807812)], [(27.3654366,13.7325583), (29.9306335,9.3433628), (-12.4546165,8.76400757)], [(-14.4931154,-2.3198719), (15.2876368,-11.0445042), (-0.198217869,5.291500e+00)], [(-28.2784843,5.97239494), (31.0530472,-24.9711266), (92.7579498,30.9939194)], [(-7.85397624,1.21641421), (-9.53237438,-28.9259853), (-50.4875069,1.72709763)], [(2.49043918,57.4012489), (8.72022247,35.6762428), (-22.1244545,-4.82361031)]]> : tensor<7x3xcomplex<f32>>
    return %0 : tensor<7x3xcomplex<f32>>
  }
}
