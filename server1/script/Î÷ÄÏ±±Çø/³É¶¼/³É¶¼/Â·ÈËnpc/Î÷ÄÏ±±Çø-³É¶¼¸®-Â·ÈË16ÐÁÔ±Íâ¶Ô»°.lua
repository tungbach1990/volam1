--���ϱ��� �ɶ��� ·��16��Ա��Ի� ������40������
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)

function main(sel)
	UTask_em = GetTask(1);
	if (UTask_em == 40*256+50) then 		
		UTask_emsub03 = GetByte(GetTask(29),3)
		if (UTask_emsub03 == 0) then 
			Say("T�i h� b�nh sinh r�t th�ch k�t giao b�ng h�u v�i hi�p kh�ch giang h�, c�c b�ng h�u t�ng cho ta ngo�i hi�u l� 'Tr�i M�nh Th��ng' qu� l� qu� khen. Nh�ng g�n ��y c� ng��i coi t�i h� ch� l� h� danh, trong l�ng t�i h� v� c�ng t�c gi�n. ", 2, "Xin h�i /L40_V3_Q1", "Ta c�n c� vi�c kh�c. /no")
		elseif (UTask_emsub03 == 3) then 
			L40_V3_Q1()
		elseif (UTask_emsub03 == 5) then 
			L40_V3_Q2()
		elseif ((UTask_emsub03 == 10) and (HaveItem(168) == 0)) then
			AddEventItem(168)
			Talk(1,"","N� hi�p ��ng kh�ch kh�, ng��i �ang c�n thi�t th� h�y l�y �i")
		else
			Talk(1,"","C� th� k�t giao b�ng h�u v�i n� hi�p nh� th� n�y th� th�t h�ng ph�c cho T�n m�.")
		end
	else
		Talk(1,"","T�i h� b�nh sinh r�t th�ch k�t giao b�ng h�u v�i hi�p kh�ch giang h�, c�c b�ng h�u t�ng cho ta ngo�i hi�u l� 'Tr�i M�nh Th��ng' qu� l� qu� khen.")
	end
end;

function no()
	Talk(1,"","V�y t�i h� kh�ng l�m phi�n n�a hi�p n�a!")
end;

function L40_V3_Q1()
	Say("M�nh Th��ng Qu�n l� ng��i n��c n�o nh�?", 4, "S� qu�c /f1", "T� qu�c /L40_V3_Q2", "Tri�u qu�c /f1", "Ng�y qu�c /f1")
end;

function f1()
	Talk(1,"","H�nh nh� l� kh�ng ph�i? L�n tr��c ta c�ng n�i nh� th� n�y b� ng��i kh�c c��i. ")
	SetTask(29, SetByte(GetTask(29),3,3))
end;

function L40_V3_Q2()
	Say("Oa! Th� ra l� ng��i n��c T�. Th�i Chi�n Qu�c c� 4 danh nh�n: M�nh Th��ng Qu�n, T�n L�ng V��ng v� B�nh Nguy�n Qu�n. C�n m�t ng��i n�a l� ai nh�?", 4, "Long D��ng Qu�n /f2", "T�nh Qu�ch Qu�n /f2", "Xu�n Th�n Qu�n /L40_V3_prise", "Thi�u Nguy�n Qu�n /f2")
end;

function f2()
	Talk(1,"","H�nh nh� kh�ng ��ng! Ta ch�a nghe qua bao gi�!")
	SetTask(29, SetByte(GetTask(29),3,5))
end;

function L40_V3_prise()
	Talk(4, "select", "��ng r�i! Sao ta l�i kh�ng ngh� ra nh�? Nghe n�i n�m x�a nh� M�nh Th��ng Qu�n c� 3000 th�c kh�ch, ta tuy kh�ng c� kh� ph�ch nh� th�, nh�ng r�t th�ch k�t giao b�ng h�u v�i n� hi�p nh� th� n�y! N� hi�p c� c�n ta gi�p �� g� kh�ng?", "Ta �ang t�m B�ch T� Gi�i Ch� ", "Sao kh�ng n�i s�m! Ta c� m�t chi�c B�ch T� Gi�i Ch� ��y! T�ng cho n� hi�p!", "�a t� Vi�n ngo�i! ")
end;

function select()
	AddEventItem(168)
	Msg2Player("T�m ���c nh�n M� n�o ")
	SetTask(29, SetByte(GetTask(29),3,10))
	AddNote("� ch� T�n vi�n ngo�i t�i Th�nh �� t�m ���c nh�n M� n�o. ")
end;
