--��������
function main()
	Say("��y l� m�t ��o d�ng �� b� m�t ra kh�i th�nh t�p k�ch qu�n ��ch! B�n mu�n d�ng m�t ��o n�y kh�ng?", 2, "Mu�n /OnGo", "Kh�ng mu�n /OnCancel");
end

function OnGo()
	local mapid = 221
	local i = random(0,1);
	
	if (i == 0) then
		NewWorld(mapid,1739,3513)
	else
		NewWorld(mapid,1836,3405)
	end
	
	SetFightState(1);
end

function OnCancel()
end
