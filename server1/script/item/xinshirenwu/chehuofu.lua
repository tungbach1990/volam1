function GetDesc(nItem)
	return ""
end

--���Է�ֽ�Զ��ٷ�Χ�ڵĹ�������
function testAround(nDist)
    local tbList,nCount = GetAroundNpcList(nDist, 8)
    	for i = 1,nCount do
    		local nNpcIndex = tbList[i]
    		local nNpcId = GetNpcSettingIdx(nNpcIndex)
    		if nNpcId == 849 then
    			local szNpcName = GetNpcName(nNpcIndex)
    			Msg2Player(format("%s trong ph�m vi %d", szNpcName, nDist))
    		end
    end
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
			Msg2Player(szNpcName.."Kh�ng h�a c�a �� gi�m xu�ng")
			AddNpcSkillState(nNpcIndex, 1041, 1, 1, 18 * 60 * 60)
		end
	end
	
	Msg2Player("Ng��i s� d�ng 1 Tri�t H�a Ph�")
	WriteLog(format("Account:%s[Name:%s] s� d�ng Tri�t H�a Ph�.",
				GetAccount(),
				GetName())
			);
	return
end
