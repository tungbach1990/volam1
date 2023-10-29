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
	local szTitle = "Xin ch�o! ��i hi�p mu�n theo d�i nhi�m v� g�?"
	local tbOpt =
	{	
		"D� T�u/#set_task_trace(1)",
		"B� ch�n t�t c�/#set_task_trace(0)",
		"Tho�t/no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

function set_task_trace(num)
	SetTask(5123, num)
	open_task_trace()
end