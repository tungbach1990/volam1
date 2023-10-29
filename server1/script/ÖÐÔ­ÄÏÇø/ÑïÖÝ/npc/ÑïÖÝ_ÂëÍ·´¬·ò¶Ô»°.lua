--��ԭ���� ���ݸ� ��ͷ����Ի�
--suyu
--200306015

CurWharf = 6;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
---------------------------------------------------------------
function main(sel)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>D��ng Ch�u ch�ng ta c� m�t con su�i, nhi�u s�ng, nhi�u c�u, nhi�u thuy�n. Nh�ng ng��i gi�u c� th� s� ��n thuy�n �i du ngo�n D��ng Ch�u, d�a v�o c�c thuy�n phu c�a ch�ng ta"
	tbDailog:AddOptEntry("Ng�i thuy�n", WharfFun)
	tbDailog:AddOptEntry("Kh�ng ng�i", OnCancel)
	if GetLevel() >= 50 then
		tbDailog:AddOptEntry("�i ��o Hoa ��o (2) [ "..AEXP_TICKET.." l��ng]", go_thd)
	end
	tbDailog:AddOptEntry("Kh�i ��ng nhi�m v� 15x �i Nguy�t Ca ��o", start_task_15)
	-- G_TASK:OnMessage("Nguy�t Ca ��o", tbDailog, "DialogWithNpc")
	if check_showdialog_condition() then
		tbDailog:AddOptEntry("��a ta ��n Nguy�t Ca ��o", goto_yuegedao)
	end
	tbDailog:Show()
end;

function start_task_15()
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
		[10]=1,
		[11]=1,
	}
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or nFact > 11 then
		Talk(1, "", "C�n ph�i gia nh�p ph�i tr��c.")
		return
	elseif CalcItemCount(3, 6, 1, 2908, -1) >= 1 then
		Msg2Player("Ng��i �� c� Nguy�t Ca L�nh r�i.")
		return
	else
		SetTask(2885, tbFactStepList[nFact])
		tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2908,1,0,0}, nBindState=-2}, "test", 1)
		Msg2Player("Nh�n ���c <color=yellow>Nguy�t Ca L�nh.") 
	end
end

function check_showdialog_condition()
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
		[10]=1,
		[11]=1,
	}
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or nFact > 11 then
		return
	end
	local nFactStep = mod(GetTask(2885), 100)
	if nFactStep >= tbFactStepList[nFact] then
		return 1
	end
	return
end

function goto_yuegedao()
	if CalcItemCount(3, 6, 1, 2908, -1) <= 0 then
		Msg2Player("Ng��i kh�ng c� <color=yellow>Nguy�t Ca L�nh")
		return
	end
	local task15xvalue = GetTask(2885)
	if task15xvalue < 100 then
		SetTask(2885, task15xvalue + 100)
		Msg2Player("B�t ��u nhi�m v� �i <color=yellow>Nguy�t Ca ��o")
	end
	NewWorld(968, 1436, 3179)
end
---------------------------------------------------------------
function  OnCancel()

   Say("Kh�ng c� ti�n ng�i thuy�n th� ng��i �i b� v�y! ",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(236);
	-- if (nRet == 1) then
	--	Msg2Player("�������ȥ�һ������˿���ࡣ�ðɣ�������ඣ�")
	if (nRet == -1) then
		Talk(1,"","Ph� �i thuy�n ��n ��o Hoa ��o "..AEXP_TICKET.."L��ng, ng��i c� �� kh�ng? ")
	end
end
---------------------------------------------------------------
