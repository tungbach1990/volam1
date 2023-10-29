--description: �����ɸ��� 
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	
	if allbrother_0801_CheckIsDialog(1) == 1 then
		allbrother_0801_FindNpcTaskDialog(1)
		return 0;
	end
	
	
	UTask_em = GetTask(1)
	if (UTask_em == 40*256+10) then
		Talk(1,"","C� chuy�n g�? H�y ��nh b�i <color=Red>Linh th�<color> c�a ta r�i h�y n�i.")
		AddNote("T�m ���c m�t cao nh�n �n c�, mu�n nh�n ���c s� gi�p �� c�a �ng ta th� ph�i ��nh b�i ���c Linh th� do �ng ta nu�i ")
	elseif (UTask_em == 40*256+20) then
		Say("Mu�n c� Kh�c Ph� th� c�n ph�i mang <color=red>Ph� dung c�m k�<color> ��n ��i. B�c tranh �� hi�n �ang n�m trong tay 1 ti�u c�c � ph� Th�i B�nh, n�u c� b�n l�nh th� ��n �� l�y r�i mang v� ��y ��i ")
		SetTask(1, 40*256+40)
		AddNote("��nh b�i ���c linh th�, nh�n nhi�m v� ��n ti�u c�c mang b�c tranh Ph� dung c�m k� v� ")
		Msg2Player("Cao nh�n y�u c�u mang b�c tranh Ph� dung c�m k� v� ��i Kh�c ph� B�ch �i�u Tri�u Ph�ng ")
	elseif ((UTask_em == 40*256+60) and (HaveItem(21) == 1)) then						--�õ�ܽ�ؽ���ͼ
		Talk(6, "select", "��y l� 'Ph� Dung C�m K� ��' m� ng��i c�n.", "��y qu� l� b�n g�c c�a ti�n nh�n. Ha ha ha�Ta ng�y ��m t�m ki�m, cu�i c�ng m�i c� ���c!", "Hi�n gi� ti�n sinh c� th� ��a kh�c ph� 'B�ch �i�u Tri�u Ph�ng' cho ta kh�ng?", "C�i n�y...", "Ti�n sinh l� cao nh�n ti�n b�i, n�i ph�i gi� l�i, n�u kh�ng s� b� thi�n h� ch� c��i.", "Ta kh�ng n�i l� kh�ng ��a. N�y l� kh�c ph�, ng��i c�m l�y �i!")
	elseif ((UTask_em == 40*256+80) and (HaveItem(22) == 0)) then
		AddEventItem(22)
		Talk(3,"","Kh�ng th�y Kh�c ph� �? T�i ng��i kh�ng t� l�y, kh�ng th� tr�ch ta ���c ","Ti�n b�i cao nh�n m� l�i l��ng g�t �� c�a h�u b�i nh� v�y, n�u tin n�y m� lan truy�n ra ngo�i th� thanh danh ng��i s�. ","Th�i ���c r�i, ta s� ng��i r�i, mau c�m Kh�c Ph� r�i �i mau ")
	elseif (UTask_em >= 40*256+40) and (UTask_em < 40*256+80) then
		Talk(1,"","Mu�n l�y kh�c ph� �? Mang <color=Red>'Ph� Dung C�m K� ��'<color> t�i ��i.")
	elseif (UTask_em >= 40*256+80) then
		Talk(1,"","Ph� Dung C�m K� �� qu� th�t tr�c tuy�t! Xem c� ��i c�ng kh�ng ch�n.")
	else
		Talk(1,"","K� nh�n c� ��ng ��n qu�y r�y ta!")
	end
end;

function select()
	DelItem(21)
	AddEventItem(22)
	SetTask(1, 40*256+80)
	AddNote("D�ng Ph� Dung K� C�m ��o' ��n Cao Nh�n ��i l�y b�n nh�c 'B�ch �i�u Tri�u Ph�ng'. ")
	Msg2Player("Nh�n ���c b�n nh�c 'B�ch �i�u Tri�u Ph�ng ")
end; 
