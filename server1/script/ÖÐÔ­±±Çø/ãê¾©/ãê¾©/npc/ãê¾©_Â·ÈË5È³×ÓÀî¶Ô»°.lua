--��ԭ���� �꾩�� ·��5ȳ����Ի�
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
	Say("C�i ch�n qu� n�y c�a ta l� do ��nh tr�n v�i b�n gi�c Kim. C�ng v� c�i ch�n n�y m� cho ��n gi� ta v�n ch�a th�nh th�n. C� nh� n�o ch�u g� con cho m�t anh qu� nh� ta?",0)
end

