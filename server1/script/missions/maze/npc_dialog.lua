-- �Խ��Ȼ���ʹ
Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\global\\station.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\missions\\maze\\head.lua")
Include("\\script\\missions\\maze\\addstatdata.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

LEVEL_MIN = 120

LIMITS = {
	MIN_TEAMSIZE = 6,
	FLAG_CHECKTIME = 1,
}

-- ����
NpcChefu = {
	m_Caption = "Mu�n ng�i xe �i ��u? ",
	m_Options = {
		"Ta mu�n �i Ph��ng T��ng",
		"Ta mu�n �i Th�nh ��",
		"Ta mu�n �i ��i L�",
		"Ta mu�n �i Bi�n Kinh",
		"Ta mu�n �i T��ng D��ng.",
		"Ta mu�n �i D��ng Ch�u.",
		"Ta mu�n �i L�m An",
		"Kh�ng �i ��u c�"
	}
}
function NpcChefu:Say(player)
	return self.m_Caption, self.m_Options
end

function NpcChefu:OnAnswer(player, sel)
	if (sel > 0 and sel < 8) then
		local mapid, x, y = GetStationPos(sel)
		if (mapid ~= nil and NewWorld(mapid, x, y) == 1) then
			player:Msg2Player("Ng�i y�n ch�a? Ch�ng ta �i ")
		end
	end
end

-- �ܾ�
NpcZhoujun = {
	m_Caption = "Cung ngh�nh ��i hi�p, l�o phu ta l� Thi�n Xu H� Ki�m S� c�a Ng�c Long S�n Trang .",
	m_Options = {
		"L� ta ��n ��y �� ho�n th�nh nhi�m v� v�a Ng�c Long Anh h�ng Thi�p",
		"Ta ��n �� nh�n Ng�c Long Danh Ki�m Ph� c�a Kh�ng B�ch",
		"Ta ��n �� nh�n ph�n th��ng thu th�p Ng�c Long Danh Ki�m c�a th�ng n�y",
		"Ta ch� ��n ch�i",
	}
}

function NpcZhoujun:Say(player)
	do
		player:Say("T�nh n�ng n�y t�m th�i ��ng.")
		return
	end
	return self.m_Caption, self.m_Options
end

function NpcZhoujun:OnAnswer(player, nIndex)
	if (nIndex == 1) then
		local nTask = player:GetTask(TASK_MAZEINVITATION)
		if (nTask == 0) then
			player:Say("Xin l��ng th�, ng��i ch�a nh�n ���c nhi�m v� n�y.")
		elseif (nTask == 1) then
			if (player:CalcFreeItemCellCount() == 0) then
				player:Say("Xin h�y s�p x�p l�i h�nh trang sau n�y h�y ��n g�p ta.")
				return
			end
			player:Describe(
				format("%s ��i hi�p, l�o phu ta �� nghe danh ng�i t� l�u, h�m nay ���c t��ng ng�, qu� l� nh�n trung long ph��ng. L�n n�y Ng�c Long S�n Trang m�i ng�i ��n ��y l� c� vi�c mu�n th��ng l��ng, l�o phu s� k� ��u �u�i c�u chuy�n. <enter> S�n Trang c�a ta tr��c ��y c� nghe ��c th�m b�o l�i, Kim Qu�c �ang �m th�m chu�n b� m�t �m m�u to l�n, h� d� t�nh m�t �m m�u ph�t ��ng m�t cu�c ��i chi�n kinh thi�n ��i v�i v��ng tri�u c�a ta . �� ch�ng l�i �m m�u c�a h�, Ng�c Long S�n Trang �� quy�t ��nh tuy�n ch�n v� hu�n luy�n m�t s� cao th� tuy�t ��nh v� l�m tr� d�ng song to�n, th�m nh�p v�o n�i cung c�a k� ��ch �m s�t th� l�nh c�a h�. Trang ch� c�u ch�ng t�i m�t ��i c�a ng�i r�t th�ch thu th�p danh ki�m, �� �� ph�ng ��c C� C�u B�i n�n �� c�t gi� danh ki�m � trong �Ki�m Gia�. H�n n�a ��  tuy�n ch�n no�ng v� s� tinh anh . <enter> h�m nay l� �� m�u c�u ��i s�, B�n Trang ch�ng t�i nguy�n l�ng m� c�a Ki�m Gia �� cho nh�ng anh h�ng v� l�m kh�p n�i h�i t� c�ng chung ch� h��ng r�n luy�n v� c�ng v� n��c b�o �n, ��ng th�i c�ng c�ng hi�n t�t c� nh�ng th�n binh l�i kh� c�a B�n Trang, nh�ng b�u v�t �� s� d�ng t�ng cho nh�ng anh h�ng ki�t xu�t , nh�ng �� t�m ra m�t cao th� ch�n ch�nh th� th�t l� v� ��i. ��i hi�p l�n n�y ��n ��y, B�n Trang ta qu� l�y l�m vinh h�nh v� c�ng. ��y l� t�n v�t c�a B�n Trang<color=red> �Ng�c Long L�nh B�i� <color>, c� t�n v�t n�y tr�n tay, ��i hi�p c� th� �i v�o Ki�m Gia b�t c� l�c n�o. Mong r�ng ��i hi�p c� th� qua vi�c hu�n luy�n t�i ��y, nh�n ���c nh�ng trang b� c�c ph�m, s�m mu�n g� c�ng c� ng�y��n �n b�o qu�c.", player:GetName()),
				1,
				"Bi�t r�i/Cancel")
			if (player:AddItem(6, 1, 2623, 1, 0, 0) > 0) then
				player:SetTask(TASK_MAZEINVITATION, 2)
			end
		elseif (nTask == 2) then
			player:Say("Ng��i �� ho�n th�nh nhi�m v� n�y r�i, kh�ng c�n ph�i l�m l�i ��u")		
		end
	elseif (nIndex ~= 4) then
		player:Say("T�nh n�ng n�y t�m th�i ch�a m�.")
	end
end

-- ��ҩʦ
NpcLiuyaoshi = {}
function NpcLiuyaoshi:Say(player)
	player:Sale(99, 1)
end

-- С����
NpcXiaozhuzhu = {
	m_Caption = "Ch�o ��i hi�p, ta l� m�t ng��i con g�i nghi�ng n��c nghi�ng th�nh, tuy�t nh��ng m�u da Ng�c Long S�n Trang �� nh�t m� nh�n Ti�u Ch�u Ch�u, xin h�i ��i hi�p ki�m ta c� chuy�n g� xin ch� gi�o?",
	m_Options = {
		"Gi�i thi�u v� Ph� B�n Ki�m Gia",
		"B�o danh v�o Ki�m Gia",
		--"Ki�m tra s� l�n h�m nay ta c� th� �i v�o Ki�m Gia",
		"Ta ch� gh� th�m",
	}
}
NpcXiaozhuzhu.tbTSK_JoinTotal = 3075
function NpcXiaozhuzhu:Say(player)
	return self.m_Caption, self.m_Options
end

function NpcXiaozhuzhu:CheckTime()
	if (LIMITS.FLAG_CHECKTIME == 0) then
		return 1
	end
	local _, _, _, _, m = MakeDateTime(5, GetCurServerTime())
	if (m > 30) then
		return 0
	else
		return 1
	end
end

function NpcXiaozhuzhu:CheckTeam(player)
	local count = player:GetTeamSize()
	if (count < LIMITS.MIN_TEAMSIZE) then
		player:Say("T� 6-8 ng��i c�p 120 tr� l�n c�ng nhau t� ��i m�i ���c �i v�o.")
		return 0
	elseif (self:CheckTime() == 0) then
		player:Say("Ch� c� th� b�o danh sau ��u m�i gi� v� tr��c 30 ph�t.")
		return 0
	end
	local mapid, _, _ = player:GetWorldPos()
	for i = 1, count do
		local index = player:GetTeamMember(i)
		local mate = PlayerList:GetPlayer(index)
		if (not mate) then
			return 0
		elseif (mate:GetLevel() < LEVEL_MIN) then
			player:Say(format("Th�nh vi�n t� ��i<color=red>%s<color> ��ng c�p ch�a ��.", mate:GetName()))
			return 0
		elseif(self:VnCheckNLPass(mate) == 0) then	--Ki�m tra ngoc long l�nh b�i
			player:Say(format("Xin th� l�i,<color=red>%s<color> kh�ng c� Ng�c Long L�nh B�i. Kh�ng �� �i�u ki�n �i v�o Ki�m Gia ti�n h�nh th� luy�n.", mate:GetName()))
			return 0
		elseif (self:VnGetJoinTotal(mate) == 0) then --Ki�m tra s� l�n �i
			player:Say(format("<color=red>%s<color> H�m nay h�t s� l�n �i v�o th� luy�n � Ki�m Gia r�i.", mate:GetName()))
			return 0	
--		elseif (MazePermission:CheckPermission(mate) == 0) then
--			player:Say(format("Xin th� l�i,<color=red>%s<color> kh�ng �� �i�u ki�n �i v�o Ki�m Gia ti�n h�nh th� luy�n.", mate:GetName()))
--			return 0
--		elseif (MazePermission:QueryLeftCount(mate) == 0) then
--			player:Say(format("<color=red>%s<color>H�m nay h�t s� l�n �i v�o th� luy�n � Ki�m Gia r�i.", mate:GetName()))
--			return 0
		else
			local m, _, _ = mate:GetWorldPos()
			if (m ~= mapid) then
				player:Say("Y�u c�u t�t c� ��i vi�n ��u � g�n ��y th� m�i c� th� ti�n h�nh b�o danh tham gia.")
				return 0
			end
		end
	end
	return 1
end

function NpcXiaozhuzhu:Enter(player, maze)
	AddStatDataTeamEnterMazeCount(1)
	local count = player:GetTeamSize()
	local members = {}
	for i = 1, count do
		local index = player:GetTeamMember(i)
		local mate = PlayerList:GetPlayer(index)
		tinsert(members, mate)
	end
	for i = 1, getn(members) do
		local mate = members[i]
		self:VnSetJoinTotal(mate) --Th�m l�n �i Ki�m Gia
		self:VnConsumeNLPass(mate) -- Thu L�nh B�i
		maze:Join(mate)
		if (not maze:Enter(mate)) then
			maze:Log(format("[MAZE ERROR]player(%s) failed to enter maze(%d)", mate:GetName(), maze.m_Id))
			player:Msg2Player(format("Th�t s� xin l�i, th�nh vi�n ��i ng� [%s] t�m th�i kh�ng th� �I v�o Ki�m Gia.", mate:GetName()))
		else
			mate:Msg2Player("Ng��i v� ��i ng� c�a ng��i �� �i v�o Ki�m Gia, b�t ��u hu�n luy�n.")
			AddStatDataPlayerEnterMazeCount(1)
			MazePermission:ReduceLeftCount(mate)
		end
	end
end

function NpcXiaozhuzhu:OnAnswer(player, sel)
	if (sel == 1) then
		player:Describe(
			"T� ��i t� 6-8 ng��i c�p 120 tr� l�n, v�o ��u m�i gi� v� tr��c 30 ph�t c� th� ��n ch� c�a ta �� b�o danh, sau khi b�o danh ti�n v�o ph� b�n. Sau khi ti�n v�o ph� b�n ng��i s� ���c chuy�n ��n m�t c�n ph�ng trong Ki�m Gia, ch� c�n ho�n th�nh s� ki�n c�a c�n ph�ng n�y, ng��i v� t� ��i c�a ng��i s� ti�p t�c tham gia v�o m�t c�n ph�ng ti�p theo, nh�ng cao th� c� th� th�nh c�ng �i v�o c�n ph�ng cu�i c�ng th� c� th� g�p ���c trang ch� c�a Ng�c Long S�n Trang v� nh�n ���c t� c�ch th� luy�n cu�i c�ng. N�u nh� trong l�c chi�n ��u � trong c�n ph�ng ph�t sinh s� ki�n c�a Ki�m Gia m� b� tr�ng th��ng, ng��I c� th� ��n V�n Hoa Tr� �� tr� th��ng, sau khi tr� th��ng th�nh c�ng s� ���c quay tr� l�i trong c�n ph�ng �� tong ���c v��t qua tr��c ��, ���ng nhi�n ng��i c�ng c� th� s� d�ng Ph�c S�nh Ph� c� � tr�n K� Tr�n C�c �� quay tr� l�i c�n ph�ng m� t� ��i ng��i �ang chi�n ��u �� ti�p t�c t�c chi�n. M�i ng��i m�i l�n tham gia ph� b�n s� c� 3 l�n c� h�i �i v�o v�o V�n Hoa Tr� �� tr� th��ng. M�i l�n tham gia ph� b�n nhi�u nh�t l� 30 ph�t. Ch�c ng��i may m�n",
			1,
			"Bi�t r�i/Cancel")
	elseif (sel == 2) then	
		if (player:IsCaptain() == 0) then
			player:Say("Ch� c� ��i tr��ng m�i c� th� d�n d�t ��i ng� �i v�o Ki�m Gia")
			return
		elseif (self:CheckTeam(player) == 0) then
			return
		elseif (MazeList:CheckCount() == 0) then
			player:Say("S� l��ng m� m� cung �� ��n gi�i h�n, xin h�y th� l�i sau.")
			return
		end
		local maze = Maze:New()
		if (not maze) then
			player:Say("Ng��i tham gia m� cung �� ��y, xin h�y th� l�i sau.")
			return
		end
		maze:SetCaptainName(player:GetName())
		self:Enter(player, maze)
	elseif (sel == 3) then
		local count = MazePermission:QueryLeftCount(player)
		if (count <= 0) then
			player:Say("H�m nay ng��i kh�ng th� �i v�o Ki�m Gia ti�n h�nh th� luy�n n�a.")
		else
			player:Say(format("H�m nay t�ch l�y s� l�n �i v�o Ki�m Gia l�<color=red>%d<color> l�n.", count))
		end
	end
end
function NpcXiaozhuzhu:VnCheckNLPass(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	if CalcItemCount(3, 6, 1, 2623, -1) < 1 then
		PlayerIndex = nOldPlayer
		return 0
	end
	PlayerIndex = nOldPlayer	
	return 1
end
function NpcXiaozhuzhu:VnConsumeNLPass(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	ConsumeItem(3, 1, 6, 1, 2623, -1)
	PlayerIndex = nOldPlayer
end
function NpcXiaozhuzhu:VnGetJoinTotal(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	print("PlayerFunLib:GetTaskDaily(self.tbTSK_JoinTotal)",PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal))
	if PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal) >= 3 then
		PlayerIndex = nOldPlayer
		return 0
	end
	PlayerIndex = nOldPlayer
	return 1
end
function NpcXiaozhuzhu:VnSetJoinTotal(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	PlayerFunLib:AddTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal, 1);
	print("PlayerFunLib:GetTaskDaily(self.tbTSK_JoinTotal)",PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal))
	PlayerIndex = nOldPlayer
end
function LoadNpc()
	DlgNpcManager:AddNpc("Chu Qu�n", 1614, 949, 49344, 102720, NpcZhoujun)
	DlgNpcManager:AddNpc("���ng V�", 1615, 949, 49408, 101408)
	DlgNpcManager:AddNpc("V��ng Binh", 1616, 949, 49152, 101856)
	DlgNpcManager:AddNpc("Vu Khi�t", 1617, 949, 49536, 100576)
	DlgNpcManager:AddNpc("Tr��ng Chi�u", 1618, 949, 49760, 100576)
	DlgNpcManager:AddNpc("��ng Ch�", 1619, 949, 49760, 103488)
	DlgNpcManager:AddNpc("Ti�u Chu Chu.", 1620, 949, 50880, 100736, NpcXiaozhuzhu)
	DlgNpcManager:AddNpc("Li�u D��c S�", 1621, 949, 50496, 100608, NpcLiuyaoshi)
	DlgNpcManager:AddNpc("Xa phu", 238, 949, 51264, 101984, NpcChefu)
end

AutoFunctions:Add(LoadNpc)
