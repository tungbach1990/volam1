MAXNUM_GIFT = 10

function main()
	Talk(1, "GiveUIForShenmi_Ore", "H�p th�nh Kho�ng th�ch th�n b�: M�i l�n ��t v�o <color=yellow>10<color> vi�n <color=yellow>c�p 10<color> L� v�t n�m D�u, th� c� th� h�p th�nh m�t kho�ng th�ch th�n b�.")
	return
end

function GiveUIForShenmi_Ore()
		GiveItemUI("H�p th�nh Kho�ng th�ch th�n b� ","T�i thanh v�t ph�m ph�a d��i ��t v�o 10 c�i L� v�t n�m D�u c�p 10 th� c� th� h�p th�nh m�t kho�ng th�ch th�n b�.", "Covert_ShenmiOre", "onCancel" );
end

function Covert_ShenmiOre(nCount)
	local q = 0
	local d = 0
	local num = 0
	local maxCount = 0
	if (nCount == 0) then
		Talk(1, "GiveUIForShenmi_Ore", "<#> C�i g� c�ng kh�ng ��a, ng��i mu�n l�m g� ��y!")
		return 
	end
	if (nCount >10 ) then
		Talk(1, "GiveUIForShenmi_Ore", "<#> S� l��ng v�t ph�m ng��i ��t v�o h�nh nh� kh�ng ��ng, ki�m tra l�i �i!")
		return l
	end
	
	for i = 1, nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)
		if(g ~= 4 or d ~= 518) then
			Talk(1, "GiveUIForShenmi_Ore","<#> Ng��i ��a ta c�i qu�i g� th� n�y?" )
			return 
		end
			function checkGiftCount(idx,count)  --������ص��ߵ�����
				local num = GetItemStackCount(idx)
				if(count + num > MAXNUM_GIFT) then -- ����̫��
					Talk(1, "GiveUIForShenmi_Ore", "<#> Ng��i ��t v�o nhi�u qu�! Ta kh�ng bi�t ph�i l�m sao!")
					return nil
				end
				return num
			end
		num = checkGiftCount(itemIdx,maxCount)
		if (not num) then
			return 
		else
			maxCount = maxCount + num
		end
	end
	if (maxCount ~= 10) then
		Talk(1, "GiveUIForShenmi_Ore", "<#> S� l��ng L� v�t n�m D�u ng��i ��a kh�ng �� r�i!")
		return 
	else
		for i=1,nCount do
			RemoveItemByIndex(GetGiveItemUnit( i ))
		end
		AddItem(6, 1, 398, 1, 1, 1, 1)
		Talk(1, "", "Ch�c m�ng b�n h�p th�nh ���c m�t kho�ng th�ch th�n b�!")
		Msg2Player("B�n nh�n ���c m�t kho�ng th�ch th�n b� ")
		return
	end
end

function onCancel()
end