--�η���Ӫ��Trap�㴥���Ľű�
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")

function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
		if(GetCurCamp() == 1) then
				if (BT_GetData(PL_PARAM1) > 0 and BT_GetData(PL_PARAM2) > 0) then
					Msg2Player("B�n hi�n �ang gi� c�, kh�ng th� �i v�o h�u doanh!")--??û��������Ϣ
				else
					SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
					SetFightState(0)
					BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
				end
		elseif (GetCurCamp() == 2) then
			Msg2Player("Ph�a tr��c s�n c�c ch�p tr�ng, ch�c ch�n c� ph�c binh! B�n kh�ng n�n t� ti�n x�ng l�n!")
			SetFightState(1)
		end;
end;


