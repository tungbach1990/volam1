Include("\\script\\missions\\clearskill\\head.lua");
Include("\\script\\task\\system\\task_string.lua");

TTID_CityIndex 	= 101;

-- ϴ�㶴(��һ��)��ع���
-- ����ֵ: -1 ʧ�ܣ�1�ɹ�
function CSP_EnterClearMap(nCityIndex)
	nLevel = GetLevel();
	if (nLevel < CSP_NEEDLEVEL) then
		Talk(1, "", "<#> Tr�ng s� ch�a ��t c�p"..CSP_NEEDLEVEL.."<#>, ch�a th� v�o ��o T�y T�y")
		return -1;
	end
	
	if (GetCamp() == 0) then
		Talk(1, "", "Ng��i kh�ng c� k� n�ng n�o, v�y m� c�ng mu�n �i t�y t�y �? ")
		return -1;
	end

	-- �����кż�¼����ʱ������
	SetTaskTemp(TTID_CityIndex, nCityIndex);
	
	-- ȥϴ�赺����Ѵ���
	nResult = GetTask(CSP_TID_ClearFreeTime);
	if (nResult < CSP_MAXClearTime) then -- ��ѽ���
		Say("<#> C� h�i v�o ��o t�y T�y mi�n ph� ch� c�"..CSP_MAXClearTime.."<#> l�n. Tr�ng s� �� suy ngh� k� ch�a?", 2, "�i ��o T�y T�y/CSP_FreeEnterClearMap", "�� ngh� th�m m�t ch�t /gotocsm_no")
		return 1;
	else
		-- û����ѻ����ˣ���ˮ����ʯ
		strNoFree = 
		{
			"<#>Xa phu: L�n d�ng mi�n ph� �� d�ng h�t, nh�ng c�c h� c� th� s� d�ng <color=blue>th�y tinh (ho�c b�ch ng�c) <color> ho�c <color=blue>tinh h�ng b�o th�ch (ho�c t� ng�c) <color> �� c� th� �i v�o ��o t�y t�y. Ng��i c� ��ng � nh� v�y kh�ng?",
			"<#> Ch� t�y �i�m k� n�ng [3 vi�n Th�y Tinh]/CSP_JEnterClearMap_Skill",
			"<#>Ch� t�y �i�m k� n�ng [B�ch Ng�c]/CSP_JEnterClearMap_Skill2",
			"<#> Ch� t�y �i�m ti�m n�ng [6 vi�n Tinh H�ng B�o Th�ch]/CSP_JEnterClearMap_Prop",
			"<#>Ch� t�y �i�m ti�m n�ng [T� Ng�c]/CSP_JEnterClearMap_Prop2",
			"<#> T�y c� �i�m ti�m n�ng v� k� n�ng [3 vi�n Th�y Tinh + 6 vi�n Tinh H�ng B�o Th�ch]/CSP_JEnterClearMap_All",
			"<#>T�y �i�m k� n�ng ti�m n�ng [B�ch Ng�c + T� Ng�c]/CSP_JEnterClearMap_All2",
			"<#> �� ra ngh� l�i/CSP_Cancel"
		};
		-- Say(strNoFree[1], 7, strNoFree[2], strNoFree[3], strNoFree[4], strNoFree[5], strNoFree[6], strNoFree[7], strNoFree[8]);
		CreateTaskSay(strNoFree)
		return 1;
	end
	return 1;
end;

-- ��ѽ����Ļ���
function CSP_FreeEnterClearMap()
	
	-- ��¼����ϴ������
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- ȫϴ
	CSP_EnterClearMapCore();
end

-- ʹ�ñ�ʯ��ȡ����ϴ��Ļ��� - ���ܵ�
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Skill()
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	nJCount = j238 + j239 + j240;
	if (nJCount < CSP_NEEDJEWEL_SKILL) then
		Talk(1,"","Ng��i kh�ng mang <color=blue>3 vi�n Th�y Tinh <color>. ��ng n�ng ru�t t�m �� r�i h�y quay l�i. ")
		return -1;
	end
	if (nJCount > CSP_NEEDJEWEL_SKILL) then
		Talk(1, "", "Tr�n ng��i ng��i �em theo r�t nhi�u Th�y Tinh, ta kh�ng ti�n quy�t ��nh gi�m ng��i s� d�ng 3 vi�n n�o, hay l� h�y c�t nh�ng th� c�n d� v�o r��ng ch�a ��? ")
		return -1;
	end

	-- ��ˮ��
	for i = 1,j238 do DelItemEx(238) end
	for i = 1,j239 do DelItemEx(239) end
	for i = 1,j240 do DelItemEx(240) end
	
	CSP_WriteLog("S� d�ng r�i"..nJCount.."H�t th�y tinh, ti�n v�o ��o T�y T�y");
	-- ��¼����ϴ������
	SetTask(CSP_TID_ClearType, CSP_CTYPE_SKILL); -- ϴ���ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("Ti�n v�o ��o T�y t�y, b�n c� th� c� v� s� l�n t�y �i�m k� n�ng. ");

end;

-- ʹ�ñ�ʯ��ȡ����ϴ��Ļ��� - Ǳ�ܵ�
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Prop()
	j353 = GetItemCountEx(353)
	if (j353 < CSP_NEEDJEWEL_PROP) then
		Talk(1,"","Ng��i kh�ng mang <color=red>6 vi�n Tinh H�ng B�o Th�ch <color>. ��ng n�ng ru�t, t�m �� r�i h�y quay l�i. ")
		return -1;
	end
	
	-- ���ɺ챦ʯ(����)
	for i = 1, CSP_NEEDJEWEL_PROP do DelItemEx(353) end

	CSP_WriteLog("S� d�ng r�i"..CSP_NEEDJEWEL_PROP.."H�t tinh h�ng b�o th�ch, ti�n v�o ��o T�y T�y");
	-- ��¼����ϴ������
	SetTask(CSP_TID_ClearType, CSP_CTYPE_PROP); -- ϴǱ�ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("Ti�n v�o ��o T�y t�y, b�n c� th� c� v� s� l�n t�y �i�m k� n�ng. ");
end;

-- ʹ�ñ�ʯ��ȡ����ϴ��Ļ��� - ���ܵ�&Ǳ�ܵ�
-- JEnter - JewelEnter
function CSP_JEnterClearMap_All()
	j353 = GetItemCountEx(353)
	if (j353 < CSP_NEEDJEWEL_PROP) then
		Talk(1,"","Ng��i kh�ng mang <color=red>6 vi�n Tinh H�ng B�o Th�ch <color>. ��ng n�ng ru�t, t�m �� r�i h�y quay l�i. ")
		return -1;
	end
	
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	nJCount = j238 + j239 + j240;
	if (nJCount < CSP_NEEDJEWEL_SKILL) then
		Talk(1,"","Ng��i kh�ng mang <color=blue>3 vi�n Th�y Tinh <color>. ��ng n�ng ru�t t�m �� r�i h�y quay l�i. ")
		return -1;
	end
	if (nJCount > CSP_NEEDJEWEL_SKILL) then
		Talk(1, "", "Tr�n ng��i ng��i �em theo r�t nhi�u Th�y Tinh, ta kh�ng ti�n quy�t ��nh gi�m ng��i s� d�ng 3 vi�n n�o, hay l� h�y c�t nh�ng th� c�n d� v�o r��ng ch�a ��? ")
		return -1;
	end
	
	-- ���ɺ챦ʯ(����)
	for i = 1,CSP_NEEDJEWEL_PROP do DelItemEx(353) end
	-- ��ˮ��
	for i = 1,j238 do DelItemEx(238) end
	for i = 1,j239 do DelItemEx(239) end
	for i = 1,j240 do DelItemEx(240) end	

	CSP_WriteLog("S� d�ng r�i"..nJCount.."H�t th�y tinh, v� "..CSP_NEEDJEWEL_PROP.."H�t tinh h�ng b�o th�ch, ti�n v�o ��o T�y T�y");
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- ϴ���ܵ��Ǳ�ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("Ti�n v�o ��o T�y t�y, b�n c� th� c� v� s� l�n t�y �i�m k� n�ng. ");
end;

function CSP_Cancel()
end

-- �����ĺ��ĺ���
function CSP_EnterClearMapCore()
	-- ����ʱ������ȡ�����к�
	nCityIndex = GetTaskTemp(TTID_CityIndex);
	nMapID = CSP_GetClearMapID(nCityIndex);
	-- ��ͼ�Ҳ���������
	if (nMapID == -1) then
		CSP_WriteLog("ID khu v�c:"..nMapID.." t�m kh�ng th�y, v�o ��o T�y T�y th�t b�i!");
		return -1;
	end

	LeaveTeam();
	nResult = NewWorld(nMapID,1615,3200);
	if (nResult == 0) then
		CSP_WriteLog("ID khu v�c:"..nMapID.." Nh�p �i�m c� sai s�t, v�o ��o T�y T�y th�t b�i!");
		Msg2Player("Nh�p �i�m c� sai s�t!");
		return -1;
	end
	
	-- ����ĳЩ���ܣ�����ʹ�ûسǷ���������ӳ�����������̯
	DisabledUseTownP(1);
	DisabledUseHeart(1);
	DisabledStall(1);
	
	-- ���÷�ս��״̬
	SetFightState(0)
	
	-- ��¼������(�뿪ʱ��ԭ)
	nSWID, nRevID = GetPlayerRev();
	SetTask(CSP_TID_RevivalSWID, nSWID);
	SetTask(CSP_TID_ReviveID, nRevID);
	
	-- �����µ���ʱ������
	SetRevPos(nMapID, CSP_RevieSWID);
	SetPunish(0);	
end;

-- ����ֵ: -1 ʧ�ܣ�1�ɹ�
function CSP_LeaveClearMap(nClearMapID)
	nCityIndex = CSP_GetCityIndexByClearMap(nClearMapID);
	if (nCityIndex == -1) then
		return -1;
	end

	-- �ָ�������(ֻ��״̬�Ϸ�ʱ��������������)
	if (CSP_CheckValid() == 1) then
		nSWID = GetTask(CSP_TID_RevivalSWID);
		nRevID = GetTask(CSP_TID_ReviveID);
		SetRevPos(nSWID, nRevID);
	end
		
	-- �رձ����εĹ��ܣ�����ʹ�ûسǷ���������ӳ�����������̯
	DisabledUseTownP(0);
	DisabledUseHeart(0);
	DisabledStall(0);
	
	-- �뵺ʱ�뿪����
	LeaveTeam();
	
	-- ���÷�ս��״̬
	SetFightState(0);
	SetPunish(1);
	SetLogoutRV(0);

	nResult = GetTask(CSP_TID_ClearFreeTime);
	if (nResult < CSP_MAXClearTime) then -- ��ѽ���
		SetTask(CSP_TID_ClearFreeTime, nResult + 1) -- ��¼��Ѵ���
	else
		SetTask(CSP_TID_JewelEnterTime, GetTask(CSP_TID_JewelEnterTime) + 1) -- ��¼ʹ�ñ�ʯ�������
	end
	

	if (nCityIndex == 1) then
		NewWorld(1, 1557, 3112) -- ����		
	elseif (nCityIndex == 2) then
		NewWorld(11, 3193, 5192) -- �ɶ�	
	elseif (nCityIndex == 3) then
		NewWorld(162, 1669, 3129) -- ����	
	elseif (nCityIndex == 4) then
		NewWorld(37, 1598, 3000) -- �꾩
	elseif (nCityIndex == 5) then
		NewWorld(78, 1592, 3377) -- ����
	elseif (nCityIndex == 6) then
		NewWorld(80, 1670, 2996) -- ����		
	elseif (nCityIndex == 7) then
		NewWorld(176, 1603, 2917) -- �ٰ�
	else
		Msg2Player("H� th�ng xu�t hi�n s� c�! Vui l�ng t�m nh�n vi�n ph�c v� x�c nh�n gi�i quy�t v�n ��. ");
	end	
end;


function CSP_JEnterClearMap_Skill2()
	if (CalcItemCount(3, 6, 1, 2390,-1) < CSP_NEEDJEWEL_SKILL2) then
		Talk(1,"","Xa phu: Tr�n ng��i kh�ng c� <color=blue>B�ch Ng�c<color>. Hay l� �� qu�n � ��u �� r�i?")
		return -1;
	end

	if (ConsumeItem(3, 1, 6,1,2390,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("�� s� d�ng %d B�ch Ng�c, ti�n v�o ��o t�y t�y", CSP_NEEDJEWEL_SKILL2));
	-- ��¼����ϴ������
	SetTask(CSP_TID_ClearType, CSP_CTYPE_SKILL); -- ϴ���ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("Ti�n v�o ��o T�y t�y, b�n c� th� c� v� s� l�n t�y �i�m k� n�ng. ");

end;

-- ʹ�ñ�ʯ��ȡ����ϴ��Ļ��� - Ǳ�ܵ�
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Prop2()
	if (CalcItemCount(3, 6, 1, 2391,-1) < CSP_NEEDJEWEL_PROP2) then
		Talk(1,"","Xa phu: Tr�n ng��i kh�ng c� <color=red>T� Ng�c<color>. Hay l� �� qu�n � ��u �� r�i?")
		return -1;
	end
	
	if (ConsumeItem(3, 1, 6,1,2391,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("�� s� d�ng %d T� Ng�c, ti�n v�o ��o t�y t�y", CSP_NEEDJEWEL_PROP2));
	-- ��¼����ϴ������
	SetTask(CSP_TID_ClearType, CSP_CTYPE_PROP); -- ϴǱ�ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("Ti�n v�o ��o T�y t�y, b�n c� th� c� v� s� l�n t�y �i�m k� n�ng. ");
end;

-- ʹ�ñ�ʯ��ȡ����ϴ��Ļ��� - ���ܵ�&Ǳ�ܵ�
-- JEnter - JewelEnter
function CSP_JEnterClearMap_All2()
	if (CalcItemCount(3, 6, 1, 2390,-1) < CSP_NEEDJEWEL_SKILL2) then
		Talk(1,"","Xa phu: Tr�n ng��i kh�ng c� <color=blue>B�ch Ng�c<color>. Hay l� �� qu�n � ��u �� r�i?")
		return -1;
	end
	
	if (CalcItemCount(3, 6, 1, 2391,-1) < CSP_NEEDJEWEL_PROP2) then
		Talk(1,"","Xa phu: Tr�n ng��i kh�ng c� <color=red>T� Ng�c<color>. Hay l� �� qu�n � ��u �� r�i?")
		return -1;
	end
	
	if (ConsumeItem(3, 1, 6,1,2390,-1) ~= 1 or ConsumeItem(3, 1, 6,1,2391,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("�� s� d�ng %d %s v� %d %s, ti�n v�o ��o t�y t�y",CSP_NEEDJEWEL_SKILL2, "B�ch Ng�c", CSP_NEEDJEWEL_PROP2, "T� Ng�c") );
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- ϴ���ܵ��Ǳ�ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("Ti�n v�o ��o T�y t�y, b�n c� th� c� v� s� l�n t�y �i�m k� n�ng. ");
end;


