Include("\\script\\lib\\objbuffer_head.lua") -- to open protocol in client
Include("\\script\\script_protocol\\protocol_def_gs.lua") -- to call ScriptProtocol:SendData

function open_task_trace()
	local nHandle = OB_Create()
	local numTaskTrace = GetTask(5123)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, numTaskTrace)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_TASKTRACE", nHandle)
	OB_Release(nHandle)
end

function choose_task_trace()
	local szTitle = "Xin chµo! §¹i hiÖp muèn theo dâi nhiÖm vô g×?"
	local tbOpt =
	{	
		"D· TÈu/#set_task_trace(1)",
		"Bá chän tÊt c¶/#set_task_trace(0)",
		"Tho¸t/no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

function set_task_trace(num)
	SetTask(5123, num)
	open_task_trace()
end