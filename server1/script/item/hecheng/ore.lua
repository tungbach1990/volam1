if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
end

Convert = {
--========��������==================================--
--����ԭ�Σ�:loadSettings()
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	���������ļ������м�ֵ���ļ��㡣�ú�����������
--settings/event/chinesenewyear/giftlvlup.txt��
--settings/event/chinesenewyear/bounslist.txt�ļ���
--Ȼ������������ļ��ֱ�����������������ļ�ֵ�����
--��������һ���Ʒ�ļ�ֵ����
--������
--	��
--����ֵ��
--	��
--������
--
--
--
--==================================================--
	loadSettings = function(self)
		self.__oretabfile = new(KTabFile,"/settings/item/004/itemvalue/ore.txt","ORE")
	end	
}

MAXGIVENUM = 50  --���Ը��������
TF_ORE_WORTH = 2

Convert:loadSettings()

--========��������==================================--
--����ԭ�Σ�ComputeWorth(nCount)
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	���ݸ���������Ʒ����������ֵ����
--������
--	nCount��������������������
--����ֵ��
--	�ɹ��򷵻ؼ�ֵ�������򷵻�nil
--������
--	��
--==================================================--
function ComputeWorth(nCount)
	local worth = 0	--�����ֵ��
	local maxCount = 0	--���������
	local mark = 0

	if(nCount == 0) then
		Talk(1,"GiveUIForOre","<#> C�i g� c�ng kh�ng b� v�o, sao h�p th�nh ��y?")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit(i)
		local g,d,p,lvl = GetItemProp(itemIdx)

		if (mark ~= 0) then
			if (mark ~= lvl) then

				Talk(1,"GiveUIForOre","<#> Ng��i b� c�i qu�i g� th�? ��ng c�p kh�ng gi�ng nhau g� h�t!")
				return nil
			end
		end
		mark = lvl

		if (lvl > 4) then
			Talk(1, "GiveUIForOre", "<#> Huy�n Tinh Kho�ng Th�ch c�a ng��i b� v�o ��ng c�p qu� cao, kh�ng n�m trong ph�m vi n�ng l�c c�a ta.")
			return nil
		end
		if(g ~= 6 or p ~= 147) then --�������
			Talk(1, "GiveUIForOre", "<#> Ng��i b� c�i qu�i g� th�? C� ph�i Huy�n Tinh Kho�ng Th�ch kh�ng?")
			return nil
		end
		function checkGiftCount(idx,count)  --������ص��ߵ�����
			local num = GetItemStackCount(idx)
			if(count + num > MAXGIVENUM) then -- ����̫��
				Talk(1,"GiveUIForOre","<#> Ng��i b� c�i qu�i g� v� v�y?")
				return nil
			end
			return num
		end
		local num = checkGiftCount(itemIdx,maxCount)
		if(not num) then
			return nil
		else
			maxCount = maxCount + num
			worth = worth + num * tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl))
		end

	end

	return worth, mark
end
--========��������==================================--
--����ԭ�Σ�GiveUIForOre()
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	�򿪸�����棬���ںϳɼ��������������ٵĶԻ�
--���á�
--������
--	��
--����ֵ��
--	��
--������
--	��
--==================================================--
function GiveUIForOre()
	GiveItemUI("H�p th�nh Huy�n Tinh Kho�ng Th�ch","�em t�i �a 50 vi�n Huy�n Tinh Kho�ng Th�ch c� ��ng c�p gi�ng nhau ��t v�o thanh v�t ph�m th� c� th� h�p th�nh ra s� l��ng Huy�n Tinh Kho�ng Th�ch c�p cao h�n t��ng �ng.", "OreLevelUp", "onCancel" );
end

--========��������==================================--
--����ԭ�Σ�OreLevelUp(nCount)
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	���ѡ������������Ʒ֮�󣬵���������棬�˺���Ϊ
--�ø��������ȷ����ť֮��Ļص�������
--������
--	��������е�����Ʒ����������������������ӵ�������
--����ֵ��
--	��
--������
--	��
--==================================================--
function OreLevelUp(nCount)
	local worth, lvl = ComputeWorth(nCount)
	if(not worth) then return end
	--�Ѿ��õ�����ļ�ֵ����ɾ��������Ʒ��ѡ���Ӧ��������������
	local num, worth2 = ConvertWorth(worth, lvl)
	local lvl2 = lvl + 1
	
	for i=1,nCount do
		RemoveItemByIndex(GetGiveItemUnit( i ))
	end
	if (num < 1) then
		Talk(1, "", "H�! L�i th�t b�i n�a r�i, �em �t Huy�n Tinh Kho�ng Th�ch h�p th�nh c�p cao c� v� nguy hi�m ��y!")
		return
	end

	if(not num) then  --ʧ�ܣ�û��ѡ���κζ���
		Talk(1,"","<#> Th�t b�i r�i �h! Li�n h� GM �i! Ta c�ng kh�ng bi�t gi�i quy�t sao n�a!")
		print("Error: the number of ore is non.")
		return
	end
	
	AddStackItem(num, 6, 1, 147, lvl2, 1, 1, 1)
	WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..
					", s� d�ng"..worth.."Gi� tr� "..lvl.." Huy�n Tinh Kho�ng Th�ch, h�p th�nh ra"..
					num.."c�i"..lvl2.." Huy�n Tinh Kho�ng Th�ch, h� th�ng nh�n ���c"..
					worth-worth2.."Gi� tr� c�n th�a l�i.")
	Talk(1, "", "B�n �� h�p th�nh ra <color=yellow>"..num.."<color> <color=yellow>"..lvl2.."<color> Huy�n Tinh Kho�ng Th�ch ")
	Msg2Player("B�n ��t ���c"..num.." vi�n Huy�n Tinh Kho�ng Th�ch")
	return
end

function ConvertWorth(worth, lvl)
	local lvlworth = tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl + 1))
	count = floor(worth / lvlworth)
	value = count * tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl + 1))
	if ( random( lvlworth) < (worth - value) and (worth - value) ~= 0) then
		count = count + 1
	end
	return count, value
end


function main()
	Talk(1, "GiveUIForOre", "H�p th�nh Huy�n Tinh Kho�ng Th�ch c�p cao: M�i l�n b� t�i �a v�o <color=yellow>50<color> vi�n <color=yellow>��ng c�p gi�ng nhau<color>, th� c� th� h�p th�nh ra Huy�n Tinh Kho�ng Th�ch c�p cao h�n. Nh�ng t�i �a ch� h�p th�nh ra ���c Huy�n Tinh Kho�ng Th�ch c�p <color=yellow>5<color> th�i.")
	return
end

function onCancel()
end