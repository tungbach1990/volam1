-- �ٰ� ·��NPC �ſ���ؤ��50������
-- by��Dan_Deng(2003-07-28)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(3) == 1 then
		allbrother_0801_FindNpcTaskDialog(3)
		return 0;
	end
	UTask_gb = GetTask(8)
	Uworld75 = GetTask(75)
	U75_sub5 = GetTask(56)
	if (UTask_gb == 50*256+20) and (HaveItem(139) == 0) then		--����50������
		Talk(5,"L50_Step1","Tr��ng ��i nh�n! Ch�ng ta l�i g�p nhau","L�n tr��c may nh� c� qu� bang hi�p ngh�a gi�p ��! Kh�ng bi�t l�n n�y t�i h� c� th� gi�p ���c g�?","Bang ch� ph�i ta mang b�c ��a �� c�a Trung Nguy�n giao ��n cho Ho�ng Th��ng. Nh�ng kh�ng c� l�nh b�i n�n kh�ng th� v�o ���c Ho�ng cung","V�y kh�ng lo! � ��y ta c� l�nh b�i. Xin c� c�m l�y m� d�ng","�a t� Tr��ng ��i nh�n!")
	elseif (UTask_gb == 50*256+30) then
		Talk(5,"L50_Step2","Tr��ng ��i nh�n! ��y l� l�nh b�i th�ng h�nh! Xin g�i l�i cho ng�i!","Sao r�i! �� g�p ���c Ho�ng th��ng ch�a?","Ho�ng th��ng th� ch�a g�p. Nh�ng m� c� g�p m�t v� l� T�o c�ng c�ng, �ng ta l� ng��i th�n t�n c�a Ho�ng th��ng. Ta �� giao cho �ng �y!","Ai da! ��i s� kh�ng th�nh r�i! Ng��i c�n c� �i�u ch�a bi�t, g� T�o c�ng c�ng n�y v�n c� quan h� m�t thi�t v�i b�n Kim qu�c. Ho�ng th��ng �� kh�ng c�n tin d�ng �ng ta n�a. B�y gi� ��a �� l�i r�i v�o tay �ng ta. E r�ng s� l�i s�p c� ��i h�a","Th�t kh�ng ng�! �� v�o ��n ho�ng cung r�i v�y m� l�i c�n b� l�a! Tr��ng ��i nh�n ��ng lo! Ta s� �i �o�t l�i b�c ��a �� ��!")
	elseif (UTask_gb == 50*256+50) then		--�˴����ټ��������Ʒ�Ƿ���ڣ����˾��ò��Ǻ������壬����Ҳʡ�˲��ٹ�����
		Talk(3,"L50_Step3","Ta �� �o�t l�i b�c ��a �� n�y. L�n n�y xin giao l�i cho Tr��ng ��i nh�n! Khi n�o Ho�ng th��ng l�m tri�u xin h�y giao t�n tay cho Ho�ng Th��ng","C�ng ���c. L�n n�y ta s� v� s� th�nh tr� c�a tri�u ��nh m� h�nh ��ng","L� ng��i T�ng Qu�c,c�n ph�i nh� v�y! T�i h� c�o t�! ")
	elseif (UTask_gb >= 50*256+20) and (UTask_gb < 50*256+40) and (HaveItem(139) == 0) then
		AddEventItem(139)
		Msg2Player("L�i nh�n ���c l�nh b�i �i v�o Ho�ng cung ")
		Talk(1,"","L�nh b�i th�ng h�nh b� m�t r�i? Kh�ng sao! Ta v�n c�n m�t c�i. ")
	elseif (Uworld75 == 10) and (U75_sub5 < 10) then		-- ȭ�����������У���ȡ������
		if (HaveItem(384) == 1) then
			SetTask(56,10)
			AddNote("Nh�n nhi�m v� ti�p theo: Gi�p Tr��ng Tu�n t�m 5 mi�ng Ng�n L��ng kho�ng ")
			Msg2Player("Nh�n nhi�m v� ti�p theo: Gi�p Tr��ng Tu�n t�m 5 mi�ng Ng�n L��ng kho�ng ")
			Talk(1,"","Ta c�ng kh�ng mu�n l�m kh� ng��i. ��ng l�c ta c�ng �ang ��nh ch� t�o m�t chi�c �o gi�p m�i. Ng��i h�y �i t�m gi�p ta 5 mi�ng L��ng Ng�n Kho�ng")
		else
		 	Talk(1,"","��n c� m�t b�c th� t�n c�ng kh�ng c�,ch� l� n�i mi�ng.Ta l�m sao c� th� tin ng��i?")
		end
	elseif (Uworld75 == 10) and (U75_sub5 == 10) then		-- ����������ж�
		if (GetItemCount(118) >= 5) then
			DelItem(118)
			DelItem(118)
			DelItem(118)
			DelItem(118)
			DelItem(118)
			SetTask(56,20)
			AddNote("T�m ���c 5 mi�ng Ng�n L��ng kho�ng: �� ho�n th�nh nhi�m v� ")
			Msg2Player("T�m ���c 5 mi�ng Ng�n L��ng kho�ng: �� ho�n th�nh nhi�m v� ")
			Talk(1,"","Ti�u b�ng h�u l�m vi�c th�t c� n�ng l�c. Ti�n �� s� r�ng m� ")
		else
			Talk(1,"","H�nh nh� kho�ng th�ch v�n c�n thi�u! C� l�n! C� l�n!")
		end
	else
		Talk(1,"","Th�t hi�m c� ���c c� h�i �� th� hi�n h�t s�c m�nh nh� v�y, nh�ng m� c�ng c�m th�y g�n c�t r� r�i!�y!")
	end
end;

function L50_Step1()
	AddEventItem(139)
	AddNote("L�i nh�n ���c l�nh b�i �i v�o Ho�ng cung ")
	Msg2Player("L�i nh�n ���c l�nh b�i �i v�o Ho�ng cung ")
end

function L50_Step2()
	DelItem(139)
	SetTask(8,50*256+40)
	AddNote("L�p t�c �i l�y l�i b�c ��a �� Trung Nguy�n ")
	Msg2Player("L�p t�c �i l�y l�i b�c ��a �� Trung Nguy�n ")
end

function L50_Step3()
	SetTask(8,50*256+60)
	DelItem(199)
	AddNote("�� giao b�c ��a �� Trung Nguy�n �� cho Tr��ng Tu�n r�i! ")
	Msg2Player("�� giao b�c ��a �� Trung Nguy�n �� cho Tr��ng Tu�n r�i! ")
end
