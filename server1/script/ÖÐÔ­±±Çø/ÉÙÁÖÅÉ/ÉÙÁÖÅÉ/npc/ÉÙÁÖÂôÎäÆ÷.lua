--������ �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������
-- Update: xiaoyang(2004\4\23) ����ɼ���ʯ���񣬿��ظ�������

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	Uworld131 = GetTask(131)
	if (Uworld131 == 10) and (GetItemCount(138) >= 5) and (GetItemCount(121) >= 5) and (GetItemCount(118) >=5) then
		Talk(1,"U131_prise","��i s�! C�c lo�i kho�ng th�ch t�i h� �� �em ��n, xin h�y xem qua.","Kho�ng th�ch n�y.....c�m �n ng��i!")
	elseif (GetFaction() == "shaolin") or (Uworld38 == 127) then
		if (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >=4) and ((Uworld131 < 10) or ((GetGameTime() > Uworld131) and (Uworld131 > 255))) then
			Say("B�n t� n�m trong ph�m vi c�a Kim qu�c, c�c th� r�n xung quang c�ch 100 d�m ���c l�nh c�a ��i Kim kh�ng ���c b�n binh kh� kho�ng th�ch cho Thi�u L�m. Hi�n v� kh� trong ch�a �� r� s�t c�, n�u qu�n Kim t�n c�ng ��n, e r�ng kh�ng ch�ng �� ���c. Ta c�n T� Thi�t Kho�ng, L��ng Ng�n Kho�ng, X�ch ��ng Kho�ng.",3,"��ng � �i thu th�p kho�ng th�ch. /yes1","T�i h� mu�n mua v�i lo�i binh kh�. /yes","T�i h� c�n chuy�n kh�c ph�i l�m, l�n sau s� ��i tho�i. /no")
		else
			Say("V� c�ng Thi�u L�m vang danh thi�n h�, nh�ng n�u kh�ng c� v� kh� th� c�ng phu n�o c�ng th�nh v� d�ng.", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
		end
	else
		Talk(1,"","Ch��ng m�n c� l�nh, v� kh� b�n ph�i ch� b�n cho ��ng m�n")
	end
end;

function yes()
	Sale(69)
end;

function yes1()
	Talk(2,"","Thi�u L�m n�m gi� v�n m�nh v� l�m �� m�y tr�m n�m nay, t�i h� nguy�n ph�c v� h�t m�nh!","Ph�t t� bi, Thi�u L�m c�n ng��i gi�p ��! H�y gi�p ti�u t�ng t�m T� Thi�t Kho�ng, L��ng Ng�n Kho�ng, X�ch ��ng Kho�ng m�i lo�i n�m vi�n.")
	SetTask(131,10)
	Msg2Player("��ng � gi�p Thi�u L�m ph�i �i t�m T� Thi�t Kho�ng, L��ng Ng�n kho�ng, X�ch ��ng kho�ng m�i lo�i 5 vi�n. ")
end

function U131_prise()
	for i=1,5 do
		DelItem(138)
		DelItem(121)
		DelItem(118)
	end
	SetTask(131,GetGameTime()+14400)
	i = GetReputeLevel(GetRepute()) + 2
	AddRepute(i)
	Msg2Player("Giao kho�ng th�ch cho Tr�ng M�t, ho�n th�nh nhi�m v�. Danh v�ng c�a b�n t�ng th�m "..i.."�i�m.")
end

function no()
end;
