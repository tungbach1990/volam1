-- �嶾 ·��NPC ����կկ������ 50������
-- by��Dan_Deng(2003-08-05)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if ((UTask_wu == 50*256+20) and (HaveItem(88) == 1)) then		-- ���������
			L40_prise()
		elseif ((UTask_wu == 50*256) and (GetLevel() >= 50)) then		--50������
			Talk(1,"L50_get","B� t�nh 100 d�m trong v�ng n�y ��u ph�i n�p ph� �� ���c Ng� ��c gi�o c�a ch�ng ta b�o h�. Nh�ng m� g�n ��y c� m�t t�n g�i l� L�u Kh�u, �� t�p h�p �� �� � Ng�c Hoa ��ng tr�n n�i V� Di. H�n l�i d�m leo l�n l�ng c�p, tung ho�nh kh�ng coi b�n gi�o ra g�. M�i ��y ch�ng �� c��p �i Ng�c San H� c�a b�n gi�o. Chuy�n n�y khi�n cho ta th�t l� m�t m�t. Kh�ng th� b� qua cho ch�ng!")
		else							-- ����Ի�
			Talk(1,"","Ch� c�n luy�n th�nh v� c�ng, th� kim ng�n m� n� s� t� �n �n m� ��n ")
		end
	else
		Talk(1,"","Nh�c ��n con g�i,ta l�i nh� ��n c�c c� n��ng c�a Th�y Y�n m�n. �i! Th�t l� ��p! Kh�ng ng� con g�i c�a c� ta l�i ��p ��n nh� v�y. M�i ngh� ��n th� l�a trong ng��i ta l�i b�c l�n r�i! Kh�!Kh�! ")
	end
end;

function L50_get()
	Say("Ng��i h�y �i d�y cho b�n L�u Kh�u kia m�t b�i h�c, cho ch�ng th�y ���c s� l�i h�i c�a b�n m�n",2,"Tu�n l�nh!/L50_get_yes","��ng ��ng b�n ch�ng qu� ��ng, thu�c h� e l�. /L50_get_no")
end;

function L50_get_yes()
	SetTask(10,50*256+10)
	AddNote("��n Ng�c Hoa ��ng tr�n V� Di s�n s�n ��nh L�u Kh�u �� l�y l�i Ng�c San H�. ")
	Msg2Player("��n Ng�c Hoa ��ng tr�n V� Di s�n s�n ��nh L�u Kh�u �� l�y l�i Ng�c San H�. ")
end;

function L50_get_no()
end;

function L40_prise()
	Talk(2,"","Ng��ic� th� ��n th��ng ��c m� m� �o�t l�i ���c Ng�c San H�, qu� l� b�n l�nh b�t ph�m. B�n tr�i ch� xem ng��i��ng l� m�t k� t�i,phong cho ng��il�m Co ��c T�n Gi�. Sau n�y ng��ic� th� thay ta m� �i�u h�nh m�i vi�c trong tr�i","Tu�n l�nh!")
	SetTask(10,60*256)
	DelItem(88)
	SetRank(54)
--	AddMagic(72)
	add_wu(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("Mang Ng�c San H� v� cho Thang B�t, ���c th�ng l� Co ��c T�n Gi� ")
	Msg2Player("Ch�c m�ng B�n! �� ���c th�ng l�m Co ��c T�n Gi�. H�c ���c v� c�ng Xuy�n T�m ��c Th�ch ")
end;
