--������ ������ ·��6����ݶԻ�
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
	i = random(0,2)

	if (i == 0) then
		Say("Ng�y tr��c ��i Th�nh Thi�n V��ng kh�i binh t�i ��ng ��nh h�,th� thi�n h�nh ��o, di�t b�o c�u ch�ng sinh,���c d�n y�u m�n, l�m tri�u ��nh r�t lo s�, ph�i binh ti�u di�t. Thi�n V��ng qu�n �t ��ch ��ng, b� b�t sau �� �� hy sinh ",0)
		return
	end

	if (i == 1) then
		Say("Khi Thi�n V��ng b� gi�t, D��ng c�ng t� c�a ng�i �ang t�i ngo�i h�c ngh�, kh�ng th� v� nh�n m�t. Khi quay l�i ��ng ��nh H�, t�p h�p anh em ngh�a qu�n, l�p ra Thi�n V��ng Bang. ",0)
		return
	end

	if (i == 2) then
		Say("D��ng c�ng t� v� ngh� cao c��ng, t�i tr� h�n ng��i, Thi�n V��ng Bang d��i b�n tay l�nh ��o c�a anh ta, ng�y c�ng ph�t tri�n, r�t ���c l�ng c�a l�o b� t�nh. Nh�ng t� tr��c ��n gi� ta ch�a t�ng ���c th�y m�t t�t c�a D��ng c�ng t�,nghe n�i �� l� m�t thi�u ni�n kh�i ng� tu�n t�. ",0)
		return
	end;

end;

