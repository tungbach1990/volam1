-- �ٰ��ʹ��ص� ·��NPC �ܹ�����ؤ��50������
-- by��Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+20) and (HaveItem(199) == 1) then		-- 50�����񣬵�һ�ν���
		Talk(3,"L50_after1","V� c�ng c�ng n�y! Ta mu�n v�o g�p Ho�ng th��ng. C� m�t v�t quan tr�ng mu�n giao cho Ho�ng th��ng. "," Ho�ng th��ng hi�n �ang ngh� ng�i. C� giao v�t �� cho ta. Ta s� chuy�n ��n cho Ho�ng th��ng","��chuy�n n�y� ","Sao h�? Kh�ng tin t��ng ta �? C�ng kh�ng ch�u h�i tr��c xem T�o c�ng c�ng ta l� ng��i nh� th� n�o. Ho�ng th��ng t� nh� ��n l�n ��u do ta s�n s�c. L� n�o ta l�i �i g�t ng��i sao? ","V�y c�ng ���c!")
	elseif (UTask_gb == 50*256+50) then		--50�����񣬵ڶ��ν����������ʿ֮��
		Talk(7,"L50_after2","Xin h�y tha m�ng!","N�i! B�c ��a �� Trung Nguy�n hi�n �ang � ��u?","� ch� ta! � ch� ta!","Ta v�n mu�n ��n �� gi�t ng��i ��y!","Xin h�y tha m�ng!","Nh�ng m� ta l�i kh�ng mu�n khi�n cho Ho�ng th��ng kinh s�n�n m�i tha cho c�i m�ng c�a ng��i. Ng��i h�y t� gi� l�y c�i m�ng c�a m�nh. N�u nh� c�n c�u k�t v�i b�n ng��i Kimm�i qu�c c�u vinh th� thi�n h� c�ng s� kh�ng tha cho ng��i. ","D�! D�!")
	elseif (UTask_gb == 50*256+40) then			-- 50�����񣬵ڶ��ν�δ����ʿ
		Talk(1,"","Kh�ng ���c qua ��y! V� s�! Mau ��n c�u mang!")
	else
		Talk(1,"","C� th�ch kh�ch! V� s�!")
		SetFightState(0)
		NewWorld(176, 1627, 3206)
	end
end;

function L50_after1()
	AddNote("Giao b�c ��a �� cho T�o c�ng c�ng. ")
	Msg2Player("Giao b�c ��a �� cho T�o c�ng c�ng. ")
	DelItem(199)
	SetTask(8,50*256+30)
	SetFightState(0)
	NewWorld(176, 1627, 3206)
end

function L50_after2()
	AddEventItem(199)
	AddNote("�o�t l�i b�c ��a �� Trung Nguy�n. ")
	Msg2Player("�o�t l�i b�c ��a �� Trung Nguy�n. ")
	SetFightState(0)
	NewWorld(176, 1627, 3206)
end
