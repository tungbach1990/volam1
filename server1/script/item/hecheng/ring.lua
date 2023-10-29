/*
if not RING then
	RING = 1
end

if not SHOSHI then
	Include ("\\script\\item\\hecheng\\shoushihecheng.lua")
end
*/
--========��������==================================--
--����ԭ�Σ�ComputeJewelWorth(nCount)
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
function ComputeRingWorth(nCount)
	local worth = 0	--�����ֵ��
	local maxCount = 0	--���������
	local wnum = 0
	if(nCount == 0) then
		Talk(1,"GiveUIForThing","<#> C�i g� c�ng kh�ng ��a, ng��i mu�n l�m g� ��y!")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g, d, p, l, f = GetItemProp(itemIdx)
		if((g ~= 4 or (d < 508 or d > 518)) and (g ~= 0 or (d~=0 and d~=1 ))) then --�������  --and d~=2 and d~=5 and d~=6 and d~=7
			Talk(1,"GiveUIForThing","<#> Ng��i ��a cho ta c�i qu�i g� th� n�y?")
			return nil
		end
		if(g == 0) then -- ����
			wnum = wnum + 1
			if (wnum > 1) then	--ֻ�ܷ�һ��װ��
				Talk(1, "GiveUIForThing", "<#> Nhi�u trang b� qu� sao ta l�m k�p ��y?��")
				return nil
			end
			det = d
			par = p
			lvl = l
			five = f
		else --��������
			function checkGiftCount(idx,count)  --������ص��ߵ�����
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- ����̫��
					Talk(1,"GiveUIForRing","<#> Ng��i ��a nhi�u th� nh� v�y, nh�n th�y cho�ng��")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				maxCount = maxCount + num
				local ll = d - 508
				if(ll ==0) then
					worth = worth + num * 100000
				else
					worth = worth + num * Convert.__gifttabfile:getCell(TF_GIFT_WORTH,ll)
				end
			end
		end
	end
	if(worth ==0) then
		Talk(1,"GiveUIForThing","<#> Xin l�i! �t nh�t c�n m�t L� v�t n�m D�u.")
		return nil
	end
	if (wnum == 0) then
		Talk(1,"GiveUIForThing","<#> Xin l�i! C�n ph�i c� m�t m�n v� kh�.")
		return nil
	end
	return worth, det, par, lvl, five
end

--========��������==================================--
--����ԭ�Σ�ConvertRing(nCount)
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	�ü�����������һ���Ʒ���˺�������������ȷ����ť
--�ص���
--������
--	nCount����������е���Ʒ����
--����ֵ��
--	��
--������
--	��
--==================================================--
function ConvertRing(nCount)
	local worth, d, p, lvl, five = ComputeRingWorth(nCount)
	if(not worth) then return end
	--�Ѿ��õ�����ļ�ֵ����ɾ��������Ʒ��ѡ���Ӧ�Ľ���
	local idx = Convert:convertring(worth, five)
	if(not idx) then --ʧ�ܣ�û��ѡ���κζ���
		Talk(1,"GiveUIForThing", "<#> Sao l�i th�t b�i? Kh�ng th� n�o! L�m l�i �i")
		return
	end
		for i=1,nCount do  --�۳����е���
			RemoveItemByIndex(GetGiveItemUnit(i))
		end
		return PayRing(idx, lvl, five)
end

--========��������==================================--
--����ԭ�Σ�PayBonus(bonusIdx)
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	����ҷ���settings/event/chinesenewyear/bonuslist.txt
--�е�bonusIdx��Ľ�Ʒ
--������
--	bonusIdx����Ʒ���ţ���tabfile�е�����-1
--����ֵ��
--	��
--������
--	��
--==================================================--
function PayRing(ringIdx, level, five)
	local num = tonumber(Convert.__ringtabfile:getCell(TF_BONUS_SEED, ringIdx))
	local _nSeed = SetRandSeed(num)
	AddItem(0, 3, 0, level, five,
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P1,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P2,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P3,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P4,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P5,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P6,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P7,ringIdx)))
	SetRandSeed(_nSeed)
	WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..
			", ��i ���c"..ringmsg[level]..", gi� tr� l�:"..
			Convert.__ringtabfile:getCell(TF_BONUS_WORTH,ringIdx))
	Talk(1, "", "B�n h�p th�nh ���c 1 "..ringmsg[level])
	Msg2Player("B�n nh�n ���c 1 "..ringmsg[level])
	return
end
