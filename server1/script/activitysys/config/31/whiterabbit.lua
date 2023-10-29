Include("\\script\\activitysys\\config\\31\\head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("ITEM")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")

local _GetFruit = function(nNpcIdx, dwNpcId)
	
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end
	-- ����Ƿ��������Ҵ�����
	if (pActivity.tbNpc[nNpcIdx] and (pActivity.tbNpc[nNpcIdx] ~= GetName())) then
		return 
	end
	
	-- ����Ƿ���ʳ��
	if (PlayerFunLib:CheckItemInBag({tbProp={6,1,2866,1,0,0},},1,"B�n kh�ng c� th�c �n, kh�ng th� nu�i th�.") ~= 1) then 
		return 
	end
	
	-- �۳�����ʳ��
	PlayerFunLib:ConsumeEquiproomItem({tbProp={6,1,2866,1,0,0},},1)
		
	DelNpc(nNpcIdx)
	pActivity.tbNpc[nNpcIdx] = nil
	tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2865,1,0,0}, nExpiredTime=20110630}, "NhanDuocLongTho", 1);	
end


local _OnBreak = function()
	Msg2Player("Th� ch�a �n h�t th�c �n.")
end


function main()
	local nNpcIdx = GetLastDiagNpc();
	local dwNpcId = GetNpcId(nNpcIdx)
	-- ����Ƿ��������Ҵ�����
	if (pActivity.tbNpc[nNpcIdx] and (pActivity.tbNpc[nNpcIdx] ~= GetName())) then
		return 
	end
	
	-- ����Ƿ���ʳ��
	if (PlayerFunLib:CheckItemInBag({tbProp={6,1,2866,1,0,0},},1,"B�n kh�ng c� th�c �n, kh�ng th� nu�i th�.") ~= 1) then 
		return 
	end

	--����������
	tbProgressBar:OpenByConfig(8, %_GetFruit, {nNpcIdx, dwNpcId}, %_OnBreak)
end;

function OnTimer(nNpcIndex, nTimeOut) 
	DelNpc(nNpcIndex);
	strPlayerName = pActivity.tbNpc[nNpcIndex]
	if strPlayerName then
		WriteLog(date("%Y%m%d %H%M%S").."\t".."SinhNhatVoLamTruyenKy".."\tQuanThoiGianThoBienMat".."\tThoCuaNguoiChoi"..strPlayerName)
	end
end