--���ϱ��� �ɶ��� ·��19��ˮ���ĶԻ�
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
Say("Tr�i c�y v�a r� l�i v�a t��i ��y! C�c lo�i tr�i c�y v�a m�i h�i t� Long Tuy�n ��y! C� nho, ��o, l�� h�y ch�n �i! H�y xem �i! ",0)

end;
