-- ����� ·��NPC �λ�ũ��������30������
-- by��Dan_Deng(2003-07-26)

function main()
	UTask_cy = GetTask(6)
	if (UTask_cy == 30*256+10) then		--30����������У�����Ů������
		Talk(6,"","�o�n ��i gia, nghe n�i ng��i l� m�t tay tr�ng tr� gi�i, ta ��n ��y mu�n nh� l�o b� ch� b� quy�t tr�ng c�y tr� 'V� Y Ngh� Th��ng'.","Hu hu hu.....ch�u g�i ��ng th��ng c�a ta.....","��i ��i gia! Ch�u g�i �ng th� n�o?","N� b� m�t t�n th� ph� � �i�m Th��ng s�n b�t �i r�i, b�y gi� kh�ng bi�t s�ng ch�t ra sao?.....","�o�n ��i gia! ��ng lo l�ng! Ta s� �i c�u ch�u g�i c�a �ng.","N� hi�p! Ng��i ��ng l� m�t ng��i t�t! Ch� c�n c�u ���c ch�u ta, chuy�n g� ta c�ng h�a! ")
		SetTask(6,30*256+20)
		AddNote("��n �i�m Th��ng s�n, t�m th� ph� gi�i c�u ch�u g�i c�a ng��i tr�ng tr� ")
		Msg2Player("��n �i�m Th��ng s�n, t�m th� ph� gi�i c�u ch�u g�i c�a ng��i tr�ng tr� ")
	elseif (UTask_cy == 30*256+30) then		--30����������У�����Ů��ɣ�
		Talk(5,"","C�m �n ng��i �� c�u ch�u ta. ��i �n ��i ��c n�y ta s� kh�ng qu�n.","�o�n ��i gia! �ng bi�t c�ch tr�ng ' V� Y Ngh� Th��ng' ph�i kh�ng?","Ti�u c� n��ng! Coi nh� c� n��ng h�i ��ng ng��i,b� quy�t tr�ng V� Y Ngh� Th��ng ch� c� l�o m�i bi�t, t� tr��c t�i nay v�n kh�ng truy�n cho ng��i ngo�i nh�ng ng��i �� c�u m�ng ch�u g�i c�a ta th� ta s� truy�n l�i cho ng��i.","Tr�ng c�y tr� V� Y Ngh� Th��ng th� ph�i c� �� 3 lo�i nguy�n li�u: m�t l� Ng�n Tuy�t Ng� � Nh� H�i. Hai l� B�ch Th��ng Ph�ng �i�p b�n su�i H� �i�p, ba l� con giun �� � V�n N�ng ��nh.","�a t� ��i Gia! ")
		SetTask(6,30*256+40)
		AddNote("Tr�ng V� Y Ngh� Th��ng nh�t ��nh ph�i c� Ng�n Tuy�t Ng� � Nh� H�i, B�ch Th��ng Ph��ng �i�p b�n su�i H� �i�p, con giun �� � g�n V�n N�ng ��nh ")
		Msg2Player("Tr�ng V� Y Ngh� Th��ng nh�t ��nh ph�i c� Ng�n Tuy�t Ng� � Nh� H�i, B�ch Th��ng Ph��ng �i�p b�n su�i H� �i�p, con giun �� � g�n V�n N�ng ��nh ")
	elseif (UTask_cy == 30*256+20) then
		Talk(1,"","N� hi�p! Ch� c�n c� th� c�u ���c ch�u g�i c�a ta chuy�n g� ta c�ng h�a v�i ng��i! ")
	else
		Talk(1,"","Tr�ng lo�i hoa n�y v�a l� m�t m�n h�c v�a l� m�t m�n ngh� thu�t.")
	end
end
