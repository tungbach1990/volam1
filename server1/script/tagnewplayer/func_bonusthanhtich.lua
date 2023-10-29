Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\tbitemHK.lua");
Include("\\script\\tagnewplayer\\tbitemBK2.lua");
Include("\\script\\tagnewplayer\\tbitemBK5.lua");
Include("\\script\\tagnewplayer\\SkillID.lua");

function GetBonusThanhTich_main()	
	local nValuePoint	= GetExtPoint(NWP_EXTPOINT);
	local nBit = GetBit(nValuePoint, NWP_E5_IsCode_BIT);
	if (nBit ~= 1) then
		Talk(1, "", "Xin h�y ki�m tra l�i �i�u ki�n tham gia.");
		return
	end
	local tbOpp = {}
	local str = "<#> ��i hi�p xin h�y ch�n ph�n th��ng";
	local str2 = "<#> Kh�ng ph�i ��i hi�p �� nh�n h�t r�i sao ?";
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich1) == 1) then
		tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng sau khi �� tr�ng sinh l�n 1/Bonus1");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich2) == 1) then
		tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng c�p 125 sau khi �� tr�ng sinh l�n 1/Bonus2");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich3) == 1 and IsNewAccount() == 1) then
		tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng c�p 130 sau khi �� tr�ng sinh l�n 1/Bonus3");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich4) == 1 and IsNewAccount() == 1) then
		tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng c�p 150 sau khi �� tr�ng sinh l�n 1/Bonus4");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich5) == 1 and IsNewAccount() == 1) then
		tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng �� gia nh�p bang h�i /Bonus5");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich6) == 1 and IsNewAccount() == 1 ) then
		tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng k� n�ng 90 ��t 20 c�p/Bonus6");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich7) == 1 and IsNewAccount() ==1 ) then
		tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng k� n�ng 120 ��t 20 c�p/Bonus7");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich8) == 1 and IsNewAccount() == 1) then
			tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng ��t 500 �i�m danh v�ng/Bonus8");
	end
	tinsert(tbOpp, "<#>Tho�t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str2, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

function Bonus1()	
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "Ph�n th��ng ch� d�nh cho nh�ng ng��i tr�ng sinh l�n 1");
			return
		end
		if (GetFaction() == "") then
			Talk(1, "", "Ng��i ch�a gia nh�p m�n ph�i, kh�ng th� nh�n th��ng !");
			return
		end
		
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "H�nh trang kh�ng �� 60 � tr�ng.");
			return
		end
		ShowHKMP() -- show ra cac mon do HKMP ma player co the nhan duoc
end
function Bonus2()
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "Ph�n th��ng ch� d�nh cho ng��i tr�ng sinh l�n 1");
			return
		end
		if (GetLevel() < 125) then
			Talk(1, "", "C�c h� v�n ch�a ��t �i�u ki�n c�p 125!");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "H�nh trang kh�ng �� 60 � tr�ng.");
			return
		end
		SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich2, 1)
		-- add 5 vo lam mat tich
		for i=1,5 do
				local itemindx = AddItem(6,1,26,1,0,0)
				nExpiredTime = OneDayTime * 7
				ITEM_SetExpiredTime(itemindx, nExpiredTime);
				SetItemBindState(itemindx, -2);
				SyncItem(itemindx)
				local strItem = GetItemName(itemindx)
				Msg2Player("B�n nh�n ���c "..strItem)
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c "..strItem)
		end
		--add 5 tay tuy kinh
		for i=1,5 do
				local itemindx = AddItem(6,1,22,1,0,0)
				nExpiredTime = OneDayTime * 7
				ITEM_SetExpiredTime(itemindx, nExpiredTime);
				SetItemBindState(itemindx, -2);
				SyncItem(itemindx)
				local strItem = GetItemName(itemindx)
				Msg2Player("B�n nh�n ���c "..strItem)
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c "..strItem)
		end
		--add item phung nguyet qua dung
		local itemindx = AddItem(6,1,127,1,0,0)
		nExpiredTime = OneDayTime * 7
		ITEM_SetExpiredTime(itemindx, nExpiredTime);
		SetItemBindState(itemindx, -2);
		SyncItem(itemindx)
		local strItem = GetItemName(itemindx)
		Msg2Player("B�n nh�n ���c "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c "..strItem)
		-- add item C�ng Nguy�t Ph� Dung
		local itemindx = AddItem(6,1,128,1,0,0)
		nExpiredTime = OneDayTime * 7
		ITEM_SetExpiredTime(itemindx, nExpiredTime);
		SetItemBindState(itemindx, -2);
		SyncItem(itemindx)
		local strItem = GetItemName(itemindx)
		Msg2Player("B�n nh�n ���c "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c "..strItem)
end

function Bonus3()
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "Ph�n th��ng ch� d�nh cho ng��i tr�ng sinh l�n 1");
			return
		end
		if (GetLevel() < 130) then
			Talk(1, "", "C�c h� v�n ch�a ��t �i�u ki�n c�p 130!");
			return
		end
		if (GetFaction() == "") then
			Talk(1, "", "Ng��i ch�a gia nh�p m�n ph�i, kh�ng th� nh�n th��ng !");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "H�nh trang kh�ng �� 60 � tr�ng.");
			return
		end
		ShowBK2()-- show cac mon BK player co the nhan duoc
end
function Bonus4()
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "Ph�n th��ng ch� d�nh cho ng��i tr�ng sinh l�n 1");
			return
		end
		if (GetLevel() < 150) then
			Talk(1, "", "C�c h� v�n ch�a ��t �i�u ki�n c�p 150!");
			return
		end
		if (GetFaction() == "") then
			Talk(1, "", "Ng��i ch�a gia nh�p m�n ph�i, kh�ng th� nh�n th��ng !");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "H�nh trang kh�ng �� 60 � tr�ng.");
			return
		end
		ShowBK5()
end
function ShowBK2()
		local strFaction = GetFaction()
		if (tbItemHK[strFaction] == nil) then
			Talk(1, "", "C�c h� v�n ch�a gia nh�p m�n ph�i!");
			return
		end
		local tbOpp = {}
		local str = "<#> Trong ph�n th��ng n�y ta cho ph�p ��i hi�p ch�n 1 trong nh�ng trang b� B�ch Kim, C�c trang b� n�y �� ���c c��ng h�a  +2";
		for i=1, getn(tbItemBK2[strFaction]) do
			local strItemName = tbItemBK2[strFaction][i].szName
			local nID =  tbItemBK2[strFaction][i].nID
			tinsert(tbOpp,"Ta mu�n nh�n".. strItemName.." /#GetBonusBK2(" .. nID .. ")");
		end
		tinsert(tbOpp, "<#>Tho�t/OnCancel")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end;
		Say( str, getn( tbOpp ), tbOpp )
end
function ShowBK5()
		local strFaction = GetFaction()
		if (tbItemHK[strFaction] == nil) then
			Talk(1, "", "C�c h� v�n ch�a gia nh�p m�n ph�i!");
			return
		end
		local tbOpp = {}
		local str = "<#> Trong ph�n th��ng n�y ta cho ph�p ��i hi�p ch�n 1 trong nh�ng trang b� B�ch Kim, C�c trang b� n�y �� ���c c��ng h�a  +5";
		for i=1, getn(tbItemBK5[strFaction]) do
			local strItemName = tbItemBK5[strFaction][i].szName
			local nID =  tbItemBK5[strFaction][i].nID
			tinsert(tbOpp,"Ta mu�n nh�n".. strItemName.." /#GetBonusBK5(" .. nID .. ")");
		end
		tinsert(tbOpp, "<#>Tho�t/OnCancel")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end;
		Say( str, getn( tbOpp ), tbOpp )
end
function GetBonusBK5(nID)
		SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich4, 1)
		--nhan trang bi BK
		local nItemIdx = AddPlatinaItem(0,nID);
		for i = 1,5 do
			UpgradePlatinaItem(nItemIdx)
		end
		SetItemBindState(nItemIdx, -2);
		SyncItem(nItemIdx)
		local strItemName = GetItemName(nItemIdx)
		Msg2Player("B�n nh�n ���c "..strItemName)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch BK5 nh�n ���c "..strItemName)
end

function GetBonusBK2(nID)
		SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich3, 1)
		--nhan trang bi BK
		local nItemIdx = AddPlatinaItem(0,nID);
		for i = 1,2 do
			UpgradePlatinaItem(nItemIdx)
		end
		SetItemBindState(nItemIdx, -2);
		SyncItem(nItemIdx)
		local strItemName = GetItemName(nItemIdx)
		Msg2Player("B�n nh�n ���c "..strItemName)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch BK2 nh�n ���c "..strItemName)
end
function ShowHKMP()
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "C�c h� v�n ch�a gia nh�p m�n ph�i!");
		return
	end
	local tbOpp = {}
	local str = "<#> Trong ph�n th��ng n�y ta cho ph�p ��i hi�p ch�n 1 trong nh�ng trang b� Ho�ng Kim M�n Ph�i v� nh�ng ph�n th��ng c� gi� tr� kh�c";
	for i=1, getn(tbItemHK[strFaction]) do
		local strItemName = tbItemHK[strFaction][i].szName
		local nID =  tbItemHK[strFaction][i].nID
		tinsert(tbOpp,"Ta mu�n nh�n".. strItemName.." /#GetBonusHK(" .. nID .. ")");
	end
	tinsert(tbOpp, "<#>Tho�t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

function GetBonusHK(nID)
	SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich1, 1)
	--nhan trang bi HK
	nIndex = AddGoldItem(0, nID)
	SetItemBindState(nIndex, -2);
	SyncItem(nIndex)
	local strItemName = GetItemName(nIndex)
	Msg2Player("B�n nh�n ���c "..strItemName)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch HKMP nh�n ���c "..strItemName)
	--thang cap 90 sau khi �a trung sinh
	if (GetLevel() < 90) then
		LevelUp(90)
		Msg2Player("B�n nh�n ���c th�ng c�p 90 sau tr�ng sinh l�n 1")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c th�ng c�p 90 sau tr�ng sinh l�n 1")
	end
	
	-- add 5 vo lam mat tich
	for i=1,5 do
			local itemindx = AddItem(6,1,26,1,0,0)
			nExpiredTime = OneDayTime * 7
			ITEM_SetExpiredTime(itemindx, nExpiredTime);
			SetItemBindState(itemindx, -2);
			SyncItem(itemindx)
			local strItemName = GetItemName(itemindx)
			Msg2Player("B�n nh�n ���c "..strItemName)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c "..strItemName)
	end
	--add 5 tay tuy kinh
	for i=1,5 do
			local itemindx = AddItem(6,1,22,1,0,0)
			nExpiredTime = OneDayTime * 7
			ITEM_SetExpiredTime(itemindx, nExpiredTime);
			SetItemBindState(itemindx, -2);
			SyncItem(itemindx)
			local strItemName = GetItemName(itemindx)
			Msg2Player("B�n nh�n ���c "..strItemName)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c "..strItemName)
	end
	--Add mat na quy anh
	local itemindx = AddItem(0,11,455,1,0,0)
	nExpiredTime = OneDayTime * 7
	ITEM_SetExpiredTime(itemindx, nExpiredTime);
	SetItemBindState(itemindx, -2);
	SyncItem(itemindx)
	local strItemName = GetItemName(itemindx)
	Msg2Player("B�n nh�n ���c "..strItemName)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c "..strItemName)
	-- add ngua bon tieu cap 10
	local numindx = AddItem(0,10,6,10,0,0)
	SetItemBindState(numindx, -2);
	SyncItem(numindx)
	local strItemName = GetItemName(numindx)
	Msg2Player("B�n nh�n ���c "..strItemName)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c "..strItemName)
end

function Bonus5()
		local szTongName , nTongID = GetTongName()
		if (nTongID < 1) then
			Talk(1, "", "Ng��i ch�a gia nh�p bang h�i !");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "H�nh trang kh�ng �� 60 � tr�ng.");
			return
		end
		SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich5, 1)
		--ADD hoi thanh phu nho
			local ndx = AddItem(6,1,1082,1,0,0)
			nExpiredTime = OneDayTime * 14
			ITEM_SetExpiredTime(ndx, nExpiredTime);
			SetItemBindState(ndx, -2)
			SyncItem(ndx);
			local strItem = GetItemName(ndx)
			Msg2Player("B�n nh�n ���c "..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c "..strItem)
end

function Bonus8()
		if (GetRepute() < 500) then
			Talk(1, "", "Ng��i ch�a ��t 500 �i�m danh v�ng");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "H�nh trang kh�ng �� 60 � tr�ng.");
			return
		end
		SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich8, 1)
		--ADD B�ch Ch�n ��n
			local ndx = AddItem(6,1,1676,1,0,0)
			SetSpecItemParam(ndx, 1, 500000000)
			nExpiredTime = OneDayTime * 14
			ITEM_SetExpiredTime(ndx, nExpiredTime);
			SetItemBindState(ndx, -2)
			SyncItem(ndx);
			local strItem = GetItemName(ndx)
			Msg2Player("B�n nh�n ���c "..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c "..strItem)

end

function Bonus6()
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "C�c h� v�n ch�a gia nh�p m�n ph�i!");
		return
	end
	if (CheckIsSkill90() ~= 1) then
		Talk(1, "", "��i hi�p h�y luy�n m�t Skill 90 l�n 20 c�p r�i h�y ��n nh�n th��ng !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "H�nh trang kh�ng �� 60 � tr�ng.");
		return
	end
	SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich6, 1)
	-- add item nhat ky cang khon phu
			local ndx = AddItem(6,1,2126,1,0,0)
			nExpiredTime = OneDayTime * 14
			ITEM_SetExpiredTime(ndx, nExpiredTime);
			SetItemBindState(ndx, -2)
			SyncItem(ndx);
			local strItem = GetItemName(ndx)
			Msg2Player("B�n nh�n ���c "..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c "..strItem)
end


function Bonus7()
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "C�c h� v�n ch�a gia nh�p m�n ph�i!");
		return
	end
	if (CheckIsSkill120() ~= 1) then
		Talk(1, "", "��i hi�p h�y luy�n m�t Skill 120 l�n 20 c�p r�i h�y ��n nh�n th��ng !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "H�nh trang kh�ng �� 60 � tr�ng.");
		return
	end
	SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich7, 1)
	--M� r��ng chua do thu 1
	OpenStoreBox(1)
	Msg2Player("B�n nh�n ���c m� r��ng ch�a �� th� nh�t")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."Ph�n th��ng th�nh t�ch nh�n ���c m� r��ng ch�a �� th� nh�t")
end

function CheckIsSkill90()
	local strFaction = GetFaction()
	for i=1, getn(tbSkill90[strFaction]) do
		local nID =  tbSkill90[strFaction][i].nID
		if (GetCurrentMagicLevel(nID, 0) >= 20) then
			return 1
		end
	end
	return 0
end
function CheckIsSkill120()
	local strFaction = GetFaction()
	for i=1, getn(tbSkill120[strFaction]) do
		local nID =  tbSkill120[strFaction][i].nID
		if (GetCurrentMagicLevel(nID, 0) >= 20) then
			return 1
		end
	end
	return 0
end

function OnCancel()
end