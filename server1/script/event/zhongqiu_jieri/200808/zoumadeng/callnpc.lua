Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\common.lua")


local tbNpcList =
{
	{szName = "��n k�o qu�n ��ng", nLevel = 1, nNpcId = 1220, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\zoumadeng\\npcdeng.lua", tbNpcParam = {1}, nTime = 60*60},
	{szName = "��n k�o qu�n T�y", nLevel = 1, nNpcId = 1220, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\zoumadeng\\npcdeng.lua",tbNpcParam = {2}, nTime = 60*60},
	{szName = "��n k�o qu�n Nam", nLevel = 1, nNpcId = 1220, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\zoumadeng\\npcdeng.lua", tbNpcParam = {3}, nTime = 60*60},
	{szName = "��n k�o qu�n B�c", nLevel = 1, nNpcId = 1220, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200808\\zoumadeng\\npcdeng.lua", tbNpcParam = {4}, nTime = 60*60},
	
}

function zhongqiu0808_CallBoss(nMapId, nPosX, nPosY, nType, nNpcParam1)
	%tbNpcList[nType].tbNpcParam[3] = nNpcParam1
	zhongqiu0808_CallNpc(%tbNpcList[nType], nMapId, nPosX * 32, nPosY * 32)
end