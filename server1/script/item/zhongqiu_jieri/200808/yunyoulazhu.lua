--zhongchaolong
--��������
--1��Сʱ֮�ڴ�ֻ��þ��鷭��
--100%������4�ֵ����� �������� ������ ����ǵ��� ������ Բ���� ������ ������ ��ͬʱ���֣�����ʱ��Ϊ5���ӡ�
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\common.lua")

local tbNpcList =
{
	{szName = "L�ng ��n b��m b��m", nLevel = 1, nNpcId = 1215, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	{szName = "L�ng ��n ng�i sao", nLevel = 1, nNpcId = 1216,nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	{szName = "L�ng ��n tr�n", nLevel = 1, nNpcId = 1218, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	{szName = "L�ng ��n �ng", nLevel = 1, nNpcId = 1217, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	
}

function main()
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("V�t ph�m n�y �� qu� h�n.",0)
		return 0;
	end
--	if zhongqiu0808_PlayerLimit() ~= 1 then
--		
--		Say("������50�����ϵĳ�ֵ��ҡ�", 0)
--		return 1
--	end
	AddSkillState(892, 1, 1, 18*60*60);
	
	
	local nMapId,nPosX,nPosY = GetWorldPos()
	zhongqiu0808_CallNpc(%tbNpcList[random(1,getn(%tbNpcList))], nMapId, (nPosX + random(-5,5))*32, (nPosY + random(-5,5))*32 )
	
	
end