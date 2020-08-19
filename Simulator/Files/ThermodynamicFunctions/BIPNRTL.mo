within Simulator.Files.ThermodynamicFunctions;

function BIPNRTL "Function to contain the Binary Interaction Parameters for NRTL Property Package"
extends Modelica.Icons.Function;
input Integer Nc;
input String CAS[Nc];
output Real BIP[Nc, Nc, 2];
protected
constant String Us = "_";
String c_cc[Nc, Nc];
String d_cc[Nc, Nc];
constant String CAS_CAS[352] = {"67-56-1_56-23-5", "67-56-1_75-25-2", "67-66-3_67-56-1", "75-09-2_67-56-1", "67-56-1_75-12-7", "151-67-7_67-56-1", "75-01-4_67-56-1", "67-56-1_75-05-8", "67-56-1_107-06-2", "67-56-1_64-19-7", "107-31-3_67-56-1", "67-56-1_64-17-5", "67-56-1_67-68-5", "124-40-3_67-56-1", "67-64-1_67-56-1", "123-38-6_67-56-1", "75-56-9_67-56-1", "79-20-9_67-56-1", "67-56-1_79-09-4", "67-56-1_68-12-2", "67-56-1_71-23-8", "109-87-5_67-56-1", "67-56-1_110-02-1", "106-99-0_67-56-1", "67-56-1_96-33-3", "115-11-7_67-56-1", "67-56-1_78-93-3", "67-56-1_109-99-9", "67-56-1_123-91-1", "67-56-1_141-78-6", "67-56-1_126-33-0", "106-97-8_67-56-1", "67-56-1_71-36-3", "67-56-1_78-92-2", "60-29-7_67-56-1", "67-56-1_110-63-4", "67-56-1_110-86-1", "542-92-7_67-56-1", "78-79-5_67-56-1", "1574-41-0_67-56-1", "2004-70-8_67-56-1", "67-56-1_80-62-6", "513-35-9_67-56-1", "67-56-1_563-80-4", "67-56-1_110-89-4", "1634-04-4_67-56-1", "67-56-1_392-56-3", "67-56-1_108-90-7", "67-56-1_71-43-2", "67-56-1_62-53-3", "67-56-1_109-06-8", "67-56-1_108-99-6", "67-56-1_108-89-4", "67-56-1_110-83-8", "67-56-1_110-82-7", "592-41-6_67-56-1", "67-56-1_123-86-4", "67-56-1_110-54-3", "67-56-1_121-44-8", "67-56-1_108-88-3", "67-56-1_108-48-5", "67-56-1_592-76-7", "67-56-1_108-87-2", "67-56-1_142-82-5", "67-56-1_100-41-4", "67-56-1_108-38-3", "67-56-1_106-42-3", "67-56-1_111-66-0", "67-56-1_111-65-9", "67-56-1_540-84-1", "56-23-5_67-56-1", "67-66-3_64-17-5", "75-09-2_64-17-5", "64-17-5_127-18-4", "64-17-5_75-05-8", "64-17-5_107-06-2", "64-17-5_64-19-7", "64-17-5_107-21-1", "124-40-3_64-17-5", "67-64-1_64-17-5", "79-20-9_64-17-5", "64-17-5_67-63-0", "64-17-5_110-02-1", "108-05-4_64-17-5", "64-17-5_78-93-3", "109-99-9_64-17-5", "64-17-5_123-91-1", "141-78-6_64-17-5", "64-17-5_126-33-0", "64-17-5_78-92-2", "60-29-7_64-17-5", "64-17-5_78-83-1", "109-73-9_64-17-5", "64-17-5_110-86-1", "78-79-5_64-17-5", "64-17-5_80-62-6", "513-35-9_64-17-5", "64-17-5_563-80-4", "64-17-5_109-60-4", "78-78-4_64-17-5", "109-66-0_64-17-5", "64-17-5_123-51-3", "64-17-5_108-86-1", "64-17-5_108-90-7", "64-17-5_71-43-2", "64-17-5_62-53-3", "64-17-5_108-99-6", "64-17-5_110-82-7", "592-41-6_64-17-5", "64-17-5_108-93-0", "64-17-5_123-86-4", "110-54-3_64-17-5", "64-17-5_111-43-3", "64-17-5_121-44-8", "64-17-5_108-88-3", "64-17-5_100-66-3", "64-17-5_108-48-5", "64-17-5_628-63-7", "64-17-5_142-82-5", "64-17-5_100-41-4", "64-17-5_106-42-3", "64-17-5_111-65-9", "64-17-5_540-84-1", "64-17-5_544-76-3", "64-17-5_112-80-1", "56-23-5_71-23-8", "71-23-8_127-18-4", "79-01-6_71-23-8", "107-06-2_71-23-8", "71-23-8_64-19-7", "124-40-3_71-23-8", "71-23-8_79-09-4", "67-63-0_71-23-8", "71-23-8_109-86-4", "107-10-8_71-23-8", "71-23-8_79-41-4", "78-93-3_71-23-8", "109-99-9_71-23-8", "109-69-3_71-23-8", "71-23-8_78-83-1", "109-73-9_71-23-8", "71-23-8_110-86-1", "71-23-8_80-62-6", "71-23-8_109-60-4", "71-23-8_123-51-3", "392-56-3_71-23-8", "71-23-8_108-90-7", "71-43-2_71-23-8", "71-23-8_109-06-8", "71-23-8_108-99-6", "71-23-8_108-89-4", "110-82-7_71-23-8", "110-54-3_71-23-8", "71-23-8_142-84-7", "121-44-8_71-23-8", "71-23-8_107-46-0", "71-23-8_108-88-3", "71-23-8_108-48-5", "71-23-8_142-82-5", "71-23-8_100-41-4", "71-23-8_111-65-9", "71-23-8_124-18-5", "71-23-8_112-30-1", "67-56-1_7732-18-5", "67-56-1_67-66-3", "67-56-1_64-17-5", "67-56-1_67-64-1", "67-56-1_71-43-2", "67-56-1_110-82-7", "67-56-1_108-88-3", "67-56-1_142-82-5", "7732-18-5_67-64-1", "7732-18-5_78-93-3", "7732-18-5_108-95-2", "64-17-5_7732-18-5", "64-17-5_67-66-3", "64-17-5_67-64-1", "64-17-5_78-93-3", "64-17-5_71-43-2", "64-17-5_110-82-7", "64-17-5_108-88-3", "64-17-5_142-82-5", "64-17-5_106-42-3", "67-64-1_67-66-3", "67-64-1_71-43-2", "67-64-1_108-95-2", "67-64-1_110-82-7", "67-64-1_108-88-3", "78-93-3_71-43-2", "78-93-3_110-82-7", "78-93-3_108-88-3", "78-93-3_142-82-5", "71-43-2_67-66-3", "71-43-2_108-95-2", "71-43-2_108-88-3", "71-43-2_106-42-3", "108-88-3_67-66-3", "108-88-3_106-42-3", "108-87-2_108-95-2", "7732-18-5_79-34-5", "109-87-5_7732-18-5", "107-10-8_7732-18-5", "78-93-3_7732-18-5", "78-84-2_7732-18-5", "109-99-9_7732-18-5", "7732-18-5_123-91-1", "141-78-6_7732-18-5", "7732-18-5_126-33-0", "7732-18-5_127-19-5", "7732-18-5_110-91-8", "7732-18-5_71-36-3", "78-83-1_7732-18-5", "75-65-0_7732-18-5", "60-29-7_7732-18-5", "7732-18-5_110-63-4", "7732-18-5_513-85-9", "7732-18-5_111-46-6", "109-73-9_7732-18-5", "109-89-7_7732-18-5", "7732-18-5_98-01-1", "7732-18-5_110-86-1", "7732-18-5_120-94-5", "7732-18-5_123-51-3", "7732-18-5_75-85-4", "7732-18-5_108-95-2", "7732-18-5_62-53-3", "7732-18-5_109-06-8", "7732-18-5_108-99-6", "7732-18-5_108-89-4", "7732-18-5_100-63-0", "7732-18-5_108-94-1", "7732-18-5_141-79-7", "7732-18-5_108-93-0", "7732-18-5_123-86-4", "7732-18-5_123-42-2", "108-20-3_7732-18-5", "7732-18-5_111-27-3", "7732-18-5_626-93-7", "7732-18-5_111-76-2", "121-44-8_7732-18-5", "7732-18-5_100-51-6", "7732-18-5_108-48-5", "7732-18-5_123-92-2", "7732-18-5_98-86-2", "7732-18-5_91-22-5", "7732-18-5_98-82-8", "56-23-5_71-43-2", "71-43-2_75-25-2", "67-66-3_71-43-2", "74-88-4_71-43-2", "71-43-2_75-52-5", "75-15-0_71-43-2", "76-13-1_71-43-2", "71-43-2_127-18-4", "71-43-2_79-01-6", "71-43-2_76-01-7", "71-43-2_79-34-5", "71-55-6_71-43-2", "71-43-2_106-93-4", "71-43-2_107-06-2", "75-03-6_71-43-2", "71-43-2_123-39-7", "71-43-2_79-24-3", "71-43-2_67-68-5", "71-43-2_107-15-3", "71-43-2_68-12-2", "71-43-2_108-03-2", "71-43-2_79-46-9", "71-43-2_110-02-1", "109-73-9_71-43-2", "75-64-9_71-43-2", "109-89-7_71-43-2", "71-43-2_110-86-1", "71-43-2_392-56-3", "71-43-2_106-46-7", "71-43-2_108-86-1", "71-43-2_108-90-7", "71-43-2_462-06-6", "71-43-2_98-95-3", "71-43-2_62-53-3", "71-43-2_108-91-8", "71-43-2_121-44-8", "71-43-2_100-47-0", "71-43-2_108-88-3", "71-43-2_100-60-7", "71-43-2_100-42-5", "71-43-2_100-41-4", "71-43-2_108-38-3", "71-43-2_106-42-3", "71-43-2_91-66-7", "71-43-2_98-82-8", "71-43-2_103-65-1", "71-43-2_92-06-8", "56-23-5_108-88-3", "67-66-3_108-88-3", "75-15-0_108-88-3", "79-01-6_108-88-3", "75-05-8_108-88-3", "624-83-9_108-88-3", "107-06-2_108-88-3", "108-88-3_79-24-3", "108-88-3_67-68-5", "108-88-3_107-15-3", "107-12-0_108-88-3", "108-88-3_68-12-2", "110-02-1_108-88-3", "108-88-3_126-33-0", "109-89-7_108-88-3", "108-88-3_110-86-1", "392-56-3_108-88-3", "108-88-3_108-86-1", "108-88-3_108-90-7", "462-06-6_108-88-3", "108-88-3_98-95-3", "108-88-3_109-06-8", "108-88-3_108-99-6", "108-88-3_100-47-0", "108-88-3_100-41-4", "108-88-3_106-42-3", "107-13-1_100-42-5", "100-41-4_100-42-5", "100-42-5_103-65-1", "56-23-5_100-41-4", "75-05-8_100-41-4", "107-13-1_100-41-4", "109-89-7_100-41-4", "108-90-7_100-41-4", "100-41-4_98-95-3", "100-41-4_62-53-3", "100-41-4_98-82-8", "100-41-4_104-51-8", "56-23-5_108-38-3", "108-38-3_68-12-2", "110-86-1_108-38-3", "108-38-3_62-53-3", "106-42-3_108-38-3", "107-06-2_95-47-6", "107-15-3_95-47-6", "95-47-6_68-12-2", "56-23-5_106-42-3", "75-05-8_106-42-3", "107-06-2_106-42-3", "106-42-3_68-12-2", "392-56-3_106-42-3", "108-90-7_106-42-3", "106-42-3_62-53-3", "56-23-5_98-82-8", "103-65-1_98-95-3", "95-63-6_526-73-8", "104-51-8_98-95-3", "99-87-6_62-53-3", "91-57-6_90-12-0"};

constant Real BIPdb[352, 3] = {{378.8254, 1430.7379, 0.2892}, {879.0968, 1063.6098, 0.6381}, {1414.2712, -141.8030, 0.2949}, {1560.0282, 441.3372, 0.6234}, {617.5847, -153.4695, 0.3003}, {9870.3530, -6982.8569, 0.187e-1}, {1789.7165, -34.9448, 0.2912}, {343.7042, 314.5879, 0.2981}, {348.6035, 1020.1431, 0.2921}, {16.6465, -217.1261, 0.3051}, {584.5720, 298.5567, 0.2962}, {-327.9991, 376.2667, 0.3057}, {-168.3182, -497.4171, 0.3079}, {-1018.1430, -54.3882, 0.3134}, {184.2662, 226.5580, 0.3009}, {1046.6524, -865.2660, 0.3084}, {924.8499, -61.1796, 0.2986}, {381.4559, 346.5360, 0.2965}, {-50.1450, -78.0859, 0.3056}, {-124.0904, 0.3428, 09.1633}, {24.9003, 9.5349, 0.3011}, {608.9115, 712.0226, 0.7259}, {-90.1051, 1217.1035, 0.2976}, {1353.0599, 610.8292, 0.4670}, {676.8360, 169.9831, 0.2958}, {1333.6000, 556.3608, 0.3697}, {307.4271, 217.9098, 0.3003}, {169.4153, 383.1579, 0.3002}, {607.4050, 76.7683, 0.2985}, {345.5416, 420.7355, 0.2962}, {1069.2756, 906.5741, 0.7182}, {1440.1498, 1053.7716, 0.4647}, {793.8173, -486.3299, 0.2483}, {-308.5610, 285.4420, 0.3036}, {705.9989, 211.1580, 0.2953}, {446.9520, -450.5858, 0.3152}, {-45.0888, 84.1956, 0.3027}, {1541.9324, 736.0352, 0.4515}, {1445.6425, 543.5270, 0.4260}, {1545.3339, 799.1289, 0.4753}, {1514.2761, 782.1729, 0.4657}, {590.2790, 380.8401, 0.2963}, {1355.6853, 660.9164, 0.3381}, {642.3761, -6.2901, 0.2987}, {590.8820, -1169.7242, 0.1387}, {851.4954, 465.8360, 0.8178}, {930.5910, 1244.1303, 0.4701}, {857.0852, 1348.0903, 0.4707}, {721.6136, 1158.5131, 0.4694}, {407.7440, 117.2473, 0.3008}, {226.0820, -385.6823, 0.3095}, {-163.4505, -86.1482, 0.3075}, {304.2242, -452.3483, 0.3053}, {1178.5792, 1618.9792, 0.4568}, {1315.1631, 1497.2135, 0.4222}, {1222.6032, 1145.1085, 0.4402}, {328.2162, 453.0017, 0.2961}, {1619.3829, 1622.2911, 0.4365}, {-476.8503, 1126.1143, 0.2874}, {939.7275, 1090.9297, 0.4643}, {-273.3320, 59.6250, 0.3051}, {1313.5497, 1143.9059, 0.4163}, {1444.5850, 1719.4586, 0.4397}, {1500.2043, 1519.3346, 0.4277}, {1080.1231, 1038.1572, 0.4251}, {991.1609, 822.1357, 0.2910}, {974.6545, 851.1070, 0.2921}, {1456.3583, 1147.8132, 0.4396}, {1681.6918, 1511.4353, 0.4381}, {1447.0909, 1386.4703, 0.4313}, {1339.9000, 488.6648, 0.4622}, {1438.3602, -327.5518, 0.3023}, {1332.8036, -153.0761, 0.3057}, {685.8542, 807.5935, 0.2900}, {529.7267, 338.1632, 0.2964}, {333.3502, 939.3870, 0.2926}, {-34.1971, -190.7763, 0.3050}, {1644.0484, -203.7691, 0.3704}, {-1224.5739, 370.7683, 0.3105}, {36.2965, 434.8228, 0.2987}, {188.3139, 158.0118, 0.3013}, {690.1392, -529.3472, 0.3125}, {222.3096, 1057.7115, 0.2918}, {505.1637, 320.7403, 0.2959}, {64.4957, 463.1931, 0.3010}, {661.3708, -200.6915, 0.3015}, {505.5637, 111.8389, 0.2988}, {305.6041, 330.5105, 0.2988}, {1195.1601, 705.0897, 0.5676}, {-559.8205, 802.5411, 0.2721}, {763.6707, 71.1984, 0.2946}, {53.1671, 82.0442, 0.3023}, {-612.3956, -5.7834, 0.3062}, {163.6655, -169.9802, 0.3017}, {1402.5377, 653.4866, 0.5056}, {456.9676, 386.5893, 0.2963}, {1412.7516, 674.7726, 0.4569}, {-54.0946, 639.6806, 0.3009}, {760.4933, 129.3970, 0.2950}, {1610.2811, 935.1426, 0.4960}, {1183.3812, 412.7546, 0.2886}, {51.1705, -42.8613, 0.3009}, {820.8023, 1349.6853, 0.4995}, {645.7829, 1383.7110, 0.5229}, {516.1410, 1065.9086, 0.4774}, {1823.3542, -523.0474, 0.3005}, {315.6078, -339.0825, 0.3056}, {876.7933, 1390.4162, 0.4485}, {1399.1806, 949.7239, 0.5011}, {1719.8644, -833.8389, 0.2920}, {841.9935, -55.3231, 0.2958}, {1218.1065, 575.2985, 0.2882}, {442.6124, 634.1687, 0.2945}, {-248.0407, 697.9004, 0.2996}, {713.5653, 1147.8607, 0.5292}, {3458.4788, -1438.8884, 0.1704}, {-48.2159, -19.6212, 0.3016}, {552.3897, 266.1248, 0.2964}, {1137.2650, 1453.5947, 0.4786}, {801.7191, 1006.8831, 0.4962}, {768.3633, 760.0800, 0.2914}, {1206.8097, 1385.3721, 0.4717}, {1091.0432, 1500.6711, 0.4738}, {2359.4082, 1509.2033, 0.4448}, {975.6816, -343.5446, 0.2988}, {1537.6384, 537.2439, 0.6310}, {608.3777, 646.0412, 0.2913}, {926.6139, 196.0696, 0.3007}, {636.9927, 364.0596, 0.2956}, {256.8999, -327.5173, 0.3044}, {81.4870, -703.3731, 0.2697}, {-189.7856, -32.4657, 0.3070}, {167.2501, -175.2928, 0.3057}, {-406.3767, 830.8897, 0.3013}, {-602.9687, -45.3543, 0.3061}, {276.6356, -423.9162, 0.3025}, {148.8670, 213.3829, 0.3016}, {562.4611, -302.2498, 0.3003}, {1201.9959, 506.8982, 0.5468}, {-2.8139, -13.8657, 0.3034}, {-698.9510, 34.7593, 0.3001}, {374.8691, -412.2861, 0.3110}, {504.0900, 125.6451, 0.2993}, {340.0210, 111.7437, 0.3005}, {12.2207, -31.8303, 0.3033}, {922.5224, 528.5894, 0.2937}, {456.2867, 538.5114, 0.2946}, {874.2419, 285.7774, 0.2899}, {529.6444, -608.3163, 0.3054}, {479.7439, -540.4699, 0.3045}, {523.8291, -603.0924, 0.3084}, {1707.7883, 353.2705, 0.5914}, {1092.1470, 480.6740, 0.2940}, {617.3558, -459.5845, 0.2892}, {991.6157, -435.2018, 0.3067}, {1615.0711, -498.3638, 0.1028}, {25.6220, 922.0009, 0.175e-1}, {472.9353, -545.1853, 0.2960}, {1198.9720, 1377.2975, 0.5193}, {563.6173, 475.5966, 0.2921}, {1109.3040, 334.2112, 0.2907}, {945.3159, 520.2926, 0.2895}, {1068.0694, -588.3325, 0.2958}, {-189.0469, 792.8020, 0.2999}, {-105.4657, 1335.3416, 0.2873}, {67.2902, -70.5092, 0.3009}, {296.2432, 118.0803, 0.3003}, {761.7553, 1094.8556, 0.4893}, {1313.9316, 1862.4639, 0.4410}, {884.0230, 1008.0037, 0.4064}, {1566.4390, 1598.3126, 0.4408}, {1324.9767, 814.1435, 0.5663}, {653.9718, 1883.6007, 0.3607}, {2419.3354, 1844.3794, 0.6308}, {-57.9601, 1241.7396, 0.2937}, {-285.3881, 1289.2198, 0.2909}, {375.3497, 45.3706, 0.3006}, {437.1923, 33.6363, 0.3022}, {255.3591, 1047.1959, 0.2970}, {761.7739, 1393.7993, 0.4376}, {542.4128, 772.4394, 0.2937}, {1114.2947, 1305.9242, 0.4758}, {1020.8405, 889.3461, 0.6180}, {-651.1909, 301.8389, 0.3054}, {-396.4935, 886.5703, 0.2971}, {-754.9547, -280.3830, 0.3086}, {429.8705, 727.6490, 0.2925}, {-247.9492, 727.5102, 0.2950}, {-644.8573, 898.3999, 0.1563}, {605.7381, 235.4493, 0.2963}, {503.0737, -181.5533, 0.2996}, {681.5104, 931.4616, 0.9809}, {-227.3671, -86.1025, 0.3062}, {373.4202, 318.1885, 0.2986}, {60.1980, -51.0865, 0.3019}, {-50.2635, 14.2180, 0.3056}, {-583.6169, 629.2214, 0.2974}, {226.4602, -241.7457, 0.2874}, {2587.8730, -439.4469, 0.2836}, {2435.8879, 102.7658, 0.972e-1}, {1608.0700, 1818.2947, 0.4898}, {-455.9152, 1301.6396, 0.2981}, {674.4614, 1809.8868, 0.3536}, {1166.8333, 1090.0262, 0.2862}, {915.7450, 1725.0977, 0.4522}, {715.9592, 548.8965, 0.2920}, {1285.9880, 1606.0820, 0.4393}, {1160.1372, 467.9008, 0.5573}, {75.5965, 328.8977, 0.3009}, {-803.1654, 1732.7268, 0.2954}, {2633.6951, 504.0381, 0.4447}, {639.8173, 2491.0163, 0.4385}, {471.7718, 2030.8877, 0.5155}, {1544.0251, 2086.4776, 0.3792}, {1310.8994, 1920.1402, 0.5778}, {2531.7402, -758.0034, 0.3020}, {1186.7304, -99.9000, 0.2974}, {160.3429, 2104.4002, 0.6379}, {-169.1652, 1372.3121, 0.2932}, {2602.6374, 436.9686, 0.3950}, {1835.0881, 419.8087, 0.6802}, {-239.6197, 573.8298, 0.3055}, {3633.5330, -494.8389, 0.2816}, {19947.2334, -15910.4563, 0.56e-2}, {2385.3714, 282.6970, 0.4942}, {11965.5274, -7391.5468, 0.235e-1}, {1979.5492, 197.0009, 0.6371}, {2559.3708, 418.7524, 0.5361}, {2325.9141, 162.3029, 0.5622}, {1473.9606, -66.4169, 0.811e-1}, {2983.8991, -171.6660, 0.2673}, {2121.4973, 101.3068, 0.1504}, {2232.9727, 641.3504, 0.4399}, {3805.0038, 918.2419, 0.2951}, {1323.2731, 845.9826, 0.6780}, {2665.1471, 4202.0746, 0.5409}, {2991.1845, -464.8054, 0.1563}, {1880.1699, 489.1746, 0.2938}, {1914.0077, 220.0262, 0.4776}, {-5096.5280, 28437.1380, 0.381e-1}, {4689.8409, 301.3998, 0.3168}, {2222.5960, 831.9908, 0.5706}, {1874.8967, 856.9565, 0.3734}, {725.1364, 858.8268, 00.}, {11675.1604, -3887.1802, 0.902e-1}, {2986.1161, -84.8485, 0.860e-1}, {-4.9421, 84.0212, 0.3055}, {893.4167, -566.9011, 0.2551}, {176.8791, -288.2136, 0.3061}, {294.4424, -185.2944, 0.3013}, {273.5119, 524.9030, 0.2961}, {161.2943, 431.5524, 0.3008}, {-53.1528, 551.9630, 0.3013}, {-94.1122, 288.6566, 0.3023}, {140.5075, -127.4605, 0.3064}, {-225.8274, 197.7460, 0.3030}, {-73.7504, -250.7743, 0.3055}, {-73.4845, 97.5682, 0.3038}, {-100.9240, 300.0048, 0.3046}, {58.8289, -39.5526, 0.3035}, {394.5891, 298.1172, 0.3004}, {1512.9737, 639.2332, 0.5231}, {527.2886, -57.1531, 0.3004}, {810.5440, 408.5646, 0.6691}, {490.0693, 560.0207, 0.2957}, {736.7867, -251.4046, 0.3074}, {-157.3069, 595.6615, 0.3012}, {1088.4773, -446.4137, 0.3068}, {-347.2708, 503.5971, 0.3045}, {65.9717, 67.1231, 0.3024}, {-344.6666, 757.9930, 0.3067}, {52.3512, -42.2029, 0.2813}, {541.0855, -319.8327, 0.2795}, {1085.4557, -715.7662, 0.2989}, {1441.9721, -865.5699, 0.2830}, {1538.3464, -819.5924, 0.3214}, {700.4097, -450.6274, 0.3251}, {277.6641, -292.2391, 0.3040}, {1311.3264, -523.3212, 0.3110}, {776.8671, -178.3464, 0.2990}, {717.4228, -684.6315, 0.2908}, {130.6061, -27.3294, 0.3037}, {1390.4880, -636.1853, 0.2851}, {111.1157, -121.2437, 0.3033}, {52.3967, 94.0417, 0.3020}, {-643.5999, 970.4264, 0.3110}, {-70.8372, 57.0902, 0.3034}, {-454.1872, 615.2806, 0.2878}, {-50.2635, 14.2180, 0.3056}, {85.2080, 104.9548, 0.3019}, {1915.7178, -810.5032, 0.3693}, {-192.1433, 141.5054, 0.3032}, {64.1947, 78.6570, 0.3022}, {-69.6810, 95.3839, 0.3041}, {629.2214, -583.6169, 0.2974}, {-591.6879, 1052.8580, 0.2439}, {185.3799, -250.7688, 0.3062}, {790.7250, 724.0955, 0.9353}, {-167.8974, 104.6027, 0.3029}, {-217.7768, 251.5704, 0.3097}, {537.4434, 21.7626, 0.3011}, {1063.2839, 192.0041, 0.2898}, {432.7908, 592.5054, 0.2969}, {-95.6685, 717.0741, 0.3009}, {-2260.2463, 3666.1775, 0.711e-1}, {510.1471, -197.5696, 0.3015}, {5175.2573, 224.8869, 0.4600}, {91.4853, -153.9388, 05.1012}, {264.6428, -60.3423, 0.2992}, {668.6525, -666.7128, 0.2414}, {-47.4722, 15.0630, 0.3049}, {-40.5158, 15.0972, 0.3037}, {386.4643, -304.6112, 0.3083}, {806.4313, -288.9774, 0.2969}, {396.5492, -97.1224, 0.3028}, {-490.8706, 1036.9557, 0.2963}, {-676.6725, 1239.9195, 0.3000}, {663.0837, -482.5109, 0.3005}, {226.4602, -241.7457, 0.2874}, {598.0263, -130.4323, 0.3023}, {-539.7919, 813.9959, 0.3466}, {649.8687, -453.4673, 0.3067}, {-172.3762, 122.4657, 0.3034}, {1102.5396, 5.3234, 0.2980}, {1304.6073, -338.2481, 0.2994}, {928.9662, -553.9006, 0.3457}, {357.7079, -307.8057, 0.3076}, {519.4154, -64.0219, 0.3003}, {243.6463, 384.0030, 0.2989}, {26.2560, -27.6358, 0.3043}, {-789.9294, 957.1492, 0.3026}, {-232.4578, 163.8924, 0.3047}, {308.9034, 548.6670, 0.2960}, {-78.8985, 351.0029, 0.3009}, {-259.4169, 1034.4099, 0.2992}, {282.0248, -254.9358, 0.3085}, {718.2538, -479.1971, 0.2870}, {1357.7269, -110.2727, 0.1967}, {559.7795, 332.8093, 0.2947}, {-192.9687, 121.7193, 0.3044}, {1413.0042, -210.0314, 0.2938}, {848.1184, -557.9036, 0.2733}, {153.1239, 722.4999, 0.2942}, {1004.5491, -949.1003, 0.2906}, {-395.6312, 359.7555, 0.3055}, {311.9792, 408.2084, 0.2972}, {-106.8166, 13.4903, 0.3033}, {329.7212, 143.3943, 0.3007}, {878.2759, -655.9008, 0.3261}, {370.6529, 140.0817, 0.3003}, {-118.3505, 885.1196, 0.2950}, {-615.6730, 811.3338, 0.3353}};

algorithm
for i in 1:Nc loop
  for j in 1:Nc loop
    for k in 1:2 loop
      BIP[i, j, k] := 0;
    end for;
  end for;
end for;
for i in 1:Nc loop
  for j in 1:Nc loop
    c_cc[i, j] := CAS[i] + Us + CAS[j];
    d_cc[i, j] := CAS[j] + Us + CAS[i];
    for k in 1:352 loop
      if c_cc[i, j] == CAS_CAS[k] then
        BIP[i, j, 1] := BIPdb[k, 1];
        BIP[j, i, 1] := BIPdb[k, 2];
        BIP[i, j, 2] := BIPdb[k, 3];
        BIP[j, i, 2] := BIPdb[k, 3];
      end if;
      if d_cc[i, j] == CAS_CAS[k] then
        BIP[j, i, 1] := BIPdb[k, 1];
        BIP[i, j, 1] := BIPdb[k, 2];
        BIP[i, j, 2] := BIPdb[k, 3];
        BIP[j, i, 2] := BIPdb[k, 3];
      end if;
    end for;
  end for;
end for;
end BIPNRTL;
