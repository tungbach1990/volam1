--description: ���������з�
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 20) then					--��������
		Msg2Player("Ti�p nh�n th� th�ch th� hai c�a T�n � Phong �� l� tr� l�i 3 c�u h�i v� 'Nh�c' ")
		Say("Mu�i c� bi�t c�m k� thi h�a? �� ta th� mu�i xem sao! Mu�i c� bi�t ca kh�c n�o sau ��y ph�i d�ng ��n T� B� �� di�n t�u?", 3, "T� V� M�c D��ng /False4", "Cao S�n L�u Th�y /False4", "Th�p Di�n Mai Ph�c /True4")
	elseif (Uworld36 == 40) then 					--�������������ǰ����
		Talk(1,"","Xem ra mu�i ch� l� m�t k� t�m th��ng. Nh�ng �� S� mu�i <color=Red>H� Linh Phi�u<color> th� mu�i xem sao! C� ta �ang � <color=Red>B�n S�n Ph� <color>!")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--��δ����
--		Talk(1,"","���з磺Ҫ����뱾�ɣ�������ͨ��������Ŀ��飬Ȼ���ٴ������µõ��������⣬�㶼��������")
	elseif (GetFaction() == "emei") then   				--�Ѿ����ţ���δ��ʦ
		Talk(1,"","S� mu�i! R�nh r�i ta c�ng trao ��i c�m ngh�!")
	else							-- �����Ի�
		Talk(1,"","Mu�n g�i g�m t�m s� v�o ng�n ��n Dao C�m. Thi�u kh�ch tri �m, huy�n �o�n c� m�y ai nghe?")
	end
end;

function False4()
	Say("Kh�ng ��ng!", 3, "T� V� M�c D��ng /False4", "Cao S�n L�u Th�y /False4", "Th�p Di�n Mai Ph�c /True4");
end;

function True4()
	Say("Tr� l�i ��ng r�i! C�u h�i th� 2: C�i n�o d��i ��y kh�ng thu�c t� ��i danh c�m?", 3, "Ho�ng Chung /True5", "L�c Kh�i /False5", "Ti�u V� /False5");
end;

function False5()
	Say("Kh�ng tr� l�i ���c �?", 3, "Ho�ng Chung /True5", "L�c Kh�i /False5", "Ti�u V� /False5");
end;

function True5()
	Say("Kh�ng kh� kh�n v�i mu�i ch�? Gi�i l�m! Mu�i c� bi�t kh�c 'Qu�ng L�ng T�n' l� ai vi�t kh�ng?", 3, "L�o T� /False6", "K� Ki�n /True6", "Khu�t Nguy�n /False6");
end;

function False6()
	Say("Kh�ng bi�t �? Hay l� mu�i th�y kh� kh�n m� l�i b��c?!", 3, "L�o T� /False6", "K� Ki�n /True6", "Khu�t Nguy�n /False6");
end;

function True6()
	Talk(1,"","Xem ra mu�i ch� l� m�t k� t�m th��ng. Nh�ng �� S� mu�i <color=Red>H� Linh Phi�u<color> th� mu�i xem sao! C� ta �ang � <color=Red>B�n S�n Ph� <color>!")
	Uworld36 = SetByte(GetTask(36),1,40)
	SetTask(36,Uworld36)
	AddNote("T�i Ngh�nh Kh�ch Th�ch g�p T�n � Phong, tr� l�i ch�nh x�c ba c�u h�i v� Nh�c, qua �i th� hai ")
	Msg2Player("T�i Ngh�nh Kh�ch Th�ch g�p T�n � Phong, tr� l�i ch�nh x�c 3 v�n �� v� Kh�c nh�c, qua �i th� hai, ��n B�n s�n Pha ti�p nh�n s� th� th�ch c�a H� Linh Phi�u. ")
end;
