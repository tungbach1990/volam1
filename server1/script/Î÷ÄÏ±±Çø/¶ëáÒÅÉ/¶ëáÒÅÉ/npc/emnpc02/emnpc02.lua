--description: ������Ҷ����
--author: yuanlan	
--date: 2003/3/3
--update: Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--update: Dan_Deng(2003-07-24), �ӡ��ط����ɡ�����
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ��أ�ȡ����˽ű���ز��ݣ�
-- Update: Dan_Deng(2004-01-13)��������������񣬸�Ϊ������������

function main()
	UTask_em = GetTask(1)
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 0)	and (GetLevel() >= 10) and (GetFaction() ~= "emei") then			-- ��������
		Say("Nga Mi s�n l� v�ng ��t thi�ng li�ng m�t c�i c�a Nga Mi, kh�ng ��n ti�p k� ph�m tr�n dung t�c.Ng��i c� h�ng th� x�ng v�o Li�n Ho�n quan sao?", 2, "�� ta th� xem. /Uworld36_get_yes", "Ta ch�p nh�n thua cu�c /no")
	elseif (Uworld36 == 20) then 					--��ɵ�һ��
		Talk(1,"","Ng��i c� th� ti�p t�c th� th�ch, v� ti�p theo l� S� mu�i <color=Red>T�n � Phong<color> � <color=Red>Ngh�nh Kh�ch Th�ch<color>")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--��δ���ţ���ȡ����������
--		Say("Ҷ���ۣ�Ҫ����뱾�ɣ�������ͨ��������Ŀ��飬Ȼ���ٴ������µõ��������⣬�㶼��������",2,"�Ҳ�������������/enroll_cancel","�������ܿ���/no")
	elseif (GetFaction() == "emei") then   				--�Ѿ����ţ���δ��ʦ
		Talk(1,"","S� mu�i! C� th�ch u�ng tr� kh�ng?")
	else							--�����Ի�
		Talk(1,"","Th�ch chi�n khinh phi s�t s�t tr�n; Nh� h��ng phanh xu�t ti�n kh� xu�n; Th� gian tuy�t ph�m nh�n nan th�c; Nh�n ��i tr� kinh �c c� nh�n..")
	end
end;

function Uworld36_get_yes()
	AddNote("G�p Di�p B�ng Ng�n, nh�n nhi�m v� x�ng Li�n Ho�n Quan ")
	Msg2Player("G�p Di�p B�ng Ng�n, nh�n nhi�m v� x�ng Li�n Ho�n Quan ")
	Talk(3, "select", "Kh� l�m! Mu�i c�n qua <color=Red>4 �i<color>, ch� c�a ta l� <color=Red>�i th� 1<color>.", "Ta r�t th�ch u�ng tr�, n�o c�ng ta u�ng 3 ly! Ch� c�n mu�i c� th� tr� l�i 3 c�u h�i v� tr�, l� c� th� qua �i thu�n l�i!.", "N�u kh�ng tr� l�i ���c, h�y quay v� �i! Nga Mi S�n kh�ng hoan ngh�nh nh�ng k� t�m th��ng!")
end;

function no()
end;

------------------- ���������ʴ� -----------------------
function select()
	Msg2Player("D�ng xong ch�n tr� th� nh�t, tr� l�i c�u h�i th� nh�t. ")
	Say("Ly th� nh�t l� Thi�t Quan �m, mu�i c� bi�t Thi�t Quan �m thu�c lo�i tr� n�o kh�ng?", 3, "H�ng tr� /False1", "L�c tr� /False1", "� Long tr�. /True1");
end;

function False1()
	Say("Kh�ng ��ng r�i! Cho mu�i th�m 1 l�n c� h�i, suy ngh� th�t k� nh�!.", 3, "H�ng tr� /False1", "L�c tr� /False1", "� Long tr�. /True1");
end;

function True1()
	Msg2Player("D�ng xong ch�n tr� th� 2, tr� l�i c�u h�i th� 2. ")
	Say("Kh� l�m! M�i u�ng ly tr� th� 2: Ly n�y l� B�ch Hoa Tr� ���c ph�i h�p v�i l�c tr� v� c�c lo�i hoa nh�i, hoa h�ng, t��ng vi, thu c�c, chi t�, m�c t�...H��ng tr� h�a quy�n v�i h��ng hoa th�nh m�t th�. Mu�i c� bi�t d�ng lo�i n��c g� �� pha tr� kh�ng?", 3, "N��c m�a th�ng 3 /False2", "Su�i � Th�m s�n /False2", "Tuy�t tr�n hoa mai /True2");
end;

function False2()
	Say("Tr� l�i sai r�i, h�y th� l�i �i!", 3, "N��c m�a th�ng 3 /False2", "Su�i � Th�m s�n /False2", "Tuy�t tr�n hoa mai /True2");
end;

function True2()
	Msg2Player("Ng��i h�y u�ng ly tr� cu�i c�ng �i r�i tr� l�i c�u h�i th� 3 ")
	Say("Xem ra mu�i c�ng c�n ch�t th�ng minh. Ly cu�i c�ng l� H�u Kh�i Tr�, lo�i tr� n�y m�c tr�n n�i cao ch�t v�t r�ng s�u n�i th�m.Con ng��i kh�ng th� h�i v�, ch� c� th� hu�n luy�n lo�i kh� l�n n�i h�i v�, t� �� m�i c� c�u chuy�n l� H�u kh�i, v�i mu�n v�n v�t v� m�i c� ���c lo�i l�c tr� qu� hi�m. Mu�i c� bi�t n�i s�n xu�t H�u Kh�i Tr� � ��u kh�ng?", 3, "Th�i B�nh, Huy Ch�u /True3", "N�i ��ng ��nh Qu�n /False3", "T�y H�, H�ng Ch�u /False3");
end;

function False3()
	Say("C� ph�i mu�i nh� nh�m ch�ng? H�y ngh� l�i �i!", 3, "Th�i B�nh, Huy Ch�u /True3", "N�i ��ng ��nh Qu�n /False3", "T�y H�, H�ng Ch�u /False3");
end;

function True3()
	Talk(1,"","Ng��i c� th� ti�p t�c th� th�ch, v� ti�p theo l� S� mu�i <color=Red>T�n � Phong<color> � <color=Red>Ngh�nh Kh�ch Th�ch<color>")
	Uworld36 = SetByte(GetTask(36),1,20)
	SetTask(36, Uworld36)
	AddNote("B�n tr� l�i ch�nh x�c 3 c�u h�i v� tr�, qua �i th� nh�t. ")
	Msg2Player("Tr� l�i ��ng 3 c�u h�i v� tr� coi nh� ng��i �� qua c�a �i th� nh�t, h�y ��n ' Ngh�nh Kh�ch Th�ch' g�p s� mu�i T�n � Phong �� nh�n th� th�ch ti�p theo ")
end;
