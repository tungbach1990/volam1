--���ϱ��� �ɶ��� ·��13����֥�Ի�
Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ��n t�m �ng c� vi�c kh�c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end
function old_main()
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_helanzhi()
	else
		Say("Ch�ng ta � Th�nh �� l�m sai ��u, r�t c�c kh�! Ta ph�i m�t v�i m�n ngon cho huynh �y �� b�i b� s�c kho�.",0)
	end
end;