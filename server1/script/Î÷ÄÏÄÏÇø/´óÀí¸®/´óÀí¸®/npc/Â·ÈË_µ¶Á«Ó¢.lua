-- ����·�ˡ�����Ӣ
-- by��Dan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
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
	if allbrother_0801_CheckIsDialog(187) == 1 then
		allbrother_0801_FindNpcTaskDialog(187)
		return 0;
	end
	Talk(3,"","Trong nh� �ang c� kh�ch, ta �i mua v�i con c� Nh� H�i t��i s�ng v� l�m m�t m�n c� ��i l�.","��ng r�i! Mua th�m m�t �t nguy�n li�u nh� n�m h��ng, ng�c lan phi�n, m�c nh�, t�m kim c�u.","Ch� xem vi�c n�y nh� th� n�o c�ng c� th� �i ��n nh� ta �n c�m, n�m t� m�n c� Sa N�i do ta l�m. ��y l� m�n c�a ng��i ��i L� d�nh �� ��i kh�ch, ng��i ��ng c� e ng�i.")
end;
