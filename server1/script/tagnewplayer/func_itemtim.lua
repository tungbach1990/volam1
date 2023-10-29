Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\QualityItem.lua");



function ToStrNumb(set)
	local s = "{"
	local sep = ""
	local val = ""
	for k,v in set do
			if (type(v) == "table") then
				val = ToStrNumb(v)
			else
				val = v
			end
			if (type(v) == "string") then
				val = "\"" ..v.."\""
			end
			s = s .. sep .. val
			sep = ", "
	end
	return s .. "}"
end

tbItem=
{
	{strSelect ="n�n"},
	{strSelect ="�o"},
	{strSelect ="th�t l�ng"},
	{strSelect ="bao tay"},
	{strSelect ="gi�y"},
	{strSelect ="v� kh� th� nh�t"},
	{strSelect ="v� kh� th� hai"}
};
tbWeapon=
{
	{strName ="�ao"},
	{strName ="Phi �ao"},
	{strName ="Phi Ti�u"},
	{strName ="Ki�m"},
	{strName ="Th��ng"},
	{strName ="B�ng"}
};



function GetItemTim()
		local tbSeries={}
		if (CheckObject() < 1) then
			Talk(1, "", "Xin h�y ki�m tra l�i �i�u ki�n tham gia.");
			return
		end
		if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim) ~= 1) then
			Talk(1, "", "Ph�n th��ng n�y ch� nh�n 1 l�n !");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "H�nh trang kh�ng �� 60 � tr�ng.");
			return
		end
		SelectItemTim(tbSeries)
end
function SelectItemTim(tbSeries)
	local tbOpp = {}
	local str = "<#>��i hi�p, xin h�y ch�n trang b� ";
	local szTempSeries = ToStrNumb(tbSeries)
	str = str .. ShowSelItem(tbSeries)
		
	for i = 1, getn(tbItem) do
			local strFunc = tbItem[i].strSelect
			tinsert(tbOpp,"Ta mu�n nh�n trang b� ".. strFunc.." /#SelectSeries("..i.. ",".."\""..strFunc.."\"".."," .. szTempSeries .. ")");
	end
	tinsert(tbOpp, "<#>Tho�t/CancelSelectItem")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
	
end
function SelectSeries(nIndex, strFunc, tbSeries)
	
	if (getn(tbSeries)> 0) then
		for i =1, getn(tbSeries) do
				
				if (tbSeries[i][1] == strFunc) then
					do
						Talk(1,"",format("��i hi�p �� ch�n trang b� %s r�i m� c�n mu�n ch�n n�a sao!!!", strFunc))
						return
					end
				end
		end
	end

	local szTempSeries = ToStrNumb(tbSeries)
	if (strFunc ~= "v� kh� th� nh�t" and strFunc ~= "v� kh� th� hai") then
		local tbOpp = {}
		local str = "<#> ��i hi�p ch�n l�a thu�c t�nh ng� h�nh ";
		tinsert(tbOpp,"Ta mu�n nh�n trang b� h� Kim/#SelectItem(0,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"Ta mu�n nh�n trang b� h� M�c/#SelectItem(1,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"Ta mu�n nh�n trang b� h� Th�y/#SelectItem(2,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"Ta mu�n nh�n trang b� h� H�a/#SelectItem(3,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"Ta mu�n nh�n trang b� h� Th�/#SelectItem(4,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp, "<#>Tho�t/CancelSelectItem")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end
		Say( str, getn( tbOpp ), tbOpp )
	else
		local tbOpp = {}
		local str = "<#> ��i hi�p xin h�y ch�n v� kh�"
		for i=1, getn(tbWeapon) do
			local strItemName = tbWeapon[i].strName
			tinsert(tbOpp,"Ta ch�n: " .. strItemName.."/#SelectItem(0,".."\""..strItemName.."\"".. "," .. szTempSeries .. ")");
		end
		tinsert(tbOpp, "<#>Tho�t/CancelSelectItem")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end;
		Say( str, getn( tbOpp ), tbOpp )
	end
end
function SelectItem(nSeries, strFunc, tbSeries)

	if (getn(tbSeries)> 0) then
		for i =1, getn(tbSeries) do
				
				if (tbSeries[i][1] == strFunc) then
					do
						Talk(1,"",format("��i hi�p �� ch�n trang b� %s r�i m� c�n mu�n ch�n n�a sao!!!", strFunc))
						return
					end
				end
		end
	end
	tbSeries[getn(tbSeries)+1] = {strFunc, nSeries}
	if (getn(tbSeries)> 0) then
		local nCount = 0
		for i =1, getn(tbSeries) do
			for j = 1, getn(tbWeapon) do
				if (tbSeries[i][1] == tbWeapon[j].strName) then
					nCount = nCount + 1
				end
			end
		end
		
		if (nCount > 2) then
			do
					Talk(1,"","��i hi�p �� ch�n qu� s� l��ng v� kh� cho ph�p!!!")
					return
			end
		end
		
	end		
		if (getn(tbSeries) < 7) then
			SelectItemTim(tbSeries)
		else
			--tbItem = clone(tbItem)
			local strTitle = "<#>C�c h� �� ch�n ng� h�nh cho c�c trang b�: "
			--for strItemName,numSeries in tbSeries do
			strTitle = strTitle .. ShowSelItem(tbSeries)
			local szTempSeries = ToStrNumb(tbSeries)
			Say(strTitle, 2,
			"Ta mu�n nh�n/#ConfirmGetItem(" .. szTempSeries .. ")",
			"H�y b� /CancelSelectItem")
		end
end
function ConfirmGetItem(tbSeries)
		for k,v in tbSeries do
			Msg2Player(v[1])
		end
		SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim, 1)--set bit 7 len 1de xac nhan  gamer nhan  phan thuong
		local nSex = GetSex()

		 for i = 1, getn(tbSeries) do
			local strItemName = tbSeries[i][1]
			local numSeries = tbSeries[i][2]
			AddQItem(strItemName, numSeries, nSex)
		end
		
		Addweapon(tbSeries)
		--tbSeries={}		
end
function Addweapon(tbSeries)
		 for i = 1, getn(tbSeries) do
					local strItemName = tbSeries[i][1]
					local nItemIndex = nil
					if (strItemName == "�ao") then
						nItemIndex = AddQualityItem(2,0,0,1,10,0,0,30,219,9,290,135,-1)				
					elseif (strItemName == "Phi �ao") then
						nItemIndex = AddQualityItem(2,0,1,1,10,0,0,30,219,9,290,140,-1)						
					elseif (strItemName == "Phi Ti�u") then
						nItemIndex = AddQualityItem(2,0,1,0,10,0,0,30,219,9,290,140,-1)						
					elseif (strItemName == "Ki�m") then
						nItemIndex = AddQualityItem(2,0,0,0,10,0,0,30,219,9,290,135,-1)					
					elseif (strItemName == "Th��ng") then
						nItemIndex = AddQualityItem(2,0,0,3,10,0,0,30,219,9,290,125,-1)					
					elseif (strItemName == "B�ng") then
						nItemIndex = AddQualityItem(2,0,0,2,10,0,0,30,219,9,290,135,-1)					
					end
				
				if (nItemIndex ~= nil) then
					SetItemBindState(nItemIndex, -2);
					SyncItem(nItemIndex)
					local strItem = GetItemName(nItemIndex)
					Msg2Player("B�n nh�n ���c "..strItem)
					WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."nh�n ���c T�m"..strItem)
				end
		end--for
end

function ShowSelItem(tbSeries)
	local szTem = ""
	for i = 1, getn(tbSeries) do
				local numSeries = tbSeries[i][2]
				local strItemName =  tbSeries[i][1]
				local nSeries=""
				if (numSeries == 0) then
					nSeries = "Kim"
				elseif(numSeries == 1) then
					nSeries = "M�c"
				elseif(numSeries == 2) then
					nSeries = "Th�y"
				elseif(numSeries == 3) then
					nSeries = "H�a"
				else
					nSeries = "Th�"
				end
				szTem = szTem .. "\n<color=yellow>"..strItemName.."<color> h� <color=red>"..nSeries.."<color>"
	end
	return szTem
end

function CancelSelectItem()

end






