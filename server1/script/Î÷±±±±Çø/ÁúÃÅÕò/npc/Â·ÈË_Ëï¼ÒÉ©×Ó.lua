-- ������·�ˡ����ɩ��
-- by��Dan_Deng(2003-09-16)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld41 = GetByte(GetTask(41),1)
	if (GetLevel() >= 40) and (GetReputeLevel(GetRepute()) >= 5) then		-- ������������
		if (Uworld41 == 0) or (Uworld41 == 5) then			-- ��������
			Talk(4,""," (Kh�c than) ","V� ��i t�u n�y, c� chuy�n g� m� �au bu�n th�.? "," (Kh�c than) ","... ")
			SetTask(41,5)
		elseif (Uworld41 == 10) or (Uworld41 == 30) then	-- ���������
			Talk(1,"","��i hi�p mu�n gi�p ch�ng ta mang Ti�u Quy�n v� ph�i kh�ng? V� c�ng c�m t�! ")
		elseif (Uworld41 == 100) then					-- �Ѿ��ȳ�С�꣬����δ��
			Talk(1,"","Ti�u Quy�n! Con �� tr� v�! Th�t kh� cho con qu�. Con mau �i g�p cha �� ng��i kh�i lo l�ng.")
		else		-- ���������
			Talk(1,""," Th�t c�m t� ��i hi�p! Ta v� m�y ng��i kh�c s� t�ng ��i hi�p m�t ph��ng thu�c tr��ng sinh.")
		end
	else
		Talk(1,"","��n �ng nh� n�y, t� s�ng ��n t�i c� m� t��ng vi�n v�ng, c�i g� l� ch� kh�, c�i g� l� anh h�ng? T�an l� �� b� �i, kh�ng lo cho cu�c s�ng th�c t�i!")
	end
end;
