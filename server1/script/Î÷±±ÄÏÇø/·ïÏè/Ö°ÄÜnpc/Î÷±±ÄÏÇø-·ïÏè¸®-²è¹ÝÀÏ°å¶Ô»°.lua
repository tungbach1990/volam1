--�������� ���踮 ����ϰ�Ի�
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
	i = random(0,1)
	if (i == 0) then
		Say("Tr� c� th� tu t�m d��ng t�nh, m�t ng�m tr� xanh c� th� khi�n con ng��i qu�n �i th� t�c.",0)
	else
		Say("Tr� c�a ch�ng ta n�i ti�ng kh�p n�i.", 0)
	end
end