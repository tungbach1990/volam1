-- ����.lua (�������޻)
if (not __SF_AWARD_H__) then
__SF_AWARD_H__ = 1;

IncludeLib("FILESYS");
Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");
SFHD_DATAFILE = [[\settings\tong\workshop\huodong_level_data.txt]];



function springfestival_aword(nTongID, nWorkshopID)
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	--��û���ȼ�
	local nLevel = TWS_GetLevel(nTongID, nWorkshopID);
	if (nLevel < 1 or nLevel > 10) then
		Say("Bang h�i c�a b�n ch�a x�y d�ng T�c Ph��ng n�y.", 1, "Ta bi�t r�i!/festival06_Cancal")
		return 0;
	end;
	
    local nGetCount = GetTask(SF_COUNT_ONETIME);
    local nRank = GetTask(SF_TK_RANK);
    SetTask(SF_COUNT_ONETIME, 0);
    SetTask(SF_TK_RANK, 0);
    if (nGetCount <= 0 or nRank <= 0) then
        Say("T�ng qu�n Ho�t ��ng ph��ng: Ng��i d�ng nh� v�n ch�a �i ��nh ni�n th�, mu�n nh�n th��ng h�y ra s�c ��nh �u�i ni�n th� tr��c.", 1, "H�y ch� xem/festival06_Cancal");
        SetTaskTemp(193, 0);
        return
    end;
    local strniaoshou = "Nguy hi�m qu�! Ng��i m�i b� Qu�i th� nh�p v�o, may m� m�i ng��i h�p s�c l�i �u�i Qu�i th� �i r�i! �� ��p t� l�ng d�ng c�m c�a ng��i, ta c� ch�t l�ng th�nh xin nh�n cho!";
    local stryongshi = "L�m r�t t�t, ng��i �� d�ng ph�o n�m tr�ng ni�n th� <color=yellow>"..nGetCount.."<color> l�n, x�p h�ng th� <color=yellow>"..nRank.."<color>, ��y l� th� lao! Xin nh�n l�y!";
    
    festival_addaward(nRank);
    local isDouble = festival_double(nLevel);--�����Ƿ���˫��
	if (1 == isDouble) then
		strniaoshou = "Th�t may m�n, ng��i �� nh�n ���c <color=red>ph�n th��ng nh�n ��i<color>, "..strniaoshou;
		stryongshi = "Th�t may m�n, ng��i �� nh�n ���c <color=red>ph�n th��ng nh�n ��i<color>, "..stryongshi;
		festival_addaward(nRank);--˫������
	end;
    if (GetTask(TK_GROUPID) > SF_SMALLMAPCOUNT) then
        Say(strniaoshou, 1, "Nh�n l�y l� v�t./festival06_Cancal");
    else
        Say(stryongshi, 1, "Nh�n l�y l� v�t./festival06_Cancal");
    end;
    SetTaskTemp(193, 0);
end;


function festival_double(nLevel)
	local nResult = 0;
	local nSeed = random(100);
	local nRate = tonumber(GetTabFileData(SFHD_DATAFILE, nLevel + 1, 7));
	if (nSeed <= nRate * 100) then
		nResult = 1;
	end;
	return nResult;
end;

festival_tabExp = {
5000000,
4000000,
3000000,
2000000,
1500000,
1000000,
500000,
500000,
};
festival_tabRate = {
	{0 ,0 ,0 ,0.464 ,0.2 ,0.175 ,0.15 ,0.01 ,0.001 ,0 },
	{0 ,0 ,0 ,0.5562 ,0.2 ,0.145 ,0.09 ,0.008 ,0.0008 ,0 } ,
	{0 ,0 ,0.3845 ,0.3 ,0.15 ,0.1 ,0.06 ,0.005 ,0.0005 ,0 } ,
	{0 ,0 ,0.546 ,0.2 ,0.12 ,0.085 ,0.045 ,0.004 ,0 ,0 } ,
	{0 ,0 ,0.653 ,0.15 ,0.09 ,0.075 ,0.03 ,0.002 ,0 ,0.01 } ,
	{0 ,0.295 ,0.4 ,0.15 ,0.076 ,0.068 ,0.01 ,0.001 ,0 ,0 } ,
	{0.267 ,0.3 ,0.2 ,0.12 ,0.08 ,0.03 ,0.003 ,0 ,0 ,0 } ,
	{0.586 ,0.2 ,0.12 ,0.06 ,0.03 ,0.004 ,0 ,0 ,0 ,0 }
};

festival_tab_Goods = {
{"Ph�c Duy�n L� (Ti�u) ",	1,	122	},
{"Ph�c Duy�n L� (Trung) ",	1,	123	},
{"Ph�c Duy�n L� (��i) ",	1,	124	},
{"Huy�n tinh c�p 3",	3,	147	},
{"Ti�n Th�o L� ",	1,	71	},
{"Huy�n Tinh c�p 4",	4,	147	},
{"Huy�n Tinh c�p 5",	5,	147	},
{"Huy�n Tinh c�p 6",	6,	147	},
{"Huy�n Tinh c�p 7",	7,	147	},
{"Ph�o hoa ng�y T�t",	1,	1345 },	--���ʵ�Ϊ0��������
};
function festival_addaward(nRank)
    if (nRank > getn(festival_tabExp)) then
        nRank = getn(festival_tabExp);
    end;
    nRank = festival_award_rank(nRank);
    festival_expaward(nRank);
    festival_goodsaward(nRank);
--    if (nRank <= 2) then
--        local nSeed = random(1, 100);
--        if (nSeed <= 2) then
--            AddItem(0, 11, 263, 1, 0, 0, 0);
--            Msg2Player("������һ��<color=yellow>�������<color>")
--        end;
--    end;
end;

function festival_goodsaward(nRank)
    local nGroup = GetTask(TK_GROUPID);
	local nGoodsType = festival_getgoodtype(nRank, nGroup);
	local strsay = "";
	if (festival_tab_Goods[nGoodsType][2] == 1) then
		AddItem(6, 1, festival_tab_Goods[nGoodsType][3], 1, 0, 0, 0);
	else
		AddItem(6, 1, festival_tab_Goods[nGoodsType][3], festival_tab_Goods[nGoodsType][2], 0, 0, 0);
	end;
	Msg2Player("B�n nh�n ���c <color=yellow>"..festival_tab_Goods[nGoodsType][1].."<color>.");
end;

function festival_getgoodtype(nRank, nGroup)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 10 do
		nRate[i] = festival_tabRate[nRank][i] * 100;
	end;
	local nBase = 0;
	for i = 1, 10 do
		nBase = nBase + nRate[i];
		if (nBase >= nSeed) then
			return i;
		end;
	end;
end;

function festival_expaward(nRank)
    if (nRank < 1) then
        nRank = 1;
    end;
    if (nRank > 8) then
        nRank = 8;
    end;
    local nCount = festival_tabExp[nRank];
	AddOwnExp(nCount);
	Msg2Player("B�n nh�n ���c<color=yellow>"..nCount.."<color>�i�m kinh nghi�m")
end;

function festival_addpkwan()
    local itemidx = random(1, 10);
    AddItem(6, 0, itemidx, 1, 0, 0, 0);
    tab_pkwan_name = {"Tr��ng M�nh ho�n", "Gia B�o ho�n", "��i L�c ho�n", "Cao Thi�m ho�n", "Cao Trung ho�n", "Phi T�c ho�n", "B�ng Ph�ng ho�n", "L�i Ph�ng ho�n", "H�a Ph�ng ho�n", "��c Ph�ng ho�n"};
    return tab_pkwan_name[itemidx];
end;

function festival_award_rank(nRank)
    local nGroup = GetTask(TK_GROUPID);
    if (nGroup > SF_SMALLMAPCOUNT) then
        if (nRank == 1) then
            nRank = 3;
        else
            nRank = 8;
        end;
    end;
    return nRank;
end;

function festival06_Cancal()
    
end;

end; --// end of __SF_AWARD_H__