-- �ٰ� ·��NPC С̫�ࣨؤ��50������
-- by��Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+40) then				--����50������
		Talk(2,"L50_pay","Ng��i l� ai?","Ta l� ng��i th�n th�ch c�a T�o ��i nh�n! C� ch�t l� v�t � c� h��ng mu�n bi�u cho T�o gia! Xin nh� ng�i th�ng b�o gi�p cho!")
	else
		Talk(1,"","�i ra! �i ra! ��ng c� �i t�i �i lui tr��c c�a Ho�ng Cung")
	end
end;

function L50_pay()
	Say("Th�n th�ch! Th�n th�ch c�i g�? �� ��n ��y �� bi�u x�n m� l�i kh�ng bi�t ti�n l�?",2,"H�i l� 3000 l�ng ng�n l��ng! /L50_pay_yes","Kh�ng cho! /L50_pay_no")
end;

function L50_pay_yes()
	if (GetCash() >= 3000) then
		Pay(3000)
		Talk(1,"after_pay","Bi�t r�i! ��y c� 3000 l��ng, xin bi�u t�n huynh u�ng r��u!")
	else
		Talk(1,"","Th�t l� keo ki�t! Mau �i �i!")
	end
end;

function after_pay()
	NewWorld(177, 1569, 3169)
	Msg2Player("H�i l� 3000 cho Ti�u Th�i gi�m, h�n s� d� d�ng �� cho b�n �i v�o Ng� Hoa Vi�n ")
	Talk(1,"","Nh� v�y c�ng t�m ���c! T�o c�ng c�ng �ang � trong ng� hoa vi�n. Ng��i h�y v�o trong �� m� t�m!")
end

function L50_pay_no()
end;
