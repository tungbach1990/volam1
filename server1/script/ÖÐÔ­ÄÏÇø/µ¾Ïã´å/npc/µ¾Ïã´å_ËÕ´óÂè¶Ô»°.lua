--description: ���ִ�_�մ���
--author: wangzg	
--date: 2003/7/22
--71	UTask_world43
--update 2003/7/28 yuanlan
--Update: Dan_Deng(2003-08-07)

function main()
	UTask_world43=GetTask(71)
	if ((UTask_world43==0) and (GetLevel() >= 3)) then		-- ����ȼ�����
		Talk(2, "select", "H�! ��a con ng� ngh�ch c�a ta, ng��i mu�n ta ph�i th� n�o?","C� chuy�n g� v�y?")
	elseif (UTask_world43==2) then
		Talk(2, "", "Ta �� khuy�n T� �� c� g�ng h�c h�nh, ng��i kh�ng n�n lo l�ng.", "T�t qu�! L�o th�n kh�ng bi�t l�y g� �� c�m �n, ��y l� Kim S�ng D��c, ng��i nh�n �i!")
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		SetTask(71,4)
		AddNote("N�i v�i T� ��i Ma, �� thuy�t ph�c th�nh c�ng T� Trung � nh�, nhi�m v� ho�n th�nh. ")
		Msg2Player("N�i v�i T� ��i Ma, �� thuy�t ph�c th�nh c�ng T� Trung � nh�, nhi�m v� ho�n th�nh. ")
		Msg2Player("C� 3 bao Kim S�ng d��c. ")
		AddRepute(6)
		Msg2Player("Thanh th� giang h� c�a b�n ���c gia t�ng 6 �i�m. ")
	elseif (UTask_world43==3) then
		Talk(2, "", "��i Ma! Ta bi�t T� Trung c� ch� kh�, huynh �y mu�n gi�t ��ch tr�n chi�n tr��ng, nam nhi ch� t�i b�n ph��ng. H�y �� huynh �y l�m theo l� t��ng c�a m�nh.", "�i, con �� l�n ta kh�ng th� gi� ���c! N� c� ch� l�n, ta l�m m� c�ng kh�ng th� ng�n c�n, c�m �n ng��i �� gi�p ta hi�u n�, Kim S�ng D��c n�y ng��i l�y �i!")
		Msg2Player("C� 3 bao Kim S�ng d��c. ")
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		SetTask(71,5)
		AddNote("Gi�p T� ��i Ma l� gi�i s� l�a ch�n c�a T� Trung, ho�n th�nh nhi�m v�. ")
		Msg2Player("Gi�p T� ��i Ma l� gi�i s� l�a ch�n c�a T� Trung, ho�n th�nh nhi�m v�. ")
		Msg2Player("C� 3 bao Kim S�ng d��c. ")
		AddRepute(4)
		Msg2Player("Thanh th� giang h� c�a b�n �� t�ng l�n 4 �i�m. ")
	else	
		Say("M�y n�m nay hai m� con ta v�t v� s�ng qua ng�y. C� ngh� ��n T��ng c�ng �� t� tr�n l� ta ch� mu�n kh�c! Hy v�ng con ta ���c b�nh an v� s�!", 0)	
	end
end;

function select()
Say("N� v�n l� ��a nghi�m t�c mi�t m�i ��n s�ch,g�n ��y l�i mu�n t�ng qu�n gi�t gi�c, r�t cu�c kh�ng bi�t n� ngh� g� n�a?", 2, "Ta gi�p b� �i h�i n� /yes", "Vi�c n�y ta c�ng kh�ng bi�t /no")
end

function yes()
SetTask(71,1)
AddNote("Nh�n nhi�m v�: Gi�p T� ��i Ma t�m hi�u suy ngh� c�a con trai. ")
Msg2Player("Nh�n nhi�m v�: Gi�p T� ��i Ma t�m hi�u suy ngh� c�a con trai. ")
end 

function no()
end
