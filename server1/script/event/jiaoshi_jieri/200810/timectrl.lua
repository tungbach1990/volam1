--2008��11��14���� 2008��11��23��24��

jiaoshi0810_StartTime = 081114
jiaoshi0810_EndTime = 081123

function jiaoshi0810_IsActTime()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	
	return nDate >= jiaoshi0810_StartTime and nDate <= jiaoshi0810_EndTime
	
end