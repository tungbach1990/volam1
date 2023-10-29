-- ·��_����ԭ.lua
-- By: Dan_Deng(2004-04-13)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld50 = GetTask(50)
	if (Uworld50 == 10) then
		Talk(8,"Uworld50_10","Ng��i v� ta ��u l� thanh ni�n, sao l�i gi�ng nh� ng��i gi� ��n ��y d�y ��i ta h�?","Kh�ng! T�t c� ch� l� �n t��ng c�a c� nh�n, b�i v� m�i ng��i c� l�p tr��ng ri�ng kh�c v�i c�ch ngh� c�a ng��i kh�. N�n ta ch� mu�n nghe suy ngh� c�a ng��i v� B�ch Doanh Doanh nh� th� n�o th�i.","Doanh Doanh b�n ch�t l��ng thi�n, c� l�n ch�ng t�i v�o n�i s�u s�n b�n ki�m th�c �n, c� �y v� con v�t nh� b� ta b�n tr�ng m� �au l�ng r�i l�.","Ng� ��c gi�o d�a v�o qu�n Kim xem ch�ng ta l� k� th�, tr�ng c� ta nh� v�y ng��i kh�ng c�m th�y r�t kh� ph�n bi�t th�t gi� sao?","Tr��c ��y c� th� l� nh� v�y, nh�ng sau n�y c� �y th�y nh�n d�n l�m than, th�m ch� c�n b� qu�n Kim t�n s�t, th� �� t� m�nh h�i c�i nh�ng vi�c sai tr�i tr��c ��y. C� �y kh�ng c� c�ch n�o thuy�t ph�c ���c anh m�nh!","Nh� th� th� � ta hi�u r�i!","Ng��i l� ng��i ��u ti�n �� b�nh t�nh nghe ta n�i v� B�ch Doanh Doanh, xin nh� ng��i gi�i th�ch v�i cha ta v� nh�ng ng��i kh�c �� h� hi�u.","C�ng kh�ng nh�t ��nh nh� v�y! Tr��c ti�n ta chu�n b� �i Ng� ��c gi�o m�t chuy�n �� nghe B�ch Doanh Doanh n�i chuy�n.")
	elseif (Uworld50 == 30) then
		Talk(2,"","Ta �� n�i B�ch Doanh Doanh l� ng��i th�t l�ng, m� c�c ng��i c�n ch�a tin sao?","C� l� nh� th�! Nh�ng ta khuy�n ng��i nh�t ��nh C�n th�n! Kh�ng n�n qu� tin t��ng c� ta. Ta s� ti�p t�c l�u � h�nh tung cu� c� ta xem c� ph�i nh� v�y kh�ng.")
	elseif (Uworld50 == 40) and (HaveItem(383) == 1) then		-- ��������
		Talk(5,"Uworld50_prise","V�y.....l� n�o B�ch Doanh Doanh lu�n l�a g�t ta?","R�t ti�c! Nh�ng vi�c c� �y b� m�t c�u k�t v�i qu�n Kim l� c� th�c!","V�y l� t� tr��c t�i gi� ta lu�n b� c� ta l�i d�ng, ta th�t ngu ng�c!","T� thi�u hi�p ch� l� nh�t th�i kh�ng xem x�t k�, b� y�u n� l�i d�ng, t�nh ng� l� t�t r�i, c�ng kh�ng n�n qu� b�n t�m l�m g�.","L�n n�y may m�n ���c khuy�n gi�i, th�t kh�ng bi�t c�m �n th� n�o m�i ph�i.")
	elseif (Uworld50 >= 50) then			-- �����Ѿ����
		Talk(1,"","R�t c�m �n ng��i! N�u kh�ng c� ng��i gi�p ��, b�y gi� ta �� b� B�ch Doanh Doanh b� b�a m�, kh�ng ch�ng �� g�y ra sai l�m nghi�m tr�ng r�i.")
	else
		Talk(1,"","C� n��ng t�t nh� B�ch Doanh Doanh, t�i sao ai c�ng ph�n ��i?")
	end
end

function Uworld50_10()
	SetTask(50,20)
	Msg2Player("B�n quy�t ��nh ��n Ng� ��c Gi�o 1 chuy�n, nghe B�ch Doanh Doanh t� m�nh gi�i th�ch. ")
end

function Uworld50_prise()
	Talk(1,"","Nh� th� n�y v�y, ta n�i cho ng��i nh�ng kinh nghi�m khi ta luy�n v�, hy v�ng ng��i xem n� c� t�c d�ng tham kh�o.")
	DelItem(383)
	SetTask(50,50)
	AddProp(1)
	AddVit(1)
	Task88_3 = GetByte(GetTask(88),3) + 1
	if (Task88_3 > 255) then Task88_3 = 255 end
	Task88 = SetByte(GetTask(88),3,Task88_3)
	SetTask(88,Task88)			-- ��¼������⹦������
	Msg2Player("C�ng t�m t�i kh�m ph� v�i T� Trung Nguy�n, ngo�i c�ng c�a b�n �� t�ng l�n 1 �i�m. ")
	i = ReturnRepute(25,60,4)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)		-- ������
end
