--�𷽺�ӪTrap�㴥���Ľű�
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")


function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
		if(GetCurCamp() == 2) then
			if( GetFightState() == 1) then
				SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				SetFightState(0)
			else
				RestTime =  GetGameTime() - BT_GetData(PL_LASTDEATHTIME) 
				if ( RestTime < TIME_PLAYER_REV) then
					Say((TIME_PLAYER_REV - RestTime) .. " gi�y sau b�n m�i c� th� r�i kh�i h�u doanh! Xin ��i ch�t n�a!", 0)
					SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				else
					file = GetMissionS(2)
					x,y = bt_getadata(file)
					SetPos(floor(x/32), floor(y/32))
					bt_RankEffect(BT_GetData(PL_CURRANK))
					SetFightState(1)
					SetPKFlag(1)
				end
			end;
		elseif (GetCurCamp() == 1) then
			file = GetMissionS(2)
			x,y = bt_getadata(file)
			SetPos(floor(x/32), floor(y/32))
			Msg2Player("Ph�a tr��c s�n c�c ch�p tr�ng, ch�c ch�n c� ph�c binh! B�n kh�ng n�n t� ti�n x�ng l�n!")
			SetFightState(1)
		end;
end;
