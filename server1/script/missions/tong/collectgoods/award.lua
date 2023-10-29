-- ����.lua (�����ļ���ӻ)
if (not __COLLG_AWARD_H__) then
	__COLLG_AWARD_H__ = 1;
Include([[\script\missions\tong\collectgoods\head.lua]]);
IncludeLib("FILESYS");

tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
1000000
};

collg_tabRate = {--С��Ե �ɲ�¶ ���PK�� �и�Ե 4������ ��Ե 5������ ���ˮ�� ������� 6������ 7������ 8������
	{0, 0, 0, 0, 0, 0.27, 0.2755, 0.12, 0.2, 0.1, 0.03, 0.0045},	--��һ��
	{0, 0, 0, 0, 0.2, 0.172, 0.2, 0.1, 0.2, 0.1, 0.025, 0.003},	--
	{0, 0, 0, 0.061, 0.2, 0.137, 0.2, 0.1, 0.2, 0.08, 0.02, 0.002},	--
	{0.04, 0.04, 0.04, 0.061, 0.17, 0.137, 0.2, 0.05, 0.18, 0.072, 0.01, 0},	--
	{0.05, 0.05, 0.06, 0.068, 0.17, 0.137, 0.2, 0.05, 0.15, 0.06, 0.005, 0},	--
	{0.059, 0.06, 0.1, 0.1, 0.12, 0.15, 0.15, 0.05, 0.15, 0.06, 0.001, 0},		--
	{0.15, 0.12, 0.14, 0.1, 0.1, 0.1, 0.1, 0.01, 0.12, 0.06, 0, 0},	--
	{0.18, 0.17, 0.14, 0.1, 0.1, 0.05, 0.1, 0.01, 0.1, 0.05, 0, 0},	--
	{0.17, 0.15, 0.1, 0.2, 0.1, 0.05, 0.1, 0.01, 0.1, 0.02, 0, 0},	--
	{0.15, 0.13, 0.16, 0.25, 0.15, 0.05, 0.1, 0.01, 0, 0, 0, 0}	--��ʮ��
};

--��Ʒ����
tab_goods = {
	{122, 0, "Ph�c Duy�n (ti�u) "},
	{71, 0, "Ti�n Th�o L� "},
	{"PK ho�n"},
	{123, 0, "Ph�c Duy�n (trung) "},
	{147, 4, "Huy�n Tinh c�p 4"},
	{124, 0, "Ph�c Duy�n (��i) "},
	{147, 5, "Huy�n Tinh c�p 5"},
	{"Th�y tinh"},
	{"M�t �� nhi�m v� "},
	{147, 6, "Huy�n Tinh c�p 6"},
	{147, 7, "Huy�n Tinh c�p 7"},
	{147, 8, "Huy�n Tinh c�p 8"},
}


function collg_about()
	Say("M�t ��t ho�t ��ng di�n ra trong <color=red>15<color> ph�t. Trong �� c� <color=red>5<color> ph�t chu�n b�. Sau khi b�o danh tham gia, ng��i ch�i s� ���c ��a ��n khu v�c chu�n b�. Khi ho�t ��ng b�t ��u th� trong khu v�c s� xu�t hi�n 'T�i h�ng h�a', ng��i ch�i ch� c�n nh�t c�c 'T�i h�ng h�a' n�y; nh�ng c�n ph�i c�n th�n nh�ng con 's�u n�' ng�u nhi�n xu�t hi�n b�m v�o th�n ng��i v� ph�t n�.", 1, "Trang k� /collg_about_next");
end;

function collg_about_next()
	Say("N�u nh� ng��i ch�i b� s�u ph�t n� th� nh�ng 'T�i h�ng h�a' s� b� r�i ra � g�n ��, ��ng th�i b� cho�ng trong 30 gi�y. Trong th�i gian b� cho�ng s� kh�ng b� 's�u n�' t�n c�ng. Khi b� s�u n� b�m v�o th� s� c� th�m k� n�ng 'n�m chuy�n', c� th� d�ng k� n�ng n�y �� n�m s�u v�o ng��i ch�i kh�c. Sau khi ho�t ��ng k�t th�c, '<color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color>' s� c�n c� v�o b�ng x�p h�ng s� l��ng 'T�i h�ng h�a' �� ph�t th��ng.", 0);
end;

function collg_aword()
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local nCount = GetTask(COLLG_COUNT_ONETIME);
	local nRank = GetTask(COLLG_TK_RANK);
	SetTask(COLLG_COUNT_ONETIME, 0);
	SetTask(COLLG_TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Say("T�ng qu�n Ho�t ��ng ph��ng: Ng��i mu�n nh�n th��ng �, h�y mau �i t�m t�i h�ng h�a ��, n�u kh�ng c� th� t�m ta c�ng l� ph� th�i gian m� th�i.", 1, "Theo c� ph�t tay bay ra/oncancel");
		SetTaskTemp(193, 0);
		return
	end;
	
	Say("T�ng qu�n Ho�t ��ng ph��ng: L�m r�t t�t, ng��i t�m ���c <color=yellow>"..nCount.."<color> t�i h�ng h�a, x�p h�ng th� <color=yellow>"..nRank.."<color>, ��y l� ph�n th��ng d�nh cho ng��i, xin h�y nh�n l�y.", 1, "Nh�n l�y l� v�t./oncancel");
	collg_giveaward(nRank);
	SetTaskTemp(193, 0);
end;


function collg_giveaward(nRank)
	AddOwnExp(tabExp[nRank]);
	collg_goodsaward(nRank);
end;

function collg_festival_addpkwan()--��PK��
    local itemidx = random(1, 10);
    AddItem(6, 0, itemidx, 1, 0, 0, 0);
    tab_pkwan_name = {"Tr��ng M�nh ho�n", "Gia B�o ho�n", "��i L�c ho�n", "Cao Thi�m ho�n", "Cao Trung ho�n", "Phi T�c ho�n", "B�ng Ph�ng ho�n", "L�i Ph�ng ho�n", "H�a Ph�ng ho�n", "��c Ph�ng ho�n"};
    Msg2Player("B�n nh�n ���c m�t"..tab_pkwan_name[itemidx]);
end;

function collg_goodsaward(nRank)
	local nGoodsType = collg_getgoodtype(nRank);
	
	if (nGoodsType == 3) then	--��һ��PK��
		collg_festival_addpkwan();
		return
	end;
	
	if (nGoodsType == 8) then	--���һ��ˮ��
		collg_givecrystal();
		return
	end;
	
	if (nGoodsType == 9) then	--��һ���������
		collg_giveTaskBook();
		return
	end;
	AddItem(6, 1, tab_goods[nGoodsType][1], tab_goods[nGoodsType][2], 0, 0, 0);
	local strsay = "B�n nh�n ���c m�t"..tab_goods[nGoodsType][3];
	Msg2Player(strsay);
end;

function collg_givecrystal()
	local nIdx = random(1, 3);
	local tab_Crystal = {{238, "Lam Th�y Tinh"}, {239, "T� Th�y Tinh"}, {240, "L�c Th�y Tinh"}};
	AddItem(4, tab_Crystal[nIdx][1], 0, 0, 0, 0, 0);
	Msg2Player("B�n nh�n ���c <color=yellow>"..tab_Crystal[nIdx][2].."<color>.");
end;

function collg_getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	local nBase = 0;
	for i = 1, getn(collg_tabRate[nRank]) do
		nBase = nBase + collg_tabRate[nRank][i] * 100;
		if (nBase >= nSeed) then
			return i;
		end;
	end;
end;

-- ����һ���������
function collg_giveTaskBook()
	local nRandomTaskID, nRandomItemIndex = 0, 0;
	-- ѡ��һ���ڶ�����������
	nRandomTaskID = TaskNo(selectNextTask());
	-- ����һ���������
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	-- ͬ����Ʒħ������
	SyncItem(nRandomItemIndex);	
	Msg2Player("B�n nh�n ���c m�t <color=green>quy�n nhi�m v�<color>!");
	WriteTaskLog("Nh�n ���c 1 m�t t�ch nhi�m v�, m� s� l�:"..nRandomTaskID);
	return nRandomTaskID;
end;


-- ����ϵͳ��д�� LOG ����
function WriteTaskLog(strMain)
	-- ����ǿ�ֵ��д��
	if strMain==nil then return end;
	WriteLog("[Ho�t ��ng thu th�p v�t ph�m bang h�i n�m 2006]"..GetLocalDate(" [%y n�m %m th�ng %d ng�y  %H gi� %M ph�t]").." [m�t m�:"..GetAccount().."] [nh�n v�t:"..GetName().."]:"..strMain);
end;

function oncancel()	--ȡ��

end;

end; --// end of __COLLG_AWARD_H__