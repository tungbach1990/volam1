-- ѧ���ٸ���ƶ�����ܵ���ؤ
-- By: Dan_Deng(2003-08-22)
-- ��Ǯ����һ��100���ڶ���200��������400...�������ƣ�����8��(12800)֮��ûѧ���ľ�ûʲô�����ˣ�ֻ��Թ̫���ࡣ

function main(sel)
	UTask_world16 = GetTask(16)
	if (UTask_world16 == 255) then			-- ���������
		Talk(1,"","� hi�n g�p l�nh!")
	else
		i = (2 ^ UTask_world16) * 100
		Say("Ch�c ng�i m�nh kh�e, xin th��ng x�t k� �n m�y ngh�o h�n n�y! ",2,"Cho ng��i "..i.."ng�n l��ng./W53_pay","Nh�ng k� �n no l��i bi�ng, nh�t ��nh kh�ng �ng h� /W53_no")
	end
end;

function W53_pay()
	UTask_world16 = GetTask(16)
	i = (2 ^ UTask_world16) * 100
	if (GetCash() >= i) then
		Pay(i)
		if (random(0,99) < 20) then			-- 20%����ѧ�����ٸ���ƶ������
			Talk(3,"W53_prise","�a t� l�ng t�t, c� mu�n h�c m�t v�i tr� ch�i vui kh�ng? ","Tr� g� vui? ","��ng l� nh� th�. V�y. ")
		else
			SetTask(16,UTask_world16 + 1)
		end
	else
		Talk(1,"","B�y gi� ta kh�ng c� ti�n l�!")
	end
end;

function W53_no()
	Talk(1,"","Ng��i kh�ng c� t�m l�ng! B� T�t s� kh�ng ph� h�p.")
end;

function W53_prise()
	AddNote("B� th� cho ng��i �n m�y, h�c ���c k� n�ng 'Ki�p Ph� T� B�n' ")
	Msg2Player("B� th� cho ng��i �n m�y, h�c ���c k� n�ng 'Ki�p Ph� T� B�n' ")
	if (HaveMagic(400) == -1) then		-- ����û�м��ܵĲŸ�����
		AddMagic(400,1)
	end
	SetTask(16,255)
end;
