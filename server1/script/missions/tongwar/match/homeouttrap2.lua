Include("\\script\\missions\\tongwar\\match\\head.lua")


function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
		if(GetCurCamp() == 2) then
				SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				SetFightState(0)
				tongwar_setdata( TONGWAR_RLTASK_LASTDTIME, GetGameTime() )
		elseif (GetCurCamp() == 1) then
			Msg2Player("Ph�a tr��c s�n c�c ch�p tr�ng, ch�c ch�n c� ph�c binh! B�n kh�ng n�n t� ti�n x�ng l�n!")
			SetFightState(1)
		end;
end;


