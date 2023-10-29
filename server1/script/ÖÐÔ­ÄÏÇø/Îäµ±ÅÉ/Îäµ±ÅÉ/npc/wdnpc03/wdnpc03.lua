--description: �䵱��Ҷ�������䵱10������
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if allbrother_0801_CheckIsDialog(12) == 1 then
		allbrother_0801_FindNpcTaskDialog(12)
		return 0;
	end
	UTask_wd = GetTask(5)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	G_TASK:OnMessage("V� �ang", tbDailog, "DialogWithNpc")
	if (UTask_wd == 10*256+20) then 
		SetTask(5, 10*256+50)
		AddNote("T�i ch� c�a Di�p Ti�p M� h�c ���c ��o ��c Kinh ")
		Msg2Player("T�i ch� c�a Di�p Ti�p M� h�c ���c ��o ��c Kinh ")
		tbDailog.szTitleMsg = "<npc>���o ��c Kinh�Theo nh� t� s� ��o Gi�o L�o T�, quy�n ��u ti�n c�a ��o Kinh c� 37 ch��ng, quy�n sau ��c Kinh c� 44 ch��ng"
		tbDailog:AddOptEntry("Ch��ng 1 ", ch1)
		tbDailog:AddOptEntry("Ch��ng 25 ", ch2)
		tbDailog:AddOptEntry("Ch��ng 33 ", ch3)
		tbDailog:AddOptEntry("Ch��ng 41 ", ch4)
		tbDailog:AddOptEntry("Ch��ng 42 ", ch5)
	elseif (UTask_wd == 10*256+50) then 
		tbDailog.szTitleMsg = "<npc>N�i dung c�a <��o ��c Kinh> b�t ��i tinh th�m, kh�ng ph�i l� c� th� l�nh ng� trong m�t kho�ng th�i gian ng�n, ng��i h�y h�c thu�c 5 ch��ng tr��c �i."
		tbDailog:AddOptEntry("Ch��ng 1 ", ch1)
		tbDailog:AddOptEntry("Ch��ng 25 ", ch2)
		tbDailog:AddOptEntry("Ch��ng 33 ", ch3)
		tbDailog:AddOptEntry("Ch��ng 41 ", ch4)
		tbDailog:AddOptEntry("Ch��ng 42 ", ch5)
	elseif (UTask_wd < 10*256+20) and (GetFaction() == "wudang") then								--��δ��10������
		tbDailog.szTitleMsg = "<npc>Kh�ng bi�t���o ��c Kinh�, sao tr� th�nh �� t� c�a V� �ang?"
	elseif (UTask_wd >= 20*256) and (GetFaction() == "wudang") then					--�Ѿ����10��������δ��ʦ
		tbDailog.szTitleMsg = "<npc>H�m nay ng��i �� h�c���o ��c Kinh�ch�a?"
	elseif (UTask_wd >= 70*256) then							--�Ѿ���ʦ
		tbDailog.szTitleMsg = "<npc>Khi ta c�n tr� nh� ng��i, c�ng l� m�t ��i tr��ng phu kho� m�nh, ��n nay m�i bi�t tr�i cao ��t r�ng, ng��i tuy l� �� t� xu�t s� c�a b�n ph�i, nh�ng c�ngkh�ng ���c xem th��ng ng��i kh�c."
	else
		tbDailog.szTitleMsg = "<npc>���o ��c Kinh�Theo nh� t� s� ��o Gi�o L�o T�, quy�n ��u ti�n c�a ��o Kinh c� 37 ch��ng, quy�n sau ��c Kinh c� 44 ch��ng. T�t c� c� h�n 5000 ch�, no�ng n�i dung th� b�c ��i tinh th�m."
	end
	tbDailog:Show() 
end;

function ch1()
	Talk(1,"","��o kh� ��o, phi th��ng ��o, danh kh� danh, phi th��ng danh.")
end;

function ch2()
	Talk(1,"","Nh�n ph�p �i�, ��a ph�p thi�n, thi�n ph�p ��o, ��o ph�p t� nhi�n.")
end;

function ch3()
	Talk(1,"","Tr� nh�n gi� tr�, t� tr� gi� minh, th�ng nh�n gi� h�u l�c, t� th�ng gi� c��ng.")
end;

function ch4()
	Talk(1,"","��i ph��ng v� ngung, ��i kh� v�n th�nh, ��i �m hy thanh, ��i t��ng v� h�nh.")
end;

function ch5()
	Talk(1,"","��o sinh nh�t, nh�t sinh nh�, nh� sinh tam, tam sinh v�n v�t.")
end;
