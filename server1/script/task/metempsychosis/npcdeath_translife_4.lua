-- �ļ�������npcdeath_translife_4.lua
-- �����ߡ���wangjingjun
-- ���ݡ������ж�ת��4ʱ ɱ�������ʱ���Ƿ���Ҫ����������
-- ����ʱ�䣺2011-07-30 16:39:31

Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\lib\\awardtemplet.lua")

local tbcondition = 
{
--	[75] = "Ӱ��",
--	[144] = "��ɽ",
--	[227] = "����",
--	[321] = "˪��",

	[75] = 156,
	[144] = 158,
	[227] = 535,
	[321] = 598,
}

local tbAward = 
{
	[75] = {{szName = "T�ch L�ch ��n", tbProp = {6,1,2973, 1, 0,0}, nRate = 80},},
	[144] = {{szName = "T�ch L�ch ��n", tbProp = {6,1,2973, 1, 0,0}, nRate = 80},},
	[227] = {{szName = "T�ch L�ch ��n", tbProp = {6,1,2973, 1, 0,0}, nRate = 70},},
	[321] = {{szName = "T�ch L�ch ��n", tbProp = {6,1,2973, 1, 0,0}, nRate = 70},},
}

function OnNpcDeath(nNpcIndex, nPlayerIndex)
	local nTskValue = CallPlayerFunction(nPlayerIndex, GetTask, TSK_TRANSLIFE_4)
	if nTskValue ~= 1 then
	--	print("���δ��ȡ������")
		return 
	end
--	print("�����ȡ������")
	
	local nNpcId = GetNpcSettingIdx(nNpcIndex)

	local nNpcName = GetNpcName(nNpcIndex)
	local nMapId,_,_ = CallPlayerFunction(nPlayerIndex, GetWorldPos)
--	print(nNpcId, nMapId)
	if nNpcId == %tbcondition[nMapId] and %tbAward[nMapId] then
		CallPlayerFunction(nPlayerIndex, giveAward, nMapId, nNpcId)
	end	
end


function giveAward(nMapId, nNpcId)
	if CountFreeRoomByWH(1,1,1) < 1 then
		Msg2Player("H�nh trang c�a ng��i �� ��y, xin h�y s�p x�p l�i!")
		return 
	end
	tbAwardTemplet:GiveAwardByList(%tbAward[nMapId], format("Ti�u di�t %d nh�n ���c T�ch L�ch ��n",nNpcId), 1)
end