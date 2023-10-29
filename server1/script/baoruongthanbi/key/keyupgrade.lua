Include("\\script\\baoruongthanbi\\head.lua");
function KeyUpgrade_main()
	GiveItemUI("N�ng C�p Ch�a Kh�a V�n N�ng", "N�ng C�p Ch�a Kh�a V�n N�ng", "ConfirmKeyUpgrade", "OnCancel", 1);
end

function ConfirmKeyUpgrade(nCount)
		if (nCount > 20) then -- cho phep bo bao duy nhat 3 vat pham
			Talk(1, "", "��i hi�p b� nhi�u th� qu�, ta xem hoa c� m�t ! ");
			return
		end
		local lag1, lag2, lag3, lag4,lag5 = 0, 0, 0, 0, 0
		local nIndexKey, nIndexBox, nIndexNTF, nIndexDLF, nIndexTHF =0, 0, 0, 0, 0
		local nCountBox, nCountKey, nCountNTF, nCountDLF, nCountTHF = 0, 0, 0, 0, 0 
		local nValueRateNTF, nValueRateDLF, nValueRateTHF = 0, 0, 0
		for i=1, nCount do
			local nItemIndex = GetGiveItemUnit(i)	--lay ve Item Index cac vat pham
			local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
			if (parttype ~= 30036 and parttype ~= 30037 and parttype ~= 30040 and parttype ~= 30041 and parttype ~= 30042) then
				Talk(1, "", "��i hi�p xin h�y b� v�o ��ng v�t ph�m !");
				return
			end
			if (parttype == 30036) then--ruong
					lag1 = 1
					nIndexBox = nItemIndex
					nCountBox = nCountBox + 1
			end
			if (parttype == 30037) then--key
					lag2 = 1
					nIndexKey = nItemIndex
					nCountKey = nCountKey + 1
			end
			if (parttype == 30040) then--nhan tam phu
					lag3 = 1
					nIndexNTF = nItemIndex
					nCountNTF = nCountNTF + 1
			end
			if (parttype == 30041) then--dia linh phu
					lag4 = 1
					nIndexDLF = nItemIndex
					nCountDLF = nCountDLF + 1
			end
			if (parttype == 30042) then--thien hanh phu
					lag5 = 1
					nIndexTHF = nItemIndex
					nCountTHF = nCountTHF + 1
			end
		end--for check
		if (nCountBox > 1 or nCountKey > 1) then
			Talk(1, "", "��i hi�p xin h�y b� v�o ��ng s� l��ng v�t ph�m !");
			return
		end
		if (lag3 ==1 and (lag4==1 or lag5 ==1)) then
				Talk(1, "", "��i hi�p ch� n�n s� d�ng 1 lo�i Ph� m� th�i !");
				return		
		end
		if (lag4 ==1 and (lag3==1 or lag5 ==1)) then
				Talk(1, "", "��i hi�p ch� n�n s� d�ng 1 lo�i Ph� m� th�i !");
				return		
		end
		if (lag5 ==1 and (lag3==1 or lag4 ==1)) then
				Talk(1, "", "��i hi�p ch� n�n s� d�ng 1 lo�i Ph� m� th�i !");
				return		
		end
		if (CheckUserInputKey(nIndexKey)==2) then--neu user in put key 2 so
			if (nCountNTF > 2 or nCountDLF > 2 or nCountTHF > 2 or nCount > 4) then--kiem tra user inout so luong phu
				Talk(1, "", "��i hi�p xin h�y b� v�o ��ng s� l��ng v�t ph�m !");
				return
			end-- end check num phu
			nValueRateNTF = nCountNTF * 5
			nValueRateDLF = nCountDLF * 15
			nValueRateTHF = nCountTHF * 30
		elseif (CheckUserInputKey(nIndexKey) ==3) then--neu user input key 3 so
			if (nCountNTF > 10 or nCountDLF > 10 or nCountTHF > 10 or nCount > 12) then--kiem tra user inout so luong phu
				Talk(1, "", "��i hi�p xin h�y b� v�o ��ng s� l��ng v�t ph�m !");
				return
			end-- end check num phu
			nValueRateNTF = nCountNTF * 1
			nValueRateDLF = nCountDLF * 3
			nValueRateTHF = nCountTHF * 6
		else--user in put key ko hop le
				Talk(1, "", "��i hi�p �ang s� h�u 1 Ch�a Kh�a ho�n h�o, ta thi�t ngh� kh�ng c�n n�ng c�p th�m n�a !");
				return
		end--end check user input key
		if (lag1 == 1 and lag2 == 1 and (lag3==1 or lag4 ==1 or lag5 ==1)) then
			local nKeyValue = GetKeyValue(nIndexKey)
			if (lag3==1) then-- su dung nhan tam phu
					GetKeyUpgraded(nValueRateNTF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
					RemoveAllItem(nCount, nIndexBox)
			end
			if (lag4==1) then--su dung dia linh phu
				GetKeyUpgraded(nValueRateDLF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
				RemoveAllItem(nCount, nIndexBox)
			end
			if (lag5==1) then--su dung thien hanh phu
				GetKeyUpgraded(nValueRateTHF, nIndexBox, nKeyValue, CheckUserInputKey(nIndexKey))
				RemoveAllItem(nCount, nIndexBox)
			end
				
		else
			Talk(1, "", "��i hi�p xin h�y b� v�o ��ng v�t ph�m !");
			return
		end--check user input item
		
end


function GetKeyUpgraded(nRate, nIndexBox, nKeyValue, nType)
	local nRandomVar = random(1,100)
	local nBoxValue = GetBoxValue(nIndexBox)
	local numBox3 = floor(nBoxValue/100)
	local numBox4 = floor(nBoxValue/10)
	--Msg2Player("nType: "..nType)
	--Msg2Player("nRate: "..nRate)
	--Msg2Player("nRandomVar: "..nRandomVar)
	if (nType > 3) then
		Talk(1,"","��i hi�p �ang s� h�u 1 Ch�a kh�a ho�n h�o, ta thi�t ngh� kh�ng n�n n�ng c�p l�n n�a !")
		return
	end
	if (nRandomVar <=nRate) then
		if (nType == 2) then--user  nang cap tu 2 so len 3 so
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, numBox3)
			SyncItem(nItemIndex)
			Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c ch�a kh�a c� ch�a 3 m� s�")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."N�ng C�p Key nh�n ���c Key 3 s� type 1")
		end--user  nang cap tu 3 so len 4 so
		if (nType == 3) then
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, numBox4)
			SyncItem(nItemIndex)
			Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c ch�a kh�a c� ch�a 4 m� s�")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."N�ng C�p Key nh�n ���c Key 4 s� type 1")
		end--end check nType
		
	else--ty le ko cho phep
			local nItemIndex = AddItem(6,1,30037,1,0,0)
			SetSpecItemParam(nItemIndex, 1, nKeyValue)
			SyncItem(nItemIndex)
			Msg2Player("N�ng c�p th�t b�i, xin tr� l�i ��i hi�p v�t ph�m")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."N�ng C�p Key th�t b�i")
	end--random
end
