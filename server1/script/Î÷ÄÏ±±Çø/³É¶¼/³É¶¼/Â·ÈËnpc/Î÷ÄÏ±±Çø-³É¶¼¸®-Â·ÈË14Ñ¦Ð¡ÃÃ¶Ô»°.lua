--���ϱ��� �ɶ��� ·��14ѦС�öԻ�  ������40������
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)
-- �޸�Dan_Deng �Ĵ���QBJ(2003-10-3)

function main(sel)
	UTask_em = GetTask(1)
	UTask_emsub01 = GetByte(GetTask(29),1)
	if (UTask_em == 40*256+50) then		-- 40��������
		if (UTask_emsub01 == 0) then
			Talk(5, "", "V� ��i t� n�y, � c�ng v�i mu�i, c� phi�n kh�ng? ", "Kh�ng ti�n! V� tr�n ng��i mu�i c� m�t m�i k� l�,n�n� ", "A! T� ng�i ���c �? Mu�i d�ng Linh X� H��ng Nan, h��ng li�u n�y ch� � T�y V�c m�i c�!", "Th� ra l� Linh X� H��ng Nang! Th�o n�o m�i th�m quy�n r�! Mu�i c� th� b�n cho ta t�i Linh X� H��ng Nang n�y ���c kh�ng? Ta �ang c�n �� c�u ng��i!", "B�n th� kh�ng b�n! Nh�ng mu�i nghe n�i ti�m t�p ho� � trong th�nh g�n ��y c� m�t c�y tr�m b�c ��p, t� l�y c�y tr�m �� ��n ��i v�i ta")
			SetTask(29,SetByte(UTask_emsub01,1,1))			-- ����task(29)��1���ֽ�Ϊ1
--			SetTask(29, 2)	
			AddNote("G�p Ti�t Ti�u mu�i (383, 315) t�m ���c Linh X� H��ng Nang, nh�ng ph�i l�y Ng�n Tr�m ��i. ")
			Msg2Player("Ti�t Ti�u mu�i xin �� ngh� l�y Ng�n Tr�m �� ��i l�y Linh X� H��ng Nang ")
		elseif ((UTask_emsub01 == 1) and (HaveItem(63) == 1)) then
			Say("Tr�m b�c n�y ��p qu�! H��ng nang n�y ��i cho t� ��y!", 1, "T�m ���c Linh X� H��ng Nang /get")
			DelItem(63)
			AddEventItem(166)
			SetTask(29,SetByte(UTask_emsub01,1,10))
--			SetTask(29, 2)
			AddNote("Nh�n ���c Linh X� H��ng Nang t� ch� Ti�t Ti�u mu�i ")
			Msg2Player("T�m ���c Linh X� H��ng Nang ")
		elseif (UTask_emsub01 == 10) and (HaveItem(166) == 0) then
			AddEventItem(166)
			Talk(1,"","C�m l�y n�y! H��ng Nang ch�a l�y �� v�i v�ng ch�y �i!")
		else
			Talk(1,"","��i t�! ��ng c� c�n tr� vi�c l�m �n c�a mu�i c� ���c kh�ng?")
		end
	else
		Talk(1,"","��i t�! ��ng c� c�n tr� vi�c l�m �n c�a mu�i c� ���c kh�ng?")
	end
end;

function get()
end;
