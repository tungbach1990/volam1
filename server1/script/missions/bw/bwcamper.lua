Include("\\script\\missions\\bw\\bwhead.lua");

function main()
	Say("C� ph�i ng��i mu�n r�i kh�i l�i ��i thi ��u kh�ng?",3,"Ph�i, ta ra ��y m�t l�t!/yes","Ta l� ��i tr��ng, mu�n bi�t s� th� t� v�o ��u tr��ng./OnShowKey","Kh�ng c�n ��u/no")
end;

function yes()
	LeaveGame();
	NewWorld(GetTask(BW_SIGNPOSWORLD), GetTask(BW_SIGNPOSX), GetTask(BW_SIGNPOSY));
end

function no()
end
