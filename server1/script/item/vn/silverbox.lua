Include("\\script\\lib\\award.lua")
--award_give
function main(nItemIdx)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate >= 70331) then
		Msg2Player("B�o r��ng �� r� s�t, kh�ng c�n s� d�ng ���c n�a.");
		return 0;
	end;
	
	local tb_goldenbox = {
						{1,	{6,1,124,1,0,0,0},	1,	23860,	"Ph�c Duy�n L� (��i) ", 0},
						{1,	{6,1,71,1,0,0},	1,	17010,	"Ti�n Th�o L� ", 0},
						{1,	{6,1,26,1,0,0,0},	1,	100,	"V� L�m M�t T�ch", 0},
						{1,	{6,1,22,1,0,0,0},	1,	100,	"T�y T�y Kinh", 0},
						{1,	{6,1,147,1,0,0},	1,	38590,	"Huy�n Tinh Kho�ng Th�ch c�p 1", 0},
						{1,	{6,1,147,2,0,0},	1,	12280,	"Huy�n Tinh Kho�ng Th�ch c�p 2", 0},
						{1,	{6,1,147,3,0,0},	1,	2150,	"Huy�n Tinh Kho�ng Th�ch c�p 3 ", 0},
						{1,	{4,353,1,1,0,0},	1,	2830,	"Tinh H�ng B�o Th�ch", 0},
						{1,	{4,238,1,1,0,0},	1,	2830,	"Lam Th�y Tinh", 0},
						{2,	{0,159},	1,	50,	"��nh Qu�c Thanh Sa Tr��ng Sam", 1},
						{2,	{0,160},	1,	50,	"��nh Qu�c � Sa Ph�t Qu�n", 1},
						{2,	{0,161},	1,	50,	"��nh Qu�c X�ch Quy�n Nhuy�n Ngoa", 1},
						{2,	{0,162},	1,	50,	"��nh Qu�c T� ��ng H� uy�n", 1},
						{2,	{0,163},	1,	50,	"��nh Qu�c Ng�n T�m Y�u ��i", 1},
		};
	local sum = 0;
	local nrand = random(100000);
	local strInfo=format("%s\t%s\tName:%s\tAccount:%s\t", 
								"[Ho�t ��ng thu th�p m�nh m�t �� th�n b�]", 
								GetLocalDate("%Y-%m-%d %H:%M"),
								GetName(), GetAccount());	
	for i = 1, getn(tb_goldenbox) do
		sum = sum + tb_goldenbox[i][4]
		if (sum >= nrand) then
			award_give(tb_goldenbox[i]);
			Msg2Player(format("Ch�c m�ng b�n �� nh�n ���c - %s",tb_goldenbox[i][5]));
			WriteLog(strInfo..format("M� R��ng b�c nh�n ���c %s", tb_goldenbox[i][5]));
			if (tb_goldenbox[i][6] == 1) then
				AddGlobalNews(format("%s �� tham gia ho�t ��ng thu th�p m�t �� th�n b� v� nh�n ���c 1 b� trang b� Ho�ng Kim!", GetName()));
			end;
			return 0;
		end;
	end;
	return 1;
end;