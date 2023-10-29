--description: �������� 50������ 
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2)
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 50*256) and (GetLevel() >= 50) then		--50����������
			Talk(3, "L50_step0", "V�y th� n�o m�i l� t�t!", "���ng Nh�n s� th�c c� chuy�n g� v�y?", "Ng��i kh�ng bi�t �! B�n ���ng n�i ti�ng c� <color=Red>1 b�<color>'�m Kh� Ph�', chia th�nh 2 quy�n, b�n tr�n c� ghi r� c�ch ch� t�o v� c�ch d�ng t�t c� �m kh� c�a b�n m�n. ��y l� b� ki�p b�n m�n kh�ng bao gi� truy�n ra ngo�i. B� ki�p do ta gi�, �� an to�n, ta ��t trong 2 h�p s�t, nh�ng ��n h�m nay ta m�i ph�t hi�n h�p s�t �� b� k� gian ��nh tr�o th�nh 1 quy�n V� T� Thi�n Th�. B� ki�p b� th�t l�c, th�t l� chuy�n l�n r�i!")
		elseif (UTask_tm == 50*256+80) then
			if ( HaveItem(48) == 1) then					--�а�����
				Talk(2, "L50_prise", "���ng Nh�n s� th�c, h�a ra ng��i tr�m '�m kh� ph�' l� Tam s� huynh ���ng H�a. Ta� h� �� �o�t b� ki�p tr� v�, huynh xem c� ph�i kh�ng?", "��ng r�i! ��y ch�nh l� quy�n '�m kh� ph�' b� m�t, ng��i �� h�a gi�i ���c m�t tr�n ��i h�a cho b�n ���ng. C�ng lao c�a ng��i th�t l�n!")
			else									--��ʧ����
				Talk(1,"","Tuy �� t�m ra ph�n �� ���ng H�a, nh�ng ch�a t�m �m kh� ph� v� l� ch�a ���c ��u!")
			end
		elseif (UTask_tm > 50*256) and (UTask_tm < 60*256) then					--��δ���50������
			Talk(1,"","���ng Nh�n:B� ki�p b� c��p th�t kh�ng ph�i chuy�n ��a. Kh�ng nh�ng l�o phu mang tr�ch nhi�m n�ng n� m� c�n g�y h�i cho ng��i v� t�i!")
		elseif (UTask_tm >= 60*256) then					--�Ѿ����50��������δ��ʦ
			Talk(1,"","May m� c� ng��i h�a gi�i ���c ��i h�a, n�u kh�ng th� h�u qu� kh�n l��ng!")
		else
			Talk(1,"","C�ng phu �m kh�, ng��i c� ch� n�o kh�ng hi�u c� ��n h�i l�o phu!")
		end
	elseif (UTask_tm >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","Tr�n giang h�, �ao th��ng d� tr�nh n� nh�ng �m ti�n kh� ph�ng.")
	else											-- ȱʡ�Ի�
		Talk(1,"","C�ng phu �m kh� trong thi�n h�, n�u ta kh�ng ��ng ��u thi�n h� th� c�n ai n�a! Ng��i ph�c kh�ng?")
	end
end;

function L50_step0()
	Talk(2,"L50_get","B�n m�n canh ph�ng nghi�m ng�t, ng��i ngo�i kh�ng c�ch n�o bi�t ���c b� ki�p gi�u � ��u, c� mu�n tr�m c�ng kh�ng tr�m ���c. V� th� ng��i tr�m b� ki�p xu�t qu� nh�p th�n c�ch m�y, nh�t ��nh c�ng c� th� ti�p c�n ���c k� tr�m. Ta nghi r�ng c� n�i gian, nh�ng chuy�n n�y li�n l�y qu� l�n, n�u b�o l�n ch��ng m�n s� g�y n�n chuy�n t�y ��nh! Ta ch� hy v�ng mau s�m t�m ra k� tr�m, s� d�n d�n che l�p �i chuy�n n�y!", "B� ki�p b� m�t khi n�o?")
end;

function L50_get()
	Say("D�a theo suy �o�n, b� ki�p b� m�t tr�m h�m qua!", 2, "Gi�p t�m b� ki�p /L50_get_yes", "Kh�ng �� kh� n�ng /L50_get_no")
end;

function L50_get_yes()
	Talk(1,"","T�i h� �i h�i th�m <color=Red>ng��i kh�c<color>, n�i kh�ng ch�ng s� t�m ra ��u m�i!")
	SetTask(2, 50*256+20)
	AddNote("G�p ���ng Nh�n t�i �m kh� ph�ng (504, 317) , nh�n <color=red>nhi�m v� t�m �m Kh� Ph�<color> ")
	Msg2Player("Nh�n nhi�m v� �m Kh� Ph�. �i t�m �m Kh� Ph� b� ��nh c�p. ")
end;

function L50_get_no()
end;

function L50_prise()
	DelItem(48)
	SetRank(30)
	SetTask(2, 60*256)
--	AddMagic(349)
	add_tm(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Giao �m Kh� Ph� cho ���ng Nh�n, th�ng l�m ���ng M�n T� L�o M�n Nh�n! H�c ���c L�i K�ch Thu�t. ")
	AddNote("Giao �m Kh� Ph� cho ���ng Nh�n, nhi�m v� ho�n th�nh, th�ng l�: T� L�o M�n Nh�n. ")
end;
