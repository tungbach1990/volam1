--======================================================================
--Author:   Tan Qingyu
--Date:     �꾩�ع� �Ƶ�BOSS�����ű�
--Describe: 2012-05-15
--======================================================================

Include("\\script\\missions\\bianjingdigong\\bianjingdigong_head.lua")

function OnLogin(nPlayerIndex)
	local nMapId = CallPlayerFunction(nPlayerIndex, GetWorldPos)
	
	if nMapId == BJDG_HEAD.nMapId then
		CallPlayerFunction(nPlayerIndex, NewWorld, unpack(BJDG_HEAD.tbLeaveTargetPos))
	end
end
