--�����ؼ�ͼ��NPC
--Edit by �ӷ����
--2006-06-20

Include("\\script\\tong\\tong_setting.lua")
-- ͬ��ϵͳ��֧��
IncludeLib("PARTNER");
IncludeLib("ITEM");
Include([[\script\lib\coordinate.lua]]);--֧���趨�ļ�����
LINK_TONG_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>C�t bi�u t��ng bang: <link>"
LINK_CITY_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>C�t bi�u t��ng th�nh th�: <link>"

--����ͼ��
function main()
	local _Name, nTongID = GetTongName()
	
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("Ng��i ch�a gia nh�p bang, mu�n ��n ��y tham quan sao?")
		return
	end
	
	local nStuntID = tong_GetCityStuntID(nTongID)
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("��y kh�ng ph�i l� l�nh ��a c�a qu� bang, ch� l� ��n tham quan th�i.")
		return
	elseif (nStuntID == 0) then
			totempole_dec("Bang h�i qu� bang ch�a m� k� n�ng th�nh th�, kh�ng th� s� d�ng C�t bi�u t��ng. H�y th�ng b�o ��n c�p l�nh ��o bang, t�i trang ch�c n�ng c� th� khai m� k� n�ng th�nh th�.")
			return
	end
		--ִ�ж�Ӧ�ؼ�
		getglobal(TB_STUNTID_INFO[nStuntID].func)(nTongID, nStuntID)
end



function IsTakeStunt(nTongID,nStuntRight)
	local _Name, nTongID = GetTongName()
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("Ng��i ch�a gia nh�p bang, mu�n ��n ��y tham quan sao?")
		return
	end
	local nStuntID = tong_GetCityStuntID(nTongID)
	if (nStuntID == 0) then
		print("Kh�ng ph�i bang chi�m th�nh!")
		return
	end
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("��y kh�ng ph�i l� l�nh ��a c�a qu� bang, ch� l� ��n tham quan th�i.")
		return
	elseif (TONG_GetWeek(nTongID) > TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD)) then
		totempole_dec("K� n�ng th�nh th� �� qu� h�n b�o tr�, hi�n t�i kh�ng th� nh�n. H�y th� l�i th�i gian b�o tr� h�m nay.")
		return
	end
	
	local nHour = tonumber(GetLocalDate("%H"))
	if (nHour < 20 or nHour > 22) then
		totempole_dec("Th�i gian ti�p nh�n k� n�ng th�nh th� l� 20:00 ��n 22:00, trong kho�ng th�i gian n�y h�y ��n nh�n k� n�ng.")
		return
	end
	
	if (nStuntRight == 1) then
	--�����ؼ���Ȩ��
		local nFigure = TONGM_CheckRight(nTongID, GetName(), 2006)
		if (nFigure == 1) then
			if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) > 0) then
				return 1
			else
				totempole_dec("K� n�ng th�nh th� trong tu�n n�y �� nh�n h�t r�i, h�y ��i tu�n sau m�i c� th� nh�n n�a.")
			end
		else
			totempole_dec("K� n�ng th�nh th� n�y ch� cho ph�p c�p l�nh ��o bang ti�p nh�n.")
		end
		return
	end
	
	if (GetTask(TASKID_STUNT_LASTWEEK) == TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) and GetTask(TASKID_CITYST_TAKED) >= TB_STUNTID_INFO[nStuntID].cntper) then
		totempole_dec("Trong tu�n n�y �� ti�p nh�n k� n�ng th�nh th� r�i, kh�ng th� nh�n n�a.")
		return
	elseif (GetTask(TASKID_STUNT_LASTWEEK) ~= TONG_GetWeek(nTongID)) then
		SetTask(TASKID_STUNT_TAKED, 0)
	end
	
	if (GetTask(TASKID_CITY_LASTDAY) == TONG_GetDay(nTongID)) then
		totempole_dec("K� n�ng bang h�i m�i ng�y ch� c� th� nh�n 1 l�n, ng�y mai h�t ��n nh�.")
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) <= 0) then
		totempole_dec("K� n�ng th�nh th� h�m nay�� ti�p nh�n h�t r�i, ng�y mai h�y ��n nh�.")
		return
	end
	
	--�����ۻ����׶�����
	--if �����ۻ����׶� < MIN then return end
	return nTongID
end

function OnCancel()
end

--�����ؼ����ƽ���
function stunt_huangjinling(nTongID, nStuntID)

	TB_STUNT_HUANGJINLING = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>"..GetCityAreaName(nCityID).."K� n�ng th�nh th�: "..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.name.."<color>"..
	"<enter>Quy�n ti�p nh�n k� n�ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_HUANGJINLING.right].."<color>"..
	"<enter>T�c d�ng c�a k� n�ng ��c bi�t:"..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.describe.."<color>"..
	"<enter>Th�i gian hi�u l�c k� n�ng l� 7 ng�y. H�m nay v�n cho ph�p "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng��i n�a ��n nh�n k� n�ng n�y.", 
	"Ti�p nh�n k� n�ng/stunt_huangjinling1",
	"R�i kh�i/OnCancel")
end

function stunt_huangjinling1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("H�nh trang c�n <color=yellow>%d<color> � tr�ng.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_HUANGJINLING.right)) then
		return
	end
	if (AddItem(6, 1, 1107, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		--��������������ʵ����Ҫ
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("Nh�n ���c 1 <color=yellow>Ho�ng Kim L�nh!<color>")
		Msg2Tong(nTongID, GetName().."Nh�n ���c 1 Ho�ng Kim L�nh k� n�ng th�nh th�")
		TONG_ApplyAddEventRecord(nTongID, GetName().."Nh�n ���c 1 Ho�ng Kim L�nh k� n�ng th�nh th�")
	end
end

--�����ؼ��������
function stunt_lingshenli(nTongID, nStuntID)
	TB_STUNT_LINGSHENLI = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>"..GetCityAreaName(nCityID).."K� n�ng th�nh th�: "..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.name.."<color>"..
	"<enter>Quy�n ti�p nh�n k� n�ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_LINGSHENLI.right].."<color>"..
	"<enter>T�c d�ng c�a k� n�ng ��c bi�t:"..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.describe.."<color>"..
	"<enter>Th�i h�n c�a k� n�ng n�y l� 7 ng�y, trong th�i h�n n�y cho ph�p t�i �a "..TB_STUNT_LINGSHENLI.maxmem.." ng��i ti�p nh�n k� n�ng, m�i ng�y m�t ng��i ch� nh�n ���c 1 l�n. H�m nay c�n cho ph�p "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng��i n�a ��n nh�n k� n�ng n�y.", 
	"Ti�p nh�n k� n�ng/stunt_lingshenli1",
	"R�i kh�i/OnCancel")
	
end

function stunt_lingshenli1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_LINGSHENLI.right)) then
		return
	end
	if (AddItem(6, 1, 1110, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("Nh�n ���c m�t <color=yellow>H�p nh�n s�m<color>, m� ra l�p t�c nh�n ���c linh l�c c�a nh�n s�m ng�n n�m.")
	else
		Msg2Player("Nh�n linh s�m l�c th�t b�i!")
	end
end

--112
function stunt_shiweiying(nTongID, nStuntID)
	TB_STUNT_SHIWEIYING = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n�ng th�nh th�: "..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.name.."<color>"..
	"<enter>Quy�n ti�p nh�n k� n�ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_SHIWEIYING.right].."<color>"..
	"<enter>T�c d�ng c�a k� n�ng ��c bi�t:"..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.describe.."<color>"..
	"<enter>Th�i h�n c�a k� n�ng n�y l� 7 ng�y, trong th�i h�n n�y cho ph�p t�i �a "..TB_STUNT_SHIWEIYING.maxmem.." ng��i ti�p nh�n k� n�ng, m�i ng�y m�t ng��i ch� nh�n ���c 1 l�n. H�m nay c�n cho ph�p "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng��i n�a ��n nh�n k� n�ng n�y.", 
	"Ti�p nh�n k� n�ng/stunt_shiweiying1",
	"R�i kh�i/OnCancel")
end

function stunt_shiweiying1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	if (PARTNER_Count() >= 5) then
		totempole_dec("S� l��ng b�n ��ng h�nh �� ��t gi�i h�n, ch� c� x�a b� 1 b�n ��ng h�nh m�i c� th� nh�n k� n�ng n�y. Nh�ng x�a b� 1 b�n ��ng h�nh r�t t�n nh�n, ng��i h�y suy ngh� cho k�.")
		return
	end
	totempole_dec("Ch�n ng� h�nh cho b�n ��ng h�nh.",
	"h� Kim/stunt_shiweiying2",
	"h� M�c/stunt_shiweiying2",
	"h� Th�y/stunt_shiweiying2",
	"h� H�a/stunt_shiweiying2",
	"h� Th� /stunt_shiweiying2",
	"Ta mu�n suy ngh� l�i/OnCancel"	)
end

TB_SERIES_NAME = {"Kim", "M�c", "Th�y ", "H�a", "Th� "}
TB_CHARACTOR = {"D�ng M�nh","V� Ch�  ","L�u Mang ","N�a Nh��c"}
function stunt_shiweiying2(nSel)
	SetTaskTemp(112, nSel)
	totempole_dec("�� l�a ch�n ng� h�nh b�n ��ng h�nh l� h� "..TB_SERIES_NAME[nSel+1].." , h�y ti�p t�c ch�n l�a t�nh c�ch.",
	TB_CHARACTOR[1].."/stunt_shiweiying3",
	TB_CHARACTOR[2].."/stunt_shiweiying3",
	TB_CHARACTOR[3].."/stunt_shiweiying3",
	TB_CHARACTOR[4].."/stunt_shiweiying3",
	"K�t th�c ��i tho�i/OnCancel"	)
end

function stunt_shiweiying3(nSel)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	local nseries = GetTaskTemp(112)
	local ncharactor = nSel + 1
	if (nseries == 0) then
		partnerIndex = PARTNER_AddFightPartner(5, 0, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 1) then
		partnerIndex = PARTNER_AddFightPartner(4, 1, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 2) then
		partnerIndex = PARTNER_AddFightPartner(2, 2, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 3) then
		partnerIndex = PARTNER_AddFightPartner(3, 3, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	else
		partnerIndex = PARTNER_AddFightPartner(1, 4, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	end
	if (partnerIndex == -1) then
		totempole_dec("Ti�p nh�n b�n ��ng h�nh th�t b�i, h�y th� l�i sao.")
		return
	end
	PARTNER_SetCurPartner(partnerIndex)
	PARTNER_CallOutCurPartner(1)
	local nlevel = random(1,49)
	for i = 1, nlevel do
		PARTNER_AddExp(partnerIndex, 825500)	--50����Ҫ����
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
	totempole_dec("Nh�n ���c 1 b�n ��ng h�nh h� <color=yellow>"..TB_SERIES_NAME[nseries+1].."<color>, lo�i h�nh <color=yellow>"..TB_CHARACTOR[ncharactor].."<color>.")
end

--����Ǯ��
function stunt_moneybox(nTongID, nStuntID)
	TB_STUNT_MONEYBOX = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n�ng th�nh th�: "..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.name.."<color>"..
	"<enter>Quy�n ti�p nh�n k� n�ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_MONEYBOX.right].."<color>"..
	"<enter>T�c d�ng c�a k� n�ng ��c bi�t:"..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.describe.."<color>"..
	"<enter>Th�i h�n c�a k� n�ng n�y l� 7 ng�y, trong th�i h�n n�y cho ph�p t�i �a "..TB_STUNT_MONEYBOX.maxmem.." ng��i ti�p nh�n k� n�ng, m�i ng�y m�t ng��i ch� nh�n ���c 1 l�n. H�m nay c�n cho ph�p "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng��i n�a ��n nh�n k� n�ng n�y.", 
	"Ti�p nh�n k� n�ng/stunt_moneybox1",
	"R�i kh�i/OnCancel")
end

function stunt_moneybox1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_RIGHT_DS.right)) then
		return
	end
	
	local ntime = floor(GetCurServerTime()/60) + 2 * 24 * 60
	SetTask(TASKID_MONEYBOX_LASTTIME, ntime)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
	totempole_dec("B�n nh�n ���c 1 <color=yellow>��o Chu Ti�n<color>, c� hi�u qu� trong 2 ng�y!")

end

--��˫ɱ��--------------------------------
function stunt_wushuang(nTongID, nStuntID)
	TB_STUNT_WSSZ = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n�ng th�nh th�: "..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.name.."<color>"..
	"<enter>Quy�n ti�p nh�n k� n�ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WSSZ.right].."<color>"..
	"<enter>T�c d�ng c�a k� n�ng ��c bi�t:"..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.describe.."<color>"..
	"<enter>Th�i h�n k� n�ng n�y l� 7 ng�y.", 
	"Ti�p nh�n k� n�ng/wsh_getwushuangshazhen",
	"Lo�i h�nh V� song s�t tr�n/wsh_typewushuangshazhen",
	"R�i kh�i/OnCancel")
end

--��ȡ ��˫ɱ��
function wsh_getwushuangshazhen()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("H�nh trang c�n <color=yellow>%d<color> � tr�ng.",5))
		return
	end
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_WSSZ.right)) then
		SetTaskTemp(193, 0);
		return
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)

	local nItem = AddItem(6, 1, 1106, 1, 0, 0, 0); --�õ�һ�� ��˫ɱ��
	
	if (nItem > 0) then
		SetSpecItemParam(nItem, 1, 120);
		SyncItem(nItem)
		totempole_dec("Nh�n ���c <color=yellow>Vo song s�t tr�n<color>.")
		Msg2Player("Nh�n th�nh c�ng 1 <color=yellow>V� song s�t tr�n<color>.");
		Msg2Tong(nTongID, GetName().."Nh�n ���c k� n�ng th�nh th� - V� song s�t tr�n")
		TONG_ApplyAddEventRecord(nTongID, GetName().."Nh�n ���c k� n�ng th�nh th� - V� song s�t tr�n")
	end;
	
	SetTaskTemp(193, 0);
end;

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end

TTK_FACE = {1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033};
MAPFILE = [[\settings\item\004\mask.txt]];
function wsh_typewushuangshazhen()
	local nMaskIdx;
	local szMaskName;
	local szContent = "khu�n m�u v� song s�t tr�n c�a qu� bang hi�n t�i l�: <color=yellow>"; 
	local tab_mask = {};
	
	local _, nTongID = GetTongName()
	local nFigure = TONGM_CheckRight(nTongID, GetName(), RIGHTID_STUNT);
	if (nFigure ~= 1) then
		SetTaskTemp(193, 0);
		totempole_dec("<color=yellow>khu�n m�u<color> v� song s�t tr�n ch� c� c�p l�nh ��o bang h�i m�i c� th� thay ��i.");
		return
	end
	
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_mask, szMaskName);
		end;
	end;
	
	if (getn(tab_mask) > 0) then
		szContent = szContent..tab_mask[1];
		for i = 2, getn(tab_mask) do
			szContent = szContent..", "..tab_mask[i];
		end;
		szContent = szContent.."<color>.";
	else
		szContent = "V� song s�t tr�n c�a qu� bang v�n ch�a c� khu�n m�u g�, ";
	end;
	
	Say(szContent.."Ng��i mu�n ti�n h�nh thao t�c g�?", 3, 
		"Ta mu�n th�m v�o khu�n m�u/add_face", 
		"Ta mu�n b� b�t khu�n m�u/removeface", 
		"R�i kh�i/OnCancel");
end;

function add_face()
	local nFaceCount = getfacecount();
	if (nFaceCount >= 10) then
		Say("B�n �� l�a ch�n 10 khu�n m�u, n�u mu�n th�m khu�n m�u m�i c�n ph�i b� b�t 1 khu�n m�u, c� mu�n ti�p t�c kh�ng?", 2, "Ta mu�n th�m v�o khu�n m�u m�i./removeface", "�� ta suy ngh� l�i/no")
		return
	end;
	
	--дһ���������
	GiveItemUI("H�y ��a v�o 1 m�t n�", "�� ��a v�o 1 m�t n�, sau khi V� song s�t tr�n ph�t huy t�c d�ng s� bi�n th�nh h�nh d�ng mong mu�n?", "add_ui_confirm", "no");
end;

function add_ui_confirm(nCount)
	if (nCount ~= 1) then
		Say("S� l��ng v�t ph�m b� v�o kh�ng ��ng.", 0);
		return
	end;
	
	local nItemIdx = GetGiveItemUnit(1);
	nItemGenre, nDetailType, nParticualrType = GetItemProp(nItemIdx);
	
	if (nItemGenre ~= 0 or nDetailType ~= 11) then
		Say("V�t ph�m b� v�o kh�ng ph�i l� m�t n�.", 0);
		return
	end;
	
	if (nParticualrType == 366) then
		Say("<color=yellow>M�t n� ng�y trang<color> kh�ng th� l�m khu�n m�u V� song s�t tr�n.", 0);
		return
	end;
	
	if (itemcheck(nParticualrType) == 0) then
		Say("khu�n m�u m�t n� n�y �� c� r�i.", 0);
		return
	end;
	
	addoneface(nParticualrType); --����һ������
	Msg2Player("B�n �� th�m v�o khu�n m�u V� song s�t tr�n cho bang h�i.");
end;

function itemcheck(nParticualrType)
	_, nTaskID = GetTongName();
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) == nParticualrType) then
			return 0;
		end;
	end;
	return 1;
end;

function removeface()
	local tab_sel = {};
	_, nTongID = GetTongName();
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_sel, "H�y b�"..szMaskName.."T�o khu�n/#deloneface("..i..")");
		end;
	end;
	tinsert(tab_sel, "�� ta suy ngh� k� l�i xem/OnCancel");
	if (getn(tab_sel) <= 0) then
		Say("Ch�a ch�n khu�n m�u V� song s�t tr�n n�o.", 0);
		return
	end;
	Say("Mu�n h�y b� khu�n m�u n�o?", getn(tab_sel), tab_sel);
end;

function getfacecount()
	_, nTaskID = GetTongName();
	local nCount = 0;
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) ~= 0) then
			nCount = nCount + 1;
		end;
	end;
	return nCount;
end;

function addoneface(nValue)
	_, nTaskID = GetTongName();
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) == 0) then
			TONG_ApplySetTaskValue(nTaskID, TTK_FACE[i], nValue);
			return
		end;
	end;
end;

function deloneface(nIdx)
	_, nTaskID = GetTongName();
	if (nIdx < 1 or nIdx > 10) then
		return
	end;
	TONG_ApplySetTaskValue(nTaskID, TTK_FACE[nIdx], 0);
	Msg2Player("H�y b� 1 khu�n m�u V� song s�t tr�n c�a bang h�i.");
end;
-------------------------------------------------------------
--�����-----
REPAREATT = 40; --ÿ�����Ӷ����;ö�
function stunt_duanwuhun(nTongID, nStuntID)
	TB_STUNT_DWH = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n�ng th�nh th�: "..
	"<enter><color=yellow>    "..TB_STUNT_DWH.name.."<color>"..
	"<enter>Quy�n ti�p nh�n k� n�ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_DWH.right].."<color>"..
	"<enter>T�c d�ng c�a k� n�ng ��c bi�t:"..
	"<enter><color=yellow>    "..TB_STUNT_DWH.describe.."<color>"..
	"<enter>Th�i h�n c�a k� n�ng n�y l� 7 ng�y, trong th�i h�n n�y cho ph�p t�i �a "..TB_STUNT_DWH.maxmem.." ng��i ti�p nh�n k� n�ng, m�i ng�y m�t ng��i ch� nh�n ���c 1 l�n. H�m nay c�n cho ph�p "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng��i n�a ��n nh�n k� n�ng n�y.", 
		"��ng v�y, d�ng Luy�n v� h�n �� gia c� v� kh�./dwh_Enhance", 
		"Sau n�y h�y n�i!/OnCancel");
end

function dwh_Enhance()
	TRepair("EnhanceRepair( %d )");
end;

--����ǿ������
function EnhanceRepair(nItemIdx)
	
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "Trang b� n�y kh�ng th� c��ng h�a.")
	end
	local nDur = GetCurDurability(nItemIdx);
	local nRepairDur = nDur + REPAREATT;
	if (nRepairDur > 255) then
		nRepairDur = 255;
	end;
	
	totempole_dec("<#>S�a gia c� trang b� n�y c� th� n�ng cao �� b�n, m�i l�n t�ng th�m <color=yellow>"..REPAREATT.."<color> �i�m, �� b�n cao nh�t l� <color=yellow>"..(255).."<color> �i�m, �� b�n hi�n t�i c�a trang b� l� <color=yellow>"..nDur.."<color>, sau khi gia c� �� b�n s� l� <color=yellow>"..nRepairDur.."<color>, ng��i mu�n s�a ch�a kh�ng?",
		"S�a ch�a/#Enhance_Repair("..nItemIdx..", "..nRepairDur..")", 
		"Kh�ng c�n ��u/cancel")
end

function Enhance_Repair(nItemIdx, nRepairDur)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_DWH.right)) then
		return
	end
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "Trang b� n�y kh�ng th� c��ng h�a.")
	end

	if (nItemIdx > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		
		EH_SetCurDurability(nItemIdx, nRepairDur);
		Msg2Player("Trang b� �� ���c gia c�.");
	end;
end

function stunt_fenghuang(nTongID, nStuntID)
	TB_STUNT_FHY = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n�ng th�nh th�: "..
	"<enter><color=yellow>    "..TB_STUNT_FHY.name.."<color>"..
	"<enter>Quy�n ti�p nh�n k� n�ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_FHY.right].."<color>"..
	"<enter>T�c d�ng c�a k� n�ng ��c bi�t:"..
	"<enter><color=yellow>    "..TB_STUNT_FHY.describe.."<color>"..
	"<enter>Th�i h�n c�a k� n�ng n�y l� 7 ng�y, trong th�i h�n n�y cho ph�p t�i �a "..TB_STUNT_FHY.maxmem.." ng��i ti�p nh�n k� n�ng, m�i ng�y m�t ng��i ch� nh�n ���c 1 l�n. H�m nay c�n cho ph�p "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng��i n�a ��n nh�n k� n�ng n�y.", 
		"��ng v�y, ta mu�n nh�n Ph�ng Ho�ng �n/fhy_getfenghuangyin", 
		"Sau n�y h�y n�i!/OnCancel");
end

function fhy_getfenghuangyin()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("H�nh trang c�n <color=yellow>%d<color> � tr�ng.",5))
		return
	end
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_FHY.right)) then
		SetTaskTemp(193, 0);
		return
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)

	AddItem(6, 1, 1105, 1, 0, 0, 0);
	totempole_dec("B�n nh�n ���c 1 <color=yellow>Ph�ng Ho�ng �n<color>.")
	Msg2Player("Nh�n th�nh c�ng 1<color=yellow>Ph�ng Ho�ng �n<color>.");
	
	SetTaskTemp(193, 0);
end;

function totempole_dec(szMsg, ...)
	if (szMsg == nil) then
		return
	end	
		
	szMsg = LINK_CITY_TOTEMPOLE..szMsg
	if (getn(arg) == 0) then
		Describe(szMsg, 1, "K�t th�c ��i tho�i/OnCancel")
	else
		Describe(szMsg, getn(arg), arg)
	end
end

function stunt_wushenbless(nTongID, nStuntID)
	TB_STUNT_WUSHENBLESS = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n�ng th�nh th�: "..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.name.."<color>"..
	"<enter>Quy�n ti�p nh�n k� n�ng: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WUSHENBLESS.right].."<color>"..
	"<enter>T�c d�ng c�a k� n�ng ��c bi�t:"..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.describe.."<color>"..
	"<enter>Th�i h�n c�a k� n�ng n�y l� 7 ng�y, trong th�i h�n n�y cho ph�p t�i �a "..TB_STUNT_WUSHENBLESS.maxmem.." ng��i ti�p nh�n k� n�ng, m�i ng�y m�t ng��i ch� nh�n ���c 1 l�n. H�m nay c�n cho ph�p "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ng��i n�a ��n nh�n k� n�ng n�y.", 
	"Ti�p nh�n k� n�ng/stunt_wushenbless1",
	"R�i kh�i/OnCancel")
end;

function stunt_wushenbless1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("H�nh trang c�n <color=yellow>%d<color> � tr�ng.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_WUSHENBLESS.right)) then
		return
	end
	local nItemIdx = AddItem(6, 1, 1264, 1, 1, 1);
	if (nItemIdx > 0) then
		local nlasttime = getExpiredTime2DayEnd() * 60;
		local nlastday = 7 - tonumber(GetLocalDate("%w"));
		if (nlastday == 7) then
			nlastday = 0;
		end;
		local ntime = GetCurServerTime() + nlasttime + nlastday * 24 * 60 * 60;
		
		SetSpecItemParam(nItemIdx, 1, ntime);
		SetSpecItemParam(nItemIdx, 2, tonumber(FormatTime2String("%y",ntime)));
		SetSpecItemParam(nItemIdx, 3, tonumber(FormatTime2String("%m",ntime)));
		SetSpecItemParam(nItemIdx, 4, tonumber(FormatTime2String("%d",ntime)));
		SyncItem(nItemIdx);
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("Nh�n ���c <color=yellow>V� Th�n T� Ph�c<color>, sau khi s� d�ng s� nh�n ���c 2 gi� nh�n ��i �i�m c�ng hi�n (ch� v�i ho�t ��ng T�ng Kim, nhi�m v� t�n s�, th� th�ch th�i gian, v� l�m li�n ��u, D� T�u, ��m Huy Ho�ng).")
	else
		Msg2Player("Nh�n V� th�n t� ph�c th�t b�i!")
	end
end;

-------��õ�����24ʱ��ʱ����λ����
function getExpiredTime2DayEnd()
	local nNowHour = tonumber(GetLocalDate("%H"));
	local nNowMin = tonumber(GetLocalDate("%M"));
	
	return (24 - nNowHour - 1) * 60 + (60 - nNowMin);
end;