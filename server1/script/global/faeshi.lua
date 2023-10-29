--����ʹ
--hehongpeng 2004-12-27
Include("\\script\\global\\shangchenghead.lua")
--����ȫ�ֱ�����¼���Ҫ�ͷ��Ǹ�����
nGlobalCityIndex = 0

CityData = {0, 0, 0, 0, 0, 0, 0};

function main()
	if (nil) then
		Say("Ch�c n�ng v�n ch�a M� ra", 0)
		return
	end
	--��ȡ�����ļ�����ֻ֤��ȡһ��
	loadsavevalue()
	
	local aryszContent = 
	{
		"<#> Ta l� ng��i tr�ng ph�t k� �c, c� th� gi�p g� cho hުp kh�ch?",
		"<#> T�m hi�u c�ng tr�ng c�c th�nh th� /onchecknum",
		"<#> Tr�ng ph�t bang h�i chi�m l�nh Ph��ng T��ng /onpunish_fengxiang",
		"<#> Tr�ng ph�t bang h�i chi�m l�nh Th�nh ��/onpunish_chengdu",
		"<#> Tr�ng ph�t bang h�i chi�m l�nh ��i L� /onpunish_dali",
		"<#> Tr�ng ph�t bang h�i chi�m l�nh Bi�n Kinh/onpunish_bianjing",
		"<#> Tr�ng ph�t bang h�i chi�m l�nh T��ng D��ng/onpunish_xiangyang",	
		"<#> Tr�ng ph�t bang h�i chi�m l�nh D��ng Ch�u/onpunish_yangzhou",
		"<#> Tr�ng ph�t bang h�i chi�m l�nh L�m An/onpunish_linan",		
		"<#> Nh�n ti�n gh� qua th�i/oncancel",
	}
	
	--���Բ�������������ʵ��
	local aryCallBackFun = {
		"/onpunish_fengxiang",
		"/onpunish_chengdu",
		"/onpunish_dali",
		"/onpunish_bianjing",
		"/onpunish_xiangyang",
		"/onpunish_yangzhou",
		"/onpunish_linan"
	}
	local nNum
	for nCityIndex=1, 7 do
		strTongName = GetCityOwner(nCityIndex)
		if (strTongName == nil or strTongName == "") then
			aryszContent[nCityIndex + 2] = "<#>"..arraycityindextoname[nCityIndex].."Kh�ng c� bang h�i chi�m l�nh, kh�ng th� ti�n h�nh tr�ng ph�t/oncancel"
		else
			nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
			aryszContent[nCityIndex + 2] = "<#> Tr�ng ph�t bang h�i"..strTongName.."chi�m l�nh th�nh th� "..arraycityindextoname[nCityIndex].." (C�ng tr�ng th�nh th�:"..nNum..")"..aryCallBackFun[nCityIndex]
		end
	end	
	
	Say(aryszContent[1], 9,	aryszContent[2],aryszContent[3],aryszContent[4],aryszContent[5],aryszContent[6],aryszContent[7],aryszContent[8],aryszContent[9], aryszContent[10]);
end 

function onpunish()
	--���ݵ�ͼ�����ͷ�
	if (nGlobalCityIndex < 1) then
		Say("<#> Kh�ng c� th�nh th� n�o c�n tr�ng ph�t", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<#> bang h�i chi�m l�nh <color=red>"..arraycityindextoname[nIndex].."<color> kh�ng ai chi�m l�nh, kh�ng th� ti�n h�nh tr�ng ph�t", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--�򿪸������
	GiveItemUI( "Giao n�p Ph�t �c L�nh", "Tr�ng ph�t th�nh th� "..arraycityindextoname[nGlobalCityIndex]..", bang h�i chi�m l�nh th�nh th� "..strCityTongName..", hi�n t�i c�ng tr�ng c�a th�nh �� l�:"..nNum, "onsubmitconfirm", "oncancel" )
end

function onconfirm(nIndex)
	local strCityTongName = GetCityOwner(nIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<#> bang h�i chi�m l�nh <color=red>"..arraycityindextoname[nIndex].."<color> kh�ng ai chi�m l�nh, kh�ng th� ti�n h�nh tr�ng ph�t", 0)
		return
	end

	--��ȫ�ֱ�����ֵ
	nGlobalCityIndex = nIndex	
	strMsg={	
		"<#> bang h�i chi�m l�nh <color=red>"..arraycityindextoname[nIndex].."<color>l�: <color=red>"..strCityTongName.."<color>, b�n x�c ��nh s� d�ng Ph�t �c L�nh?",
		"<#> S� d�ng/onpunish",
		"<#> �� ta suy ngh� l�i!/oncancel"		
	};
	
	Say(strMsg[1], 2, strMsg[2], strMsg[3]);
end

function onpunish_fengxiang()
	onconfirm(1)
end

function onpunish_chengdu()
	onconfirm(2)
end

function onpunish_dali()
	onconfirm(3)
end

function onpunish_bianjing()
	onconfirm(4)
end

function onpunish_xiangyang()
	onconfirm(5)
end

function onpunish_yangzhou()
	onconfirm(6)
end

function onpunish_linan()
	onconfirm(7)
end
		
function oncancel()
	return
end

function onchecknum()
	--��ѯ����������������
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo1 = ""
	local strInfo2 = ""
	for nCityIndex=1, 4 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<#><color=red>"..arraycityindextoname[nCityIndex].."<color> Kh�ng ai chi�m l�nh, c�ng tr�ng l�:<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<#> bang h�i chi�m l�nh <color=red>"..arraycityindextoname[nCityIndex].."<color> l�: <color=red>"..strTongName.."<color>, c�ng tr�ng th�nh th� l�:<color=red>"..nNum.."<color>"
		end
		if (nCityIndex == 1) then
		    strInfo = arr[nCityIndex]
		elseif (nCityIndex == 2) then
		    strInfo = strInfo.."<enter>"..arr[nCityIndex]
		elseif (nCityIndex == 3) then
		    strInfo1 = arr[nCityIndex]
		elseif (nCityIndex == 4) then
		    strInfo1 = strInfo1.."<enter>"..arr[nCityIndex]
		end
	end
	
	--Talk(4, "onchecknum1", arr[1], arr[2], arr[3], arr[4])
	Talk(2, "onchecknum1", strInfo, strInfo1)
end

function onchecknum1()
	--��ѯ����������������
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo = ""
	local strInfo1 = ""
	for nCityIndex=5, 7 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<#><color=red>"..arraycityindextoname[nCityIndex].."<color> kh�ng ai chi�m l�nh, c�ng tr�ng th�nh th� l�: <color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<#> bang h�i chi�m l�nh <color=red>"..arraycityindextoname[nCityIndex].."<color> l�: <color=red>"..strTongName.."<color>, c�ng tr�ng th�nh th� l�:<color=red>"..nNum.."<color>"
		end
		if (nCityIndex == 5) then
		    strInfo = arr[nCityIndex]
		elseif (nCityIndex == 6) then
		    strInfo = strInfo.."<enter>"..arr[nCityIndex]
		else
		    strInfo1 = arr[nCityIndex]
		end
	end
	
	--Talk(3, "", arr[5], arr[6], arr[7])
	Talk(2, "", strInfo, strInfo1)
end

function onsubmitconfirm(nCount)
	if (nCount < 1) then
		Msg2Player("B�n kh�ng giao n�p Ph�t �c L�nh")
		return
	end
	
	--�ж���Ʒ�Ƿ�Ϊ������
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit( i )
		ItemGenre, DetailType, ParticularType = GetItemProp(nItemIndex)

		if (ItemGenre ~= AEXP_PUNISHMEDIAL_NGENTYPE or
			DetailType ~= AEXP_PUNISHMEDIAL_DETAILTYPE or
			ParticularType ~= AEXP_PUNISHMEDIAL_PARTYPE) then
				Msg2Player("<#> H�nh nh� v�t c�a ng��i kh�ng ph�i Ph�t �c L�nh ��!")
				return 0			
		end
	end
	
	local nTotalNum = 0
	for i = 1, nCount do
		nItemIndex = GetGiveItemUnit( i )
		nTotalNum = nTotalNum + GetItemStackCount(nItemIndex)
		RemoveItemByIndex( nItemIndex )
	end
	
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--if (nNum < 0) then
	--	nNum = 0
	--end
	
	local nSpareNum = nNum - nTotalNum
	--if (nSpareNum < 0) then
	--	nSpareNum = 0
	--end
	
	SetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex], nSpareNum)
	local strCityTongName = GetCityOwner(nGlobalCityIndex);	
	--��tab�ļ�����д
	CityData[nGlobalCityIndex] = CityData[nGlobalCityIndex] + nTotalNum
	if (CityData[nGlobalCityIndex] > AEXP_REDUCEMAX_SAVE) then
		CityData[nGlobalCityIndex] = 0		
		WriteLog("["..date("%Y-%m-%d %X").."] Bang h�i:"..strCityTongName.." Th�nh th�:"..arraycityindextoname[nGlobalCityIndex].." V� "..GetAccount().."("..GetName()..") �� giao"..nTotalNum.."Ph�t �c L�nh, v��t qu� s� l��ng, hi�n t�i l� "..nSpareNum.."(Current OnlineTime: "..GetGameTime().." sec)" );
		savevalue()
	end	
	
	Say("<#> bang h�i chi�m l�nh <color=red>"..arraycityindextoname[nGlobalCityIndex].."<color> l�: <color=red>"..strCityTongName.."<color>, b�n giao n�p"..nTotalNum.."Ph�t �c L�nh �� tr�ng ph�t ��i ph��ng, c�ng tr�ng hi�n t�i c�a th�nh th� l�:<color=red>"..nSpareNum.."<color>",0)
end
