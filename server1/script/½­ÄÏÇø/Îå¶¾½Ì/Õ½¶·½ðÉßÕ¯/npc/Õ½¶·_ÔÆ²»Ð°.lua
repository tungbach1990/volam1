-- ս��_�Ʋ�а.lua ս���Ʋ�а�����ű�
-- By: Xiao_Yang(2004-04-29)

function OnDeath()
	if (GetTask(124) == 35) then
		AddEventItem(387)
		SetTask(124,40)
		Talk(1,"","Ng��i. Th�t qu� �c ��c! ")
		Msg2Player("B�n ��nh b�i V�n B�t T�. L�c so�t trong ng��i h�n t�m th�y thu�c gi�i K� ��c �m D��ng Ti�u  ")
		SetFightState(0)
		NewWorld(185,1612,3204)
	end
end
