--Edit by Youtube PGaming   --

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main(sel)
if (GetTask(69) == 13)  or GetLastFactionNumber() == 10 then
Say("Ti�u Vi�n T�: � ��y c� r�t nhi�u th�n binh l�i kh�, ng��i c� mu�n m�t m�n kh�ng?", 2,"Giao d�ch/yes", "Kh�ng giao d�ch/no");
else 
Talk(1,"","Ti�u Vi�n T�: Ch��ng m�n c� l�nh, binh kh� b�n ph�i ch� b�n cho ��ng m�n.")	
end
end;


function yes()
Sale(1);  			
end;


function no()
end;
