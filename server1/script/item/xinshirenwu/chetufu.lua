function GetDesc(nItem)
	return ""
end

function main(nItem)
	local nMapId, nX, nY = GetWorldPos()
	if nMapId ~= 395 then
		Msg2Player("V�t ph�m n�y ch� ���c s� d�ng trong b�n �� Thi�n B�o Kh�")
		return 1
	end
	
	local tbList,nCount = GetAroundNpcList(20, 8)--����20���Ϊһ����Χ
	for i = 1,nCount do
		local nNpcIndex = tbList[i]
		local nNpcId = GetNpcSettingIdx(nNpcIndex)
		if nNpcId == 849 then
			local szNpcName = GetNpcName(nNpcIndex)
			Msg2Player(szNpcName.."Kh�ng l�i c�a �� gi�m xu�ng")
			AddNpcSkillState(nNpcIndex, 1042, 1, 1, 18 * 60 * 60)
		end
	end
	
	Msg2Player("Ng��i s� d�ng m�t Tri�t Th� Ph�")
	WriteLog(format("Account:%s[Name:%s] s� d�ng Tri�t Th� Ph�.",
				GetAccount(),
				GetName())
			);
	return
end
