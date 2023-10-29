Include("\\script\\tong\\tong_header.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
IncludeLib("LEAGUE")
IncludeLib("TONG")
tbZhongQiu200909 = {}
tbZhongQiu200909.tbNpcPos = {}
local tbLadderId = 
{
	10263,10264,10265
}

local tbTongTSK_Exploit = 
{
	TONGTSK_Gongde_meici,
	TONGTSK_Gongde_meizhou,
	TONGTSK_Gongde_Total,
}

local tbTongTSK_ExploitFlag = 
{
	TONGTSK_Gongde_meici_flag,
	TONGTSK_Gongde_meizhou_flag
}

-- ��ð�Ṧ��ֵ
function tbZhongQiu200909:GetTongExploit(nId)
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		error("Have not a Tong")
	end
	return TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[nId]);
end

-- ��Ṧ��+nCount
function tbZhongQiu200909:AddExploit(nCount)
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		error("Have not a Tong")
	end

	local nOldCount1 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[1]);
	local nOldCount2 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[2]);
	local nOldCount3 = TONG_GetTaskValue(nTongID, %tbTongTSK_Exploit[3]);	

	Ladder_NewLadder(%tbLadderId[1], szTongName, nOldCount1+ nCount, 0)
	Ladder_NewLadder(%tbLadderId[2], szTongName, nOldCount2+ nCount, 0)
	Ladder_NewLadder(%tbLadderId[3], szTongName, nOldCount3+ nCount, 0)
	
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[1], nCount);
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[2], nCount);
	TONG_ApplyAddTaskValue(nTongID, %tbTongTSK_Exploit[3], nCount);
	Msg2Tong(nTongID, format("Bang h�i %s t�ng %d, hi�n t�i bang h�i %s %d", "�i�m trang tr�", nCount, "�i�m trang tr�", nOldCount1+ nCount))
	
	
	
	--local szParam = format("%u,%s,%d", nTongID, szTongName, nCount)
	--LG_ApplyDoScript(1, "", "", "\\script\\event\\zhongqiu_jieri\\head.lua", "tbZhongQiu200909_AddExploit", szParam , "", "")
end

-- ��Ṧ��ֵ���� ,��������
function tbZhongQiu200909:UpdateExploit(nTongID, nId)
	local nFlag = self:GetCurFlag(nId);
	
	if (TONG_GetTaskValue(nTongID, %tbTongTSK_ExploitFlag[nId]) ~= nFlag) then
		return 1
	end
end

function tbZhongQiu200909:IsTimeAct()
	
	local nTime = tonumber(GetLocalDate("%H%M"))
	local nWeek	= tonumber(GetLocalDate("%w"))	
	local nWeek	= tonumber(GetLocalDate("%w"))
	if ( nWeek == 5 or nWeek == 6 or nWeek == 0) then
		
		if (1930 <= nTime and nTime < 2000) then
			return 1	
		end
	end
	Talk(1,"", format("Hi�n t�i kh�ng th� n�p %s nh�n %s.", "nh�nh c�y", "�i�m trang tr�"))
end

-- ���Ŀǰ��־ֵ
function tbZhongQiu200909:GetCurFlag(nId)
	if (nId == 2) then
		return tonumber(GetLocalDate("%W%Y"));
	end
		
	if (nId == 1) then
		ndate = GetLocalDate("%y%m%d");
		return tonumber(ndate);

	end
end


function tbZhongQiu200909:GetAwardDailog()
	local tbOpt = {}
	local nWeek = tonumber(GetLocalDate("%w"))
	local nTimeHM = tonumber(GetLocalDate("%H%M"))
	if (2000 <= nTimeHM and nTimeHM <  2400 and ( nWeek == 5 or nWeek == 6 or nWeek == 0)) then
		tinsert(tbOpt, {"Nh�n ph�n th��ng m�i ��t", self.GetAward1, {self}})
	end
	
	if nWeek == 0 and (2000 <= nTimeHM and nTimeHM <  2400) then
		tinsert(tbOpt, {"Nh�n ph�n th��ng tu�n", self.GetAward2, {self}})
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate == 20100124 and (2000 <= nTimeHM and nTimeHM <  2400) then
		tinsert(tbOpt, {"Nh�n ph�n th��ng chung cu�c", self.GetAward3, {self}})
	end
	if getn(tbOpt) == 0 then
		Talk(1, "", "Hi�n t�i kh�ng ph�i l� th�i gian nh�n th��ng")
		return 
	end
	tinsert(tbOpt, {"K�t th�c ��i tho�i"})
	
	CreateNewSayEx("��i hi�p c�n nh�n lo�i ph�n th��ng n�o?", tbOpt)
end

function tbZhongQiu200909:TongInfo()
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local szMsg = format("Th�nh t�ch m�i ��t: %d<enter>Th�nh t�ch tu�n: %d<enter> Th�nh t�ch chung %d",tbZhongQiu200909:GetTongExploit(1),tbZhongQiu200909:GetTongExploit(2),tbZhongQiu200909:GetTongExploit(3))
	Say(szMsg, 0)
end

function tbZhongQiu200909:GetRank(nId)
	local szTongName, nTongID = GetTongName();
	for i = 1, 5 do
		local szName, nValue = Ladder_GetLadderInfo(%tbLadderId[nId], i);
		if (szName ~= nil and nValue ~= "" and szName == szTongName) then
			return i
		end
	end
	return nil
end



function tbZhongQiu200909:GetAward1()
	
	
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local nId = 1
	local nRank = self:GetRank(nId)
	
	if not PlayerFunLib:CheckTask(2646, 22000, "Ng��i ch�i ch� nh�n ���c 22000000000 t� 3 lo�i ho�t ��ng ��t, tu�n, chung cu�c", "<") then
	
		return
	end	
	
	local nFlag = self:GetCurFlag(nId)
	local nGongdeCount = self:GetTongExploit(nId);
	

	if not PlayerFunLib:CheckTask(2648, nFlag, "��i hi�p �� nh�n ph�n th��ng n�y r�i.", "~=") then
		return
	end	
	
	
	local nJoinTongTime = GetJoinTongTime()
	
	if nJoinTongTime < 12*60 then
		Talk(1, "", format("C�n ph�i v�o bang %d gi� m�i c� th� nh�n ���c ph�n th��ng n�y.", 12))
		return 
	end
	local tbAward = 
	{
		{nExp = 6e7},
		{nExp = 4e7},
		{nExp = 3e7},
		{nExp = 2e7},
		{nExp = 1e7},
	}
	if nRank and nGongdeCount > 0 then
		tbAwardTemplet:GiveAwardByList(tbAward[nRank], "meici gong de paiming "..nRank, 1)
		PlayerFunLib:AddTask(2646, floor(tbAward[nRank].nExp/1e6))
		PlayerFunLib:SetActivityTask(2648, nFlag)
	elseif not nRank and nId == 1 and nGongdeCount >= 2 then
		PlayerFunLib:AddExp(5e6, bFlag, "meici gong de paiming not rank")
		PlayerFunLib:AddTask(2646, 5)
			
		PlayerFunLib:SetActivityTask(2648, nFlag)
	else
		Talk(1, "", " kh�ng ph� h�p v�i �i�u ki�n nh�n th��ng l�n n�y.")
		return
	end	
end


function tbZhongQiu200909:GetAward2()
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local nId = 2
	local nRank = self:GetRank(nId)
	
	if not PlayerFunLib:CheckTask(2646, 22000, "Ng��i ch�i ch� nh�n ���c 22000000000 t� 3 lo�i ho�t ��ng ��t, tu�n, chung cu�c", "<") then
		return
	end	

	if not PlayerFunLib:CheckTask(2649, tonumber(GetLocalDate("%W%Y")), "��i hi�p �� nh�n ph�n th��ng n�y r�i.", "~=") then
		return
	end	
	local nJoinTongTime = GetJoinTongTime()
	
	if nJoinTongTime < 48*60 then
		Talk(1, "", format("C�n ph�i v�o bang %d gi� m�i c� th� nh�n ���c ph�n th��ng n�y.", 48))
		return 
	end
	local tbAward = 
	{
		{nExp = 15e7},
		{nExp = 1e8},
		{nExp = 8e7},
		{nExp = 6e7},
		{nExp = 4e7},
	}
	if nRank then
		tbAwardTemplet:GiveAwardByList(tbAward[nRank], "meizhou gong de paiming "..nRank, 1)
		PlayerFunLib:AddTask(2646, floor(tbAward[nRank].nExp/1e6))
		PlayerFunLib:SetActivityTask(2649, tonumber(GetLocalDate("%W%Y")))
	else
		Talk(1, "", " kh�ng ph� h�p v�i �i�u ki�n nh�n th��ng l�n n�y.")
		return
	end	
end


function tbZhongQiu200909:GetAward3()
	local szTongName, nTongID = GetTongName();
	if szTongName == nil or szTongName == "" then
		return
	end
	local nId = 3
	local nRank = self:GetRank(nId)
	
	if not PlayerFunLib:CheckTask(2646, 22000, "Ng��i ch�i ch� nh�n ���c 22000000000 t� 3 lo�i ho�t ��ng ��t, tu�n, chung cu�c", "<") then
		return
	end	

	if not PlayerFunLib:CheckTask(2650, 0, "��i hi�p �� nh�n ph�n th��ng n�y r�i.", "==") then
		return
	end	
	local nJoinTongTime = GetJoinTongTime()
	
	if nJoinTongTime < 24*60*7 then
		Talk(1, "", format("C�n ph�i v�o bang %d gi� m�i c� th� nh�n ���c ph�n th��ng n�y.", 24*7))
		return 
	end
	local tbAward = 
	{
		{nExp = 2e8},
		{nExp = 15e7},
		{nExp = 10e7},
		{nExp = 8e7},
		{nExp = 6e7},
	}
	if nRank then
		tbAwardTemplet:GiveAwardByList(tbAward[nRank], "tatol gong de paiming "..nRank, 1)
		PlayerFunLib:AddTask(2646, floor(tbAward[nRank].nExp/1e6))
		PlayerFunLib:SetActivityTask(2650, 1)
	else
		Talk(1, "", " kh�ng ph� h�p v�i �i�u ki�n nh�n th��ng l�n n�y.")
		return
	end	
end



function tbZhongQiu200909:FlyToTree()
	local tbPos = 
	{
		{121,226,275, "Long M�n tr�n"},
		{100,183,203, "Chu Ti�n tr�n"},
		{101,171,198, "��o H��ng th�n"},
		{174,218,192, "Long Tuy�n th�n"},
		{53, 220,200, "Ba L�ng huy�n"},
		{20, 432,359, "Giang T�n Th�n"},
		{153,232,180, "Th�ch C� tr�n"},
		{99, 189,223, "V�nh L�c tr�n"},
	}
	local tbOpt = {}
	for i=1, getn(tbPos) do 
		local tb = tbPos[i]
		tinsert(tbOpt, format("%s(%d,%d)/#tbZhongQiu200909:Fly(%d,%d,%d)", tb[4],tb[2],tb[3], tb[1],tb[2] * 8 ,tb[3] * 16))
		
	end
	tinsert(tbOpt, "H�y b� /OnCancel")
	Say("Xa phu: ��i hi�p mu�n �i n�i ��u?", getn(tbOpt), tbOpt)
end
function tbZhongQiu200909:Fly(n,x,y)
	NewWorld(n,x,y)
	SetFightState(1)
end


function OnCancel()
	
	
end