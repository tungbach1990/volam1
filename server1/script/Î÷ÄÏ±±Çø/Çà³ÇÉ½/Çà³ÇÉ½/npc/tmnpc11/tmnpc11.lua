--description: ���Ź����� 40������ 
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(7) == 1 then
		allbrother_0801_FindNpcTaskDialog(7)
		return 0;
	end
	UTask_tm = GetTask(2)
	if (UTask_tm == 40*256+20) then
		if (GetTaskTemp(4) == 31) then  --�Ѿ������ֻ����
			Talk(7, "L40_step42", "V�n b�i l� �� t� ���ng M�n, �� t�ng nghe qua C�nh T� K� ��i hi�p! ", "���ng D� l� ai?", "L� s� th�c c�a v�n b�i.", "H�! H�n kh�ng c�n m�t m�i n�o ��n ��y g�p ta, hay ch�ng d�m ��n g�p ta? L�i ph�i m�t t�n ti�u b�i nh� ng��i ��n l�m g�?", "Ti�n b�i hi�u l�m r�i! N�m x�a s� th�c kh�ng ph�i th�y ch�t kh�ng c�u, m� l� b�n m�n v�n c� m�n quy, kh�ng ���c tr� b�nh cho ng��i ngo�i n�n th�c th�c m�i b�t ��c d� th�i! �� nhi�u n�m nay �ng c� m�i ray r�c trong l�ng!", "Nh�ng duy�n c� n�y sao h�n kh�ng ��ch th�n ��n gi�i b�y c�ng ta?", "Ti�n b�i bi�t s� th�c v�n c�n hi�u l�m, e r�ng v�a g�p m�t kh�ng k�p m� mi�ng thׅ�.")
		else
			Talk(1,"","M�c k� ng��i l� ai, chuy�n g� th� c�ng ph�i h� g�c 5 con gia s�c c�a ta <color=Red>S�i x�m, M�nh h�, Kim Ti�n b�o, Heo r�ng, G�u n�u <color> r�i m�i n�i!")
--			AddNote("�����ɽ�����ҵ������棬��Ҫ�ȴ��������ֻ����Żᱻ��������ᡣ")
		end
	elseif (UTask_tm == 40*256+60) then
		if (HaveItem(43) == 1) and (HaveItem(44) == 1) and (HaveItem(45) == 1) and (HaveItem(46) == 1) and (HaveItem(47) == 1) then		--�Ѿ��õ�����ҩ��
			Talk(2, "", "Ti�n b�i, 5 lo�i n�y l� thu�c ch�a b�nh l�, ch� c�n u�ng 3 l�n l� c� th� ch�a ���c b�nh!", " T�t l�m! Con g�i ta ���c c�u r�i! �a t� ng��i, c�ng �a t� s� th�c c�a ng��i, ta �� hi�u l�m r�i!")
			DelItem(43)
			DelItem(44)
			DelItem(45)
			DelItem(46)
			DelItem(47)
			SetTask(2, 40*256+80)
			AddNote("Giao ph��ng thu�c cho C�nh T� K�, �� h�a gi�i th�nh c�ng �n o�n gi�a �ng ta v� ���ng D� ")
			Msg2Player("Ki�m �� 5 lo�i d��c li�u �em cho C�nh T� K�, �� h�a gi�i th�nh c�ng �n o�n gi�a �ng ta v� s� th�c ")
		else
			Talk(3, "", "Ng��i qu� th�t c� c�ch c�u con g�i ta sao?", "���ng D� s� th�c �� n�i cho v�n b�i ph��ng thu�c n�y! V�n b�i �ang t�m 5 lo�i d��c li�u c�n thi�t �� ch�a b�nh l�!", "Th�t c�m �n ng��i! ")
		end
	elseif (UTask_tm >= 40*256+40) and (UTask_tm < 40*256+80) then					--��δ���40������
		Talk(1,"","Ng��i qu� th�t c� c�ch c�u con g�i ta sao?")
	elseif (UTask_tm >= 40*256+80) and (UTask_tm < 70*256) then					--�Ѿ����40��������δ��ʦ
		Talk(1,"","Ta �� tr�ch l�m s� th�c ng��i, ta th�t l�y l�m h� th�n!")
	else									--��δ���40������ȱʡ�Ի���
		Talk(1,"","�i�u m� ta �au l�ng nh�t tr�n ��i l� ng��i b�n th�n nh�t c�a ta l�i l� k� v� t�nh v� ngh�a!")
	end
end;

function L40_step42()
	SetTask(2, 40*256+40)
	AddNote("��nh b�i 5 lo�i gia s�c c�a C�nh T� K�, bi�t con g�i �ng ta m�c c�n b�nh k� qu�i, mu�n t�m ��ng D� s� th�c �� ngh� c�ch ch�a tr� ")
	Talk(4,"","K� th�c, ta gi�t h�n li�u c� �ch g�? Th� t� c�a ta c�ng kh�ng th� s�ng l�i ���c, v�n ta �� kh�ng c�n h�ng th�, ch� mong ���c s�ng b�n ��a con g�i b� b�ng c�a ta. N�o ng�, ��a con g�i duy nh�t c�ng m�c ph�i ch�ng b�nh l� nh� v�y. N�u c� con g�i c�ng r�i b� ta m� �i, ta s�ng tr�n ��i c�n c� � ngh�a g�!", "Ti�n b�i, ��ng n�n n�ng! Con g�i c�a ng��i nh�t ��nh ���c c�u!", "C�n c� c�ch g� sao? S� th�c c�a ng��i l� thi�n h� �� nh�t th�n y. Ngo�i h�n, c�n ai c� th� c�u ���c con g�i ta!", "Ta c� c�ch! �� ta �i t�m S� th�c!")
end;
