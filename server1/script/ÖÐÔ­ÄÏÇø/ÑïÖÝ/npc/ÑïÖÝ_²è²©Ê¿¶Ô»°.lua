--��ԭ���� ���ݸ� �販ʿ�Ի�
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
	i = random(0,3)

	if (i == 0) then
		Say("Tr� l� m�t s�n ph�m tao nh� trong thi�n h�. U�ng tr� l� m�t chuy�n tao nh� b�c nh�t trong thi�n h�. Ng��i ng��i ��u bi�t u�ng tr� l� m�t ngh� thu�t, c�ch pha tr� c�ng l� lo�i h�c v�n uy�n th�m!",0)
		return
	end

	if (i == 1) then
		Say("Pha tr� chia th�nh h� ��u, trung ��u, th��ng ��u, kh�ng ��n gi�n nh� m�i ng��i t��ng",0)
		return
	end

	if (i == 2) then
		Say("Tr� l� m�t s�n ph�m tao nh� trong thi�n h�. U�ng tr� l� m�t chuy�n tao nh� b�c nh�t trong thi�n h�. Ng��i ng��i ��u bi�t u�ng tr� l� m�t ngh� thu�t, c�ch pha tr� c�ng l� lo�i h�c v�n uy�n th�m!",0)
		return
	end

	if (i == 3) then
		Say("U�ng tr� ch� th��ng th�c c�ng b�nh ng�t tr�i c�y, c�n u�ng r��u ph�i c� ch�t �� nh�m!.....",0)
	end

end

