-- ���� ·��NPC ؤ���Զ�����ؤ��30������
-- by��Dan_Deng(2003-07-28)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(193) == 1 then
		allbrother_0801_FindNpcTaskDialog(193)
		return 0;
	end
	UTask_gb = GetTask(8)
	if (UTask_gb == 30*256+10) then		--30������ʼ
		Talk(3,"","Tri�u �� ch�! La tr��ng l�o b�o �� t� ��n h�i nguy�n nh�n t�i sao tr� h�n!","L� v� g�n ��y n�i ��y x�y ra nhi�u chuy�n l� k�. �� t� b�n tr�i ��n Th�c C��ng s�n s�n b�n ��u kh�ng th�y tr� v�! H�nh nh� tr�n �� c� ma qu� ","C� chuy�n n�y sao? �� t� s� l�n Th�c C��ng s�n m�t chuy�n!")
		SetTask(8,30*256+20)
		AddNote("Tri�u �� ch� n�i cho b�n bi�t t�i Th�c C��ng s�n c� �� t� m�t t�ch, b�n quy�t ��nh �i �i�u tra ")
		Msg2Player("Tri�u �� ch� n�i cho b�n bi�t t�i Th�c C��ng s�n c� �� t� m�t t�ch, b�n quy�t ��nh �i �i�u tra ")
	elseif (UTask_gb == 30*256+30) then		--30���������
		Talk(3,"","Tri�u �� ch�! K� th�c kh�ng c� ma qu�! M� l� b�n s�t th� Kim qu�c �� phuc � ��y b�t t�t c� �� t� C�i bang. T�i h� �� c�u ���c h� v�!","Nguy�n do l� v�y! Ng��i c�n tr� m� b�n l�nh cao c��ng! B�i ph�c!","Phi�n ng��i mang van th� n�y v� cho la t��ng l�o, trong �� ta �� tr�nh t�u r�t chi ti�t!")
		SetTask(8,30*256+40)
		AddEventItem(81)
		AddNote("C�u ���c c�c �� t� b� b�t, n�i s� t�nh cho Tri�u �� ch�, nh�n ���c v�n th� ")
		Msg2Player("C�u ���c c�c �� t� b� b�t, n�i s� t�nh cho Tri�u �� ch�, nh�n ���c v�n th� ")
	elseif ((UTask_gb == 30*256+40) and (HaveItem(81) == 0)) then		-- �����У����߶���
		Talk(1,"","M�t r�i �! Kh� th�n ta l�i ph�i vi�t m�t quy�n kh�c!")
		AddEventItem(81)
	else
		Talk(1,"","Kim binh ng�y m�t l�ng h�nh. Xem ra D��ng Ch�u �� kh�ng th� b�nh y�n n�a r�i!")
	end
end;
