-- �ٰ��Ĳ÷죬��������񼪷�
-- By: Dan_Deng(2003-12-29)
-- GetTask(67): ��24��λΪ����ǣ���1��λΪ�Ƿ����򼪷�

function main(sel)
	Uworld67 = GetTask(67)
	if (GetBit(Uworld67,24) == 1) then			-- �ѻ�
		if (GetBit(Uworld67,1) == 0) then		-- ��δ���������������
			if (GetSex() == 0) then					-- �жԻ�������װ
				Talk(1,"buy_sale","�ng ch�! Nghe v� ta n�i l� ph�c ��m c��i nh� �ng tr� danh thi�n h�, b�y gi� c� b�n kh�ng? ")
			else
				Talk(1,"buy_sale","�ng ch�! V�y c��i nh� �ng c�c k� ��p,l�n n�y c� h�ng kh�ng v�y? ")
			end
		else
			Talk(1,"","Qu�n �o l�n tr��c mua � b�n ti�m m�c v�n v�a v�n ch�! Nh� n�i v�i b�n b� th�n th�ch c�a ng��i nh�!")
		end
	else
		Talk(1,"","Kh�ng ph�i ta n�i qu� ��u, c�c lo�i l� ph�c c�a nh� ta l� t�t nh�t tr�n th� gian, l�c n�o c�n nh� gh� ��n nh�! ")
	end
end

function buy_sale()
	Say("� ��y ta chuy�n may qu�n �o l� ph�c, ���ng nhi�n lo�i n�o c�ng c�, ch� l� gi� ti�n h�i ��t m�t ch�t, c�n 88888 l��ng. ",2,"Ng�y ��i h�, ���ng nhi�n Ta mu�n mua m�t b�. /buy_yes","Kh�ng c�n ��u, ta ch�a l�m ��m c��i /no")
end

function buy_yes()
	if (GetCash() >= 88888) then
		Pay(88888)
		if (GetSex() == 0) then
			AddItem(0,2,28,1,random(0,4),0,0)
		else
			AddItem(0,2,28,4,random(0,4),0,0)
		end
		Uworld67 = GetTask(67)
		Uworld67 = SetBit(Uworld67,1,1)
		SetTask(67,Uworld67)
		Talk(1,"","Kh�ng th�nh v�n ��, s� g�i l�i cho kh�c quan ngay, nh�n th� ch�c kh�ch quan tr�m n�m h�nh ph�c!")
	else
		Talk(1,"","Kh�ng ph�i l� ng��i gi�u c�, th� ��ng ��i h�i m�y th� l� nghi n�y. Mu�n g�, ki�m �� ti�n �� r�i h�ng ��n mua!")
	end
end

function no()
end
