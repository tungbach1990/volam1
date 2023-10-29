-- �ļ�������bossbaoxiang.lua
-- �����ߡ���wangjingjun
-- ���ݡ���������boss����ʹ�ýű�
-- ����ʱ�䣺2011-08-29 11:44:06

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	[1]={szName="�� Ph� T� M�ng Kh�i",tbProp={6,1,2714,1,0,0},nRate = 1.1,},
	[2]={szName="�� Ph� T� M�ng Y",tbProp={6,1,2715,1,0,0},nRate = 1.1,},
	[3]={szName="�� Ph� T� M�ng Y�u ��i",tbProp={6,1,2717,1,0,0},nRate = 1.1,},
	[4]={szName="�� Ph� T� M�ng H� Uy�n",tbProp={6,1,2718,1,0,0},nRate = 1.1,},
	[5]={szName="�� Ph� T� M�ng H�ng Li�n",tbProp={6,1,2719,1,0,0},nRate = 0.5,},
	[6]={szName="�� Ph� T� M�ng B�i",tbProp={6,1,2720,1,0,0},nRate = 0.5,},
	[7]={szName="�� Ph� T� M�ng H�i",tbProp={6,1,2716,1,0,0},nRate = 0.7,},
	[8]={szName="�� Ph� T� M�ng Th��ng Gi�i Ch�",tbProp={6,1,2721,1,0,0},nRate = 0.3,},
	[9]={szName="�� Ph� T� M�ng H� Gi�i Ch�",tbProp={6,1,2722,1,0,0},nRate = 0.3,},
	[10]={szName="�� Ph� T� M�ng Kh� Gi�i",tbProp={6,1,2723,1,0,0},nRate = 0.1,},
	[11]={szName="T� M�ng L�nh",tbProp={6,1,2350,1,0,0},nRate = 0.05,},
	[12]={szName="Ch�a Kh�a Nh� �",tbProp={6,1,2744,1,0,0},nRate = 1,},
	[13]={nExp_tl=1,nRate = 39.29,nCount = 1500000,},
	[14]={nExp_tl=1,nRate = 32.14,nCount = 3000000,},
	[15]={nExp_tl=1,nRate = 16,nCount = 5000000,},
	[16]={nExp_tl=1,nRate = 2,nCount = 8000000,},
	[17]={nExp_tl=1,nRate = 1,nCount = 12000000,},
	[18]={nExp_tl=1,nRate = 0.2,nCount = 15000000,},
	[19]={nExp_tl=1,nRate = 0.1,nCount = 20000000,},
	[20]={szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nRate = 1,},
	[21]={szName="Ho�ng Kim �n (C��ng h�a)",tbProp={0,3208,},nQuality=1,nRate = 0.2,nExpiredTime = 30 * 24 * 60,},
	[22]={szName="B�ch C�u Ho�n ��c bi�t",tbProp={6,1,1157,1,0,0},nRate = 0.02,},
	[23]={szName="Ho�ng Kim �n (C��ng h�a)",tbProp={0,3218,},nQuality=1,nRate = 0.2,nExpiredTime = 30 * 24 * 60,},
}

function main(nIndexItem)
	nWidth = 1
	nHeight = 1
	nFreeItemCellLimit = 1
	-- �ж�����Կ���Ƿ����
	local nCount = CalcItemCount(3, 6, 1, 2744, -1) 
	if nCount == 0 then
		Say("C�n c� ch�a kh�a Nh� � m�i c� th� m� B�o R��ng Boss!", 1, "��ng/no")
		return 1
	end
	
	local Genre, DetailType, Particular=GetItemProp(nIndexItem)
	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end
	
	ConsumeItem(3, 1, 6, 1, 2744, -1)	-- ��������Կ��
	tbAwardTemplet:Give(%tbAward, 1, {"GoldBoss", "use_bossBox"})
	
	return 0
end