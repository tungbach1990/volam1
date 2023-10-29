IncludeLib("LEAGUE")
function query()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 4, "Tin t�c thi ��u c�a m�nh/selfmatch", "Tin t�c thi ��u c�a khu v�c m�nh/owntong", "Tin t�c thi ��u c�a khu v�c kh�c/whichtong", "Nh�n ti�n gh� qua th�i/no");
end

function owntong()
	Say("Ng��i mu�n xem tin t�c h�ng m�c thi ��u n�o?", 7, "Danh s�ch m�n ph�i thi ��u/owntong_SINGLE", "Song ��u/owntong_DOUBLE", "Ng� h�nh ��u/owntong_FIVE", "Th�p ph�i ��u/owntong_TEN", "Th�p l�c ��u/owntong_SIXTEEN", "Trang tr��c/query", "��ng/no");
end

function owntong_SINGLE()
	Say("Ng��i mu�n xem tin t�c ��n ��u c�a m�n ph�i n�o?", 12, "Thi�u L�m/owntong_sl", "Thi�n V��ng/owntong_tw", "���ng M�n/owntong_tm", "Ng� ��c/owntong_wu", "Nga Mi/owntong_em", "Th�y Y�n/owntong_cy", "C�i Bang/owntong_gb", "Thi�n Nh�n/owntong_tr", "V� �ang/owntong_wd", "C�n L�n/owntong_kl", "Trang tr��c/owntong", "��ng/no");
end

function owntong_sl()
	local owntongteamname = getowntongname().."M�n ph�i ��n ��u 1_";
	Say("Ng��i mu�n xem tin t�c Thi�u L�m ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(1,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(1,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(1,'"..owntongteamname.."3')", "Nh�m th� 4".."/#tonginfo(1,'"..owntongteamname.."4')", "Nh�m th� 5".."/#tonginfo(1,'"..owntongteamname.."5')", "Trang tr��c/owntong_SINGLE", "��ng/no");
end

function owntong_tw()
	local owntongteamname = getowntongname().."M�n ph�i ��n ��u 2_";
	Say("Ng��i mu�n xem tin t�c Thi�n V��ng ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(2,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(2,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(2,'"..owntongteamname.."3')", "Nh�m th� 4".."/#tonginfo(2,'"..owntongteamname.."4')", "Nh�m th� 5".."/#tonginfo(2,'"..owntongteamname.."5')", "Trang tr��c/owntong_SINGLE", "��ng/no");
end

function owntong_tm()
	local owntongteamname = getowntongname().."M�n ph�i ��n ��u 3_";
	Say("Ng��i mu�n xem tin t�c ���ng M�n ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(3,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(3,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(3,'"..owntongteamname.."3')", "Nh�m th� 4".."/#tonginfo(3,'"..owntongteamname.."4')", "Nh�m th� 5".."/#tonginfo(3,'"..owntongteamname.."5')", "Trang tr��c/owntong_SINGLE", "��ng/no");
end

function owntong_wu()
	local owntongteamname = getowntongname().."M�n ph�i ��n ��u 4_";
	Say("Ng��i mu�n xem tin t�c Ng� ��c ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(4,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(4,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(4,'"..owntongteamname.."3')", "Nh�m th� 4".."/#tonginfo(4,'"..owntongteamname.."4')", "Nh�m th� 5".."/#tonginfo(4,'"..owntongteamname.."5')", "Trang tr��c/owntong_SINGLE", "��ng/no");
end

function owntong_em()
	local owntongteamname = getowntongname().."M�n ph�i ��n ��u 5_";
	Say("Ng��i mu�n xem tin t�c Nga My ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(5,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(5,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(5,'"..owntongteamname.."3')", "Nh�m th� 4".."/#tonginfo(5,'"..owntongteamname.."4')", "Nh�m th� 5".."/#tonginfo(5,'"..owntongteamname.."5')", "Trang tr��c/owntong_SINGLE", "��ng/no");
end

function owntong_cy()
	local owntongteamname = getowntongname().."M�n ph�i ��n ��u 6_";
	Say("Ng��i mu�n xem tin t�c Th�y Y�n ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(6,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(6,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(6,'"..owntongteamname.."3')", "Nh�m th� 4".."/#tonginfo(6,'"..owntongteamname.."4')", "Nh�m th� 5".."/#tonginfo(6,'"..owntongteamname.."5')", "Trang tr��c/owntong_SINGLE", "��ng/no");
end

function owntong_gb()
	local owntongteamname = getowntongname().."M�n ph�i ��n ��u 7_";
	Say("Ng��i mu�n xem tin t�c C�i Bang ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(7,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(7,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(7,'"..owntongteamname.."3')", "Nh�m th� 4".."/#tonginfo(7,'"..owntongteamname.."4')", "Nh�m th� 5".."/#tonginfo(7,'"..owntongteamname.."5')", "Trang tr��c/owntong_SINGLE", "��ng/no");
end

function owntong_tr()
	local owntongteamname = getowntongname().."M�n ph�i ��n ��u 8_";
	Say("Ng��i mu�n xem tin t�c Thi�n Nh�n ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(8,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(8,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(8,'"..owntongteamname.."3')", "Nh�m th� 4".."/#tonginfo(8,'"..owntongteamname.."4')", "Nh�m th� 5".."/#tonginfo(8,'"..owntongteamname.."5')", "Trang tr��c/owntong_SINGLE", "��ng/no");
end

function owntong_wd()
	local owntongteamname = getowntongname().."M�n ph�i ��n ��u 9_";
	Say("Ng��i mu�n xem tin t�c V� �ang ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(9,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(9,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(9,'"..owntongteamname.."3')", "Nh�m th� 4".."/#tonginfo(9,'"..owntongteamname.."4')", "Nh�m th� 5".."/#tonginfo(9,'"..owntongteamname.."5')", "Trang tr��c/owntong_SINGLE", "��ng/no");
end

function owntong_kl()
	local owntongteamname = getowntongname().."M�n ph�i ��n ��u 10_";
	Say("Ng��i mu�n xem tin t�c C�n L�n ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(10,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(10,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(10,'"..owntongteamname.."3')", "Nh�m th� 4".."/#tonginfo(10,'"..owntongteamname.."4')", "Nh�m th� 5".."/#tonginfo(10,'"..owntongteamname.."5')", "Trang tr��c/owntong_SINGLE", "��ng/no");
end

function owntong_DOUBLE()
	local owntongteamname = getowntongname().."Song ��u";
	Say("Ng��i mu�n xem tin t�c Song Nh�n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(11,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(11,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(11,'"..owntongteamname.."3')", "Nh�m th� 4".."/#tonginfo(11,'"..owntongteamname.."4')", "Nh�m th� 5".."/#tonginfo(11,'"..owntongteamname.."5')", "Trang tr��c/owntong", "��ng/no");
end

function owntong_FIVE()
	local owntongteamname = getowntongname().."Ng� h�nh ��u";
	Say("Ng��i mu�n xem tin t�c Ng� h�nh ��u c�a chi�n ��i n�o?", 5, "Nh�m th� 1".."/#tonginfo(12,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(12,'"..owntongteamname.."2')", "Nh�m th� 3".."/#tonginfo(12,'"..owntongteamname.."3')", "Trang tr��c/owntong", "��ng/no");
end

function owntong_TEN()
	local owntongteamname = getowntongname().."Th�p to�n ��u";
	Say("Ng��i mu�n xem tin t�c Th�p to�n ��u c�a chi�n ��i n�o?", 4, "Nh�m th� 1".."/#tonginfo(13,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(13,'"..owntongteamname.."2')", "Trang tr��c/owntong", "��ng/no");
end

function owntong_SIXTEEN()
	local owntongteamname = getowntongname().."Th�p l�c ��u";
	Say("Ng��i mu�n xem tin t�c Th�p l�c ��u c�a chi�n ��i n�o?", 4, "Nh�m th� 1".."/#tonginfo(14,'"..owntongteamname.."1')", "Nh�m th� 2".."/#tonginfo(14,'"..owntongteamname.."2')", "Trang tr��c/owntong", "��ng/no");
end

function whichtong()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 6, "Khu 1 ~   Khu 5/tong_1to5", "Khu 6 ~ Khu10/tong_6to10", "Khu 11 ~ Khu15/tong_11to15", "Khu 16 ~ Khu 22/tong_16to22", "Trang tr��c/query", "��ng/no");
end

function tong_1to5()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 7, "Khu 1/tong_1", "Khu 2/tong_2", "Khu 3/tong_3", "Khu 4/tong_4", "Khu 5/tong_5", "Trang tr��c/whichtong", "��ng/no");
end

function tong_6to10()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 7, "Khu 6/tong_6", "Khu 7/tong_7", "Khu 8/tong_8", "Khu 9/tong_9", "Khu 10/tong_10", "Trang tr��c/whichtong", "��ng/no");
end

function tong_11to15()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 7, "Khu 11/tong_11", "Khu 12/tong_12", "Khu 13/tong_13", "Khu 14/tong_14", "Khu 15/tong_15", "Trang tr��c/whichtong", "��ng/no");
end

function tong_16to22()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 8, "Khu 16/tong_16", "Khu 17/tong_17", "Khu 18/tong_18", "Khu 19/tong_19", "Khu 20/tong_20", "Khu 22/tong_22", "Trang tr��c/whichtong", "��ng/no");
end

function tong_1()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 5, "1-1/#othertong('1-1')", "1-2/#othertong('1-2')", "1-3/#othertong('1-3')", "Trang tr��c/tong_1to5", "��ng/no");
end

function tong_2()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 5, "2-1/#othertong('2-1')", "2-2/#othertong('2-2')", "2-3/#othertong('2-3')", "Trang tr��c/tong_1to5", "��ng/no");
end

function tong_3()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 5, "3-1/#othertong('3-1')", "3-2/#othertong('3-2')", "3-3/#othertong('3-3')", "Trang tr��c/tong_1to5", "��ng/no");
end

function tong_4()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 5, "4-1/#othertong('4-1')", "4-2/#othertong('4-2')", "4-3/#othertong('4-3')", "Trang tr��c/tong_1to5", "��ng/no");
end

function tong_5()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 4, "5-1/#othertong('5-1')", "5-2/#othertong('5-2')", "Trang tr��c/tong_1to5", "��ng/no");
end

function tong_6()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 5, "6-1/#othertong('6-1')", "6-2/#othertong('6-2')", "6-3/#othertong('6-3')", "Trang tr��c/tong_6to10", "��ng/no");
end

function tong_7()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 5, "7-1/#othertong('7-1')", "7-2/#othertong('7-2')", "7-3/#othertong('7-3')", "Trang tr��c/tong_6to10", "��ng/no");
end

function tong_8()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 4, "8-1/#othertong('8-1')", "8-2/#othertong('8-2')", "Trang tr��c/tong_6to10", "��ng/no");
end

function tong_9()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 4, "9-1/#othertong('9-1')", "9-2/#othertong('9-2')", "Trang tr��c/tong_6to10", "��ng/no");
end

function tong_10()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 4, "10-1/#othertong('10-1')", "10-2/#othertong('10-2')", "Trang tr��c/tong_6to10", "��ng/no");
end

function tong_11()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 5, "11-1/#othertong('11-1')", "11-2/#othertong('11-2')", "11-3/#othertong('11-3')", "Trang tr��c/tong_11to15", "��ng/no");
end

function tong_12()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 4, "12-1/#othertong('12-1')", "12-2/#othertong('12-2')", "Trang tr��c/tong_11to15", "��ng/no");
end

function tong_13()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 4, "13-1/#othertong('13-1')", "13-2/#othertong('13-2')", "Trang tr��c/tong_11to15", "��ng/no");
end

function tong_14()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 3, "14-1/#othertong('14-1')", "Trang tr��c/tong_11to15", "��ng/no");
end

function tong_15()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 3, "15-1/#othertong('15-1')", "Trang tr��c/tong_11to15", "��ng/no");
end

function tong_16()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 3, "16-1/#othertong('16-1')", "Trang tr��c/tong_16to22", "��ng/no");
end

function tong_17()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 3, "17-1/#othertong('17-1')", "Trang tr��c/tong_16to22", "��ng/no");
end

function tong_18()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 3, "18-1/#othertong('18-1')", "Trang tr��c/tong_16to22", "��ng/no");
end

function tong_19()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 3, "19-1/#othertong('19-1')", "Trang tr��c/tong_16to22", "��ng/no");
end

function tong_20()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 4, "20-1/#othertong('20-1')", "20-2/#othertong('20-2')", "Trang tr��c/tong_16to20", "��ng/no");
end

function tong_22()
	Say("Ng��i mu�n xem tin t�c thi ��u c�a khu v�c n�o?", 3, "22-1/#othertong('22-1')", "Trang tr��c/tong_16to20", "��ng/no");
end

function othertong(tongname)
	Say("Ng��i mu�n xem tin t�c h�ng m�c thi ��u n�o?", 7, "Danh s�ch m�n ph�i thi ��u/#othertong_SINGLE('"..tongname.."')", "Song ��u/#othertong_DOUBLE('"..tongname.."')", "Ng� h�nh ��u/#othertong_FIVE('"..tongname.."')", "Th�p ph�i ��u/#othertong_TEN('"..tongname.."')", "Th�p l�c ��u/#othertong_SIXTEEN('"..tongname.."')", "Trang tr��c/whichtong", "��ng/no");
end

function othertong_SINGLE(tongname)
	Say("Ng��i mu�n xem tin t�c ��n ��u c�a m�n ph�i n�o?", 12, "Thi�u L�m/#othertong_sl('"..tongname.."')", "Thi�n V��ng/#othertong_tw('"..tongname.."')", "���ng M�n/#othertong_tm('"..tongname.."')", "Ng� ��c/#othertong_wu('"..tongname.."')", "Nga Mi/#othertong_em('"..tongname.."')", "Th�y Y�n/#othertong_cy('"..tongname.."')", "C�i Bang/#othertong_gb('"..tongname.."')", "Thi�n Nh�n/#othertong_tr('"..tongname.."')", "V� �ang/#othertong_wd('"..tongname.."')", "C�n L�n/#othertong_kl('"..tongname.."')", "Trang tr��c/#othertong('"..tongname.."')", "��ng/no");
end

function othertong_sl(tongname)
	local othertongteamname = tongname.."M�n ph�i ��n ��u 1_";
	Say("Ng��i mu�n xem tin t�c Thi�u L�m ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(1,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(1,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(1,'"..othertongteamname.."3')", "Nh�m th� 4".."/#tonginfo(1,'"..othertongteamname.."4')", "Nh�m th� 5".."/#tonginfo(1,'"..othertongteamname.."5')", "Trang tr��c/#othertong_SINGLE('"..tongname.."')", "��ng/no");
end

function othertong_tw(tongname)
	local othertongteamname = tongname.."M�n ph�i ��n ��u 2_";
	Say("Ng��i mu�n xem tin t�c Thi�n V��ng ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(2,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(2,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(2,'"..othertongteamname.."3')", "Nh�m th� 4".."/#tonginfo(2,'"..othertongteamname.."4')", "Nh�m th� 5".."/#tonginfo(2,'"..othertongteamname.."5')", "Trang tr��c/#othertong_SINGLE('"..tongname.."')", "��ng/no");
end

function othertong_tm(tongname)
	local othertongteamname = tongname.."M�n ph�i ��n ��u 3_";
	Say("Ng��i mu�n xem tin t�c ���ng M�n ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(3,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(3,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(3,'"..othertongteamname.."3')", "Nh�m th� 4".."/#tonginfo(3,'"..othertongteamname.."4')", "Nh�m th� 5".."/#tonginfo(3,'"..othertongteamname.."5')", "Trang tr��c/#othertong_SINGLE('"..tongname.."')", "��ng/no");
end

function othertong_wu(tongname)
	local othertongteamname = tongname.."M�n ph�i ��n ��u 4_";
	Say("Ng��i mu�n xem tin t�c Ng� ��c ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(4,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(4,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(4,'"..othertongteamname.."3')", "Nh�m th� 4".."/#tonginfo(4,'"..othertongteamname.."4')", "Nh�m th� 5".."/#tonginfo(4,'"..othertongteamname.."5')", "Trang tr��c/#othertong_SINGLE('"..tongname.."')", "��ng/no");
end

function othertong_em(tongname)
	local othertongteamname = tongname.."M�n ph�i ��n ��u 5_";
	Say("Ng��i mu�n xem tin t�c Nga My ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(5,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(5,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(5,'"..othertongteamname.."3')", "Nh�m th� 4".."/#tonginfo(5,'"..othertongteamname.."4')", "Nh�m th� 5".."/#tonginfo(5,'"..othertongteamname.."5')", "Trang tr��c/#othertong_SINGLE('"..tongname.."')", "��ng/no");
end

function othertong_cy(tongname)
	local othertongteamname = tongname.."M�n ph�i ��n ��u 6_";
	Say("Ng��i mu�n xem tin t�c Th�y Y�n ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(6,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(6,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(6,'"..othertongteamname.."3')", "Nh�m th� 4".."/#tonginfo(6,'"..othertongteamname.."4')", "Nh�m th� 5".."/#tonginfo(6,'"..othertongteamname.."5')", "Trang tr��c/#othertong_SINGLE('"..tongname.."')", "��ng/no");
end

function othertong_gb(tongname)
	local othertongteamname = tongname.."M�n ph�i ��n ��u 7_";
	Say("Ng��i mu�n xem tin t�c C�i Bang ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(7,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(7,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(7,'"..othertongteamname.."3')", "Nh�m th� 4".."/#tonginfo(7,'"..othertongteamname.."4')", "Nh�m th� 5".."/#tonginfo(7,'"..othertongteamname.."5')", "Trang tr��c/#othertong_SINGLE('"..tongname.."')", "��ng/no");
end

function othertong_tr(tongname)
	local othertongteamname = tongname.."M�n ph�i ��n ��u 8_";
	Say("Ng��i mu�n xem tin t�c Thi�n Nh�n ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(8,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(8,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(8,'"..othertongteamname.."3')", "Nh�m th� 4".."/#tonginfo(8,'"..othertongteamname.."4')", "Nh�m th� 5".."/#tonginfo(8,'"..othertongteamname.."5')", "Trang tr��c/#othertong_SINGLE('"..tongname.."')", "��ng/no");
end

function othertong_wd(tongname)
	local othertongteamname = tongname.."M�n ph�i ��n ��u 9_";
	Say("Ng��i mu�n xem tin t�c V� �ang ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(9,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(9,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(9,'"..othertongteamname.."3')", "Nh�m th� 4".."/#tonginfo(9,'"..othertongteamname.."4')", "Nh�m th� 5".."/#tonginfo(9,'"..othertongteamname.."5')", "Trang tr��c/#othertong_SINGLE('"..tongname.."')", "��ng/no");
end

function othertong_kl(tongname)
	local othertongteamname = tongname.."M�n ph�i ��n ��u 10_";
	Say("Ng��i mu�n xem tin t�c C�n L�n ��n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(10,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(10,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(10,'"..othertongteamname.."3')", "Nh�m th� 4".."/#tonginfo(10,'"..othertongteamname.."4')", "Nh�m th� 5".."/#tonginfo(10,'"..othertongteamname.."5')", "Trang tr��c/#othertong_SINGLE('"..tongname.."')", "��ng/no");
end

function othertong_DOUBLE(tongname)
	local othertongteamname = tongname.."Song ��u";
	Say("Ng��i mu�n xem tin t�c Song Nh�n ��u c�a chi�n ��i n�o?", 7, "Nh�m th� 1".."/#tonginfo(11,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(11,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(11,'"..othertongteamname.."3')", "Nh�m th� 4".."/#tonginfo(11,'"..othertongteamname.."4')", "Nh�m th� 5".."/#tonginfo(11,'"..othertongteamname.."5')", "Trang tr��c/#othertong('"..tongname.."')", "��ng/no");
end

function othertong_FIVE(tongname)
	local othertongteamname = tongname.."Ng� h�nh ��u";
	Say("Ng��i mu�n xem tin t�c Ng� h�nh ��u c�a chi�n ��i n�o?", 5, "Nh�m th� 1".."/#tonginfo(12,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(12,'"..othertongteamname.."2')", "Nh�m th� 3".."/#tonginfo(12,'"..othertongteamname.."3')", "Trang tr��c/#othertong('"..tongname.."')", "��ng/no");
end

function othertong_TEN(tongname)
	local othertongteamname = tongname.."Th�p to�n ��u";
	Say("Ng��i mu�n xem tin t�c Th�p to�n ��u c�a chi�n ��i n�o?", 4, "Nh�m th� 1".."/#tonginfo(13,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(13,'"..othertongteamname.."2')", "Trang tr��c/#othertong('"..tongname.."')", "��ng/no");
end

function othertong_SIXTEEN(tongname)
	local othertongteamname = tongname.."Th�p l�c ��u";
	Say("Ng��i mu�n xem tin t�c Th�p l�c ��u c�a chi�n ��i n�o?", 4, "Nh�m th� 1".."/#tonginfo(14,'"..othertongteamname.."1')", "Nh�m th� 2".."/#tonginfo(14,'"..othertongteamname.."2')", "Trang tr��c/#othertong('"..tongname.."')", "��ng/no");
end

function getowntongname()
	return GetTong();
end

function tonginfo(matchtype, tongname)
	leagueid = matchtype + 10
	print("getinfo-"..leagueid..":"..tongname)
	local lid = LG_GetLeagueObj(leagueid, tongname)
	if(FALSE(lid)) then
		print("��i nh�m kh�ng t�n t�i");
		Say("��i ng��i mu�n xem kh�ng t�n t�i.", 0);
		return 0
	end
	local mark = LG_GetLeagueTask(lid, 3);
	local matchcount = LG_GetLeagueTask(lid, 9);
	local position = LG_GetLeagueTask(lid, 5);
	local wincount = LG_GetLeagueTask(lid, 6);
	local drawcount = LG_GetLeagueTask(lid, 7);
	local losecount = LG_GetLeagueTask(lid, 8);
	
	if ( position == 0 ) then
		local num = LG_GetMemberCount(lid);
		local membername = {};
		local captain = "";
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name
		end
		local opp = selfinfo2next( lid, 0 )
		Say("T�n c�a chi�n ��i n�y l� [<color=red>"..tongname.."<color>], ��i tr��ng l� <color=red>"..captain.."<color> hi�n �ang trong giai �o�n d� tuy�n thi ��u, �i�m t�ch l�y l� <color=red>"..mark.."<color>. �� qua <color=red>"..matchcount.."<color> tr�n ��u, th�ng <color=red>"..wincount.."<color> tr�n, h�a <color=red>"..drawcount.."<color> tr�n, b�i <color=red>"..losecount.."<color> tr�n. Th�nh vi�n g�m"..num.."ng��i, danh s�ch nh� sau:",getn(opp),opp );
	else
		leaugeid = matchtype + 30;
		local lid = LG_GetLeagueObj(leaugeid, tongname)
		local loldid = LG_GetLeagueObj(matchtype + 10,  tongname)
		if(FALSE(loldid)) then
			print("��i nh�m kh�ng t�n t�i");
			Say("��i ng��i mu�n xem kh�ng t�n t�i.", 0);
			return 0
		end
		if(FALSE(lid)) then
			print("��i nh�m kh�ng t�n t�i");
			Say("��i ng��i mu�n xem kh�ng t�n t�i.", 0);
			return 0
		end
		local num = LG_GetMemberCount(loldid);
		local membername = {};
		local captain = "";
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(loldid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( loldid, 0 )
		if ( position == 32 ) then
			positioninfo = "32 ��i m�nh nh�t";
		elseif ( position == 16 ) then
			positioninfo = "16 ��i m�nh nh�t";
		elseif ( position == 8 ) then
			positioninfo = "8 ��i m�nh nh�t";
		elseif ( position == 4 ) then
			positioninfo = "4 ��i m�nh nh�t";
		elseif ( position == 2 ) then
			positioninfo = "Quy�t ��nh cu�i c�ng";
		else
			print("Giai �o�n thi ��u kh�ng ��ng");
		end
		Say("T�n c�a chi�n ��i n�y l� [ "..tongname.." ], ��i tr��ng l� "..captain..", hi�n �ang � <color=red>"..positioninfo.."<color>. Th�nh vi�n g�m"..num..", danh s�ch nh� sau:", getn(opp), opp);
	end
end

function selfmatch()
	local tab = {};
	faction = GetLastFactionNumber()+1
	playername = GetName()
	local lid = LG_GetLeagueObjByRole(faction + 10, playername)
	if (not FALSE(lid)) then
		tab[getn(tab) + 1] = "Danh s�ch m�n ph�i thi ��u/#selfinfo("..faction..")"
	end
	for i = 11, 15 do 
		local lid = LG_GetLeagueObjByRole(i + 10, playername)
		if (not FALSE(lid)) then
			local l_leaguename = LG_GetLeagueInfo(lid)
			tab[getn(tab) + 1] = "chi�n ��i ["..l_leaguename.."] �� gia nh�p.".."/#selfinfo("..i..")"
		end
	end
	if ( getn( tab ) == 0 ) then
		Say("   Hi�n ng��i ch�a tham gia tr�n ��u n�o!", 0)
		return
	end
	tab[getn(tab) + 1] = "Kh�ng c�n/OnCancel"
	--Say("���ִ���Ա����Ҫ��ѯ�Լ�����������أ�", 7, "���ɵ�����/#selfinfo(10)", "˫����/#selfinfo(11)", "�����Ŷ���/#selfinfo(12)", "ʮȫ�Ŷ���/#selfinfo(13)", "16���Ŷ���/#selfinfo(14)", "��һҳ/query", "�ر�/no");
	Say("   Ng��i mu�n xem m�c thi ��u n�o c�a m�nh?", getn(tab),tab);
end

function selfinfo(teamtpye)
	local playername = GetName();
	local lid = LG_GetLeagueObjByRole(teamtpye + 10,playername);
	if(FALSE(lid)) then
		print("��i nh�m kh�ng t�n t�i");
		Say("   Ng��i kh�ng tham gia m�c thi ��u n�y", 0);
		return 0
	end
	local leaguename = LG_GetLeagueInfo(lid)
	local mark = LG_GetLeagueTask(lid, 3);
	local matchcount = LG_GetLeagueTask(lid, 9);
	local position = LG_GetLeagueTask(lid, 5);
	local wincount = LG_GetLeagueTask(lid, 6);
	local drawcount = LG_GetLeagueTask(lid, 7);
	local losecount = LG_GetLeagueTask(lid, 8);
	if ( position == 0 ) then
		local num = LG_GetMemberCount(lid);
		local membername = {};
		local captain = ""
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( lid, 0 )
		
		Say("T�n ��i c�a ng��i l� [<color=red>"..leaguename.."<color>], ��i tr��ng l� <color=red>"..captain.."<color> hi�n �ang trong giai �o�n d� tuy�n thi ��u, �i�m t�ch l�y l� <color=red>"..mark.."<color>. �� qua <color=red>"..matchcount.."<color> tr�n ��u, th�ng <color=red>"..wincount.."<color> tr�n, h�a <color=red>"..drawcount.."<color> tr�n, b�i <color=red>"..losecount.."<color> tr�n. Th�nh vi�n g�m"..num.."ng��i, danh s�ch nh� sau:",getn(opp),opp );
	else
		leaugeid = teamtpye + 30;
		local lcirleid = LG_GetLeagueObjByRole(teamtpye + 10,playername);	--ѭ������lid
		local szleaguename = LG_GetLeagueInfo(lcirleid)
		local lid = LG_GetLeagueObj(leaugeid,szleaguename);	--��̭����lid
		if(FALSE(lcirleid)) then
			print("��i nh�m kh�ng t�n t�i");
			Say("��i ng��i mu�n xem kh�ng t�n t�i.", 0);
			return 0
		end
		
		if(FALSE(lid)) then
			print("��i nh�m kh�ng t�n t�i");
			Say("��i ng��i mu�n xem kh�ng t�n t�i.", 0);
			return 0
		end
		local num = LG_GetMemberCount(lcirleid);
		local membername = {}
		local captain = ""
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lcirleid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( lcirleid, 0 )
		if ( position == 32 ) then
			positioninfo = "32 ��i m�nh nh�t";
		elseif ( position == 16 ) then
			positioninfo = "16 ��i m�nh nh�t";
		elseif ( position == 8 ) then
			positioninfo = "8 ��i m�nh nh�t";
		elseif ( position == 4 ) then
			positioninfo = "4 ��i m�nh nh�t";
		elseif ( position == 2 ) then
			positioninfo = "Quy�t ��nh cu�i c�ng";
		else
			print("Giai �o�n thi ��u kh�ng ��ng");
		end
		Say("T�n ��i c�a ng��i l� [ "..leaguename.." ], ��i tr��ng l� "..captain..", hi�n �ang � <color=red>"..positioninfo.."<color>. Th�nh vi�n g�m"..num..", danh s�ch nh� sau:", getn(opp), opp);
	end
end

function no()
end

function FALSE(value)
	if (value == nil or value == 0) then
		return 1
	end
	return nil
end

function selfinfo2next( lid, num )
	local count = LG_GetMemberCount(lid);
	local membername = {};
	local opp = {}
	local captain = ""
	for i = 0, count -1 do
		local name,job = LG_GetMemberInfo(lid, i);
		if ( job == 1 ) then
			captain = name
		end
		membername[i + 1] = name;
	end
	if ( getn(membername) - num > 10 ) then
		for i = num+1, num+10 do
			opp[ getn(opp) + 1 ] = membername[i].."/#selfinfo2next("..lid..","..(num+10)..")"
		end
		opp[getn(opp)+1] = "Trang k� /#selfinfo2next("..lid..","..(num+10)..")"
	else
		for i = num+1, getn( membername ) do
			opp[getn(opp) + 1] = membername[i]
		end
	end
	opp[getn(opp)+1] = "��ng/no"
	if( num == 0 ) then
		return opp
	end
	Say("Quan vi�n V� l�m ki�t xu�t:", getn(opp), opp)
end