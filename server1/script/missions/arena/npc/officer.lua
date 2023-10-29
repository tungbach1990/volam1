Include("\\script\\missions\\arena\\player.lua")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\maps\\checkmap.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("TITLE")

local tbTitle2Id = 
{
	["��c C� C�u B�i"] = 237,
	["V� L�m Ch� T�n"] = 238,
	["Nh�t ��i T�ng s� "] = 239,
	["Tuy�t Th� Cao Th�"] = 240,
	["Vang Danh Giang H�"] = 241,
	["Hi�p Danh Vi�n B�"] = 242,
	["V� L�m T�n T�"] = 243,
	["M�i nh�p giang h� "] = 244,
	["Nh�p M�n �� T�"] = 245,
}

function want_get_title()
	local szTitle = "Nh�ng ��i hi�p m�i tu�n tham gia ��y �� 20 tr�n C�nh K� Tr��ng c� th� nh�n th��ng kinh nghi�m c�a C�nh K� Tr��ng"	
	local tbOpt = 
	{
		{"Ta mu�n nh�n th��ng", get_title, {}},

		{"Ta ch� xem qua"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function get_title()
	if tbPlayer:GetTitleFlag() ~= 0 then
		return Talk(1, "", "M�i tu�n ch� nh�n m�t l�n")
	end
	
	if tbPlayer:GetCurCount() < tbPlayer.PER_WEEK_COUNT then
		return Talk(1, "", format("C�n ph�i tham gia �� %d tr�n m�i nh�n ���c", tbPlayer.PER_WEEK_COUNT))
	end
	tbPlayer:SetTitleFlag()
	local tbExpAward = {szName = "�i�m Kinh Nghi�m", nExp = 100000000}
	tbAwardTemplet:Give(tbExpAward, 1, {"HiepKhachCanhKyTruong", "PhanThuong20tran"})
	
--	local szTitle = tbPlayer:GetTitle()
--	local nTitleId = %tbTitle2Id[szTitle]
--	if not nTitleId then
--		return
--	end
--	
--	tbPlayer:SetTitleFlag()
--	local nTime = GetCurServerTime() + 60*60*24*7
--	nTime = tonumber(FormatTime2String("%m%d%H%M", nTime))
--	SetTask(TASK_ACTIVE_TITLE, nTitleId);
--	Title_AddTitle(nTitleId, 2, nTime)
--	Title_ActiveTitle(nTitleId)
end

function show_introduction()
	local szTitle = "Ch�o ��i hi�p! C�nh K� Tr��ng �� ���c c�ng b� r�ng r�i ��n c�c hi�p kh�ch trong giang h�. <enter> b�o danh: nh�n chu�t ph�i v�o b�n �� C�nh K� Tr��ng tr�n g�c  ph�i c�a giao di�n ch�nh m� ra b�ng giao di�n b�o danh; <enter> Huy Ch��ng Vinh D� C�nh K� Tr��ng: m�i tu�n c� 20 tr�n ��u s� nh�n ���c Huy Ch��ng Vinh D� , nh�ng ��i hi�p tham gia ��nh �� 20 tr�n c�n c� th� nh�n ���c Huy Ch��ng kh�c; <enter> ��ng c�p chi�n ��i: c�n c� theo bi�u hi�n c�a ng��i trong chi�n ��i chi�n ��u, c� th� n�ng cao ho�c l� h� th�p ��ng c�p chi�n ��i c�a ng��i; <enter> C�a H�ng Huy Ch��ng Vinh D�: s� d�ng Huy Ch��ng Vinh D� �� mua c�c lo�i ��o c� qu� gi�."
	local tbOpt = 
	{
		{"���c!", },
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function open_credits_shop()
	local nMapId = GetWorldPos()
	if (IsFreshmanMap(nMapId) == 1 or IsCityMap(nMapId) == 1) and GetFightState() == 0 then
		Sale(175, 16)
	else
		Msg2Player("Ch� c� th� m� c�a h�ng t�i c�c khu v�c an to�n nh� th�nh th� v� t�n th� th�n.")
	end
end


function main()
	--Close dong nhan Vinh Du Canh Ky Truong, edit by ThanhLD - 20130516
	local szTitle = "Ch�o ��i hi�p, b�n t� l� Quan Vi�n C�nh K� Tr��ng."	
	local tbOpt = 
	{
		{"Nh�n th��ng chi�n ��i C�nh K� Tr��ng tu�n n�y", want_get_title, {}},		
		{"M� c�a h�ng Vinh D� C�nh K� Tr��ng", open_credits_shop, {}},
		{"Gi�i thi�u v� t�nh n�ng C�nh K� Tr��ng", show_introduction, {}},
		{"H�y b� "},
	}
	CreateNewSayEx(szTitle, tbOpt)
end