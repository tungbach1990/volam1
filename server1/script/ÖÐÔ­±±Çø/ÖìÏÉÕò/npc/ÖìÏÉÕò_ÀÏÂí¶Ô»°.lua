--��ԭ���� ������ ����Ի�
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

Say("Th�y ��c h�nh c�a L�o Chu ch�a? B� v� qu�n l� nghi�m ng�t nh� v�y, xem ta ��y ��n gi� v�n ch�a l�y v�. C�i g�? Kh�ng ��ng �� khoe sao? Th�i c�t �i, ch�a v� c� g� l� kh�ng t�t!",0)

end;
