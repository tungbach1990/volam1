-- �ļ�������xmas2007_itemsnowman.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2007-12-01 16:05:50

IncludeLib("NPCINFO")
IncludeLib("TASKSYS")
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\event\\xmas07_makesnowman\\head.lua")
Include("\\script\\lib\\pay.lua")

xmas2007_SnowManItem_forbitmap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

xmas2007_tbSnowManBoss = 
{
	--[��ƷPID] = {����,bossID}
	[1634] = {szName = "Ho�ng Tuy�t Nh�n", nBossId = 1329},
	[1635] = {szName = "T� Tuy�t Nh�n", nBossId = 1330},
	[1636] = {szName = "L�c Tuy�t Nh�n", nBossId = 1331},
}
xmas2007_SnowManItem_tbItemList = 
{
	--[��ƷPID] = {����,��Ʒprop������%}
	[1634] = {
		{"T� Th�y Tinh",{4,238,1,1,0,0},6.00},
		{"L�c Th�y Tinh",{4,239,1,1,0,0},5.00},
		{"Lam Th�y Tinh",{4,240,1,1,0,0},5.00},
		{"Ti�n Th�o L� ��c bi�t",{6,1,1181,1,0,0},5.00},
		{"Ti�n Th�o L� ",{6,1,71,1,0,0},10.00},
		{"Ph�c Duy�n L� (��i) ",{6,1,124,1,0,0},30.00},
		{"Tinh H�ng B�o Th�ch",{4,353,1,1,0,0},5.60},
		{"An bang b�ng tinh th�ch h�ng li�n",{0,164},0.01},
		{"An bang k� huy�t th�ch gi�i ch�",{0,167},0.02},
		{"An bang c�c hoa th�ch ch� ho�n",{0,165},0.02},
		{"An bang �i�n ho�ng th�ch ng�c b�i",{0,166},0.05},
		{"��nh qu�c � sa ph�t qu�n",{0,160},0.06},
		{"��nh qu�c thanh sa tr��ng sam",{0,159},0.06},
		{"��nh qu�c ng�n t�m y�u ��i",{0,163},0.06},
		{"��nh qu�c x�ch quy�n nhuy�n ngoa",{0,161},0.06},
		{"��nh qu�c t� ��ng h� uy�n",{0,162},0.06},
		{"Hoa Tuy�t ",{6,0,1013,1,0,0},8.25},
		{"Qu� m�u Xanh",{6,0,1012,1,0,0},8.25},
		{"Hoa h�ng",{6,0,20,1,0,0},8.25},
		{"M�t n� - Tu�n L�c",{0,11,405,1,0,0},0.60},
		{"M�t n� - �ng Gi� N�el (H�ng ph�n) ",{0,11,398,1,0,0},0.45},
		{"M�t n� - �ng Gi� N�el (xanh) ",{0,11,397,1,0,0},0.45},
		{"M�t n� - �ng Gi� N�el (tr�ng) ",{0,11,399,1,0,0},0.45},
		{"M�t n� - �ng Gi� N�el (v�ng) ",{0,11,400,1,0,0},0.45},
		{"M�t n� - �ng Gi� N�el (��) ",{0,11,394,1,0,0},0.45},
		{"M�t n� - Thi�n S� Gi�ng Sinh (��) ",{0,11,395,1,0,0},0.45},
		{"M�t n� - Thi�n S� Gi�ng Sinh (xanh) ",{0,11,401,1,0,0},0.45},
		{"M�t n� - Thi�n S� Gi�ng Sinh (tr�ng) ",{0,11,403,1,0,0},0.45},
		{"M�t n� - Thi�n S� Gi�ng Sinh (v�ng) ",{0,11,404,1,0,0},0.45},
		{"M�t n� - Thi�n S� Gi�ng Sinh (H�ng ph�n) ",{0,11,402,1,0,0},0.45},
		{"M�t n� - Tinh Linh (��) ",{0,11,423,1,0,0},0.45},
		{"M�t n� - Tinh Linh (L�c) ",{0,11,396,1,0,0},0.45},
		{"M�t n� - Tinh Linh (v�ng) ",{0,11,424,1,0,0},0.45},
		{"M�t n� - Tinh Linh (t�m) ",{0,11,422,1,0,0},0.45},
		{"M�t n� Ho�ng Tuy�t Nh�n",{0,11,425,1,0,0},0.45},
		{"M�t n� T� Tuy�t Nh�n",{0,11,426,1,0,0},0.45},
		{"M�t n� L�c Tuy�t Nh�n",{0,11,427,1,0,0},0.45},
	},
	[1636] =
	{
		{"Ti�n Th�o L� ��c bi�t",{6,1,1181,1,0,0},0.50},
		{"Ti�n Th�o L� ",{6,1,71,1,0,0},9.50},
		{"B�ch Qu� L� ",{6,1,73,1,0,0},10.00},
		{"Thi�n s�n  B�o L� ",{6,1,72,1,0,0},10.00},
		{"Ph�c Duy�n L� (��i) ",{6,1,124,1,0,0},5.00},
		{"Ph�c Duy�n L� (Trung) ",{6,1,123,1,0,0},10.00},
		{"Qu� Hoa T�u",{6,1,125,1,0,0},5.00},
		{"M�t n� - Tu�n L�c",{0,11,405,1,0,0},12.50},
		{"Hoa Tuy�t ",{6,0,1013,1,0,0},12.50},
		{"Qu� m�u Xanh",{6,0,1012,1,0,0},8.25},
		{"Hoa h�ng",{6,0,20,1,0,0},12.50},
	}
}
function main(nItemIndex)
	local _, _, PID			= GetItemProp(nItemIndex);
	local szItemName		= GetItemName(nItemIndex);
	local tbSnowManBossInfo	= xmas2007_tbSnowManBoss[PID];
	local nCurExp			= GetTask(xmas2007_SnowManItem_TSK_ExpLimit);
	local nExp				= 1000000
	local nTotalRate		= 100000;
	local nRate				= floor(nTotalRate*5/100)
	if xmas07_makeSnowMan_isUsePeriod() == 0 then
		Msg2Player("V�t ph�m �� qu� h�n s� d�ng, s� b� m�t �i.")
		return 0
	end
	if xmas2007_SnowManItem_CheckForbitMap() == 1 then
		return 1
	end
	if IsCharged() == 0 or GetLevel() < 50 then
		Msg2Player("Ng��i ch�i c�p 50 tr� l�n �� n�p th� m�i c� th� s� d�ng v�t ph�m n�y.")
		return 1;
	end
	if nCurExp >= xmas2007_SnowManItem_ExpMax then
		Msg2Player("S� d�ng ng��i Tuy�t �� v��t gi�i h�n �i�m kinh nghi�m, kh�ng th� s� d�ng n�a.")
		return 1;
	else
		AddOwnExp(nExp);
		SetTask(xmas2007_SnowManItem_TSK_ExpLimit,nCurExp+nExp);
	end
	
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tUse a %s.",xmas07_makeSnowMan_ActName,
            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szItemName ))
	if random(1,nTotalRate) <= nRate then
		local W,X,Y=GetWorldPos()
		local nSeries = random(0,4)
		AddNpcEx(tbSnowManBossInfo.nBossId, 90, nSeries, SubWorld, X*32, Y*32,1, tbSnowManBossInfo.szName, 2)
		
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tcall a boss %s.",xmas07_makeSnowMan_ActName,
            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szItemName ))
	end
	xmas2007_SnowManItem_GiveRandomItem(xmas2007_SnowManItem_tbItemList[PID])
	return 0;
end



function xmas2007_SnowManItem_CheckForbitMap()
	local W,X,Y=GetWorldPos()
	local nMapId = W;
	local i;
	if ( GetFightState() == 0 ) then	--��ս��������
		Msg2Player("Kh�ng � trong tr�ng th�i chi�n ��u th� kh�ng th� s� d�ng");
		return 1
	end
	for i = 249, 318 do	--ϴ�赺ɽ��
		if ( i == nMapId ) then
			Msg2Player("N�i ��y kh�ng th� s� d�ng v�t ph�m n�y ");
			return 1
		end
	end	
	for i = 375, 415 do	--�����ν�ս����ͼ ���������ͼ �������ͼ
		if ( i == nMapId ) then
			Msg2Player("N�i ��y kh�ng th� s� d�ng v�t ph�m n�y ");
			return 1
		end
	end	

	for i = 1, getn( xmas2007_SnowManItem_forbitmap ) do		--�����ͼ����
		if( xmas2007_SnowManItem_forbitmap[i] == nMapId ) then
			Msg2Player("N�i ��y kh�ng th� s� d�ng v�t ph�m n�y ");
			return 1
		end
	end
	
	if (CheckAllMaps(nMapId) == 1) then
		Msg2Player("Tri�u h�i l�nh b�i kh�ng th� s� d�ng t�i khu v�c ��c th� n�y.");
		return 1
	end
	return 0		
end