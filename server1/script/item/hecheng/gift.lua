
--========�ඨ��====================================--
--������Convert
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	������㼦����������������ϵ�ļ�ֵ�����ü�������
--����һ���Ʒ�ļ�ֵ�����Լ�ѡ��Ʒ��
--
--��Ա������
--	__gifttabfile�����������ֵ��tabfile
--	__bonustabfile����Ʒ��tabfile
--	__giftWorth���������������ļ�ֵ����
--	__bonusWorth����Ʒ�ļ�ֵ����
--��Ա������
--	:loadSettings()�������ֵ���趨�ļ���
--	:giftLevelup(worth)��������������
--	:convert(worth)����worth��ȡ��Ʒ
--
--������
--
--
--
--==================================================--

if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not MEM_HEAD then
	Include ("\\script\\lib\\mem.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
end

if not WORTHANALYSE_HEAD then
	Include ("\\script\\class\\worthanalyse.lua")
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
		self.__gifttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/giftslvlup.txt","GIFT")
		self.__crystaltabfile = new(KTabFile,"/settings/event/juanzhouhecheng/crystal.txt","CRYSTAL")		
		self.__giftWorth = new(WorthAnalyse,80)
		for i=1,self.__gifttabfile:getRow() do
			self.__giftWorth:addWorth(i,tonumber(self.__gifttabfile:getCell("Worth",i)))
		end
		self.__giftWorth:makeBaseP()
		return
	end,
	
--========��������==================================--
--����ԭ�Σ�:giftLevelup(worth)
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	�ɼ�ֵ��worthѡ����Ҫ�����õ�����������������š�
--������
--	worth����ֵ���������Ǵ�����ύ�����������������
--��ֵ���ܺ͡�
--����ֵ��
--	�ɹ��򷵻ؽ�Ҫ�����õ���������������������Ϊnil
--������
--
--
--
--==================================================--
	giftLevelup =function(self,worth)
		self.__giftWorth:makeWorthP(worth)
		return self.__giftWorth:getFromWorth()
	end,
}



TID_CLONECRYSTAL = 503
MAX_CRYSTAL_WORTH = 50000000 --����5000������ˢˮ��

MAXGIVENUM = 20  --���Ը�������������
TF_GIFT_WORTH = 3  --giftlvl.txt��worth�������
TF_GIFT_P1 = 4
TF_GIFT_P2 = 5
TF_GIFT_P3 = 6
TF_GIFT_P4 = 7
TF_GIFT_CRYPTIC = 8
TF_CRYSTAL_WORTH = 2

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
	local crystal = 0	--ˮ����ֵ��
	local maxCount = 0	--���������
	
	if(nCount == 0) then
		Talk(1, "GiveUIForGift", "<#> C�i g� c�ng kh�ng ��a, ng��i mu�n l�m g� ��y!")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)

		if(g ~= 4 or d<468 or (d >486 and d < 508) or d > 518) then --�������
			Talk(1,"GiveUIForGift","<#> Ng��i ��a cho ta c�i qu�i g� th� n�y?")
			return nil
		end
		if(d > 467 and d < 487) then -- ����
			crystal = crystal + GetItemStackCount(itemIdx)* tonumber(Convert.__crystaltabfile:getCell(TF_CRYSTAL_WORTH,(d-467)))
		else --��������
			function checkGiftCount(idx,count)  --������ص��ߵ�����
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- ����̫��
					Talk(1, "GiveUIForGift", "<#> �� ng��i cho nhi�u qu�, nh�n kh�ng r� g� h�t!")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				if (d == 518) then
					Say("L� v�t n�m D�u b�n ��t v�o trong c� L� v�t n�m D�u (c�p 10) , nh� th� s� �nh h��ng h�p th�nh th�t b�i, c� c�n h�p th�nh l�i kh�ng?", 2, "���c, h�p th�nh l�i �i!/GiveUIForGift", "Kh�ng c�n!/onCancel")
					return nil
				end
				maxCount = maxCount + num
				local lvl = d - 507
				worth = worth + num * tonumber(Convert.__gifttabfile:getCell(TF_GIFT_WORTH,lvl))
			end
		end
	end
	if(crystal > MAX_CRYSTAL_WORTH) then --��ֵ������5000w������ˢ����
		SetTask(TID_CLONECRYSTAL,GetTask(TID_CLONECRYSTAL)+1)
		return -1
	end
	if(worth ==0) then
		Talk(1, "GiveUIForGift", "<#> Xin l�i! �t nh�t c�n m�t L� v�t n�m D�u.")
		return nil
	end

	return worth + crystal
end
--========��������==================================--
--����ԭ�Σ�GiveUIForGift()
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
function GiveUIForGift()
	GiveItemUI("H�p th�nh L� v�t n�m D�u ","B�n c� th� ��t nhi�u nh�t l� 20 c�i L� v�t n�m D�u v� B�ng Tinh trong ho�t ��ng gi�ng sinh c�n d� l�i.", "GiftLevelUp", "onCancel" );
end

--========��������==================================--
--����ԭ�Σ�GiftLevelUp(nCount)
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
function GiftLevelUp(nCount)
	local worth = ComputeWorth(nCount)
	if(not worth) then return end
	--�Ѿ��õ�����ļ�ֵ����ɾ��������Ʒ��ѡ���Ӧ��������������
	for i=1,nCount do
		RemoveItemByIndex(GetGiveItemUnit( i ))
	end
	if(worth < 0) then
		--����ˢˮ�����۵�������Ʒ������¼��־
		WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..
					"Trong l�c h�p th�nh l� V�t n�m D�u, ph�t hi�n ra �� s� d�ng Th�y Tinh v��t qu� 5000 v�n. Ki�n ngh� n�n kh�a ngay Account n�y")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..
					"�� s� d�ng"..GetTask(TID_CLONECRYSTAL).."l�n, Th�y Tinh n�y c� nhi�u kh� n�ng l� phi ph�p. Xin GM h�y ch� �!")
		end
		--˵����ô���أ��Ի�һ��
		Talk(1,"","<#> H�! Chuy�n g� v�y, th�t b�i r�i �h? Sao k� v�y n̅� ")
		return
	end
	local idx = Convert:giftLevelup(worth)
	if(not idx) then  --ʧ�ܣ�û��ѡ���κζ���
		Talk(1,"","<#> H�! Chuy�n g� v�y, th�t b�i r�i �h? Sao k� v�y n̅� ")
		return
	end
	if (idx == 1) then
		Talk(1,"","<#> H�! Chuy�n g� v�y, th�t b�i r�i �h? Sao k� v�y n̅� ")
		return
	end

	AddItem(tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P1,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P2,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P3,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P4,idx)),
					0,0,0,0,0,0,0,0)
	WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName()..
					", s� d�ng"..worth.."�� s� Th�n b� l� v�t, h�p th�nh"..
					Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx).."Gi� tr� l��ng th�n b� l� v�t, h� th�ng nh�n ���c "..
					tostring(worth-Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx)).."Gi� tr� c�n th�a l�i.")
	Talk(1, "","<#> H�p th�nh ra m�t ti�m ch�t"..Convert.__gifttabfile:getCell(TF_GIFT_CRYPTIC,idx).."L� v�t n�m D�u")
	Msg2Player("B�n nh�n ���c m�t L� v�t n�m D�u")
	return
end

function main()
	Talk(1, "GiveUIForGift", "H�p th�nh L� v�t n�m D�u: ��t nhi�u nh�t l� 20 c�i <color=yellow>L� v�t n�m D�u<color>, th� c� kh� n�ng h�p th�nh ���c L� v�t n�m d�u cao c�p h�n. N�u b�n c�n d� <color=yellow>B�ng Tinh<color> trong d�p l� gi�ng sinh c�ng c� th� b� v�o �� t�ng x�c xu�t cao h�n. ")
end

function onCancel()
end