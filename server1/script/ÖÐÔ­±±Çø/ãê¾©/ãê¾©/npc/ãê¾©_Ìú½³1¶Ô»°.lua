--description: ��ԭ���� �꾩�� ����1�Ի� ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Tr��c kia ti�m th� r�n n�y r�t �n n�n l�m ra, r�t nhi�u v� l�m cao th� ��n ��y ��t l�m binh kh�, b�y gi� th� �. Th�i kh�ng n�i cho xong! Mu�n xem lo�i binh kh� g�?"

function main(sel)
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),1)
		if (UTask_trsub60 == 0) then
			tiejiang_city("<dec><npc>Ta n�m nay �� tr�n ba ch�c r�i m� v�n h�a l�y ���c v�, t�i sao v�n ch�a c� ng��i th�ch ta nh�? Kh�ng d�m gi�u ��i hi�p ta r�t th�ch Tr��ng g�a ph� � ph�a ��ng th�nh, nh�ng ta l�i kh�ng d�m m� mi�ng th� l� s� c� �y gh�t ta.", "V�y �� ta th� n�i gi�p �ng nh�!/L60_sub_yes")
		elseif (UTask_trsub60 == 1) then
			if (HaveItem(63) == 1) then
				tiejiang_city("<dec><npc>Phi�n ng��i gi�p ta t�ng c� �y c�y tr�m b�c n�y ���c kh�ng?")
			else
				AddEventItem(63)
				Talk(1,"","Ng��i ch�a l�y ng�n tr�m �� v�i b� �i, r�t cu�c c� mu�n gi�p ta kh�ng?")
			end
		elseif (UTask_trsub60 == 2) and (HaveItem(64) == 1) then
			Talk(2, "", "Th�t ra Tr��ng qu� ph� c�ng c� c�m t�nh v�i �ng, ��y l� H��ng Nang c�a c� ta ��a �ng!", "C�m �n ng��i! N�u kh�ng c� ng��i, ch�ng t�i kh�ng bi�t m�t bao l�u m�i hi�u t�m � c�a nhau n�a. Ta c� 1 thanh �o�n ki�m, m�c d� kh�ng ��ng gi� l� bao, nh�ng l� v�t t� truy�n c�a ta, b�y gi� t�ng ng��i coi nh� t� l�.")
			DelItem(64)
			AddEventItem(127)
			SetTask(28, SetByte(GetTask(28),1,10))
			AddNote("Giao H��ng nang cho Kh�c Thi�t T��ng, nh�n ���c �o�n Ki�m 'Y�m Nh�t'.")
			Msg2Player("Nh�n ���c �o�n Ki�m 'Y�m Nh�t'.")
		else
			if (HaveItem(127) == 1) then
				tiejiang_city("<dec><npc>�a t� ��i hi�p �� l�m m�i gi�p ta v�i Tr��ng g�a ph�, c�n xem lo�i binh kh� g� � ��y?")
			else
				AddEventItem(127)
				Talk(1,"","M�c d� ng��i thi �n b�t c�u b�o, nh�ng ng��i �� gi�p ta vi�c l�n nh� th�, thanh ki�m n�y b�t lu�n th� n�o ng��i c�ng ph�i nh�n l�y.")
			end
		end
	elseif (UTask_tr > 60*256+20) then
		tiejiang_city("<dec><npc>�a t� ��i hi�p �� l�m m�i gi�p ta v�i Tr��ng g�a ph�, c�n xem lo�i binh kh� g� � ��y?")
	else
		tiejiang_city()
	end
end;

function L60_sub_yes()
	Talk(1,"","V�y l�m phi�n ng��i r�i! C�y ng�n tr�m n�y ch�nh tay ta l�m, ng��i gi�p ta ��a cho c� ta, n�u c� ta nh�n ch�ng t� trong l�ng c� �y c� ta.")
	AddEventItem(63)
	SetTask(28, SetByte(GetTask(28),1,1))
	AddNote("��i tho�i v�i Kh�c Thi�t T��ng, nh�n mang Ng�n tr�m t�ng cho Tr��ng qu� ph� ")
	Msg2Player("Nh�n ���c 1 c�y Ng�n tr�m.")
end;

function yes()
Sale(7);  			--�������׿�
end;

