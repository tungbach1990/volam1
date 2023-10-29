/*
if not AMULET then
	AMULET = 1
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
function ComputeAmuletWorth(nCount)
	local worth = 0	--�����ֵ��
	local maxCount = 0	--���������
	local wnum = 0

	if(nCount == 0) then
		Talk(1, "GiveUIForThing", "<#> C�i g� c�ng kh�ng ��a, ng��i mu�n l�m g� ��y!")
		return nil
	end
	for i=1, nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g, d, p, l, f = GetItemProp(itemIdx)

		if((g ~= 4 or (d < 508 or d > 518)) and (g ~= 0 or (d~=2 and d~=6 ))) then --�������  
			Talk(1, "GiveUIForThing", "<#> Ng��i ��a cho ta c�i qu�i g� th� n�y?")
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
					Talk(1,"GiveUIForThing", "<#> �� ng��i cho nhi�u qu�, nh�n kh�ng r� g� h�t!")
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
		Talk(1, "GiveUIForThing", "<#> Xin l�i! �t nh�t c�n m�t L� v�t n�m D�u.")
		return nil
	end
	if (wnum == 0) then
		Talk(1, "GiveUIForThing", "<#> Xin l�i! C�n ph�i c� m�t y ph�c (ho�c th�t l�ng) .")
		return nil
	end

	return worth, det, par, lvl, five
end

--========��������==================================--
--����ԭ�Σ�ConvertBonus(nCount)
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
function ConvertAmulet(nCount)
	local worth, d, p, lvl, five = ComputeAmuletWorth(nCount)
	if(not worth) then return end
	--�Ѿ��õ�����ļ�ֵ����ɾ��������Ʒ��ѡ���Ӧ�Ľ���
	local idx = Convert:convertamulet(worth, five)
	if(not idx) then --ʧ�ܣ�û��ѡ���κζ���
		Talk(1,"GiveUIForThing", "<#> Sao l�i th�t b�i? Kh�ng th� n�o! L�m l�i �i")
		return
	end

	for i=1,nCount do  --�۳����е���
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	return PayAmulet(idx, d, p, lvl, five)
end

--========��������==================================--
--����ԭ�Σ�PayAmulet(bonusIdx)
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
function PayAmulet(bonusIdx, det, par, level, five)
	if (det == 2) then
		if ((par >=0 and par <= 6) or (par >= 14 and par <= 20)) then
			par = 1
		else
			par = 0
		end
	end
	local num = tonumber(Convert.__amulettabfile:getCell(TF_BONUS_SEED, bonusIdx))
	local _nSeed = SetRandSeed(num)
	
	AddItem(0, 4, par, level, five,
						Convert.__amulettabfile:getCell(TF_BONUS_P1,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P2,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P3,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P4,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P5,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P6,bonusIdx),
						Convert.__amulettabfile:getCell(TF_BONUS_P7,bonusIdx))
	SetRandSeed(_nSeed)
	WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..
			", ��i ���c"..amuletmsg[par + 1][level]..", gi� tr� l�:"..
			Convert.__amulettabfile:getCell(TF_BONUS_WORTH,bonusIdx))
	Talk(1, "", "<#>B�n h�p th�nh ���c 1 "..amuletmsg[par + 1][level])
	Msg2Player("B�n nh�n ���c 1 "..amuletmsg[par + 1][level])
	return
end
