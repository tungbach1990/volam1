-- ؤ�� ·��NPC ؤ�����1 20������
-- by��Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 20*256) and (GetLevel() >= 20) and (GetFaction() == "gaibang") then		--20������
		Say("C�i t�n M�nh Vi�n T�i �� v�n cho m�nh l� con ch�u c�a Tr��ng l�o C�i Bang. Ng�y th��ng hay ng�ng ngh�nh kho�c l�c v�i huynh �� trong bang. H�n bi�t r� m�nh sai, nh�ng v�n c� ch�p. K�t qu� l� b� ��nh cho m�t tr�n, th�t l� ��ng ��i! ",2,"D�y d� ngh�ch t� /L20_get_yes","Ch�nh nh�n h�nh ��o /L20_get_no")
	elseif (UTask == 20*256+10) then
		Talk(1,"","Ng��i nh�t ��nh ph�i c�n th�n! C�i t�n M�nh Vi�n T�i � th�c th�c h�n l� Tr��ng l�o C�i Bang m�i d�m b�t n�t ng��i nh� th�!")
	else
		Talk(1,"","M�nh Vi�n T�i th��ng b�t n�t �� t� c�p th�p, th�t l� t�i t�! ")
	end
end;

function L20_get_yes()
	Talk(3,"after_get","L� n�o nh� v�y! M�nh Vi�n T�i hi�n �ang � ��u?","H�nh nh� � ph�a T�y r�ng, ng��i nh� ��ng g�y chuy�n v�i h�n, n�u ��c t�i v�i M�nh tr��ng l�o th� phi�n ph�c l�m! "," Ng��i y�n t�m! Ta nh�t ��nh s� 'gi�p h�n' th�y l�i ch�nh ��o! ")
end;

function after_get()
	SetTask(8,20*256+10)
	AddNote("Nh�n nhi�m v� c�p 20: Gi�o hu�n M�nh Vi�n T�i ")
	Msg2Player("Nh�n nhi�m v� c�p 20: Gi�o hu�n M�nh Vi�n T�i ")
end

function L20_get_no()
	Talk(2,"","Huynh ��! Nh�n nh�c ch�t �i! Nh� v�y ch�ng t�t h�n sao?","�y! ")
end;
