-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - �°���
-- �ļ�������xinban_qi.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-21 16:15:54

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	[1] = {szName = "K� Nghi�p Kim B�i", tbProp = {6, 1, 2075, 1, 0, 0}, nRate = 1.000000},
	[2] = {szName = "M�ng Long Kim B�i", tbProp = {6, 1, 2076, 1, 0, 0}, nRate = 1.000000},
	[3] = {szName = "Minh �o Kim B�i", tbProp = {6, 1, 2077, 1, 0, 0}, nRate = 1.000000},
	[4] = {szName = "��a Ph�ch Kim B�i", tbProp = {6, 1, 2078, 1, 0, 0}, nRate = 1.000000},
	[5] = {szName = "V� Tr�n Kim B�i", tbProp = {6, 1, 2079, 1, 0, 0}, nRate = 1.000000},
	[6] = {szName = "B�ch H�i Kim B�i", tbProp = {6, 1, 2080, 1, 0, 0}, nRate = 1.000000},
	[7] = {szName = "V� �o Kim B�i", tbProp = {6, 1, 2081, 1, 0, 0}, nRate = 1.000000},
	[8] = {szName = "Ma Th� Kim B�i", tbProp = {6, 1, 2082, 1, 0, 0}, nRate = 1.000000},
	[9] = {szName = "Khi�u chi�n L� bao", tbProp = {6, 1, 2006, 1, 0, 0}, nRate = 20.000000},
	[10] = {szName = "Ti�n Th�o L� ", tbProp = {6, 1, 71, 1, 0, 0}, nRate = 11.966000},
	[11] = {szName = "Ti�n Th�o L� ��c bi�t", tbProp = {6, 1, 1181, 1, 0, 0}, nRate = 5.000000},
	[12] = {szName = "Kim T�", tbProp = {4, 979, 1, 1, 0, 0}, nRate = 1.000000},
	[13] = {szName = "Thi�n Ni�n H� Th� �", tbProp = {6, 1, 2074, 1, 0, 0}, nRate = 1.000000},
	[14] = {szName = "Kim Quang B�c Kinh Chi M�ng", nQuality = 1, tbProp = {0, 197}, nRate = 0.001000},
	[15] = {szName = "Kim Quang Nh� �i�n Chi H�n", nQuality = 1, tbProp = {0, 202}, nRate = 0.001000},
	[16] = {szName = "Thi�n S�n Tuy�t Li�n", tbProp = {6, 1, 1431, 1, 0, 0}, nRate = 0.030000},
	[17] = {szName = "Huy�n Ch�n ��n", tbProp = {6, 1, 1678, 1, 0, 0}, nRate = 0.010000, tbParam = {1500000000}},
	[18] = {szName = "Huy�t Ch�n ��n", tbProp = {6, 1, 1677, 1, 0, 0}, nRate = 0.020000, tbParam = {1000000000}},
	[19] = {szName = "B�ch Ch�n ��n", tbProp = {6, 1, 1676, 1, 0, 0}, nRate = 0.200000, tbParam = {500000000}},
	[20] = {szName = "Th�n b� kho�ng th�ch", tbProp = {6, 1, 398, 1, 0, 0}, nRate = 1.000000},
	[21] = {szName = "T� Th�y Tinh", tbProp = {4, 239, 1, 1, 0, 0}, nRate = 7.000000},
	[22] = {szName = "Lam Th�y Tinh", tbProp = {4, 238, 1, 1, 0, 0}, nRate = 7.000000},
	[23] = {szName = "L�c Th�y Tinh", tbProp = {4, 240, 1, 1, 0, 0}, nRate = 7.000000},
	[24] = {szName = "Tinh H�ng B�o Th�ch", tbProp = {4, 353, 1, 1, 0, 0}, nRate = 4.000000},
	[25] = {szName = "Thi�t La H�n", tbProp = {6, 1, 23, 1, 0, 0}, nRate = 10.000000},
	[26] = {szName = "B�n Nh��c T�m Kinh", tbProp = {6, 1, 12, 1, 0, 0}, nRate = 2.000000},
	[27] = {szName = "Huy�n tinh kho�ng th�ch c�p 6", tbProp = {6, 1, 147, 6, 0, 0}, nRate = 5.000000},
	[28] = {szName = "Huy�n tinh kho�ng th�ch c�p 7", tbProp = {6, 1, 147, 7, 0, 0}, nRate = 4.000000},
	[29] = {szName = "Huy�n tinh kho�ng th�ch c�p 8", tbProp = {6, 1, 147, 8, 0, 0}, nRate = 1.000000},
	[30] = {szName = "Long Ph�ng V�", 	tbProp = {6, 1, 2060, 8, 0, 0}, nRate = 0.5, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	[31] = {szName = "M�nh T�c nghi�p b�ch h� v� song kh�u(1/6)", tbProp = {4, 1146, 1, 1, 0, 0}, nRate = 0.005000},
	[32] = {szName = "M�nh T�c nghi�p b�ch h� v� song kh�u(2/6)", tbProp = {4, 1147, 1, 1, 0, 0}, nRate = 0.005000},
	[33] = {szName = "M�nh T�c nghi�p b�ch h� v� song kh�u(3/6)", tbProp = {4, 1148, 1, 1, 0, 0}, nRate = 0.005000},
	[34] = {szName = "M�nh T�c nghi�p b�ch h� v� song kh�u(4/6)", tbProp = {4, 1149, 1, 1, 0, 0}, nRate = 0.005000},
	[35] = {szName = "M�nh T�c nghi�p b�ch h� v� song kh�u(5/6)", tbProp = {4, 1150, 1, 1, 0, 0}, nRate = 0.005000},
	[36] = {szName = "M�nh T�c nghi�p b�ch h� v� song kh�u(6/6)", tbProp = {4, 1151, 1, 1, 0, 0}, nRate = 0.005000},
	[37] = {szName = "M�nh Minh �o h� c�t h� uy�n (1/6)", tbProp = {4, 1194, 1, 1, 0, 0}, nRate = 0.004000},
	[38] = {szName = "M�nh Minh �o h� c�t h� uy�n (2/6)", tbProp = {4, 1195, 1, 1, 0, 0}, nRate = 0.004000},
	[39] = {szName = "M�nh Minh �o h� c�t h� uy�n (3/6)", tbProp = {4, 1196, 1, 1, 0, 0}, nRate = 0.004000},
	[40] = {szName = "M�nh Minh �o h� c�t h� uy�n (4/6)", tbProp = {4, 1197, 1, 1, 0, 0}, nRate = 0.004000},
	[41] = {szName = "M�nh Minh �o h� c�t h� uy�n (5/6)", tbProp = {4, 1198, 1, 1, 0, 0}, nRate = 0.004000},
	[42] = {szName = "M�nh Minh �o h� c�t h� uy�n (6/6)", tbProp = {4, 1199, 1, 1, 0, 0}, nRate = 0.004000},
	[43] = {szName = "M�nh ��ch kh�i c�u t�ch b� h� uy�n (1/6)", tbProp = {4, 1091, 1, 1, 0, 0}, nRate = 0.010000},
	[44] = {szName = "M�nh ��ch kh�i c�u t�ch b� h� uy�n (2/6)", tbProp = {4, 1092, 1, 1, 0, 0}, nRate = 0.010000},
	[45] = {szName = "M�nh ��ch kh�i c�u t�ch b� h� uy�n (3/6)", tbProp = {4, 1093, 1, 1, 0, 0}, nRate = 0.010000},
	[46] = {szName = "M�nh ��ch kh�i c�u t�ch b� h� uy�n (4/6)", tbProp = {4, 1094, 1, 1, 0, 0}, nRate = 0.010000},
	[47] = {szName = "M�nh ��ch kh�i c�u t�ch b� h� uy�n (5/6)", tbProp = {4, 1095, 1, 1, 0, 0}, nRate = 0.010000},
	[48] = {szName = "M�nh ��ch kh�i c�u t�ch b� h� uy�n (6/6)", tbProp = {4, 1096, 1, 1, 0, 0}, nRate = 0.010000},
	[49] = {szName = "M�nh T� kh�ng h� ph�p y�u ��i (1/6)", tbProp = {4, 1134, 1, 1, 0, 0}, nRate = 0.004000},
	[50] = {szName = "M�nh T� kh�ng h� ph�p y�u ��i (2/6)", tbProp = {4, 1135, 1, 1, 0, 0}, nRate = 0.004000},
	[51] = {szName = "M�nh T� kh�ng h� ph�p y�u ��i (3/6)", tbProp = {4, 1136, 1, 1, 0, 0}, nRate = 0.004000},
	[52] = {szName = "M�nh T� kh�ng h� ph�p y�u ��i (4/6)", tbProp = {4, 1137, 1, 1, 0, 0}, nRate = 0.004000},
	[53] = {szName = "M�nh T� kh�ng h� ph�p y�u ��i (5/6)", tbProp = {4, 1138, 1, 1, 0, 0}, nRate = 0.004000},
	[54] = {szName = "M�nh T� kh�ng h� ph�p y�u ��i (6/6)", tbProp = {4, 1139, 1, 1, 0, 0}, nRate = 0.004000},
	[55] = {szName = "M�nh V� gian ph�t v�n ti ��i (1/6)", tbProp = {4, 1158, 1, 1, 0, 0}, nRate = 0.008000},
	[56] = {szName = "M�nh V� gian ph�t v�n ti ��i (2/6)", tbProp = {4, 1159, 1, 1, 0, 0}, nRate = 0.008000},
	[57] = {szName = "M�nh V� gian ph�t v�n ti ��i (3/6)", tbProp = {4, 1160, 1, 1, 0, 0}, nRate = 0.008000},
	[58] = {szName = "M�nh V� gian ph�t v�n ti ��i (4/6)", tbProp = {4, 1161, 1, 1, 0, 0}, nRate = 0.008000},
	[59] = {szName = "M�nh V� gian ph�t v�n ti ��i (5/6)", tbProp = {4, 1162, 1, 1, 0, 0}, nRate = 0.008000},
	[60] = {szName = "M�nh V� gian ph�t v�n ti ��i (6/6)", tbProp = {4, 1163, 1, 1, 0, 0}, nRate = 0.008000},
	[61] = {szName = "M�nh B�ng h�n t�m ti�n y�u kh�u (1/6)", tbProp = {4, 1206, 1, 1, 0, 0}, nRate = 0.004000},
	[62] = {szName = "M�nh B�ng h�n t�m ti�n y�u kh�u (2/6)", tbProp = {4, 1207, 1, 1, 0, 0}, nRate = 0.004000},
	[63] = {szName = "M�nh B�ng h�n t�m ti�n y�u kh�u (3/6)", tbProp = {4, 1208, 1, 1, 0, 0}, nRate = 0.004000},
	[64] = {szName = "M�nh B�ng h�n t�m ti�n y�u kh�u (4/6)", tbProp = {4, 1209, 1, 1, 0, 0}, nRate = 0.004000},
	[65] = {szName = "M�nh B�ng h�n t�m ti�n y�u kh�u (5/6)", tbProp = {4, 1210, 1, 1, 0, 0}, nRate = 0.004000},
	[66] = {szName = "M�nh B�ng h�n t�m ti�n y�u kh�u (6/6)", tbProp = {4, 1211, 1, 1, 0, 0}, nRate = 0.004000},
	[67] = {szName = "M�nh L�ng nh�c n� l�i ph�p gi�i (1/6)", tbProp = {4, 1260, 1, 1, 0, 0}, nRate = 0.030000},
	[68] = {szName = "M�nh L�ng nh�c n� l�i ph�p gi�i (2/6)", tbProp = {4, 1261, 1, 1, 0, 0}, nRate = 0.030000},
	[69] = {szName = "M�nh L�ng nh�c n� l�i ph�p gi�i (3/6)", tbProp = {4, 1262, 1, 1, 0, 0}, nRate = 0.030000},
	[70] = {szName = "M�nh L�ng nh�c n� l�i ph�p gi�i (4/6)", tbProp = {4, 1263, 1, 1, 0, 0}, nRate = 0.030000},
	[71] = {szName = "M�nh L�ng nh�c n� l�i ph�p gi�i (5/6)", tbProp = {4, 1264, 1, 1, 0, 0}, nRate = 0.030000},
	[72] = {szName = "M�nh L�ng nh�c n� l�i ph�p gi�i (6/6)", tbProp = {4, 1265, 1, 1, 0, 0}, nRate = 0.030000},
	[73] = {szName = "M�nh T� ho�ng phong tuy�t b�ch v�n th�c y�u (1/6)", tbProp = {4, 1176, 1, 1, 0, 0}, nRate = 0.003000},
	[74] = {szName = "M�nh T� ho�ng phong tuy�t b�ch v�n th�c y�u (2/6)", tbProp = {4, 1177, 1, 1, 0, 0}, nRate = 0.003000},
	[75] = {szName = "M�nh T� ho�ng phong tuy�t b�ch v�n th�c y�u (3/6)", tbProp = {4, 1178, 1, 1, 0, 0}, nRate = 0.003000},
	[76] = {szName = "M�nh T� ho�ng phong tuy�t b�ch v�n th�c y�u (4/6)", tbProp = {4, 1179, 1, 1, 0, 0}, nRate = 0.003000},
	[77] = {szName = "M�nh T� ho�ng phong tuy�t b�ch v�n th�c y�u (5/6)", tbProp = {4, 1180, 1, 1, 0, 0}, nRate = 0.003000},
	[78] = {szName = "M�nh T� ho�ng phong tuy�t b�ch v�n th�c y�u (6/6)", tbProp = {4, 1181, 1, 1, 0, 0}, nRate = 0.003000},
	[79] = {szName = "M�nh S��ng tinh thanh phong l� ��i (1/6)", tbProp = {4, 1272, 1, 1, 0, 0}, nRate = 0.007000},
	[80] = {szName = "M�nh S��ng tinh thanh phong l� ��i (2/6)", tbProp = {4, 1273, 1, 1, 0, 0}, nRate = 0.007000},
	[81] = {szName = "M�nh S��ng tinh thanh phong l� ��i (3/6)", tbProp = {4, 1274, 1, 1, 0, 0}, nRate = 0.007000},
	[82] = {szName = "M�nh S��ng tinh thanh phong l� ��i (4/6)", tbProp = {4, 1275, 1, 1, 0, 0}, nRate = 0.007000},
	[83] = {szName = "M�nh S��ng tinh thanh phong l� ��i (5/6)", tbProp = {4, 1276, 1, 1, 0, 0}, nRate = 0.007000},
	[84] = {szName = "M�nh S��ng tinh thanh phong l� ��i (6/6)", tbProp = {4, 1277, 1, 1, 0, 0}, nRate = 0.007000},
	[85] = {szName = "M�nh Ma s�t t�n d��ng �nh hy�t gi�p (1/6)", tbProp = {4, 1097, 1, 1, 0, 0}, nRate = 0.004000},
	[86] = {szName = "M�nh Ma s�t t�n d��ng �nh hy�t gi�p (2/6)", tbProp = {4, 1098, 1, 1, 0, 0}, nRate = 0.004000},
	[87] = {szName = "M�nh Ma s�t t�n d��ng �nh hy�t gi�p (3/6)", tbProp = {4, 1099, 1, 1, 0, 0}, nRate = 0.004000},
	[88] = {szName = "M�nh Ma s�t t�n d��ng �nh hy�t gi�p (4/6)", tbProp = {4, 1100, 1, 1, 0, 0}, nRate = 0.004000},
	[89] = {szName = "M�nh Ma s�t t�n d��ng �nh hy�t gi�p (5/6)", tbProp = {4, 1101, 1, 1, 0, 0}, nRate = 0.004000},
	[90] = {szName = "M�nh Ma s�t t�n d��ng �nh hy�t gi�p (6/6)", tbProp = {4, 1102, 1, 1, 0, 0}, nRate = 0.004000},
	[91] = {szName = "M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (1/9) /9)", tbProp = {4, 585, 1, 1, 0, 0}, nRate = 0.030000},
	[92] = {szName = "M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (2/9) /9)", tbProp = {4, 586, 1, 1, 0, 0}, nRate = 0.030000},
	[93] = {szName = "M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (3/9) /9)", tbProp = {4, 587, 1, 1, 0, 0}, nRate = 0.030000},
	[94] = {szName = "M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (4/9) /9)", tbProp = {4, 588, 1, 1, 0, 0}, nRate = 0.030000},
	[95] = {szName = "M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (5/9) /9)", tbProp = {4, 589, 1, 1, 0, 0}, nRate = 0.030000},
	[96] = {szName = "M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (6/9) /9)", tbProp = {4, 590, 1, 1, 0, 0}, nRate = 0.030000},
	[97] = {szName = "M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (7/9) /9)", tbProp = {4, 591, 1, 1, 0, 0}, nRate = 0.030000},
	[98] = {szName = "M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (8/9) /9)", tbProp = {4, 592, 1, 1, 0, 0}, nRate = 0.030000},
	[99] = {szName = "M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (9/9) /9)", tbProp = {4, 593, 1, 1, 0, 0}, nRate = 0.030000},
	[100] = {szName = "M�nh Ph�c Ma T� Kim C�n (1/9) /9)", tbProp = {4, 576, 1, 1, 0, 0}, nRate = 0.020000},
	[101] = {szName = "M�nh Ph�c Ma T� Kim C�n (2/9) /9)", tbProp = {4, 577, 1, 1, 0, 0}, nRate = 0.020000},
	[102] = {szName = "M�nh Ph�c Ma T� Kim C�n (3/9) /9)", tbProp = {4, 578, 1, 1, 0, 0}, nRate = 0.020000},
	[103] = {szName = "M�nh Ph�c Ma T� Kim C�n (4/9) /9)", tbProp = {4, 579, 1, 1, 0, 0}, nRate = 0.020000},
	[104] = {szName = "M�nh Ph�c Ma T� Kim C�n (5/9) /9)", tbProp = {4, 580, 1, 1, 0, 0}, nRate = 0.020000},
	[105] = {szName = "M�nh Ph�c Ma T� Kim C�n (6/9) /9)", tbProp = {4, 581, 1, 1, 0, 0}, nRate = 0.020000},
	[106] = {szName = "M�nh Ph�c Ma T� Kim C�n (7/9) /9)", tbProp = {4, 582, 1, 1, 0, 0}, nRate = 0.020000},
	[107] = {szName = "M�nh Ph�c Ma T� Kim C�n (8/9) /9)", tbProp = {4, 583, 1, 1, 0, 0}, nRate = 0.020000},
	[108] = {szName = "M�nh Ph�c Ma T� Kim C�n (9/9) /9)", tbProp = {4, 584, 1, 1, 0, 0}, nRate = 0.020000},
	[109] = {szName = "M�nh H�m thi�n th�a long chi�n ngoa (1/6)", tbProp = {4, 1031, 1, 1, 0, 0}, nRate = 0.040000},
	[110] = {szName = "M�nh H�m thi�n th�a long chi�n ngoa (2/6)", tbProp = {4, 1032, 1, 1, 0, 0}, nRate = 0.040000},
	[111] = {szName = "M�nh H�m thi�n th�a long chi�n ngoa (3/6)", tbProp = {4, 1033, 1, 1, 0, 0}, nRate = 0.040000},
	[112] = {szName = "M�nh H�m thi�n th�a long chi�n ngoa (4/6)", tbProp = {4, 1034, 1, 1, 0, 0}, nRate = 0.040000},
	[113] = {szName = "M�nh H�m thi�n th�a long chi�n ngoa (5/6)", tbProp = {4, 1035, 1, 1, 0, 0}, nRate = 0.040000},
	[114] = {szName = "M�nh H�m thi�n th�a long chi�n ngoa (6/6)", tbProp = {4, 1036, 1, 1, 0, 0}, nRate = 0.040000},
	[115] = {szName = "M�nh Minh �o T� S�t ��c Nh�n (1/9) /9)", tbProp = {4, 648, 1, 1, 0, 0}, nRate = 0.020000},
	[116] = {szName = "M�nh Minh �o T� S�t ��c Nh�n (2/9) /9)", tbProp = {4, 649, 1, 1, 0, 0}, nRate = 0.020000},
	[117] = {szName = "M�nh Minh �o T� S�t ��c Nh�n (3/9) /9)", tbProp = {4, 650, 1, 1, 0, 0}, nRate = 0.020000},
	[118] = {szName = "M�nh Minh �o T� S�t ��c Nh�n (4/9) /9)", tbProp = {4, 651, 1, 1, 0, 0}, nRate = 0.020000},
	[119] = {szName = "M�nh Minh �o T� S�t ��c Nh�n (5/9) /9)", tbProp = {4, 652, 1, 1, 0, 0}, nRate = 0.020000},
	[120] = {szName = "M�nh Minh �o T� S�t ��c Nh�n (6/9) /9)", tbProp = {4, 653, 1, 1, 0, 0}, nRate = 0.020000},
	[121] = {szName = "M�nh Minh �o T� S�t ��c Nh�n (7/9) /9)", tbProp = {4, 654, 1, 1, 0, 0}, nRate = 0.020000},
	[122] = {szName = "M�nh Minh �o T� S�t ��c Nh�n (8/9) /9)", tbProp = {4, 655, 1, 1, 0, 0}, nRate = 0.020000},
	[123] = {szName = "M�nh Minh �o T� S�t ��c Nh�n (9/9) /9)", tbProp = {4, 656, 1, 1, 0, 0}, nRate = 0.020000},
	[124] = {szName = "M�nh Hoa V� M�n Thi�n (1/9) /9)", tbProp = {4, 657, 1, 1, 0, 0}, nRate = 0.004000},
	[125] = {szName = "M�nh Hoa V� M�n Thi�n (2/9) /9)", tbProp = {4, 658, 1, 1, 0, 0}, nRate = 0.004000},
	[126] = {szName = "M�nh Hoa V� M�n Thi�n (3/9) /9)", tbProp = {4, 659, 1, 1, 0, 0}, nRate = 0.004000},
	[127] = {szName = "M�nh Hoa V� M�n Thi�n (4/9) /9)", tbProp = {4, 660, 1, 1, 0, 0}, nRate = 0.004000},
	[128] = {szName = "M�nh Hoa V� M�n Thi�n (5/9) /9)", tbProp = {4, 661, 1, 1, 0, 0}, nRate = 0.004000},
	[129] = {szName = "M�nh Hoa V� M�n Thi�n (6/9) /9)", tbProp = {4, 662, 1, 1, 0, 0}, nRate = 0.004000},
	[130] = {szName = "M�nh Hoa V� M�n Thi�n (7/9) /9)", tbProp = {4, 663, 1, 1, 0, 0}, nRate = 0.004000},
	[131] = {szName = "M�nh Hoa V� M�n Thi�n (8/9) /9)", tbProp = {4, 664, 1, 1, 0, 0}, nRate = 0.004000},
	[132] = {szName = "M�nh Hoa V� M�n Thi�n (9/9) /9)", tbProp = {4, 665, 1, 1, 0, 0}, nRate = 0.004000},
	[133] = {szName = "M�nh B�ng h�n ��n ch� phi �ao (1/9)", tbProp = {4, 980, 1, 1, 0, 0}, nRate = 0.030000},
	[134] = {szName = "M�nh B�ng h�n ��n ch� phi �ao (2/9)", tbProp = {4, 981, 1, 1, 0, 0}, nRate = 0.030000},
	[135] = {szName = "M�nh B�ng h�n ��n ch� phi �ao (3/9)", tbProp = {4, 982, 1, 1, 0, 0}, nRate = 0.030000},
	[136] = {szName = "M�nh B�ng h�n ��n ch� phi �ao (4/9)", tbProp = {4, 983, 1, 1, 0, 0}, nRate = 0.030000},
	[137] = {szName = "M�nh B�ng h�n ��n ch� phi �ao (5/9)", tbProp = {4, 984, 1, 1, 0, 0}, nRate = 0.030000},
	[138] = {szName = "M�nh B�ng h�n ��n ch� phi �ao (6/9)", tbProp = {4, 985, 1, 1, 0, 0}, nRate = 0.030000},
	[139] = {szName = "M�nh B�ng h�n ��n ch� phi �ao (7/9)", tbProp = {4, 986, 1, 1, 0, 0}, nRate = 0.030000},
	[140] = {szName = "M�nh B�ng h�n ��n ch� phi �ao (8/9)", tbProp = {4, 987, 1, 1, 0, 0}, nRate = 0.030000},
	[141] = {szName = "M�nh B�ng h�n ��n ch� phi �ao (9/9)", tbProp = {4, 988, 1, 1, 0, 0}, nRate = 0.030000},
	[142] = {szName = "M�nh Phi Tinh �o�t H�n (1/9) /9)", tbProp = {4, 666, 1, 1, 0, 0}, nRate = 0.020000},
	[143] = {szName = "M�nh Phi Tinh �o�t H�n (2/9) /9)", tbProp = {4, 667, 1, 1, 0, 0}, nRate = 0.020000},
	[144] = {szName = "M�nh Phi Tinh �o�t H�n (3/9) /9)", tbProp = {4, 668, 1, 1, 0, 0}, nRate = 0.020000},
	[145] = {szName = "M�nh Phi Tinh �o�t H�n (4/9) /9)", tbProp = {4, 669, 1, 1, 0, 0}, nRate = 0.020000},
	[146] = {szName = "M�nh Phi Tinh �o�t H�n (5/9) /9)", tbProp = {4, 670, 1, 1, 0, 0}, nRate = 0.020000},
	[147] = {szName = "M�nh Phi Tinh �o�t H�n (6/9) /9)", tbProp = {4, 671, 1, 1, 0, 0}, nRate = 0.020000},
	[148] = {szName = "M�nh Phi Tinh �o�t H�n (7/9) /9)", tbProp = {4, 672, 1, 1, 0, 0}, nRate = 0.020000},
	[149] = {szName = "M�nh Phi Tinh �o�t H�n (8/9) /9)", tbProp = {4, 673, 1, 1, 0, 0}, nRate = 0.020000},
	[150] = {szName = "M�nh Phi Tinh �o�t H�n (9/9) /9)", tbProp = {4, 674, 1, 1, 0, 0}, nRate = 0.020000},
	[151] = {szName = "M�nh T�y T��ng Ng�c Kh�u (1/6) /6)", tbProp = {4, 801, 1, 1, 0, 0}, nRate = 0.020000},
	[152] = {szName = "M�nh T�y T��ng Ng�c Kh�u (2/6) /6)", tbProp = {4, 802, 1, 1, 0, 0}, nRate = 0.020000},
	[153] = {szName = "M�nh T�y T��ng Ng�c Kh�u (3/6) /6)", tbProp = {4, 803, 1, 1, 0, 0}, nRate = 0.020000},
	[154] = {szName = "M�nh T�y T��ng Ng�c Kh�u (4/6) /6)", tbProp = {4, 804, 1, 1, 0, 0}, nRate = 0.020000},
	[155] = {szName = "M�nh T�y T��ng Ng�c Kh�u (5/6) /6)", tbProp = {4, 805, 1, 1, 0, 0}, nRate = 0.020000},
	[156] = {szName = "M�nh T�y T��ng Ng�c Kh�u (6/6) /6)", tbProp = {4, 806, 1, 1, 0, 0}, nRate = 0.020000},
	[157] = {szName = "M�nh H�ng Truy Nhuy�n Th�p H�i (1/6) /6)", tbProp = {4, 807, 1, 1, 0, 0}, nRate = 0.030000},
	[158] = {szName = "M�nh H�ng Truy Nhuy�n Th�p H�i (2/6) /6)", tbProp = {4, 808, 1, 1, 0, 0}, nRate = 0.030000},
	[159] = {szName = "M�nh H�ng Truy Nhuy�n Th�p H�i (3/6) /6)", tbProp = {4, 809, 1, 1, 0, 0}, nRate = 0.030000},
	[160] = {szName = "M�nh H�ng Truy Nhuy�n Th�p H�i (4/6) /6)", tbProp = {4, 810, 1, 1, 0, 0}, nRate = 0.030000},
	[161] = {szName = "M�nh H�ng Truy Nhuy�n Th�p H�i (5/6) /6)", tbProp = {4, 811, 1, 1, 0, 0}, nRate = 0.030000},
	[162] = {szName = "M�nh H�ng Truy Nhuy�n Th�p H�i (6/6) /6)", tbProp = {4, 812, 1, 1, 0, 0}, nRate = 0.030000},
	[163] = {szName = "M�nh V� Gian � Thi�n Ki�m (1/9) /9)", tbProp = {4, 621, 1, 1, 0, 0}, nRate = 0.020000},
	[164] = {szName = "M�nh V� Gian � Thi�n Ki�m (2/9) /9)", tbProp = {4, 622, 1, 1, 0, 0}, nRate = 0.020000},
	[165] = {szName = "M�nh V� Gian � Thi�n Ki�m (3/9) /9)", tbProp = {4, 623, 1, 1, 0, 0}, nRate = 0.020000},
	[166] = {szName = "M�nh V� Gian � Thi�n Ki�m (4/9) /9)", tbProp = {4, 624, 1, 1, 0, 0}, nRate = 0.020000},
	[167] = {szName = "M�nh V� Gian � Thi�n Ki�m (5/9) /9)", tbProp = {4, 625, 1, 1, 0, 0}, nRate = 0.020000},
	[168] = {szName = "M�nh V� Gian � Thi�n Ki�m (6/9) /9)", tbProp = {4, 626, 1, 1, 0, 0}, nRate = 0.020000},
	[169] = {szName = "M�nh V� Gian � Thi�n Ki�m (7/9) /9)", tbProp = {4, 627, 1, 1, 0, 0}, nRate = 0.020000},
	[170] = {szName = "M�nh V� Gian � Thi�n Ki�m (8/9) /9)", tbProp = {4, 628, 1, 1, 0, 0}, nRate = 0.020000},
	[171] = {szName = "M�nh V� Gian � Thi�n Ki�m (9/9) /9)", tbProp = {4, 629, 1, 1, 0, 0}, nRate = 0.020000},
	[172] = {szName = "M�nh T� Ho�ng Ph�ng Ngh�a �ao (1/9) /9)", tbProp = {4, 630, 1, 1, 0, 0}, nRate = 0.020000},
	[173] = {szName = "M�nh T� Ho�ng Ph�ng Ngh�a �ao (2/9) /9)", tbProp = {4, 631, 1, 1, 0, 0}, nRate = 0.020000},
	[174] = {szName = "M�nh T� Ho�ng Ph�ng Ngh�a �ao (3/9) /9)", tbProp = {4, 632, 1, 1, 0, 0}, nRate = 0.020000},
	[175] = {szName = "M�nh T� Ho�ng Ph�ng Ngh�a �ao (4/9) /9)", tbProp = {4, 633, 1, 1, 0, 0}, nRate = 0.020000},
	[176] = {szName = "M�nh T� Ho�ng Ph�ng Ngh�a �ao (5/9) /9)", tbProp = {4, 634, 1, 1, 0, 0}, nRate = 0.020000},
	[177] = {szName = "M�nh T� Ho�ng Ph�ng Ngh�a �ao (6/9) /9)", tbProp = {4, 635, 1, 1, 0, 0}, nRate = 0.020000},
	[178] = {szName = "M�nh T� Ho�ng Ph�ng Ngh�a �ao (7/9) /9)", tbProp = {4, 636, 1, 1, 0, 0}, nRate = 0.020000},
	[179] = {szName = "M�nh T� Ho�ng Ph�ng Ngh�a �ao (8/9) /9)", tbProp = {4, 637, 1, 1, 0, 0}, nRate = 0.020000},
	[180] = {szName = "M�nh T� Ho�ng Ph�ng Ngh�a �ao (9/9) /9)", tbProp = {4, 638, 1, 1, 0, 0}, nRate = 0.020000},
	[181] = {szName = "M�nh T� ho�ng b�ng tung c�m uy�n (1/6)", tbProp = {4, 1055, 1, 1, 0, 0}, nRate = 0.030000},
	[182] = {szName = "M�nh T� ho�ng b�ng tung c�m uy�n (2/6)", tbProp = {4, 1056, 1, 1, 0, 0}, nRate = 0.030000},
	[183] = {szName = "M�nh T� ho�ng b�ng tung c�m uy�n (3/6)", tbProp = {4, 1057, 1, 1, 0, 0}, nRate = 0.030000},
	[184] = {szName = "M�nh T� ho�ng b�ng tung c�m uy�n (4/6)", tbProp = {4, 1058, 1, 1, 0, 0}, nRate = 0.030000},
	[185] = {szName = "M�nh T� ho�ng b�ng tung c�m uy�n (5/6)", tbProp = {4, 1059, 1, 1, 0, 0}, nRate = 0.030000},
	[186] = {szName = "M�nh T� ho�ng b�ng tung c�m uy�n (6/6)", tbProp = {4, 1060, 1, 1, 0, 0}, nRate = 0.030000},
	[187] = {szName = "M�nh U Minh Th��ng (1/9) /9)", tbProp = {4, 684, 1, 1, 0, 0}, nRate = 0.020000},
	[188] = {szName = "M�nh U Minh Th��ng (2/9) /9)", tbProp = {4, 685, 1, 1, 0, 0}, nRate = 0.020000},
	[189] = {szName = "M�nh U Minh Th��ng (3/9) /9)", tbProp = {4, 686, 1, 1, 0, 0}, nRate = 0.020000},
	[190] = {szName = "M�nh U Minh Th��ng (4/9) /9)", tbProp = {4, 687, 1, 1, 0, 0}, nRate = 0.020000},
	[191] = {szName = "M�nh U Minh Th��ng (5/9) /9)", tbProp = {4, 688, 1, 1, 0, 0}, nRate = 0.020000},
	[192] = {szName = "M�nh U Minh Th��ng (6/9) /9)", tbProp = {4, 689, 1, 1, 0, 0}, nRate = 0.020000},
	[193] = {szName = "M�nh U Minh Th��ng (7/9) /9)", tbProp = {4, 690, 1, 1, 0, 0}, nRate = 0.020000},
	[194] = {szName = "M�nh U Minh Th��ng (8/9) /9)", tbProp = {4, 691, 1, 1, 0, 0}, nRate = 0.020000},
	[195] = {szName = "M�nh U Minh Th��ng (9/9) /9)", tbProp = {4, 692, 1, 1, 0, 0}, nRate = 0.020000},
	[196] = {szName = "M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)", tbProp = {4, 873, 1, 1, 0, 0}, nRate = 0.040000},
	[197] = {szName = "M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)", tbProp = {4, 874, 1, 1, 0, 0}, nRate = 0.040000},
	[198] = {szName = "M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)", tbProp = {4, 875, 1, 1, 0, 0}, nRate = 0.040000},
	[199] = {szName = "M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)", tbProp = {4, 876, 1, 1, 0, 0}, nRate = 0.040000},
	[200] = {szName = "M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)", tbProp = {4, 877, 1, 1, 0, 0}, nRate = 0.040000},
	[201] = {szName = "M�nh Ma Th� S�n H�i Phi H�ng L� (1/6) /6)", tbProp = {4, 878, 1, 1, 0, 0}, nRate = 0.040000},
	[202] = {szName = "M�nh ��ng C�u Gi�ng Long C�i Y (1/6) /6)", tbProp = {4, 849, 1, 1, 0, 0}, nRate = 0.080000},
	[203] = {szName = "M�nh ��ng C�u Gi�ng Long C�i Y (2/6) /6)", tbProp = {4, 850, 1, 1, 0, 0}, nRate = 0.080000},
	[204] = {szName = "M�nh ��ng C�u Gi�ng Long C�i Y (3/6) /6)", tbProp = {4, 851, 1, 1, 0, 0}, nRate = 0.080000},
	[205] = {szName = "M�nh ��ng C�u Gi�ng Long C�i Y (4/6) /6)", tbProp = {4, 852, 1, 1, 0, 0}, nRate = 0.080000},
	[206] = {szName = "M�nh ��ng C�u Gi�ng Long C�i Y (5/6) /6)", tbProp = {4, 853, 1, 1, 0, 0}, nRate = 0.080000},
	[207] = {szName = "M�nh ��ng C�u Gi�ng Long C�i Y (6/6) /6)", tbProp = {4, 854, 1, 1, 0, 0}, nRate = 0.080000},
	[208] = {szName = "M�nh ��ng C�u Kh�ng Long H� Uy�n (1/6) /6)", tbProp = {4, 855, 1, 1, 0, 0}, nRate = 0.020000},
	[209] = {szName = "M�nh ��ng C�u Kh�ng Long H� Uy�n (2/6) /6)", tbProp = {4, 856, 1, 1, 0, 0}, nRate = 0.020000},
	[210] = {szName = "M�nh ��ng C�u Kh�ng Long H� Uy�n (3/6) /6)", tbProp = {4, 857, 1, 1, 0, 0}, nRate = 0.020000},
	[211] = {szName = "M�nh ��ng C�u Kh�ng Long H� Uy�n (4/6) /6)", tbProp = {4, 858, 1, 1, 0, 0}, nRate = 0.020000},
	[212] = {szName = "M�nh ��ng C�u Kh�ng Long H� Uy�n (5/6) /6)", tbProp = {4, 859, 1, 1, 0, 0}, nRate = 0.020000},
	[213] = {szName = "M�nh ��ng C�u Kh�ng Long H� Uy�n (6/6) /6)", tbProp = {4, 860, 1, 1, 0, 0}, nRate = 0.020000},
	[214] = {szName = "M�nh L�c Ng�c Tr��ng (1/9) /9)", tbProp = {4, 675, 1, 1, 0, 0}, nRate = 0.020000},
	[215] = {szName = "M�nh L�c Ng�c Tr��ng (2/9) /9)", tbProp = {4, 676, 1, 1, 0, 0}, nRate = 0.020000},
	[216] = {szName = "M�nh L�c Ng�c Tr��ng (3/9) /9)", tbProp = {4, 677, 1, 1, 0, 0}, nRate = 0.020000},
	[217] = {szName = "M�nh L�c Ng�c Tr��ng (4/9) /9)", tbProp = {4, 678, 1, 1, 0, 0}, nRate = 0.020000},
	[218] = {szName = "M�nh L�c Ng�c Tr��ng (5/9) /9)", tbProp = {4, 679, 1, 1, 0, 0}, nRate = 0.020000},
	[219] = {szName = "M�nh L�c Ng�c Tr��ng (6/9) /9)", tbProp = {4, 680, 1, 1, 0, 0}, nRate = 0.020000},
	[220] = {szName = "M�nh L�c Ng�c Tr��ng (7/9) /9)", tbProp = {4, 681, 1, 1, 0, 0}, nRate = 0.020000},
	[221] = {szName = "M�nh L�c Ng�c Tr��ng (8/9) /9)", tbProp = {4, 682, 1, 1, 0, 0}, nRate = 0.020000},
	[222] = {szName = "M�nh L�c Ng�c Tr��ng (9/9) /9)", tbProp = {4, 683, 1, 1, 0, 0}, nRate = 0.020000},
	[223] = {szName = "M�nh Ho�ng Kim - L�i Khung H�n Tung B�ng B�ch Quan(1/6)", tbProp = {4, 1004, 1, 1, 0, 0}, nRate = 0.005000},
	[224] = {szName = "M�nh Ho�ng Kim - L�i Khung H�n Tung B�ng B�ch Quan(2/6)", tbProp = {4, 1005, 1, 1, 0, 0}, nRate = 0.005000},
	[225] = {szName = "M�nh Ho�ng Kim - L�i Khung H�n Tung B�ng B�ch Quan(3/6)", tbProp = {4, 1006, 1, 1, 0, 0}, nRate = 0.005000},
	[226] = {szName = "M�nh Ho�ng Kim - L�i Khung H�n Tung B�ng B�ch Quan(4/6)", tbProp = {4, 1007, 1, 1, 0, 0}, nRate = 0.005000},
	[227] = {szName = "M�nh Ho�ng Kim - L�i Khung H�n Tung B�ng B�ch Quan(5/6)", tbProp = {4, 1008, 1, 1, 0, 0}, nRate = 0.005000},
	[228] = {szName = "M�nh Ho�ng Kim - L�i Khung H�n Tung B�ng B�ch Quan(6/6)", tbProp = {4, 1009, 1, 1, 0, 0}, nRate = 0.005000},
	[229] = {szName = "M�nh Thi�n Ni�n H�n Thi�t (1/9) /9)", tbProp = {4, 702, 1, 1, 0, 0}, nRate = 0.020000},
	[230] = {szName = "M�nh Thi�n Ni�n H�n Thi�t (2/9) /9)", tbProp = {4, 703, 1, 1, 0, 0}, nRate = 0.020000},
	[231] = {szName = "M�nh Thi�n Ni�n H�n Thi�t (3/9) /9)", tbProp = {4, 704, 1, 1, 0, 0}, nRate = 0.020000},
	[232] = {szName = "M�nh Thi�n Ni�n H�n Thi�t (4/9) /9)", tbProp = {4, 705, 1, 1, 0, 0}, nRate = 0.020000},
	[233] = {szName = "M�nh Thi�n Ni�n H�n Thi�t (5/9) /9)", tbProp = {4, 706, 1, 1, 0, 0}, nRate = 0.020000},
	[234] = {szName = "M�nh Thi�n Ni�n H�n Thi�t (6/9) /9)", tbProp = {4, 707, 1, 1, 0, 0}, nRate = 0.020000},
	[235] = {szName = "M�nh Thi�n Ni�n H�n Thi�t (7/9) /9)", tbProp = {4, 708, 1, 1, 0, 0}, nRate = 0.020000},
	[236] = {szName = "M�nh Thi�n Ni�n H�n Thi�t (8/9) /9)", tbProp = {4, 709, 1, 1, 0, 0}, nRate = 0.020000},
	[237] = {szName = "M�nh Thi�n Ni�n H�n Thi�t (9/9) /9)", tbProp = {4, 710, 1, 1, 0, 0}, nRate = 0.020000},
	[238] = {szName = "M�nh Ch�n V� Ki�m (1/9) /9)", tbProp = {4, 693, 1, 1, 0, 0}, nRate = 0.008000},
	[239] = {szName = "M�nh Ch�n V� Ki�m (2/9) /9)", tbProp = {4, 694, 1, 1, 0, 0}, nRate = 0.008000},
	[240] = {szName = "M�nh Ch�n V� Ki�m (3/9) /9)", tbProp = {4, 695, 1, 1, 0, 0}, nRate = 0.008000},
	[241] = {szName = "M�nh Ch�n V� Ki�m (4/9) /9)", tbProp = {4, 696, 1, 1, 0, 0}, nRate = 0.008000},
	[242] = {szName = "M�nh Ch�n V� Ki�m (5/9) /9)", tbProp = {4, 697, 1, 1, 0, 0}, nRate = 0.008000},
	[243] = {szName = "M�nh Ch�n V� Ki�m (6/9) /9)", tbProp = {4, 698, 1, 1, 0, 0}, nRate = 0.008000},
	[244] = {szName = "M�nh Ch�n V� Ki�m (7/9) /9)", tbProp = {4, 699, 1, 1, 0, 0}, nRate = 0.008000},
	[245] = {szName = "M�nh Ch�n V� Ki�m (8/9) /9)", tbProp = {4, 700, 1, 1, 0, 0}, nRate = 0.008000},
	[246] = {szName = "M�nh Ch�n V� Ki�m (9/9) /9)", tbProp = {4, 701, 1, 1, 0, 0}, nRate = 0.008000},
	[247] = {szName = "M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (1/6) /6)", tbProp = {4, 879, 1, 1, 0, 0}, nRate = 0.020000},
	[248] = {szName = "M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (2/6) /6)", tbProp = {4, 880, 1, 1, 0, 0}, nRate = 0.020000},
	[249] = {szName = "M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (3/6) /6)", tbProp = {4, 881, 1, 1, 0, 0}, nRate = 0.020000},
	[250] = {szName = "M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (4/6) /6)", tbProp = {4, 882, 1, 1, 0, 0}, nRate = 0.020000},
	[251] = {szName = "M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (5/6) /6)", tbProp = {4, 883, 1, 1, 0, 0}, nRate = 0.020000},
	[252] = {szName = "M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (6/6) /6)", tbProp = {4, 884, 1, 1, 0, 0}, nRate = 0.020000},

};

function main(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	
	local bRet, szFailMsg = tbBirthday0905:IsPlayerEligible();
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ng��i ch�a �� �i�u ki�n �� nh�n v�t ph�m n�y");
		return 1;
	end
	
	if CalcFreeItemCellCount() < 10 then
		Talk(1,"", format("Ch� tr�ng h�nh trang kh�ng �� %d ch�, h�y s�p x�p l�i.", 10));
		return 1
	end
	
	if tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == 0 or tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == nil then
		tbBirthday0905.tbTask:add_zhuhe_maxexp();
	end	
	
	if (tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_curexp) >= tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp)) then
		Msg2Player("�� nh�n kinh nghi�m gi�i h�n cao nh�t.");
		return 1;
	end
	
	local n_rand = random(1, 100);
	local n_sum = 0;
	local n_exp = 0;
	for i = 1, getn(tbBirthday0905.tbxinbanqi_addexp) do
		n_sum = n_sum + tbBirthday0905.tbxinbanqi_addexp[i][2];
		if (n_sum >= n_rand) then
			n_exp = tbBirthday0905.tbxinbanqi_addexp[i][1];
			break
		end
	end
	
	AddOwnExp(n_exp);
	tbBirthday0905.tbTask:add_task(tbBirthday0905.tbTask.tsk_zhuhe_curexp, floor(n_exp / tbBirthday0905.expbase));
	Msg2Player(format("Nh�n ���c kinh nghi�m kh�ng c�ng d�n %d.", n_exp ));
	
	 tbAwardTemplet:GiveAwardByList(%tbAward, "birthday_jieri zhuhe");
end
