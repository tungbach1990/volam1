Include("\\script\\global\\global_zahuodian.lua");
Include("\\script\\dailogsys\\dailogsay.lua")

function main(sel)
if (GetTask(169) == 41)  then
	Say("B�n ti�m tuy nh� nh�ng th� g� c�ng c�. Kh�ch quan mu�n mua g�? ", 4,"Xin h�i �ng ch� � ��y c� b�n d�ng c� ��nh c� kh�ng/nv4xHS" ,"Mua thi�p ch�c T�t/BuyChristmasCard","Giao d�ch/yes", "Kh�ng giao d�ch/no");
	else 
	Say("B�n ti�m tuy nh� nh�ng th� g� c�ng c�. Kh�ch quan mu�n mua g�? ", 3, "Mua thi�p ch�c T�t/BuyChristmasCard","Giao d�ch/yes", "Kh�ng giao d�ch/no");
	end
end;

function nv4xHS()
Talk(1,"","Ti�m t�p h�a: C�c v� ��i hi�p, � ��y c� �� lo�i h�ng h�a, ��u l� nh�ng v�t ph�m c�n thi�t cho qu� tr�nh b�n t�u, nh�ng nh�ng m�n �� ch�i cao c�p nh� d�ng c� ��nh c� th� ta kh�ng c�. � Ph��ng T��ng c� m�t v� L�u Vi�n Ngo�i n�i ti�ng l� th�ch ngh� thu�t")	 			
AddNote("Ti�m t�p h�a nh� ��i hi�p h�i th�m L�u Vi�n Ngo�i.") 
Msg2Player("Ti�m t�p h�a nh� ��i hi�p h�i th�m L�u Vi�n Ngo�i t�i <color=yellow>Ph��ng T��ng 199/207.") 
SetTask(169,42)		
end;

function yes()
Sale(20); 		
end;

function BuyChristmasCard()
	Sale(97);
end

function no()
end;

