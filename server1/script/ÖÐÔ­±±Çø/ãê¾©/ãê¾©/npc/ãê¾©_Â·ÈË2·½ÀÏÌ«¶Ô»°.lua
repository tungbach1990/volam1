--��ԭ���� �꾩�� ·��2����̫�Ի�
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
	Say("Ph��ng l�o th�i: Th�m h�a T�nh Khang n�m �� su�t ��i ta kh�ng th� qu�n, n�m �� ta m�i 18 tu�i, v�a m�i ��nh h�n c�n ch�a qua nh� ch�ng. V� h�n phu b� b�t ra chi�n tr��ng ��nh tr�n, kh�ng ng� m�t �i kh�ng tr� l�i, d�ng th��ng cho ta �� th� ti�t ��i ch�ng s",0)
end

