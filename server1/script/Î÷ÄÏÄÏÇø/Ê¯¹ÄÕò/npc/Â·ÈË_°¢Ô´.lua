-- ʯ����·�ˡ���Դ
-- by��Dan_Deng(2003-09-16)
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
	Talk(1,"","H�! ��n �ng b�n ngo�i ��u cho con g�i r�ng Th�y Y�n ��p. ��ng l� b�n h� ��p th�t, nh�ng hoa n�o m� kh�ng c� ��c? ��ng ��n b�n h� ng��i c� ch�t c�ng kh�ng bi�t t�i sao! ")
end;
