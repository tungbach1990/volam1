--�η���Ӫ��Trap�㴥���Ľű�
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")
function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
		if(GetCurCamp() == 1) then
			SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
			SetFightState(0)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
		elseif (GetCurCamp() == 2) then
			Msg2Player("Ph�a tr��c s�n c�c ch�p tr�ng, ch�c ch�n c� ph�c binh! B�n kh�ng n�n t� ti�n x�ng l�n!")
			SetFightState(1)
		end;
end;


