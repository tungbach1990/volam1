--��ԭ���� ��ţɽ3to���Ķ�3
--Trap ID����ԭ���� 20

function main(sel)
	if (GetTask(129) == 50) then			-- ����Ȫ����
		Say("V�a ��n c�a ��ng, ��t nhi�n b�n nghe ti�ng k�u th�m th��ng, h�nh nh� l� ti�ng c�a Chu V�n Tuy�n..",2,"�i c�u ng��i /U129_50","Kh�ng ch� � ��n, �i v�o ��ng Thi�n T�m. /enter_cave")
	elseif (GetTask(129) == 55) then		-- ս��δ������ǿ�Ƚ������Ķ�
		Talk(1,"go_Zhome","��ng l�i! Ti�p chi�u ��y! ")
	else
		enter_cave()
	end
end;

function enter_cave()
	SetFightState(1)
	NewWorld(42, 1676, 2901);
	AddTermini(109)
end

function U129_50()
	SetTask(129,55)
	Talk(4,"go_Zhome","T�i sao c�c ng��i t�i sao l�m h�i Chu huynh? ","Ng��i t� ��u ��n? ��ng c� nhi�u chuy�n!","Xem ra b�c th� gi� m�o n�y, th� ra l� m�u ma ch��c qu� c�a b�n ng��i!","H�! Thi�n Nh�n b�n ta h�nh s�, kh�ng ai c� th� bi�t ���c. Nh�ng ng��i �� bi�t ���c chuy�n n�y, th� b�n ta ��nh ti�n ng��i c�ng h�n v� b�n kia th� gi�i v�y. ")
end

function go_Zhome()
	SetFightState(1)
	NewWorld(232,1612,3204)
end
