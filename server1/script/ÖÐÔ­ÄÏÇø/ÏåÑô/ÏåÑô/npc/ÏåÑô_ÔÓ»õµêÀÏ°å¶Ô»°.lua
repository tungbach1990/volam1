--description: ��ԭ���� ������ �ӻ����ϰ�Ի�	�䵱��20������
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-08)
-- Update: Dan_Deng(2003-08-17)
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+40) and (HaveItem(66) == 1) then
		Talk(2, "", "N�y ch� gia, �ng c� th� gi�p ta s�a t�m ��o b�o n�y?", "Con trai ta l�n V� �ang s�n h�i l� d�u t�m b� s�i hoang trong <color=Red>H�a Lang ��ng<color> ha �i m�t. Ai c� th� c�u ���c con ta?!","C�u ng��i l� kh�n c�p, ta g�i l�i ��o b�o ch� �ng!")
		SetTask(5, 20*256+50)
		DelItem(66)
		AddNote("T�i T��ng D��ng �� t�m th�y �ng ch� ti�m t�p h�a, ���c bi�t con trai c�a b� ta �� b� s�i hoang <color=red>trong ��ng H�a Lang<color> tha �i m�t. ")
		Msg2Player("T�i T��ng D��ng �� t�m th�y b� �ng ch� ti�m t�p h�a, ���c bi�t con g�i c�a b� ta �� b� s�i hoang<color=red> trong ��ng H�a Lang<color> tha �i m�t. ")
	elseif (UTask_wd == 20*256+50) then
		if (HaveItem(67) == 1) then
			Talk(3,"","Kh�ch quan l� �n nh�n c�u m�ng c�a con ta, c�n ta gi�p g� xin c� n�i!","C� th� gi�p ta s�a t�m ��o b�o n�y?","Kh�ng th�nh v�n ��! �� ��n �n c�u m�ng con ta, ta kh�ng l�y ti�n c�ng s�a �o!")
			DelItem(67)
			AddEventItem(68)
			Msg2Player("�o �� ���c v� xong. ")
			SetTask(5, 20*256+80)
			AddNote("�ng ch� ti�m t�p h�a T��ng D��ng d�ng l�a t� t�m �� s�a l�i chi�c �o. ")
		else
			Say("Con trai ta l�n V� �ang s�n h�i l� d�u t�m b� s�i hoang trong <color=Red>H�a Lang ��ng<color> ha �i m�t. Ai c� th� c�u ���c con ta?!", 2, "Ta ch� l� mu�n mua ch�t �t �� th�i /yes", "Ta �� bi�t r�i. /no")
		end
	elseif (UTask_wd == 20*256+80) and (HaveItem(68) == 0) then		-- ���߶���
		AddEventItem(68)
		Talk(1,"","�n nh�n, ng��i qu�n l�y ��o b�o r�i!")
	else
		local Buttons = store_sel_extend();
		Say("Kh�ch quan mu�n mua th� g�? �� �n, m�c, hay �� d�ng?", getn(Buttons), Buttons);
	end
end;

function yes()
	Sale(11)  			--�������׿�
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;
