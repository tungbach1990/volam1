Include("\\script\\lib\\progressbar.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\29\\head.lua")

--Fix bug missing LanHuan positions - Modified by DinhHQ - 20110425
tbLanHuanCaoPos = 
	{
		{153,1745,3213,},
		{153,1724,3192,},
		{153,1757,3197,},
	}
tbLanHuaCao = {
		szName = "B�i Hoa Lan R�ng", 
		nLevel = 95,
		nNpcId = 1782,
		nIsboss = 0,
		tbNpcParam = {},
		szScriptPath = "\\script\\activitysys\\config\\29\\lanhuacao.lua",
	}

local _Limit = function(nNpcIdx)
	local tbAllowTime = {
		{123000,130000},
		{200000,203000},
	}
	
	if not pActivity:CheckDate() then
		Msg2Player(format("Th�i gian ho�t ��ng �� qua, kh�ng th� ti�p t�c thu th�p n�a."))
		return
	end
	
	if (not PlayerFunLib:CheckTotalLevel(120,"��ng c�p c�a ng��i ch�a �� 120",">=")) then
		return
	end
	
	if (not lib:CheckTime(tbAllowTime,"Hi�n t�i kh�ng ph�i th�i gian thu th�p, m�i ng�y v�o l�c 12:30 ��n 13:00 v� 20:00 ��n 20:30 h�ng ��n nh�.")) then
		return
	end
	
	return 1
end

local _GetFruit = function(nNpcIdx, dwNpcId)
	
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end
	local nLimit = %_Limit(nNpcIdx)
	
	if not nLimit then
		return 0
	end

	local nNpcParam = GetNpcParam(nNpcIdx, 1)
	--һ���Ӻ�����
	--HideNpc(nNpcIdx, 60*18)--��֪��Ϊʲô���������ص�NPC��NPC�Ͳ����ٳ�����,�ĳ�ɾ����call�ķ�ʽ
	DelNpc(nNpcIdx)
	DynamicExecute("\\script\\activitysys\\config\\29\\lanhuacao.lua","AddTimer", 60*18, "_GenLanHuaCao", nNpcParam)
	--print(nNpcIdx)
	--print(dwNpcId)
	
	AddStatData("jiefangri_zhailanhua")
	
	tbAwardTemplet:Give({tbProp={6,1,1977,1,0,0},nBindState = -2,nExpiredTime=10080}, 1, {"EventTangHoa042011", "NhanDuocHoaLan"});
	
	local nCount = CalcItemCount(-1, 6, 1, 1977, -1)
	if nCount > 2 then
		Msg2Player(format("M�i ng�y ch� ���c ph�p t�ng 2 Hoa Lan R�ng cho Ng��i L�nh, tr�n ng��i ng��i �� ��t ��n %d c�i r�i.",nCount))
	end
	--Msg2Player("��õ���һ��������");
end

function _GenLanHuaCao(nNpcParam)
--Fix bug missing LanHuan positions - Modified by DinhHQ - 20110425
	for i=1, 1 do
		local nMapId, nPosX, nPosY = unpack(%tbLanHuanCaoPos[nNpcParam])
		%tbLanHuaCao.tbNpcParam[1] = nNpcParam
		%basemission_CallNpc(%tbLanHuaCao, nMapId, nPosX*32, nPosY*32)	
	end
	--%tbLanHuanCaoPos[nNpcIdx] = nil
	return 0--����0��ʾ����Ҫ�ٶ�ʱ
end

local _OnBreak = function()
	Msg2Player("Thu th�p ��t �o�n")
end

function main()
	local nNpcIdx = GetLastDiagNpc();
	local dwNpcId = GetNpcId(nNpcIdx)
	
	if not %_Limit(nNpcIdx) then
		return
	end
	--����������
	tbProgressBar:OpenByConfig(7, %_GetFruit, {nNpcIdx, dwNpcId}, %_OnBreak)
end;