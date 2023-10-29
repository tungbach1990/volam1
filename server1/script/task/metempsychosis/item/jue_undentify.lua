Include("\\script\\task\\metempsychosis\\translife_7_config.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

g_szTittle = "H�y l�a ch�n: "

g_tbGiveItem = TL7_CONFIG.tbJueUnDentifyGiveItem

function main(nItemIndex)
	local tbSelection = 
	{
		"<#> nh�n ���c [B� quy�t Tr�ng sinh 7- trang th� 1]/#get_jue(%d, %d)",
		"<#> nh�n ���c [B� quy�t Tr�ng sinh 7- trang th� 2]/#get_jue(%d, %d)",
		"<#> nh�n ���c [B� quy�t Tr�ng sinh 7- trang th� 3]/#get_jue(%d, %d)",
		"<#> nh�n ���c [B� quy�t Tr�ng sinh 7- trang th� 4]/#get_jue(%d, %d)",
		"<#> nh�n ���c [B� quy�t Tr�ng sinh 7- trang th� 5]/#get_jue(%d, %d)",
		"<#> nh�n ���c [B� quy�t Tr�ng sinh 7- trang th� 6]/#get_jue(%d, %d)",
		"<#> nh�n ���c [B� quy�t Tr�ng sinh 7- trang th� 7]/#get_jue(%d, %d)",	
		"<#> �� ra ngh� l�i/#on_cancel(%d, %d)",	
	}

	for nIndex, szSelection in tbSelection do
		tbSelection[nIndex] = format(tbSelection[nIndex], nIndex, nItemIndex)
	end
	Say(g_szTittle, getn(tbSelection), tbSelection);
	return 1
end


function on_cancel(nSelection, nItemIndex)

end

function get_jue(nSelection, nItemIndex)
	local nTotalNeedRoom = 1
	if %PlayerFunLib:CheckFreeBagCell(nTotalNeedRoom, "default") ~= 1 then
		Say(format(TL7_CONFIG.tbLang[4], nTotalNeedRoom), 0 )
		return 
	end
	
	local nItemTotalNum = getn(g_tbGiveItem)
	if nSelection < 1 or nSelection > nItemTotalNum then
		return
	end
	
	local nGenre, nDetail, nParticular, nLevel = GetItemProp(nItemIndex)
	local nDelCode = ConsumeEquiproomItem(1, nGenre, nDetail, nParticular, nLevel)
	if nDelCode ~= 1 then
		Say(TL7_CONFIG.tbLang[10], 0 )
		return
	end
	local tbItemParam = g_tbGiveItem[nSelection]
	AddItem(unpack(tbItemParam))
end