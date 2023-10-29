-- �嶾 ·��NPC �����Ӱ�ӨӨ 20������
-- by��Dan_Deng(2003-08-05)

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>Lu�n lu�n c� k� ngu ng�c kh�ng bi�t s�ng ch�t l� g�, kh�ng l� tr� ��p nh� b�n ti�n t� ta ��y l�i l� m�t �i�u sai tr�i hay sao?"
	G_TASK:OnMessage("Ng� ��c", tbDailog, "DialogWithNpc")
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ��n t�m �ng c� vi�c kh�c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end

function old_main()
	UTask_wu = GetTask(10)
	Uworld50 = GetTask(50)
	if (Uworld50 == 20) then			-- ��������ԭ����
		Talk(6,"Uworld50_20","B�ch c� n��ng! X�a nay ch�nh t� ��u kh�ng dung h�p, T� ��i Nh�c hy v�ng c� s� r�i xa T� Trung Nguy�n ","R�i xa anh �y th� ta s�ng c�n � ngh�a g�? C�ng v� mu�n ���c su�t ��i s�ng b�n c�nh anh �y m� ta �� thay ��i r�t nhi�u, t�i sao c�c ng��i kh�ng nh�n th�y ���c nh�ng �i�u n�y?","C� th�t s� l� mu�n kh�ng l�i s� quy�t ��nh c�a l�nh t�n sao?","Ta ch� mu�n s�m ���c th�nh th�n v�i Trung Nguy�n ��i ca, sau �� s� r�t lui kh�i giang h� chuy�n t�m nu�i ch�ng nu�i con, kh�ng m�ng g� ��n th� s� lo�n l�c n�a. Nh� v�y th� c� g� n�n t�i ch�?","C� th�t s� nh� v�y kh�ng","Tr�i xanh ch�ng gi�m, n�u nh� ti�u n� c� n�a l�i gi� d�i, xin h�y n�i s�m s�t ��nh ch�t t��i ngay. Ti�u n� kh�ng h� o�n tr�ch")
	elseif (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 20*256+10) then
			i = GetItemCount(85)				-- ��ͷ
			if (i >= 7) then
				Talk(1,"L20_prise","Ti�n t�! Thu�c h� �� mang 7 c�i ��u c�a 'La Ti�u S�n Th�t Qu� 'v� ��y r�i ")
			else
				Talk(1,"","Ch�ng ph�i l� ng��i �� �i La Ti�u s�n r�i �? T�i sao v�n c�n c� m�t � ��y?")
			end
		elseif ((UTask_wu == 20*256) and (GetLevel() >= 20)) then		--20������
			Talk(4,"L20_get","�y! V�a m�i ��n! C� nh� quy t�c kh�ng v�y? �� l�u qu� r�i, t�i sao v�n ch�a giao 'Nh�n ��u Tr�ng' ra ��y","Nh�n ��u Tr�ng l� c�i g�?","�� l� nh�ng c�i ��u b�n ngh�ch ph�n v�i Ng� ��c Gi�o ","Thu�c h� ngu ��n! Xin ti�n t� ch� d�y th�m l�n n�a")
		else							-- ����Ի�
			Skill150Dialog("Lu�n lu�n c� k� ngu ng�c kh�ng bi�t s�ng ch�t l� g�, kh�ng l� tr� ��p nh� b�n ti�n t� ta ��y l�i l� m�t �i�u sai tr�i hay sao?")
		end
	else
		Skill150Dialog("��i v�i b�n ti�u th� m� n�i, c�i lo�i g�i l� nam nh�n th� kh�ng m�i h� h� c�ng d�n x�c ��n, ��i x� t�t v�i h� m�t ch�t, th� m�t t�n hai t�n �ang b�n m�ng cho ta �� th�i.")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("Ng� ��c", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end


function L20_get()
	Say("C�i b�n La Ti�u S�n �� r�t th�m kh�t s�c ��p c�a ti�n t� n�y! H�! C�c th�i m� ��i �n th�t thi�n nga! Ng��i h�y ch�u kh� l�n La Ti�u S�n l�n n�a, gi�t s�ch h�t b�n ch�ng cho ta",2,"D�! Thu�c h� s� l�p t�c �i l�y ��u b�n ch�ng. /L20_get_yes","Thu�c h� v� c�ng k�m c�i, e r�ng. /L20_get_no")
end;

function L20_get_yes()
	Talk(1, "", "V�y th� ta s� ��i �� nghe tin t�t c�a ng��i nh�!")
	SetTask(10,20*256+10)
	AddNote("V� B�ch Doanh Doanh, ��n La Ti�u s�n �� gi�t La Ti�u Th�t Qu� ")
	Msg2Player("V� B�ch Doanh Doanh, ��n La Ti�u s�n �� gi�t La Ti�u Th�t Qu� ")
end;

function L20_get_no()
	Talk(1,"","Ta �� v�n bi�t ng��i ch� l� m�t t�n ti�u qu� nh�t gan. Th�t l� th� v� d�ng!")
end;

function L20_prise()
	Talk(1,"","Hahaha! Th�t vui qu�! Ng��i th�t r�t c� b�n l�nh! ���c! Ti�n t� ta gi� l�i th�ng ng��i l� Th�i M�nh S� Gi� ")
	i = GetItemCount(85)				-- ��ͷ
	for j = 1,i do DelItem(85) end
	SetTask(10,30*256)
	SetRank(51)
--	AddMagic(70)
--	AddMagic(66)
	add_wu(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng B�n! �� ���c th�ng l� Ng� ��c Gi�o Th�i m�nh s� gi� S� ���c h�c v� c�ng: X�ch Di�m Th�c Thi�n, T�p Nan D��c Kinh ")
	AddNote("V� B�ch Doanh Doanh, �i gi�t La Ti�u s�n th�t qu�, ���c th�ng l�: Th�i M�nh S� Gi� ")
end;

function Uworld50_20()
	SetTask(50,30)
	Msg2Player("Nghe nh�ng l�i c�a B�ch Doanh Doanh, b�n c�ng c�m th�y ��ng c�m, th��ng x�t, nh�ng kh�ng bi�t l�m c�ch n�o �� gi�p �� ")
end
