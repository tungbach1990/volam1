--�������� ���踮 ·��18�οͶԻ�
--�������� ���踮 ��ɽ��������NPC 199,201
function main(sel)
	if(GetLevel() >= 60)then
		Say("Nh�n qua l� bi�t ng��i l� tuy�t th� ��i hi�p. C� ph�i ��nh ��n ��nh Hoa S�n t� v� ph�i kh�ng? Ch� c�n b� ra 500 l��ng, ta s� ��a ng��i ��n t�n n�i!",2,"Th� v� ��y, �i xem th�! /yes","Kh�ng quan t�m, kh�ng mu�n �i. /no")
	else
		Say("��nh Hoa S�n ph�a ��ng c� m�y t�n c� su�t ng�y ch�m gi�t,tranh gi�nh thi�n h� �� nh�t g� ��. B�n ta ��a c�c ng��i ��n ��, th�t c�ng ch�ng ph�i l� chuy�n hay!",0)
	end
end;

function yes()
	if(GetCash() >= 500)then
		Pay(500);
		NewWorld(2, 2600, 3600);		
	else
		Say("500 l��ng m� c�ng kh�ng c� l�m sao �i?",0)
	end
end;

function no()
	Say("L�c xu�ng n�i nh� t�m D� V� n�y nh�!",0)
end;