-- ��Ȫ�� ְ��NPC ҩ���ϰ壨�嶾10������
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	UTask_wu = GetTask(10)
	if ((UTask_wu == 10*256+10) and (HaveItem("10 bao t�n th�ch") == 0)) then 		--������
		Say("Ch� t�i ��y d��c li�u g� c�ng c�, c� b�nh th� kh�i b�nh, kh�ng b�nh kh�e ng��i, b�n thu�c ��ng gi� kh�ng l�a g�t, ng�i mua m�t �t ch�?", 3, "C� b�nT�n th�ch kh�ng v�y?/L10_buy", "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Say("Ch� t�i ��y d��c li�u g� c�ng c�, c� b�nh th� kh�i b�nh, kh�ng b�nh kh�e ng��i, b�n thu�c ��ng gi� kh�ng l�a g�t, ng�i mua m�t �t ch�?", 3, "Giao d�ch/yes","Ta ��n nh�n nhi�m v� S� nh�p/yboss", "Kh�ng giao d�ch/no")
	end
end;

function L10_buy()
	Talk(1,"L10_buy_sele","�� ��u l� ��c d��c c�! Ng��i mua m�t l�c nhi�u nh� v�y �� l�m g�?")
end;

function L10_buy_sele()
	Say("Nh�ng m� n�u ng��i c� th� tr� th�m ta ch�t ��nh thׅ�heyhey, 1000 l��ng th�i!",2,"Mua/L10_buy_yes","Sao gi�ng c��p qu� v�y!/L10_buy_no")
end;

function L10_buy_yes()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(220)
		AddNote("Mua ���c 10 bao T�n th�ch.")
		Msg2Player("Mua ���c 10 bao T�n th�ch.")
	end
end;

function L10_buy_no()
	Talk(1,"","Mu�n mua th� b�n! H�m!...ai m� bi�t ���c mi mua nhi�u nh� v�y �� l�m g� ")
end;

function yes()
	Sale(30);  			--�������׿�
end;

function no()
end;
