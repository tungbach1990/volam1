function main()
	local eattime = GetTask(1502)
	local eatexp = GetTask(1501)
	local eatmsg = {"<#> B�n �� �n qu� nhi�u B�nh ch�ng, kh�ng th� ti�p t�c �n n�a!",
		"<#> B�n c�m th�y r�t no, ��i m�t th�i gian m�i c� th� d�ng B�nh ch�ng ���c!",
		"<#> B�n �� �n �� s� B�nh ch�ng, ��y �� l� c�i b�nh cu�i c�ng r�i!"
		}
	local randomexp = {10000, 20000, 50000}
	if(eatexp > 20000000)  then   --ʹ�þ������20,000,000�������ٳ�
		Msg2Player(eatmsg[1])
		return 1
	else
		if (GetGameTime() > eattime + 60 * 60) then
			local i = random(1, 3)
			AddOwnExp(randomexp[i]) 
			SetTask(1501, eatexp+randomexp[i])
			SetTask(1502, GetGameTime())  --��¼��ǰ����ʱ��
			if(GetTask(1501) > 20000000) then
				Msg2Player(eatmsg[3])
			end
			return 0
		elseif  (eattime == 0) then
			local i = random(1, 3)
			AddOwnExp(randomexp[i]) 
			SetTask(1501,eatexp+randomexp[i])
			SetTask(1502, GetGameTime())  --��¼��ǰ����ʱ��
			if(GetTask(1501) >20000000) then
				Msg2Player(eatmsg[3])
			end
			return 0	
		else
			Msg2Player(eatmsg[2])
			return 1
		end

	end
end