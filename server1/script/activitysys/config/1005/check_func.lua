Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\config\\1005\\variables.lua")

tbPVLB_Check = {}

function tbPVLB_Check:IsNewPlayer()
	local nBitVal1 = %tbExtPointLib:GetBitValue(%nEXT_POINT_ID, %nEXT_POINT_BIT_NEW_ACCOUNT) --n�p code t�i kho�n m�i
	local nBitVal2 = %tbExtPointLib:GetBitValue(%nEXT_POINT_ID, %nEXT_POINT_BIT_OLD_ACCOUNT)--n�p code t�i kho�n c�
	local nBitVal3 = %tbExtPointLib:GetBitValue(%nEXT_POINT_ID, %nEXT_POINT_BIT_USER_ACTIVE_IN_GAME)--�� nh�n th��ng
	if nBitVal1 == 0 and nBitVal2 == 0 then		
		return 0
	end
	if  nBitVal3 ~= 1 then
		return 0
	end
	if CalcItemCount(-1, 6, 1, 30439, -1) < 1 then
		return 0
	end
	return 1
end

function tbPVLB_Check:IsNewRole()
	if GetRoleCreateDate() >= 20130611 then		
		return 1
	end
end

function tbPVLB_Check:CheckTime()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if %nSTART_DATE and %nSTART_DATE ~= 0 and %nSTART_DATE > nCurDate then
		return 0
	end
	if %nEND_DATE and %nEND_DATE ~= 0 and %nEND_DATE <= nCurDate then
		return 0
	end
	return 1
end