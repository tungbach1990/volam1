function SendRankData(handle)
	local nResultHandle = OB_Create()
	OB_PushInt(nResultHandle, 10268) 
	OB_PushInt(nResultHandle, 0)
	OB_PushString(nResultHandle, "�i�m binh gi�p hi�n t�i")
	OB_PushInt(nResultHandle, GetAllEquipValue())
	SendScriptData(2, nResultHandle)
	OB_Release(nResultHandle)
end
