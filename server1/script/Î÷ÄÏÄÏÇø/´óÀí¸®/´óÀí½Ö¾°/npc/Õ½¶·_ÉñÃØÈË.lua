function OnDeath()
	if (GetTask(126) == 45) then
		SetTask(126,50)
		Msg2Player("Gi�t ch�t k� th�n b�, gi�i c�u �o�n T� Th�nh ")
		AddNote("Gi�t ch�t k� th�n b�, gi�i c�u �o�n T� Th�nh ")
		Talk(1,"Uworld126_kill","S� c� ng��i ��n t�m ng��i b�o th� cho ta. ")
	end
end

function Uworld126_kill()
	SetFightState(0)
	NewWorld(162,1531,3157)
end
