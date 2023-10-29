--description: ���̽�����̳��
--author: yuanlan	
--date: 2003/5/18
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4)
	Uworld51 = GetTask(51)
	if (Uworld51 == 50) then		-- ϴ��ԩ�����������
		Talk(5,"Uworld51_55","B�n ph��ng Nam gian tr�, l�n n�y m�u k� ly gi�n c�a b�n ta c�ng kh�ng k�m. Ha ha, huynh �� b�n ch�ng t��ng t�n �� l� tuy�t h�c cho ch�ng ta bi�t, Nam tri�u �� h�t nh�n t�i, c�n g� ��ng s� n�a?","Nghe n�i l�n tr��c gi�t v�i t�n Thi�u L�m l�m b�n ch�ng v� ���ng M�n l�m v�o kh�ng ho�ng, l�n n�y l�i gi�t th�m.....�m, C�i Bang tr��c gi� v�n ch�ng ��i b�n ta, l�n n�y s� x� �� t� C�i Bang. ��ng r�i, s� ph�c k�ch ch�ng � Ti�n C�c ��ng.","Ng��i l� ai? ��n ��y l�m g�?","T�i h� m�i ��n, ��t nhi�n g�p ���c Thi�n h� �� t� cao th� oai phong l�m li�t Nh�t Nguy�t ��n Ch�, nh�t th�i k�ch ��ng. L�u r�i kh�ng g�p ��n Ch�, ng�y c�ng th�y oai phong.","Ha ha, ha ha, ���c l�m.")
	elseif (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 20*256) and (GetLevel() >= 20) then
			AddNote("T�i qu�ng tr��ng Thi�n Nh�n gi�o g�p Nh�t Nguy�t ��n ch� � H�p T�t, tr� l�i c�u h�i c�a �ng ta. ")
			Msg2Player("T�i qu�ng tr��ng Thi�n Nh�n gi�o g�p Nh�t Nguy�t ��n ch� � H�p T�t, tr� l�i c�u h�i c�a �ng ta. ")
			Talk(8,"L20_get_test","�y da�..M�t h�t r�i! Kh�ng c�n m�t m�i n�o n�a.....","C� chuy�n g� v�y?","Ta, ta b� �c hi�p r�i!","� ��n Ch� v� c�ng c�i th�, ai d�m �c hi�p ng�i?","L�i m�t ��a tr� n�a!","M�t ��a tr�?","Ta v�a g�p m�t ��a tr� � khu r�ng ph�a ��ng, t�n ti�u qu� �� h�i ta m�t c�u, nh�ng ta kh�ng c�ch n�o tr� l�i ���c n�n �� thua n� Nh�t Nguy�t Song Lu�n! Chuy�n n�y n�u b� ��n ra ngo�i ch�c ch�n s� b� ng��i c��i ch�. Tuy ta v� c�ng cao c��ng, nh�ng kh�ng th� l�y l�i ���c,l�m sao c�n c� th� nh�n m�t ai tr�n giang h� n�a?","V�n �� l� th� n�o?")
		elseif (UTask_tr == 20*256+10) then 
			L20_get_test()
		elseif (UTask_tr == 20*256+20) then 
			L20_get()
		elseif (UTask_tr == 20*256+80) and (HaveItem(58) == 1 ) then
			L20_prise()
		elseif (UTask_tr == 30*256+20) then	--�ӵ�30������Ҫֱ���л�����ʼ����
			Say("Mu�n ta ��a ng��i ��n l�ng T�n Th�y Ho�ng kh�ng? Kh�ng v�n �� g�, ch� c�n 500 l��ng th�i!", 2, "L�m phi�n ��a ta �i /L30_deliver_yes", "Ta s� t� �i! /L30_deliver_no")
		elseif (UTask_tr == 40*256+20) then	--�ӵ�40������Ҫֱ���л���������ԭ
			Say("Mu�n ta ��a ng��i ��n l�ng T�n Th�y Ho�ng kh�ng? Kh�ng v�n �� g�, ch� c�n 700 l��ng th�i!", 2, "L�m phi�n ��a ta �i /L40_deliver_yes", "Ta s� t� �i! /L40_deliver_no")
		elseif (UTask_tr >= 20*256+30) and (UTask_tr < 20*256+80) then					--�Ѿ��ӵ�20��������δ���
			Talk(1,"","T�n ti�u qu� �� � <color=Red>c�nh r�ng ph�a ��ng<color>, phi�n ng��i gi�o hu�n n�!")
		elseif (UTask_tr >= 30*256) then					--�Ѿ����20��������δ��ʦ
			Talk(1,"","Tuy v� c�ng ng��i kh�ng b�ng ta, nh�ng n�u gi�p ta l�y l�i ���c Nh�t Nguy�t Song Lu�n, ta r�t c�m k�ch!")
		else
			Talk(4, "", "Bi�t ta l� ai kh�ng? Ta ch�nh l� Thi�n h� �� t� cao th� oai phong l�m li�t � H�p T�t!", "Thi�n h� �� t� th�i sao?", "��ng, �� nh�t ch�nh l� Gi�o ch�, ngo�i Gi�o ch�, Gia Lu�t T� Ly v� �oan M�c Du� ra, v� c�ng c�a ta l� l�i h�i nh�t! Th� n�o? Ng��i c� ph�c kh�ng? N�u kh�ng ph�c ta s� cho ng��i n�m s� l�i h�i c�a Nh�t Nguy�t Song Lu�n!", "���c r�i! ���c r�i!")
		end
	elseif (GetTask(30) == 5) then		--�ӵ�����������Ҫֱ���л�����ɽ
		Say("Mu�n ta ��a ng��i ��n l�ng T�n Th�y Ho�ng kh�ng? Kh�ng v�n �� g�, ch� c�n 500 l��ng th�i!", 2, "L�m phi�n ��a ta �i /W30_deliver_yes", "Ta s� t� �i! /W30_deliver_no")
	elseif (UTask_tr >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","Ng��i mu�n �i �? Ta s� nh� ng��i ��y, huhuhu�.")
	else
		Talk(4, "", "Bi�t ta l� ai kh�ng? Ta ch�nh l� Thi�n h� �� t� cao th� oai phong l�m li�t � H�p T�t!", "Thi�n h� �� t� th�i sao?", "��ng, �� nh�t ch�nh l� Gi�o ch�, ngo�i Gi�o ch�, Gia Lu�t T� Ly v� �oan M�c Du� ra, v� c�ng c�a ta l� l�i h�i nh�t! Th� n�o? Ng��i c� ph�c kh�ng? N�u kh�ng ph�c ta s� cho ng��i n�m s� l�i h�i c�a Nh�t Nguy�t Song Lu�n!", "���c r�i! ���c r�i!")
	end
end;

function L20_get_test()
	Say("C� m�t con tr�u � h��ng B�c, tr��c ti�n quay v� ph�a ph�i 3 v�ng, r�i quay ra ph�a sau 3 v�ng, sau �� l�i quay v� ph�a ph�i, v�y l�c n�y �u�i c�a n� � h��ng n�o?", 5, "H��ng ��ng /L20_get_fail", "H��ng nam /L20_get_fail", "H��ng t�y /L20_get_fail", "H��ng B�c /L20_get_fail", "H��ng xu�ng ��t /L20_get_pre")
end;

function L20_get_fail()
	SetTask(4, 20*256+10)
	Talk(1,"","V�y l� ng��i c�ng kh�ng bi�t �, th�t l� ng�c!")
end;

function L20_get_pre()
	SetTask(4,20*256+20)
	Talk(2, "L20_get", "Ha ha ha, c�u �� n�y th�t ��n gi�n! B�t k� c�i ��u h��ng v� h��ng n�o, th� c�i �u�i c�ng h��ng xu�ng ��t th�i!", "�i! Ng��i th�t th�ng minh! V�y ng��i gi�p ta �i gi�o hu�n t�n nh�c �y, l�y <color=Red>Nh�t Nguy�t Song Lu�n<color> gi�p ta.")
end;

function L20_get()
	Say("Xem nh� ta c�u xin ng��i ��y, ng��i c� gi�p kh�ng?", 2, "���c, �� ta th� /L20_get_yes", "Ta c�n c� vi�c kh�c. /L20_get_no")
end;

function L20_get_yes()
	Talk(1,"","T�t qu�! T�n nh�c �� � <color=Red>c�nh r�ng ph�a ��ng<color>, h�y thay ta gi�o hu�n n�!")
	SetTask(4, 20*256+30)
	AddNote("Nh�n nhi�m v� '��a tr� th�ng minh': T�m ��a tr� l�y l�i c�p Nh�t Nguy�t Song Lu�n cho � H�p T�t. ")
	Msg2Player("Nh�n nhi�m v� '��a tr� th�ng minh': T�m ��a tr� l�y l�i c�p Nh�t Nguy�t Song Lu�n cho � H�p T�t. ")
end;

function L20_get_no()
	Talk(1,"","N�u ng��i kh�ng gi�p ta, ta bi�t t�m ai ��y, huhuhu�..")
end;

function L20_prise()
	Talk(1,"","Ng��i gi�p ta l�y l�i Nh�t Nguy�t Song Lu�n, th�t ��ng l� �n nh�n c�u m�ng c�a ta! Kh�ng, kh�ng, ng��i l� ph� m�u t�i sinh c�a ta!")
	SetRank(57)
	DelItem(58)
	SetTask(4, 30*256)
--	AddMagic(137)
	add_tr(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("B�n ���c th�ng c�p Thi�n Nh�n T� S�! H�c ���c v� c�ng �o �nh Phi H�. ")
	AddNote("��a c�p Nh�t Nguy�t Song Lu�n cho Nh�t Nguy�t ��n ch� � H�p T�t, ho�n th�nh nhi�m v� ��a tr� th�ng minh. Th�ng c�p T� S�. ")
end;

function W30_deliver_yes()		--����������Ҫֱ���л�����ɽ
	if (GetCash() >= 300) then
		Pay(300)
		NewWorld(2, 2288, 4091)
	else
		Talk(1,"","Kh�ng ti�n b�c n�o c� th� mua ���c ta, Thi�n h� �� t� cao th� oai phong l�m li�t Nh�t Nguy�t ��n Ch� � H�p T�t.")
	end
end;

function W30_deliver_no()
	Talk(1,"","Ch�t ti�n th� n�y th� mua ���c g�?")
end;

function L30_deliver_yes()	--����30������Ҫֱ���л�����ʼ����
	if (GetCash() >= 500) then
		Pay(500)
		NewWorld(7, 2235, 2847)
	else
		Talk(1,"","Ai c�ng bi�t, kh�ng ti�n b�c n�o c� th� mua ���c ta, Thi�n h� �� t� cao th� oai phong l�m li�t Nh�t Nguy�t ��n Ch� � H�p S�t.")
	end
end;

function L30_deliver_no()
	Talk(1,"","�� nghe qua c�u ph� t�i ti�u tai ch�a? Ch�t ti�n th� n�y th� mua ���c g�? C�n th�n k�o m�t m�ng tr�n ���ng ��y!")
end;

function L40_deliver_yes()	--40������Ҫֱ���л���������ԭ
	if (GetCash() >= 700) then
		Pay(700)
		NewWorld(43, 1695, 3200)
	else
		Talk(1,"","Ai c�ng bi�t, kh�ng ti�n b�c n�o c� th� mua ���c ta, Thi�n h� �� t� cao th� oai phong l�m li�t Nh�t Nguy�t ��n Ch� � H�p S�t.")
	end
end;

function L40_deliver_no()
	Talk(1,"","�i ���ng c�n th�n nh�, ha ha!")
end;

----------------------- �������� --------------------------
function Uworld51_55()
	SetTask(51,55)
	Msg2Player("Nghe l�n � H�p T�t t� n�i chuy�n. Chuy�n n�y qu� nhi�n l� do Thi�n Nh�n gi�o l�m. Nhanh ch�ng quay l�i b�o c�o tin t�c. ")
end
