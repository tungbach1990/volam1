--��ԭ���� ������ ��ͷ�Ի�
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
Say("Ti�u C�c uy v� ta n�i ti�ng � T��ng Ng�c. C�c b�ng h�u h�c b�ch ��o r�t nhi�u. Ngay c� quan ph� c�ng th��ng nh� b�n ta.Ha ha! Ch� c�n c� ti�n nhi�u, h�ng g� b�n ta c�ng d�m nh�n!", 0);
end;


