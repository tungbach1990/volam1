-- ���� ·��NPC ���ģ�50������
-- by��Dan_Deng(2003-08-04)

function main()
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+10)then		-- 50�����������
		Talk(1,"","Ta bi�t m�t b� m�t nh� v� Tr�n Vi�n s� huynh, n�u mu�n bi�t th� mau mau l�m con g� n��ng cho ta �n, ng�y n�o c�ng �n chay, th�t ch�n ch�t �i ���c!")
		SetTask(7,50*256+20)
		AddNote("Tr�ng T�m bi�t ���c b� m�t c�a Tr�ng Vi�n, nh�ng ph�i h�i l� g� quay th� m�i n�i. ")
		Msg2Player("Tr�ng T�m bi�t ���c b� m�t c�a Tr�ng Vi�n, nh�ng ph�i h�i l� g� quay th� m�i n�i. ")
	elseif (UTask_sl == 50*256+20) then
		if (HaveItem(123) == 1) then
			Talk(1,"","Oh, g� n��ng ngon qu� �i! Gh� tai t�i ��y ta n�i cho nghe b� m�t: N�m x�a tr��c khi Tr�nh Vi�n s� huynh ch�t �� vi�t b�n s� l�n ��t l�: 4, 5, 3. Nh�ng kh�ng ai hi�u ���c � ngh�a �� l� g�!")
			Msg2Player("�em g� quay cho Tr�ng T�m, ���c h�n ch�: N�m x�a Tr�ng Vi�n �� vi�t ra tr�n ��t ba con s�: 4, 5, 3. ")
			AddNote("�em g� quay cho Tr�ng T�m, ���c h�n ch�: N�m x�a Tr�ng Vi�n �� vi�t ra tr�n ��t ba con s�: 4, 5, 3. ")
			DelItem(123)
			SetTask(7,50*256+30)
		else
			Talk(1,"","Ta bi�t m�t b� m�t nh� v� Tr�n Vi�n s� huynh, n�u mu�n bi�t th� mau mau l�m con g� n��ng cho ta �n, ng�y n�o c�ng �n chay, th�t ch�n ch�t �i ���c!")
		end
	else							-- ����Ի�
		Talk(1,"","Ph��ng tr��ng nhu nh��c qu�, n�u c� ti�p t�c nh� v�y ng��i Kim s� �� ��u c��i c� ch�ng ta m� �i ��.")
	end
end;
