-- �ļ�������xmas2007_giftbox.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2007-11-26 14:42:26

--ʱ�䣺2008 ��01 ��13 �� 24��00
--ʱ�ޣ�2008 ��01 ��31 �� 24��00
--���ԣ����ף��ӵ�����̯������ = 0 ��������50��/λ
--ʹ��: �Ҽ����ʹ�û�ø������

Include("\\script\\event\\xmas07_makesnowman\\head.lua")
xmas2007_GiftBox_tbItemList =
{
	--����,{��ƷProp},����%,
	{"Kim B�ng Tinh",{6,1,1628,1,0,0},10},
	{"M�c B�ng Tinh",{6,1,1629,1,0,0},15},
	{"Th�y B�ng Tinh",{6,1,1630,1,0,0},20},
	{"H�a B�ng Tinh",{6,1,1631,1,0,0},25},
	{"Th� B�ng Tinh",{6,1,1632,1,0,0},30},
}

function main()
	if xmas07_makeSnowMan_isActPeriod() == 0 then
		Msg2Player("V�t ph�m �� qu� h�n s� d�ng, s� b� m�t �i.")
		return 0;
	end
	xmas2007_SnowManItem_GiveRandomItem(xmas2007_GiftBox_tbItemList);
end


