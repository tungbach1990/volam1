-- ������ ·��NPC �������ţ������ų�ʦ����
-- by��Dan_Deng(2003-07-27)

function main()
	UTask_cy = GetTask(6)
	if (GetFaction() == "cuiyan") then
		if (UTask_cy == 60*256+20) then				--��ʦ���������
			Talk(2,"","B� b�! L�o b� �� �� n�i cho ta nghe ch�n t��ng s� th�t, ta s� ��a b�c th� n�m �� cho Ch��ng m�n, m�i ng��i xem xong s� hi�u n�i kh� t�m c�a S� t�! ","T�m nguy�n n�m �� c�a S� t�, ta �� thay S� t� ho�n th�nh, v�y c�ng �� may r�i! ")
			SetTask(6,60*256+30)
		elseif (UTask_cy == 60*256) and (GetLevel() >= 50) then		--��ʦ����
			Talk(3,"L60_get","Ng��i ngo�i lu�n c� th�nh ki�n v�i Th�y Y�n ch�ng ta, ngay c� �� t� c�ng truy�n r�ng t� s� s�ng l�p ph�i, do b� ng��i y�u ru�ng b� n�n t�nh t�nh thay ��i r�t nhi�u, c�m h�n h�t t�t c� ��n �ng trong thi�n h�, cho n�n �� ��nh ra m�n quy kh�c nghi�t, khi�n cho c�c �� t� trong m�n ��i ��i c�m gh�t ��n �ng.","Nh�ng m�n quy n�y nh� m�t s�i d�y lu�n bu�c ch�t t�t c� m�i ng��i, k� th�c v�n kh�ng ph�i nh� v�y, nguy�n do trong �� ng��i ngo�i kh�ng hi�u th� m�c, t� b�n th�n ch�ng ta c�ng kh�ng mu�n khi�n ng��i kh�c th��ng t�m nh� v�y.","L�m th� n�o m�i c� th� khi�n m�i ng��i hi�u ���c ch�n t��ng s� vi�c n�y ch�?")
		else
			Talk(1,"","T� nh� �� l�u l�c trong ch�n giang h�, ch�p m�t �� nhi�u n�m tr�i qua r�i ")
		end
	else
		Talk(1,"","Nh� ng�y n�o ta c�n �m Do�n ch��ng m�n tr�n tay, b�y gi� �� l�n th� n�y r�i! Th�i gian tr�i qua nhanh nh� t�n b�n! ")
	end
end;

function L60_get()
	Say("Ch�n t��ng s� th�t c� li�n quan ��n m�t ng��i trong c�m ��a, ch� c� t�m ���c ng��i n�y th� tr�ng �en s� r� r�ng",2,"Ti�p t�c t�m hi�u /L60_get_yes","Hay m�c k� kh�ng lo /L60_get_no")
end;

function L60_get_yes()
	Talk(4,"","Th�n l� �� t� b�n m�n, t� th�y c� tr�ch nhi�m ph�i t�m ra s� th�t.","Ra kh�i c�ng �i theo h��ng ��ng B�c s� ��n Ng�c N� h�, c�m ��a � g�n Ng�c N� h�.","���c r�i! Ta �i ��y! ","��ng v�i! Ng��i b�n tr�! �� b�o v� t�nh m�ng cho ng��i, tr��c khi g�p ng��i �� c�n ph�i c� m�t c�i kh�n t�, kh�n t� n�y s� xu�t hi�n trong S�n ��ng c�a C�m Cung."	)
	SetTask(6,60*256+10)
	AddNote("Ti�p nh�n nhi�m v� xu�t s� c�a Th�y Y�n M�n, �i�u tra ch�n t��ng c�a c�m ��a Th�y Y�n m�n ")
	Msg2Player("Ti�p nh�n nhi�m v� xu�t s� c�a Th�y Y�n M�n, �i�u tra ch�n t��ng c�a c�m ��a Th�y Y�n m�n ")
end;

function L60_get_no()
end;
