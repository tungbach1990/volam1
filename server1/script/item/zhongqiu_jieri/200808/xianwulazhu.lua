--zhongchaolong
--��������
--8��Сʱ֮�ڴ�ֻ��þ��鷭��
--100%������1��������ơ�ͬʱ���֡�����ƵĴ���ʱ��Ϊ5����.
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\common.lua")

local tbNpcList =
{
	{szName = "��n k�o qu�n", nLevel = 1, nNpcId = 1220, nTime = 60*5, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\denglong.lua"},
	
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
	AddSkillState(892, 1, 1, 18*60*60*8);
	local nMapId,nPosX,nPosY = GetWorldPos()
	zhongqiu0808_CallNpc(%tbNpcList[1], nMapId, (nPosX + random(-2,2))*32, (nPosY + random(-2,2))*32 )
end