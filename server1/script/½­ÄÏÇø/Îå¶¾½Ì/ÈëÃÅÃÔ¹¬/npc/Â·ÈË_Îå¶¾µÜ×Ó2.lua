-- �嶾 ·��NPC �嶾����2 ����������ɣ�
-- by��Dan_Deng(2003-08-05)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) then		-- �����������
		if (HaveItem(227) == 1) and (HaveItem(223) == 1) and (HaveItem(224) == 1) and (HaveItem(225) == 1) and (HaveItem(226) == 1) then
			enroll_prise()
		else
			Talk(1,"","Th�i gian luy�n c�ng v�n ch�a ��, t�i sao ng��i l�i ra ��y?")
		end
	else							-- ����Ի�
		Talk(1,"","Trong ��ng Ng� ��c r�t nguy hi�m, ng��i ch� c� �i l�i lung tung ")
	end
end;

function enroll_prise()
	Talk(1,"","N�m Kh�ng t��c v� �� gom ��. Hay l�m! V�y l� ng��i �� ch�nh th�c tr� th�nh �� t� k� danh c�a b�n m�n r�i")
	DelItem(227)
	DelItem(223)
	DelItem(224)
	DelItem(225)
	DelItem(226)
	i = ReturnRepute(25,29,5)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	Uworld37 = SetByte(GetTask(37),2,127)
	SetTask(37,Uworld37)
	AddNote("Ho�n th�nh nhi�m v� luy�n c�ng � Ng� ��c ��ng, Ch�nh th�c tr� th�nh <color=red>K� Danh �� t�<color> c�a b�n m�n. ")
	Msg2Player("Ho�n th�nh nhi�m v� luy�n c�ng � Ng� ��c ��ng, Ch�nh th�c tr� th�nh K� Danh �� t� c�a b�n m�n. ")
end;
