--Edit by Youtube PGaming   --

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main(sel)
if (GetTask(69) == 13) or GetLastFactionNumber() == 10 then
Say("Ph� Dung: Lo�i thu�c n�y l� do l�c L�n s� t� r�nh r�i �� d�n c�c s� t� mu�i �i h�i thu�c l� ch� t�o, r�t l� linh nghi�m.", 2,"Giao d�ch/yes", "Kh�ng giao d�ch/no");
else 
Talk(1,"","Ph� Dung: Ch��ng m�n c� l�nh, thu�c c�a b�n ph�i ch� b�n cho ��ng m�n.")	
end
end;


function yes()
Sale(3);  			
end;


function no()
end;
