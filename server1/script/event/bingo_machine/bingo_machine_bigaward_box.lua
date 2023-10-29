--�ٱ��侫��ʯ��
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\common.lua")

local tbItem = 
{
	["6,1,3060"] = {szName="H�n Nguy�n Linh L�", tbProp={6,1,2312,1,0,0}},
}

local _GetItem = function (nCount)
	AskClientForNumber("refining_box_getpotion", 0, nCount, "Xin m�i nh�p s� c�n r�t")
end

local _OpenBox = function (nPlayerIndex, szName, nCount)
	if DynamicExecuteByPlayer(nPlayerIndex, "", "GetName") ~= szName then
		return
	end	
	
	lib:DoFunByPlayer(nPlayerIndex, %_GetItem, nCount)
	
end

function main(nItemIndex)
	local nCount = GetItemParam(nItemIndex, 1);
	
	if nCount == 0 then
		Say("�� nh�n h�t H�n Nguy�n Linh L� b�n trong, c� th� h�y �i.", 0)
		return 0
	end
	
	SetTaskTemp(114, nItemIndex)
	if GetFightState() == 1 then
		tbProgressBar:OpenByConfig(12, %_OpenBox, {PlayerIndex, GetName(), nCount})
	else
		AskClientForNumber("refining_box_getpotion", 0,nCount, "Xin m�i nh�p s� c�n r�t")
	end
	
	return 1
end


function refining_box_getpotion(nPickCount)
	local nFreeItemCellCount = CalcFreeItemCellCount()
	if nPickCount <= 0 then
		return
	end
	if nFreeItemCellCount < nPickCount / 50 then
		nPickCount = nFreeItemCellCount * 50
	end
	local nItemIndex = GetTaskTemp(114)
	if IsMyItem(nItemIndex) == 1 then
		local Gid, Did, Pid = GetItemProp(nItemIndex);
		local szItemId = format("%d,%d,%d",Gid, Did, Pid)
		if not %tbItem[szItemId] then  --�ǲ����������
			return
		end
		
		local nCount = GetItemParam(nItemIndex, 1);
		if nPickCount > nCount then
			nPickCount = nCount
		end
		
		local nBindState = GetItemBindState(nItemIndex);
		local tbPotion = clone(%tbItem[szItemId]);
		tbPotion.nCount = nPickCount;
		tbPotion.nBindState = nBindState;
		if tbAwardTemplet:GiveAwardByList(tbPotion, "H�n Nguy�n Linh L�") == 1 then
			nCount = nCount - nPickCount
			if nCount <= 0 then
				RemoveItemByIndex(nItemIndex)
			else
				SetSpecItemParam(nItemIndex, 1, nCount)
				SyncItem(nItemIndex) --ͬ���ͻ���
				SetItemBindState(nItemIndex, nBindState)
			end
		end
	else
		print("V�t ph�m kh�ng � tr�n ng��i")
	end
end

function GetDesc(nItemIndex)
	local nCount= GetItemParam(nItemIndex, 1);

	return format("C�n d�:  <color=yellow>%d<color>", nCount)
end