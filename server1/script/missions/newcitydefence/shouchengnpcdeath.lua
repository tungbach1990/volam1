----------------------------------------------------------------
--FileName:	npcdeath.lua
--Creater:	firefox
--Date:		2005-11-25
--Comment:	��ĩ�������ս��֮�������
--			���ܣ��سǷ�ʿ�������������ű�
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")

function OnDeath(nNpcIndex)
	SetMissionV( MS_SHOUCHENGWEIBING, GetMissionV( MS_SHOUCHENGWEIBING ) - 1 )
	if (rank == 2) then
		SetMissionV( MS_SHOUCHENGJIANGJUN, GetMissionV( MS_SHOUCHENGJIANGJUN ) - 1)
		Msg2MSAll(MISSIONID, "Th� th�nh chi�n b�o:<color=pink>1 t�n T��ng qu�n th� th�nh b�n ta t� tr�n.")
	end
	if (GetMissionV( MS_SHOUCHENGJIANGJUN ) <= 0) then
		Msg2MSAll(MISSIONID, "Th� th�nh chi�n b�o:<color=pink>T��ng s� th� th�nh c�a ta ��u t� tr�n.")
		CloseMission( MISSIONID )
	end
end