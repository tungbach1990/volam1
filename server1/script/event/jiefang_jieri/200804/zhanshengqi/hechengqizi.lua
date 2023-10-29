-- �ļ�������hechengqizi.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-14 14:32:38

--10 �����Ƭ1 + 6 �����Ƭ2 + 3 �����Ƭ3 + 1 �����Ƭ4 + 3 ����	��ã�1��սʤ��
--��ע��- ԭ�Ͻ�������ұ������Զ��۳���

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_zhanshengqi = {}

jiefang_0804_zhanshengqi.szName = "jiefang_0804_zhanshengqi"

jiefang_0804_zhanshengqi.tbRecipe =
{
	tbItemList = {
		{szName="M�nh c� 1", tbProp={6, 1, 1735}, nCount = 10},
		{szName="M�nh c� 2", tbProp={6, 1, 1736}, nCount = 6},
		{szName="M�nh c� 3", tbProp={6, 1, 1737}, nCount = 3},
		{szName="M�nh c� 4", tbProp={6, 1, 1738}, nCount = 1},
	},
	nMoney = 30000,
	tbAwardItem =
	{
		{szName="L� C� Chi�n Th�ng", tbProp={6, 1, 1739, 1, 0, 0}},
	}
}

function jiefang_0804_zhanshengqi:main()
	local tbSay = 
	{
		"<dec><npc>T� 26-04-2008 ��n 24h00 18-05-2008, khi ��nh qu�i s� thu th�p ���c c�c m�nh c�, c� th� mang c�c m�nh c� ��n l�o phu �� h�p th�nh l� c� chi�n th�ng ho�n ch�nh.",
		format("Ta mu�n h�p th�nh L� c� chi�n th�ng/#%s:Compose()", self.szName),
		"Ta s� gh� l�i sau/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_zhanshengqi:Compose()
	if (CalcFreeItemCellCount() < 10) then
		Say("T�i h�nh trang �� ��y, h�y d�n d�p h�nh trang �� b�o ��m an to�n cho v�t ph�m.",0)
		return 0;
	end
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose("H�p th�nh 1 l� c� chi�n th�ng", tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "L� Quan: Ch�c m�ng ��i hi�p �� h�p th�nh l� c� chi�n th�ng ho�n ch�nh!", 0)
end