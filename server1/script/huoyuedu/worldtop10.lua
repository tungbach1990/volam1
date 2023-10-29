-- �ļ�������worldtop10.lua
-- �����ߡ���wangjingjun
-- ���ݡ������ж��Ƿ�ɱ������ʮ��boss
--			boss���Ű� 566	�������� 562 	��ľ� 565 	������ 582 	������ 567
--			������ʦ 740	�Ʋ�Ⱦ 741	���ʦ̫ 743	������ 745	�����	747
-- ����ʱ�䣺2011-10-19 12:03:30Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\huoyuedu\\huoyuedu.lua")

function checkworldtop10(nNpcIndex, nPlayerIndex)
	local szScript = GetNpcScript(nNpcIndex)
	if szScript and (szScript == "\\script\\missions\\boss\\bossdeath.lua")then
		if NpcFunLib:CheckId("566,740,1366,582,568,744,583,563,562,747,739,1365,741,742,743,567,745,565,1367,1368", nNpcIndex) then
			vn_addhuoyuedu(nNpcIndex, nPlayerIndex)
		end
	end
end

function addhuoyuedu(nPlayerIndex)
do return end
	local nOldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIndex
	
	local tbPlayer = {}
	local nTeamSize = GetTeamSize()
	if nTeamSize > 0 then
		for i=1, nTeamSize do
			local nPlayerIndex = GetTeamMember(i)
			DynamicExecuteByPlayer(nPlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "BOSS")
		end
	else
		DynamicExecuteByPlayer(nPlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "BOSS")
	end
	
	PlayerIndex = nOldPlayerIndex
end

function vn_addhuoyuedu(nNpcIndex, nPlayerIndex)
	local nOldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIndex
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);	
	for i=1,nCount do
		DynamicExecuteByPlayer(tbRoundPlayer[i], "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "BOSS")
	end
	PlayerIndex = nOldPlayerIndex
end