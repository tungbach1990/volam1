--������ ������ �ӻ����ϰ�Ի�������40������
-- Update: Dan_Deng(2003-08-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function main(sel)
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx)
	local tbDailog = DailogClass:new(szNpcName)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog.szTitleMsg = "<npc>Tr��c ��y ta l� ng��i b�n h�ng rong, t�ch c�p ���c �t v�n, m� ti�m t�p h�a nh� n�y"
	if (GetTask(3) == 40*256+50) and (GetTask(14) == 5) and (HaveItem(148) == 0) then 		--������40������
		tbDailog:AddOptEntry("C� b�n h�t sen kh�ng?", lotus)
	end
	tbDailog:AddOptEntry("Giao d�ch", yes)
	tbDailog:AddOptEntry("Kh�ng giao d�ch", no)
	tbDailog:Show()
end

function lotus()
	Say("H�t sen ch�nh l� ��c s�n c�a b�n ti�m, d� nhi�n l� c�, ch� c� 500 l��ng th�i", 2, "Mua/yes1", "Kh�ng mua/no")
end;

function yes1()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(148)
		Msg2Player("Mua ���c h�t sen")
--		SetTask(14, 3)	
		AddNote("Mua ���c h�t sen t�i ti�m t�p h�a Ba L�ng huy�n ")
	else
		Say("C� �� ti�n r�i h�y ��n mua �i, h�y xem nh�ng m�n h�ng kh�c tr��c �i.", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	end
end;

function yes()
Sale(38);  			
end;

function no()
end;
