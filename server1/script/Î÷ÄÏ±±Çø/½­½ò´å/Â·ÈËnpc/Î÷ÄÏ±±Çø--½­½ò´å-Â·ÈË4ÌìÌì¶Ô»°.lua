--���ϱ��� ����� ·��4����Ի�
--������������񣺻��ӵĵ���
--suyu
-- Update: Dan_Deng(2003-08-11)
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
	UTask_world18 = GetTask(46);
	if(UTask_world8 == 1) then
		Talk(1,"","H� t� ca n�i ��i khi huynh �y c� n�, s� d�n ch�u �i b�n chim, th�t th�ch qu�!")
	elseif(UTask_world18 == 2) then
		Talk(1,"","N� c�a H� T� ca ch�a l�m xong sao?")
	elseif(UTask_world18 >= 10) then
		Talk(1,"","Hay l�m, l�t n�a H� T� Ca s� ��n t�m ch�u!")
	else
		Talk(1,"","H� T� ca lu�n g�t g�m ch�u! Ch�u ph�i m�c m� huynh �y!")
	end
end;
