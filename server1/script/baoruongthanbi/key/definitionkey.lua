Include("\\script\\baoruongthanbi\\head.lua");
function DefinitionKey_main()
	GiveItemUI("Gi�m ��nh l�i Ch�a Kh�a V�n N�ng", "Gi�m ��nh l�i Ch�a Kh�a V�n N�ng", "ConfirmDefinitionKey", "OnCancel");
end

function ConfirmDefinitionKey(nCount)
		if (nCount < 1) then
			return
		end
		if (nCount > 6) then -- cho phep bo bao duy nhat 3 vat pham
			Talk(1, "", "��i hi�p b� nhi�u th� qu�, ta hoa c� m�t !");
			return
		end
		local lag1, lag2, lag3, lag4 = 0, 0, 0, 0 
		local nCountBox, nCountKey, nCountNHB, nCountTHB = 0, 0, 0, 0
		local  nIndexBox, nIndexKey =0, 0
		for i=1, nCount do
			local nItemIndex = GetGiveItemUnit(i)	--lay ve Item Index cac vat pham
			local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
			if (parttype ~= 30036 and parttype ~= 30037 and parttype ~= 30038 and parttype ~= 30039) then
				Talk(1, "", "��i hi�p xin h�y b� v�o ��ng v�t ph�m !");
				return
			end
				if (parttype == 30036) then--ruong
					lag1 = 1
					nIndexBox = nItemIndex
					nCountBox = nCountBox +1
				end
				if (parttype == 30037) then--key
					lag2 = 1
					nIndexKey = nItemIndex
					nCountKey = nCountKey +1
				end
				if (parttype == 30038) then--nhi ho bua
					lag3 = 1
					nCountNHB = nCountNHB + 1
					--nIndexHB = nItemIndex
				end
				if (parttype == 30039) then--tam ho bua
					lag4 = 1
					--nIndexHB = nItemIndex
					nCountTHB = nCountTHB + 1
				end
		end--for
		if (nCountBox > 1 or nCountKey > 1 or nCountNHB > 4 or nCountTHB > 4) then
				Talk(1, "", "��i hi�p xin h�y b� v�o ��ng v�t ph�m !");
				return
		end
		if (lag3 ==1 and lag4 ==1) then
			Talk(1,"","��i hi�p ch� n�n s� d�ng 1 lo�i b�a m� th�i !")
			return
		end
		if (lag1==1 and lag2 == 1 and (lag3 ==1 or lag4 ==1)) then
				--nGblBoxValue = GetBoxValue(nIndexBox)--lay ve gia tri cua ruong
				if (lag3 == 1) then--user su dung nhi ho bua
					RemoveAllItem(nCount, nIndexBox)
					AddNewKeyValue(nCountNHB, nIndexBox,nIndexKey, 2)
					
				end
				if (lag4 ==1) then--user su dung tam ho bua
					RemoveAllItem(nCount, nIndexBox)
					AddNewKeyValue(nCountTHB, nIndexBox, nIndexKey, 3)
					
				end
		else
			Talk(1, "", "��i hi�p xin h�y b� v�o ��ng v�t ph�m !");
			return
		end
end


function AddNewKeyValue(nCountHB, nIndexBox, nIndexKey, nType)
		local nBoxValue = GetBoxValue(nIndexBox)--lay ve gia tri cua ruong
		local num2 = floor(nBoxValue/ 1000)--lay 2 gia tri dau cua ruong
		local num3 = floor(nBoxValue/ 100)--lay 3 gia tri dau cua ruong
		local num4 = floor(nBoxValue/ 10)--lay 4 gia tri dau cua ruong
		--local num5 = floor(nBoxValue/ 1)--lay 5 gia tri dau cua ruong
		local nValue = 0
		local nRandomKeyValue = random(1, 100)
		if (nCountHB==4) then
			nValue = 100
		elseif (nCountHB==3) then
			nValue = 75
		elseif (nCountHB==2) then
			nValue = 50
		else
			nValue = 25
		end
		if (nValue == 100) then--so luong bua bo vao la 4
			if (nRandomKeyValue <= 10) then--check ty le random <= 10 do....
				if (nType==2) then--neu user su dung nhi ho bua thi add key dung voi 3 so cua box
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num3)
					SyncItem(nItemIndex)
					Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c ch�a kh�a c� ch�a 3 m� s�")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."Gi�m ��nh Key nh�n ���c Key 3 s� type 1")
				else--nguoc lai neu su dung tam ho bua thi add key dung voi 4 so cua box
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num4)
					SyncItem(nItemIndex)
					Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c ch�a kh�a c� ch�a 4 m� s�")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."Gi�m ��nh Key nh�n ���c Key 4 s� type 1")
				end--check user su dung loai ho bua
			else--ty le random lon hon 10
				if (nType==2) then--neu user su dung nhi ho bua thi add key dung voi 2 so cua box
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num2)
					SyncItem(nItemIndex)
					Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c ch�a kh�a c� ch�a 2 m� s�")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."Gi�m ��nh Key nh�n ���c Key 2 s� type 1")
				else--nguoc lai neu su dung tam ho bua thi add key dung voi 3 so cua box
					local nItemIndex = AddItem(6,1,30037,1,0,0)
					SetSpecItemParam(nItemIndex, 1, num3)
					SyncItem(nItemIndex)
					Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c ch�a kh�a c� ch�a 3 m� s�")
					WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."Gi�m ��nh Key nh�n ���c Key 3 s� type 1")
				end--check user su dung loai ho bua
			end--check ran dom max key value
		elseif (nRandomKeyValue <= nValue ) then--neu gia tri random <= nValue% thi...
			if (nType==2) then--neu user su dung nhi ho bua thi add key dung voi 2 so cua box
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, num2)
				SyncItem(nItemIndex)
				Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c ch�a kh�a c� ch�a 2 m� s�")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."Gi�m ��nh Key nh�n ���c Key 2 s� type 1")
			else--nguoc lai neu su dung tam ho bua thi add key dung voi 3 so cua box
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, num3)
				SyncItem(nItemIndex)
				Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c ch�a kh�a c� ch�a 3 m� s�")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."Gi�m ��nh Key nh�n ���c Key 3 s� type 1")
			end--check user su dung loai ho bua
		elseif (nRandomKeyValue > nValue and nValue >= 75) then--neu user bo vao 3 ho bua v� gia tri random lon hon cho phep
			if (nType==2) then--neu user su dung nhi ho bua thi add key random 2 so
				local nVarRandom = random(10,99)
				if (nVarRandom == num2) then
					nVarRandom = nVarRandom + 1
				end
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, nVarRandom)
				SyncItem(nItemIndex)
				Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c ch�a kh�a c� ch�a 2 m� s�")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."Gi�m ��nh Key nh�n ���c Key 2 s� type 2")
			else--nguoc lai neu su dung tam ho bua thi add key random3 so 
				local nVarRandom = random(100,999)
				if (nVarRandom == num2) then
					nVarRandom = nVarRandom + 1
				end
				local nItemIndex = AddItem(6,1,30037,1,0,0)
				SetSpecItemParam(nItemIndex, 1, nVarRandom)
				SyncItem(nItemIndex)
				Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c ch�a kh�a c� ch�a 3 m� s�")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."Gi�m ��nh Key nh�n ���c Key 3 s� type 2")
			end--check user su dung loai ho bua
		else--ko phu hop gia tri random, bo vao it hon 3 la bua
			RemoveItemByIndex(nIndexBox)
			RemoveItemByIndex(nIndexKey)
			Talk(1,"","Gi�m ��nh th�t b�i, t�n th�t h�t nguy�n li�u !")
			Msg2Player("Gi�m ��nh th�t b�i !")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."Gi�m ��nh Key th�t b�i, tr� h�t nguy�n li�u")
		end--check value
end

function OnCancel()
end
