-- ������ �����ŵ���2 ��������
-- by��Dan_Deng(2003-07-25)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) then		--��������
		if (HaveItem(106) == 1) then
			enroll_prise()
		else
			Say("Kh�ng c� <color=Red>Hoa T�nh<color>, kh�ng th� v��t qua Hoa Kh�i tr�n. T� th�t s� mu�n qua tr�n?",2,"L�n n�y ta kh�ng c� chu�n b� t�t /U36_uncompleted","Ta ti�p t�c x�ng tr�n /no")
		end
	elseif (GetFaction() == "cuiyan") then			-- ���ŵ���
		Say("S� mu�i luy�n c�ng trong Hoa Kh�i tr�n? C� mu�n r�i kh�i Hoa Kh�i tr�n kh�ng?",2,"���c, �a t� t� t� /U36_leave","Kh�ng c�n, ta c�n ph�i ti�p t�c luy�n c�ng /no")
	elseif (UTask_cy == 70*256) then			-- �ѳ�ʦ
		Talk(1,"","Th� ra l� S� t�, l�u qu� kh�ng g�p!")
	else
		Talk(1,"","Hoan ngh�nh ��n Th�y Y�n m�n.")
	end
end;

function enroll_prise()
	Talk(1,"U36_leave","Ch�c m�ng! B�n �� v��t qua th� th�ch c�a B�n ph�i, t� b�y gi� ch�ng ta l� t� mu�i t�t! ")
	DelItem(106)			-- �黨
	i = ReturnRepute(20,29,5)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	Uworld36 = SetByte(GetTask(36),2,127)
	SetTask(36,Uworld36)
	AddNote("Ho�n th�nh nhi�m v� Hoa Kh�i tr�n, tr� th�nh <color=Red>K� Danh �� t�<color> c�a Th�y Y�n m�n ")
	Msg2Player("Ho�n th�nh nhi�m v� Hoa Kh�i tr�n, tr� th�nh K� Danh �� t� c�a Th�y Y�n m�n ")
end;

function U36_uncompleted()
	Talk(1,"U36_leave","Hoan ngh�nh t� mu�i x�ng tr�n b�t c� l�c n�o!")
end

function U36_leave()
--	SetPos(304,1498)
	SetPos(340,1456)
end

function no()
end
