/*
if not AMULET then
	Include ("\\script\\item\\hecheng\\amulet.lua")
end

if not PENDANT then
	Include ("\\script\\item\\hecheng\\pendant.lua")
end

if not RING then
	Include ("\\script\\item\\hecheng\\ring.lua")
end
if not SHOSHI then
	SHOUSHI = 1
end
*/

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
	Include ("\\script\\item\\hecheng\\worthanalyse.lua")
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
		self.__ringtabfile = new(KTabFile,"/settings/event/juanzhouhecheng/ringlist.txt","RING")
		self.__amulettabfile = new(KTabFile,"/settings/event/juanzhouhecheng/amuletlist.txt","AMULET")
		self.__pendanttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/pendantlist.txt","PENDANT")
		self.__pendantWorth = new(WorthAnalyse,80)
		self.__amuletWorth = new(WorthAnalyse,80)
		self.__ringWorth = new(WorthAnalyse,80)
		return
	end,
	
	
--========��������==================================--
--����ԭ�Σ�:convert(worth)
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	�ɼ�ֵ��worth�������ҽ�Ҫ�ĵ��Ľ�����š�
--������
--	worth����������ļ�ֵ��֮�͡�
--����ֵ��
--	����ɹ����򷵻����õ�����������������Ϊnil
--������
--
--==================================================--
	convertring = function(self,worth,mark)
		for i=1,self.__ringtabfile:getRow() do
			if (tonumber(self.__ringtabfile:getCell("Ng� H�nh",i)) == mark or tonumber(self.__ringtabfile:getCell("Ng� H�nh",i)) == 9) then
				self.__ringWorth:addWorth(i, tonumber(self.__ringtabfile:getCell("Worth",i)), tonumber(self.__ringtabfile:getCell("mID",i)))
			else
				self.__ringWorth:addWorth(i, 0, tonumber(self.__ringtabfile:getCell("mID",i)))
			end
		end
		self.__ringWorth:makeBaseP()
		self.__ringWorth:makeWorthP(worth)
		return self.__ringWorth:getFromWorth()
	end,
	convertpendant = function(self,worth, mark)
		for i=1,self.__pendanttabfile:getRow() do
			if (tonumber(self.__pendanttabfile:getCell("Ng� H�nh",i)) == mark or tonumber(self.__pendanttabfile:getCell("Ng� H�nh",i)) == 9) then
				self.__pendantWorth:addWorth(i, tonumber(self.__pendanttabfile:getCell("Worth",i)), tonumber(self.__pendanttabfile:getCell("mID",i)))
			else
				self.__pendantWorth:addWorth(i, 0, tonumber(self.__pendanttabfile:getCell("mID",i)))
			end
		end
		self.__pendantWorth:makeBaseP()
		self.__pendantWorth:makeWorthP(worth)
		return self.__pendantWorth:getFromWorth()
	end,
	convertamulet = function(self,worth, mark)		
		for i=1,self.__amulettabfile:getRow() do
			if (tonumber(self.__amulettabfile:getCell("Ng� H�nh",i)) == mark or tonumber(self.__amulettabfile:getCell("Ng� H�nh",i)) == 9) then
				self.__amuletWorth:addWorth(i, tonumber(self.__amulettabfile:getCell("Worth",i)), tonumber(self.__amulettabfile:getCell("mID",i)))
			else
				self.__amuletWorth:addWorth(i, 0, tonumber(self.__amulettabfile:getCell("mID",i)))
			end
		end
		self.__amuletWorth:makeBaseP()
		self.__amuletWorth:makeWorthP(worth)
		return self.__amuletWorth:getFromWorth()
	end	 
}

--eg.
Convert:loadSettings()
ringmsg = 
	{
		"Ho�ng Ng�c Gi�i Ch�",
		"C�m L�m Th�ch Gi�i Ch�",
		"Ph� Dung Th�ch Gi�i Ch�",
		"Ph� Th�y Gi�i Ch�",
		"Th�y L�u Th�ch Gi�i Ch�",
		"T� M�u L�c Gi�i Ch�",
		"H�i Lam B�o Th�ch Gi�i Ch�",
		"H�ng B�o Th�ch Gi�i Ch�",
		"Lam B�o Th�ch Gi�i Ch�",
		"To�n Th�ch Gi�i Ch�"
	}

pendantmsg = 
	{
		{"Hu�n Y H��ng Nang","M�t L� H��ng Nang","Nh� H��ng H��ng Nang","Lan Hoa H��ng Nang","H�p Hoan H��ng Nang","T� T� H��ng Nang","Tr�m ��n H��ng Nang","Ti�n X� H��ng Nang","Gi� Nam H��ng Nang","Long Ti�n H��ng Nang"},
		{"Du Di�n Ng�c B�i ","Kinh B�ch Ng�c B�i ","��o Hoa Ng�c B�i ","Mai Hoa  Ng�c B�i ","Ng� S�c Ng�c B�i ","Thanh Ng�c Ng�c B�i ","B�ch Ng�c Ng�c B�i ","M�c Ng�c Ng�c B�i ","Ho�ng Ng�c Ng�c B�i ","D��ng Chi B�ch Ng�c"}
	}
	
amuletmsg = 
	{
		{"��ng H�ng Li�n","Ng�n H�ng Li�n","Kim H�ng Li�n","B�ch Kim H�ng Li�n","Ng�c Ch�u H�ng Li�n","L�c T�ng Th�ch H�ng Li�n","Th�y Tinh H�ng Li�n ","Kh�ng T��c Th�ch H�ng Li�n","Tr�n Ch�u H�ng Li�n","To�n Th�ch H�ng Li�n"},
		{"L�c T�ng Th�ch H� Th�n ph� ","San H� H� Th�n ph� ","Mi�u Nh�n H� Th�n ph� ","H� T�nh H� Th�n ph� ","Th�y Tinh H� Th�n ph� ","H� Ph�ch H� Th�n ph� ","B�ch Ph� Th�y H� Th�n ph� ","H�ng Ph� Th�y H� Th�n ph� ","T� Ph� Th�y H� Th�n ph� ","L�c Ph� Th�y H� Th�n ph� "}
	}

MAXGIVENUM = 20  --���Ը�������������
TF_GIFT_WORTH = 3  --giftlvl.txt��worth�������

TF_BONUS_WORTH = 3 
TF_BONUS_SEED = 4
TF_BONUS_P1 = 5
TF_BONUS_P2 = 6
TF_BONUS_P3 = 7
TF_BONUS_P4 = 8
TF_BONUS_P5 = 9
TF_BONUS_P6 = 10
TF_BONUS_P7 = 11
TF_BONUS_F = 12



function main()
	Talk(1, "GiveUIForThing", "H�p th�nh nh�n: M�i l�n b� t�i �a v�o <color=yellow>20<color> l� v�t n�m D�u v� m�t m�n <color=yellow>v� kh�<color> m�u xanh, c� th� h�p th�nh ra ��ng c�p t��ng �ng, trang s�c thu�c t�nh ng� h�nh. Ta c�ng b� nhi�u l� v�t n�m D�u v�o thu�c t�nh c�a nh�n c�ng cao.<enter>C�ch th�c ��i: V� kh� ��i nh�n; kh�n ��i ho�c gi�y ��i �ai th�t; y ph�c ho�c y�u ��i ��i d�y chuy�n")
end

function GiveUIForThing()
	GiveItemUI("Giao di�n h�p th�nh trang s�c","Thanh c�ng c� ph�a d��i ��t v�o nhi�u nh�t 20 l� v�t n�m d�u v� m�t v� kh�.", "ConvertThing", "onCancel" );
end

function ConvertThing(nCount)
	local worth = 0	--�����ֵ��
	local maxCount = 0	--���������
	local wnum = 0
	local thindex = 0
	if(nCount == 0) then
		Talk(1,"GiveUIForThing","<#> C�i g� c�ng kh�ng ��a, ng��i mu�n l�m g� ��y!")
		return nil
	end
	for i=1,nCount do
		itemIdx = GetGiveItemUnit( i )
		g, d, p, l, f = GetItemProp(itemIdx)
		if((g ~= 4 or (d < 508 or d > 518)) and (g ~= 0 or (d~=0 and d~=1 and d ~= 2 and d ~= 5 and d ~= 6 and d ~= 7 ))) then --�������  --and d~=2 and d~=5 and d~=6 and d~=7
			Talk(1,"GiveUIForThing","<#> Ng��i ��a cho ta c�i qu�i g� th� n�y?")
			return nil
		end
		if(g == 0 ) then -- ����װ��
		magictype = GetItemMagicAttrib(itemIdx, 1)
			if (not magictype) then
				Talk(1, "GiveUIForThing", "<#> Ng��i ��a ta m�t v� kh� ph�i c� thu�c t�nh m�u xanh. ")
				return
			end
		if (magictype == 0 ) then
			Talk(1, "GiveUIForThing", "<#> Ng��i ��a ta m�t v� kh� ph�i c� thu�c t�nh m�u xanh. ")
			return
		end	
			wnum = wnum + 1
			thindex = itemIdx
		else --��������

		end
	end
	if (wnum > 1) then	--ֻ�ܷ�һ��װ��
		Talk(1, "GiveUIForThing", "<#> Nhi�u trang b� qu� sao ta l�m k�p ��y?��")
		return nil
	end	
	if (wnum < 1) then
		Talk(1, "GiveUIForThing", "<#> V� kh� g� c�ng kh�ng ��t v�o sao ��i trang s�c ��y?")
		return
	end
	gg, dd = GetItemProp(thindex)
	if(gg == 0 and (dd == 0 or dd == 1)) then -- ��ָ
		ConvertRing(nCount)
	elseif (gg == 0 and (dd == 2 or dd == 6)) then --����
		ConvertAmulet(nCount)
	elseif (gg == 0 and (dd == 7 or dd == 5)) then --��׹
		ConvertPendant(nCount)
	end
end

function onCancel()
end