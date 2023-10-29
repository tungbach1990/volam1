Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

tbMapList =
{
	[11]	=	1,	
	[1]		=	1,	
	[37]	=	1,	
	[176]	=	1,	
	[162]	=	1,	
	[78]	=	1,	
	[80]	=	1,	
}

function main(nItemIndex)
	local nValueParam =GetItemParam(nItemIndex,1)
	local nMaxCount = 0
	
	if (IsCityMap() ~=1) then
		Talk(1, "", "Khu v�c th�nh th� phi chi�n ��u m�i c� th� s� d�ng")
		return 1
	end
	
	if (nValueParam <= 0 ) then
		Talk(1,"","�� r�t h�t to�n b� Ph� Qu� C�m H�p trong �� r�i, c� th� v�t �i.")
		return 0
	end
	
	if (nValueParam >= 60 ) then
		nMaxCount = 59
	else
		nMaxCount = nValueParam
	end
	
	local szTitle = "Xin m�i nh�p s� c�n r�t"
	g_AskClientNumberEx(1, nMaxCount, szTitle, {GetPQCH,{nItemIndex}})
	
	return 1
end

function GetPQCH(nItemIndex,nCount)
	local tbAward = {szName = "Ph� Qu� C�m H�p", tbProp = {6,1,2402,1,0,0}, nCount = 1, nExpiredTime = 20160}
	local nItemParam = GetItemParam(nItemIndex,1)
	
	if ( nCount > CalcFreeItemCellCount() ) then
		Talk(1,"",format("H�nh trang kh�ng �� %d � tr�ng ..",nCount))
		return
	end
	
	if (IsMyItem(nItemIndex) ~=1) then
		return
	end
	
	if ( nCount > nItemParam ) then
		Talk(1,"",format("Hi�n t�i b�n ch� c�n %d Ph� Qu� C�m H�p ..",nItemParam))
		return	
	end
	
	local ntemp =  nItemParam - nCount
	
	if (ntemp <= 0) then
		RemoveItemByIndex(nItemIndex)
	else
		SetSpecItemParam(nItemIndex,1,ntemp)
		SyncItem(nItemIndex)
		SetItemBindState(nItemIndex, -2)
	end
	
	tbAwardTemplet:Give(tbAward, nCount,{"DenBuPQCH2011","NhanPQCHTuTangRuong"})
end

function IsCityMap()
 	local nMapId =GetWorldPos()
	if (tbMapList[nMapId] == 1 and GetFightState() == 0) then
		return 1
	else
		return 0
	end
end

function GetDesc(nItemIndex)
	local nValueParam =GetItemParam(nItemIndex,1)
	return format("C�n d� l�i :<color=yellow>%d<color> Ph� Qu� C�m H�p", nValueParam)
end
