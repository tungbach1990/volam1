Include("\\script\\activitysys\\playerfunlib.lua")

VngPlayerFunLib ={}

function VngPlayerFunLib:VnCheckInCity (strFail)
	local strMessage
	if not strFail or strFail == "default" then
		strMessage = "Thao t�c n�y kh�ng th� th�c hi�n t�i ��y! Xin h�y v� c�c th�nh th� v� th�n tr�n r�i th� l�i."
	else
	 strMessage = strFail
	end
	if GetFightState() ~= 0 then
		lib:ShowMessage(strMessage)
		return nil
	end
	return PlayerFunLib:CheckInMap("53,20,99,100,101,121,153,174,11,78,1,162,37,80,176", strMessage)
end