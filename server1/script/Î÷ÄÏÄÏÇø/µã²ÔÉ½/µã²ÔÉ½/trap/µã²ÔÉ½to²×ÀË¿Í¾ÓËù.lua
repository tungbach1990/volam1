--�������� ���ɽto���˿;���
--Trap ID�����˿� 1

function main(sel)
	Uworld42 = GetTask(42)
--	Msg2Player("���˿;���")
	if (Uworld42 == 60) then
		SetTask(42,70)
		Talk(15,"U42_go","Hi hi! ","Hi hi hi! ","Ch�u ngoan! ��n ��y �ng c�ng n�o.....Ai cha, n�ng qu�!","�ng n�i! Ch�u mu�n �n k�o.","Con c�ng mu�n.","�ng n�i! T�i n� c�, c�n c�a con th� sao?","���c r�i! Ai c�ng c� ph�n.","Xin h�i c� ph�i Th��ng L�ng Kh�ch trong ph�ng?","K� n�o b�n ngo�i?","V�n b�i xin b�i ki�n!","Ta �ang vui v�y v�i con ch�u, kh�ng r�nh ti�p ng��i, v� �i!","Th�t kh�ng d�m gi�u, m� c�a m�y ��a tr� n�y c�ng r�t lo l�ng, m�t �n m�t ng�, xin Ti�n b�i tha cho b�n ch�ng.","M�y ��a n�y ��u l� ch�u c�a ta, ng��i n�i c�i g� m� b�n ch�ng ch�? Th�ng nh�c n�y d�m ��n ��y tr�u ta �?","Ti�n b�i! ��ng ��a v�i ta n�a. Th�ng c�m gi�m �i!","Th�ng c�m gi�m! Ti�u t� to gan, ti�p chi�u!")
	elseif (Uworld42 == 70) then
		Talk(1,"U42_go","Ti�u t� kh�ng bi�t s�ng ch�t, c�n kh�ng ch�u �i! ")
	end
end;

function U42_go()
	NewWorld(231,1611,3193)
end
