--======================================================================
--Author:   Tan Qingyu
--Date:     �꾩�ع� �Ƶ�BOSS�ű�
--Describe: 2012-05-15
--======================================================================

Include("\\script\\lib\\droptemplet.lua")

function OnDeath(nNpcIndex)
	local tbAward = 
	{
		{szName = "��i H�ng Bao", tbProp={6, 1, 13, 1, 0, 0}, nRate = 100,},
	}
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "Boss ��ng �i�p t� vong r�i ra t�i ��a Cung Bi�n Kinh", 1)
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end
