--��ԭ����\��ţɽ\����Ȫ����\ս��_�׾�.lua
--by xiaoyang (2004\4\20)

function OnDeath()
Uworld129 = GetTask(129)
	if (Uworld129 == 55) then
		SetTask(129,60)
		Talk(1,"",".....Kh�ng ng� ng��i l�i l�i h�i nh� v�y! L�i Quy�t ta ch�ng qua ch� l� m�t �� t� y�u k�m c�a Thi�n Nh�n gi�o. S� c� ng��i b�o th� cho ta! V� l�m Trung Nguy�n s� b� di�t vong....")
		Msg2Player("��nh b�i L�i Quy�t, c�u ���c Chu V�n Tuy�n �� b� th��ng. ")
		i = random(0,99)
		if (i < 33) then
			NewWorld(41, 1951, 2989)
		elseif (i < 67) then
			NewWorld(41, 1685, 3268)
		else
			NewWorld(41, 1788, 3085)
		end
   end
end
