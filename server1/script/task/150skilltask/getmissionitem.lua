Include("\\script\\task\\150skilltask\\taskdetail.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")

local _TaskDetail = TaskDetailClass:NewFun("GetMissionItem", "Action")

function _TaskDetail:Exec(tbParam)
	local tbAward = tbParam[1]
	tbAwardTemplet:GiveAwardByList(tbAward, "Nhi�m v� ��i tho�i k� n�ng c�p 150 nh�n ���c ��o c�")
	return 1
end