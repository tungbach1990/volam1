-- �ļ�������makesnowman.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2007-11-23 10:56:30

Include("\\script\\event\\xmas07_makesnowman\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\basic.lua");
function main()
	xmas07_makeSnowMan_main()
end
function xmas07_makeSnowMan_main()
	if xmas07_makeSnowMan_isActPeriod() == 0 then
		Say(format("Ho�t ��ng <color=yellow>%s<color> �� k�t th�c!",xmas07_makeSnowMan_ActName),0)
		return 0;
	end
	local tbDialog =
	{
		"<dec><npc>Ha ha, gi�ng sinh vui v�!",
		"Ta mu�n t�m hi�u n�i dung ho�t ��ng/xmas07_makeSnowMan_Content",
		"Ta mu�n t�o ng��i tuy�t./xmas07_makeSnowMan_wantCompose",
		"K�t th�c ��i tho�i/OnCancel",
	}

	CreateTaskSay(tbDialog)
end
function xmas07_makeSnowMan_Content()
	local tbDialog =
	{
		"<dec><npc>T� <color=red>0h00 ng�y 08-12-2007 ��n 24h00 ng�y 13-01-2008<color>, c�c v� l�m nh�n s� khi ��nh qu�i s� c� c� h�i nh�t ���c <color=yellow>�H�p qu� gi�ng sinh�<color>, m� h�p qu� gi�ng sinh s� ng�u nhi�n nh�n ���c nguy�n li�u t�o ng��i tuy�t. Sau khi thu th�p �� nguy�n li�u c� th� ��n ��y �� ch� t�o <color=yellow>Ng��i Tuy�t <color> c�c lo�i.<enter>� khu v�c b�n ngo�i th�nh, s� d�ng  �Ho�ng Tuy�t Nh�n�, �T� Tuy�t Nh�n� ho�c �L�c Tuy�t Nh�n� c� th� nh�n ���c <color=red>1000000 �i�m kinh nghi�m<color> v� 1 <color=red>v�t ph�m ng�u nhi�n<color>, d� nhi�n n�u may m�n c� th� g�i ra <color=yellow>Boss Tuy�t Nh�n<color>, ��nh b�i Boss Tuy�t Nh�n s� c� c� h�i nh�n ���c ph�n th��ng c� gi� tr�.",
		"Ha ha, ta hi�u r�i/xmas07_makeSnowMan_main"
	}
	CreateTaskSay(tbDialog)
end
function xmas07_makeSnowMan_wantCompose()
	local tbDialog = 
	{
		"<dec><npc>C�c v� l�m nh�n s� khi ��nh qu�i s� c� c� h�i nh�t ���c <color=yellow>B�ng Tinh<color> h� kim, m�c, th�y, h�a, th�. S� d�ng c�c lo�i b�ng tinh kh�c nhau s� ch� t�o ���c Ng��i Tuy�t kh�c nhau, ��i hi�p mu�n lo�i n�o?",
		"Ta mu�n ch� t�o 'Ho�ng Tuy�t Nh�n'/#xmas2007_makeSnowMan_compose([[Yellow]])",
		"Ta mu�n ch� t�o 'T� Tuy�t Nh�n'/#xmas2007_makeSnowMan_compose([[Purple]])",
		"Ta mu�n ch� t�o 'L�c Tuy�t Nh�n'/#xmas2007_makeSnowMan_compose([[Green]])",
		"L�c kh�c quay l�i/OnCancel"
	}
	CreateTaskSay(tbDialog)
end
xmas2007_makeSnowMan_tbItem =
{
	{1, {6,1,1634,1,0,0}, "Ho�ng Tuy�t Nh�n"},
	{1, {6,1,1635,1,0,0}, "T� Tuy�t Nh�n"},
	{1, {6,1,1636,1,0,0}, "L�c Tuy�t Nh�n"},
}
xmas2007_makeSnowMan_tbMaterial =
{
	{0, {6,1,1633,nil,nil,nil}, "Ng� S�c B�ng Tinh"},
	{0, {6,1,1628,nil,nil,nil}, "Kim B�ng Tinh"},
	{0, {6,1,1629,nil,nil,nil}, "M�c B�ng Tinh"},
	{0, {6,1,1630,nil,nil,nil}, "Th�y B�ng Tinh"},
	{0, {6,1,1631,nil,nil,nil}, "H�a B�ng Tinh"},
	{0, {6,1,1632,nil,nil,nil}, "Th� B�ng Tinh"},
}
xmas2007_makeSnowMan_Recipe =
{
	Yellow	= {tbItemList = {1,2,3,4,5,6}, nMoney = 0, tbResult = xmas2007_makeSnowMan_tbItem[1]},		--1��ɫ���� + 2 ����� + 3 ľ���� + 4 ˮ���� + 5 ����� + 6 ������
	Purple	= {tbItemList = {0,2,3,4,5,6}, nMoney = 0, tbResult = xmas2007_makeSnowMan_tbItem[2]},		--0��ɫ���� + 2 ����� + 3 ľ���� + 4 ˮ���� + 5 ����� + 6 ������
	Green	= {tbItemList = {0,2,3,4,5,6},nMoney = 100000, tbResult = xmas2007_makeSnowMan_tbItem[3]},	--10 ���� + 0��ɫ���� + 2 ����� + 3 ľ���� + 4 ˮ���� + 5 ����� + 6 ������
}

function xmas2007_makeSnowMan_ComposeConfirm(szSelect)
	local tbMaterial = xmas2007_makeSnowMan_tbMaterial;
	local szMaterialList = nil;
	for i=1,getn(tbMaterial) do
		tbMaterial[i][1] = xmas2007_makeSnowMan_Recipe[szSelect].tbItemList[i];
		if tbMaterial[i][1] ~= 0 then
			if not szMaterialList then
				szMaterialList = format("<color=red>%d<color> <color=yellow>%s<color>",tbMaterial[i][1],tbMaterial[i][3])
			else
				szMaterialList = format("%s, <color=red>%d<color> <color=yellow>%s<color>",szMaterialList,tbMaterial[i][1],tbMaterial[i][3])
			end
		end
	end
	local tbAwardItem = xmas2007_makeSnowMan_Recipe[szSelect].tbResult
	local nMoney = xmas2007_makeSnowMan_Recipe[szSelect].nMoney;
	
	if xmas2007_makeSnowMan_CheckMaterial(tbMaterial) ~= 1 then
		Say(format("��i hi�p kh�ng c� �� nguy�n li�u, c�n ph�i c� %s m�i c� th� ch� t�o ���c.",szMaterialList), 1 , "Th�t ng�i qu�, ta s� quay l�i sau./OnCancel")
		return 0;
	end
	if Pay(nMoney) == 0 then
		Say(format("Kh�ng ���c r�i, kh�ng mang theo �� ti�n, c�n c� <color=yellow>%d<color> l��ng",nMoney),0)
		return 0;
	end
	if nMoney ~= 0 then
		Msg2Player(format("Ti�u ph� <color=yellow>%d<color> l��ng",nMoney))
	end
	if xmas2007_makeSnowMan_ConsumeMaterial(tbMaterial) ~= 1 then
		Say("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.",0)
		return 0;
	end
	xmas2007_SnowManItem_AddItem(tbAwardItem[3],tbAwardItem[2]);
	Say(format("�ng gi� Tuy�t: Ha ha, <color=yellow>%s<color> �� ch� t�o th�nh c�ng, h�y nh�n l�y!",tbAwardItem[3]))
end
function xmas2007_makeSnowMan_compose(szSelect)
	local tbMaterial = xmas2007_makeSnowMan_tbMaterial;
	local szMaterialList = nil;
	for i=1,getn(tbMaterial) do
		tbMaterial[i][1] = xmas2007_makeSnowMan_Recipe[szSelect].tbItemList[i];
		if tbMaterial[i][1] ~= 0 then
			if not szMaterialList then
				szMaterialList = format("<color=red>%d<color> <color=yellow>%s<color>",tbMaterial[i][1],tbMaterial[i][3])
			else
				szMaterialList = format("%s, <color=red>%d<color> <color=yellow>%s<color>",szMaterialList,tbMaterial[i][1],tbMaterial[i][3])
			end
		end
	end
	local tbAwardItem = xmas2007_makeSnowMan_Recipe[szSelect].tbResult
	local nMoney = xmas2007_makeSnowMan_Recipe[szSelect].nMoney;
	if nMoney ~= 0 then 
		szMaterialList = format("%s, c�n ph�i c� <color=yellow>%d<color> l��ng",szMaterialList,nMoney)
	end
	local tbNpcSay =
	{
		format("<dec><npc>Ch� t�o <color=yellow>%s<color>, c�n c�: %s.",tbAwardItem[3],szMaterialList),
		format("Ch� t�o ng��i Tuy�t/#xmas2007_makeSnowMan_ComposeConfirm([[%s]])",szSelect),
		"�� ta chu�n b� ��/OnCancel",
	}
	CreateTaskSay(tbNpcSay)
end

function xmas2007_makeSnowMan_CheckMaterial(tbMaterial)
	for i=1,getn(tbMaterial) do
		local tbItem =  tbMaterial[i]
		local nLevel = tbItem[2][4] or -1
		if tbItem[1] > 0 and CalcEquiproomItemCount(tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel) < tbItem[1] then
			return 0;
		end
	end
	return 1;
end

function xmas2007_makeSnowMan_ConsumeMaterial(tbMaterial)
	for i=1,getn(tbMaterial) do
		local tbItem =  tbMaterial[i]
		local nLevel = tbItem[2][4] or -1
		--print(tbItem[1],tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel)
		if tbItem[1] > 0 and ConsumeEquiproomItem(tbItem[1],tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel) ~= 1 then
			return 0;
		end
	end
	return 1;
end

function OnCancel()
end