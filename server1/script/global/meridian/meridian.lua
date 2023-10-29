Include("\\script\\global\\meridian\\lang.lua")

--��������ID
local tbHuMaiDan = {6, 1, 3203};

local tbLevel2Item = 
{
--�i�u ch�nh kinh m�ch - by NgaVN 
	[5] = {szName = "Huy�t Long ��ng c�p 4", tbProp = {6, 1, 30289,4}, nCount = 10}, --Item c�p 4
	[6] = {szName = "Huy�t Long ��ng c�p 5", tbProp = {6, 1, 30289,5}, nCount = 10}, --Item c�p 5
	[7] = {szName = "Huy�t Long ��ng c�p 6", tbProp = {6, 1, 30289,6}, nCount = 10}, --Item c�p 6
	[8] = {szName = "Huy�t Long ��ng c�p 2", tbProp = {6, 1, 3328,2}, nCount = 10},
	[9] = {szName = "Huy�t Long ��ng c�p 8", tbProp = {6, 1, 30289,8}, nCount = 10}, --Item c�p 8
	[10] = {szName = "Huy�t Long ��ng c�p 9", tbProp = {6, 1, 30289,9}, nCount = 10},--Item c�p 9
	[11] = {szName = "Huy�t Long ��ng c�p 5", tbProp = {6, 1, 3328,5}, nCount = 10},
	[12] = {szName = "Huy�t Long ��ng", tbProp = {6, 1, 3328,6}, nCount = 10},
	[13] = {szName = "Huy�t Long ��ng c�p 12", tbProp = {6, 1, 30289,12}, nCount = 10},--Item c�p 12
	[14] = {szName = "Huy�t Long ��ng c�p 8", tbProp = {6, 1, 3328,8}, nCount = 10},
	[15] = {szName = "Huy�t Long ��ng 14", tbProp = {6, 1, 30289,14}, nCount = 10},--Item c�p 14
	[16] = {szName = "Huy�t Long ��ng c�p 10", tbProp = {6, 1, 3328,10}, nCount = 10},
}

--��Ѩ���
function MeridianLevelUpCheck(nMeridianIndex, nNewLevel, nNeedZY, nNeedHMD, nZYTaskID,nWay)
	
	--Temporarily close 4 meridians - Modified By admin
	--if nMeridianIndex >= 1 and nMeridianIndex < 5 then
	--	Msg2Player(MSG_CLOSE_MERIDIANS);
	--	return 0;
	--end
	if nWay == 1 then
		local tbItem = %tbLevel2Item[nNewLevel]
		if not tbItem then
			Msg2Player("Huy�t Long ��ng kh�ng c� hi�u qu� ��i v�i t�ng kinh m�ch n�y")
			return 0;
		end
		--��Ҫ����������
		if CalcItemCount(3, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4]) < tbItem.nCount then
			Msg2Player(format("��i hi�p h�y ki�m tra l�i trong h�nh trang Huy�t Long ��ng �� ch�nh x�c hay ch�a, c�n ph�i %d c�i %s.", tbItem.nCount, tbItem.szName));
			return 0;
		end
	end
	
	--��Ҫ��Ԫ����
	if GetTask(nZYTaskID) < nNeedZY then
		Msg2Player(format("Mu�n xung kai huy�t v� n�y c�n %d �i�m Ch�n Nguy�n, Ch�n Nguy�n c�a c�c h� kh�ng ��!", nNeedZY));
		return 0;
	end
	--��Ҫ����������
	if CalcItemCount(3, %tbHuMaiDan[1], %tbHuMaiDan[2], %tbHuMaiDan[3], -1) < nNeedHMD then
		Msg2Player(format("Mu�n xung kai huy�t v� n�y c�n %d H� M�ch ��n, H� M�ch ��n c�a c�c h� kh�ng ��!", nNeedHMD));
		return 0;
	end
	return 1;
end

--��Ѩ����Ʒ����ʾ
function MeridianLevelUp(nMeridianIndex, nAcupIndex, nSuccessRate, nRollBackLevel, szMeridianName, szAcupName, nNeedZY, nNeedHMD, nZYTaskID, nWay)

	if MeridianLevelUpCheck(nMeridianIndex, nAcupIndex, nNeedZY, nNeedHMD, nZYTaskID, nWay) == 0 then
		return 0;
	end
	local bProtection = nil;
	if nWay == 1 then
		local tbItem = %tbLevel2Item[nAcupIndex]
		ConsumeItem(3, tbItem.nCount, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4])
		bProtection = 1
		nRollBackLevel = nAcupIndex - 1
	end
	
	if ConsumeItem(3, nNeedHMD, %tbHuMaiDan[1], %tbHuMaiDan[2], %tbHuMaiDan[3],-1) ~= 1 then
		return 0;
	end
	
	SetTask(nZYTaskID, GetTask(nZYTaskID) - nNeedZY);
	
	if random(1, 10000) <= nSuccessRate then
		Msg2Player(format("[%s] huy�t v� [%s] �� xung huy�t th�nh c�ng, ti�u hao %d �i�m Ch�n Nguy�n v� %d H� M�ch ��n!", szMeridianName, szAcupName, nNeedZY, nNeedHMD));
		return 1;
	else
		if bProtection then
			Msg2Player("Do c� Huy�t Long ��ng b�o h�, kinh m�ch s� kh�ng b� t�n th�t.")
		end
		if nRollBackLevel == nAcupIndex - 1 then
			Msg2Player(format("[%s] huy�t v� [%s] xung huy�t th�t b�i, ti�u hao %d �i�m Ch�n Nguy�n v� %d H� M�ch ��n!", szMeridianName, szAcupName, nNeedZY, nNeedHMD));
		elseif nRollBackLevel == 0 then
			Msg2Player(format("[%s] huy�t v� [%s] xung huy�t th�t b�i, ti�u hao %d �i�m Ch�n Nguy�n v� %d H� M�ch ��n! [%s] ��ng c�p h� xu�ng %d c�p!", szMeridianName, szAcupName, nNeedZY, nNeedHMD, szMeridianName, nRollBackLevel));
		else
			Msg2Player(format("[%s] huy�t v� [%s] xung huy�t th�t b�i, ti�u hao %d �i�m Ch�n Nguy�n v� %d H� M�ch ��n! [%s] ��ng c�p h� xu�ng %d c�p!", szMeridianName, szAcupName, nNeedZY, nNeedHMD, szMeridianName, nRollBackLevel));
		end
		return -1, nRollBackLevel;
	end
end

--�����ȼ�������ʱ���Ὺ��
function MeridianLevelTimeLineCheck(nLevel)
	return 1;
end

--��Ѩ�ɹ��Ļص�
function OnLevelUpSuccess()
	SetUpSkillIDAndLevel();
end

--��Ѩʧ�ܵĻص�
function OnLevelUpFailed()
	SetUpSkillIDAndLevel();
end

--��ȡ��������ƽ���ȼ�
function GetAvgMeridianLevel()
	local nTotal = 0
	for i= 4001, 4008 do 
		nTotal = nTotal + GetTask(i)
	end
	return floor(nTotal / 8)
end

--����ID��GetLastFactionNumber()����Ӧ���׼���ID
tbFactionToSkillId = {
	[1] = 1220,
	[2] = 1221,
	[3] = 1223,
	[4] = 1222,
	[5] = 1224,
	[6] = 1225,
	[7] = 1227,
	[8] = 1226,
	[9] = 1228,
	[10] = 1229,
};


--���ݾ�����ƽ���ȼ��ͽ�ɫ�����������ý��׼���
function SetUpSkillIDAndLevel()
	local nSkillLevel = %GetAvgMeridianLevel();
	local nFaction = GetLastFactionNumber();
	local nSkillID = %tbFactionToSkillId[nFaction + 1];
	if nSkillID then
		if HaveMagic(nSkillID) ~= nSkillLevel then
			AddMagic(nSkillID, nSkillLevel);
			Msg2Player(format("Ng��i nh�n ���c v� c�ng th�t truy�n c�a m�n ph�i c�p %d, m� trang k� n�ng ra xem. ", nSkillLevel));
		end
	end
end
