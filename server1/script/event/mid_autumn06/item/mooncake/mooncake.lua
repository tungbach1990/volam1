--by ��־ɽ [2006-09-12]
--2006����֮���±������˵õ���Ӧ�Ľ���
--Illustration: ���� -- lightcage au06- -- midautumn2006

if (not __H_ITEM_MOONCAKE__) then
	__H_ITEM_MOONCAKE__ = 1;
	
Include([[\script\event\mid_autumn06\head.lua]]);
	
--nIndex
tab_Exp = {
	20000 ,
	40000 ,
	100000 ,
	500000 ,
	1000000 ,
	2000000 ,
}

--������ں���
function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < AU06_BEGINDATE or nDate >= 20061117 or 
			gb_GetTask("midautumn2006_city_all", 1) ~= 0) then
		Say("B�nh Trung thu ch� ���c d�ng t� 30/9 ��n 16/11.B�nh Trung thu ch� ���c d�ng t� 30/9 ��n 16/11.", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("Ch� c� ng��i ch�i n�p th� m�i c� th� �n b�nh trung thu", 0);
		return 1;
	end;
	
	if (not nIndex) then
		return 1;
	end;
	
	local nCount = getn(tab_Exp);
	if (nIndex > nCount) then
		nIndex = nCount;
	elseif (nIndex < 1) then
		nIndex = 1;
	end;
	
	local nExp = GetTask(AU06_TK_EXP);
	if (nExp >= EXP_AWARD_LIMIT) then
		Say("M�i ng��i ch� c� th� nh�n ���c <color=red>"..EXP_AWARD_LIMIT.."<color> �i�m kinh nghi�m t� b�nh trung thu m� th�i.", 0);
		return 1;
	end;
	--���轱��
	SetTask(AU06_TK_EXP, nExp + tab_Exp[nIndex]);
	AddOwnExp(tab_Exp[nIndex]);
	
	--������ʾ
	Msg2Player("B�n nh�n ���c<color=yellow>"..tab_Exp[nIndex].."<color> �i�m kinh nghi�m.")
	return 0;
end

end; --//end of __H_ITEM_MOONCAKE__