--�������
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\progressbar.lua")

local tbItem = 
{
	["6,1,1781"] = {szName="H�i Thi�n T�i T�o ��n", tbProp={1, 8, 0, 4, 0, 0}},
}

local _AskForNumber = function(nItemIndex, nCount)
	
	local pData = {}
	local tbParam = {}
	tinsert(tbParam, nItemIndex)
	tinsert(pData, huitianjinlang_getpotion)
	tinsert(pData, tbParam)
	g_AskClientNumberEx(0, nCount, "Xin m�i nh�p s� c�n r�t", pData)
	
end

local _OpenBox = function (nPlayerIndex, szName, nCount, nItemIndex)

	if CallPlayerFunction(nPlayerIndex, GetName) ~= szName then
		return
	end
	
	CallPlayerFunction(nPlayerIndex, %_AskForNumber, nItemIndex, nCount)
	
end

function main(nItemIndex)
	local nCount = GetItemParam(nItemIndex, 1);
	
	if nCount == 0 then
		Say("�� r�t h�t to�n b� thu�c trong �� r�i, c� th� v�t �i.", 0)
		return 0
	end
	
	if GetFightState() == 1 then
		tbProgressBar:OpenByConfig(5, %_OpenBox, {PlayerIndex, GetName(), nCount, nItemIndex})
	else
		%_AskForNumber(nItemIndex, nCount)
	end
	
	return 1
end


function huitianjinlang_getpotion(nItemIndex, nPickCount)
	
	local nFreeItemCellCount = CalcFreeItemCellCount()
	if nPickCount <= 0 then
		return
	end
	if nFreeItemCellCount < nPickCount then
		nPickCount = nFreeItemCellCount
	end
	
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
		
		
		%tbItem[szItemId].nCount = nPickCount
		if tbAwardTemplet:GiveAwardByList(%tbItem[szItemId], "C�m nang thay ��i tr�i ��t") == 1 then
			nCount = nCount - nPickCount
			if nCount <= 0 then
				RemoveItemByIndex(nItemIndex)
			else
				SetSpecItemParam(nItemIndex, 1, nCount)
				SyncItem(nItemIndex) --ͬ���ͻ���
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