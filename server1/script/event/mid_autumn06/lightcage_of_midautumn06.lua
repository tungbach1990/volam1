--by ��־ɽ [2006-09-12]
--2006����֮�������,��ֵõ�����,������ȡ������±�.
--Illustration: ���� -- lightcage au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);
Include([[\script\lib\gb_taskfuncs.lua]]);

--������ں���
function au06_entrance()
	if (au06_IsPayed_player() == 0) then
		Say("Ch� c� ng��i ch�i n�p th� m�i c� th� tham gia ho�t ��ng Trung thu", 0);
		return
	end;
	
	local tab_Content = {
		"Ta mu�n l�m l�ng ��n b��m b��m [c�n 2 gi�y ki�ng v�ng, 1 thanh tre, 1 d�y c�i, 1 n�n  v� 1000 l��ng]/#determine_process( 1 )",
		"Ta mu�n l�m l�ng ��n ng�i sao [c�n 2 gi�y ki�ng lam, 1 thanh tre, 1 d�y c�i, 1 n�n v� 2000 l��ng]/#determine_process( 2 )",
		"Ta mu�n l�m l�ng ��n �ng [c�n 2 gi�y ki�ng l�c, 1 thanh tre, 1 d�y c�i, 1 n�n v� 3000 l��ng]/#determine_process( 3 )",
		"Ta mu�n l�m l�ng ��n tr�n [c�n 2 gi�y ki�ng ��, 1 thanh tre, 1 d�y c�i, 1 n�n v� 4000 l��ng]/#determine_process( 4 )",
		"Ta mu�n l�m l�ng ��n c� ch�p [c�n 1 gi�y ki�ng cam, 1 thanh tre, 1 d�y c�i, 1 n�n v� 5000 l��ng]/#determine_process( 5 )",
		"Ta mu�n l�m l�ng ��n k�o qu�n [c�n 5 lo�i gi�y ki�ng, 1 thanh tre, 1 d�y c�i, 1 n�n v� 5000 l��ng]/sure_colorfulcage",
		"Ch� ��n th�m �ng ch�t th�i!/oncancel"
	};
	Say("L�ng ��n ta l�m n�i danh kh�p n�i, ng��i ng��i ��u th�ch. Kh�ch quan mu�n l�m l�ng ��n g�?", getn(tab_Content), tab_Content);
end;

--ȷ������(��ͨ����)
function determine_process(nIndex)
	if (nIndex < 1 or nIndex > 5) then
		return
	end;
	tab_Index = {1, 2, 3, 4, 5};
	local szCageName = tab_Lightcage[nIndex][3];
	Say("L�m "..szCageName.."c�n <color=yellow>"..tab_Lightcage[nIndex][9].."M� "..tab_Lightcage[nIndex][4]..", 1 thanh tre, 1 d�y c�i, 1 n�n v� <color=red>"..tab_Lightcage[nIndex][5].."<color> l��ng ti�n c�ng, l�m ch�?", 2, "��ng! Xin l�o b�i tr� t�i!/#process_lightcage("..tab_Index[nIndex]..")", "Ta s� quay l�i sau!/oncancel");
	
end;

--�������(��ͨ��������)
function process_lightcage(nIndex)
	if (nIndex < 1 or nIndex > 5) then
		return
	end;
	
	local szCageName = tab_Lightcage[nIndex][3];
	local bEnough = 1;
	--������
	if (GetCash() < tab_Lightcage[nIndex][5]) then
		bEnough = 0;
	end;
	if (CalcEquiproomItemCount(6, 1, tab_Lightcage[nIndex][2], -1) < tab_Lightcage[nIndex][9]) then
		bEnough = 0;
	end

	for i = 1, getn(tab_BasicMaterial) do
		if (CalcEquiproomItemCount(6, 1, tab_BasicMaterial[i][1], -1) < 1) then
			bEnough = 0;
		end
	end;
	if (bEnough == 0) then
		Say("Kh�ch quan kh�ng �� v�t li�u, <color=red>"..szCageName.."<color> c�n <color=yellow>"..tab_Lightcage[nIndex][9].."M� "..tab_Lightcage[nIndex][4]..", 1 thanh tre, 1 d�y c�i, 1 n�n v� <color=red>"..tab_Lightcage[nIndex][5].."<color> l��ng ti�n c�ng.", 1, "�� ta �i chu�n b� ��!/oncancel");
		return
	end;
	
	--ɾ������
	if (Pay(tab_Lightcage[nIndex][5]) == 0) then
		return
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (ConsumeEquiproomItem(1, 6, 1, tab_BasicMaterial[i][1], -1) ~= 1) then
			return
		end
	end;
	if (ConsumeEquiproomItem(tab_Lightcage[nIndex][9], 6, 1, tab_Lightcage[nIndex][2], -1) ~= 1) then
		return
	end;
	
	local nSeed = random(1, 10);
	if (nSeed <= 8) then
	--������Ʒ
		AddItem(6, 1, tab_Lightcage[nIndex][1], 1, 0, 0, 0);
	--����
		Say("<color=red>"..szCageName.."<color> �� l�m xong, Kh�ch quan v�a � ch�?!", 0);
		Msg2Player("B�n nh�n ���c <color=yellow>"..szCageName.."(".."��c bi�t"..")<color>");
	else
	--������Ʒ
		local iIdx = AddItem(6, 1, tab_Lightcage[nIndex][6], 1, 0, 0, 0);
		if (iIdx > 0) then
			SetSpecItemParam(iIdx, 1, 1);
			SyncItem(iIdx);
		end;
	--����
		Say("<color=red>"..szCageName.."<color> �� l�m xong, nh�ng kh�ng ���c nh� �. Th�t ng�i qu�!", 0);
		Msg2Player("B�n nh�n ���c <color=yellow>"..szCageName.."<color>");
	end;
end;

--ȷ������(��ʵ���)
function sure_colorfulcage()
	Say("<color=red>l�ng ��n Ng� s�c<color><color> c�n c� <color=yellow>5 lo�i gi�y ki�ng, 1 thanh tre, 1 d�y c�i, 1 n�n<color> v� <color=red>5000 l��ng<color> ti�n c�ng, l�m ch�?", 2, "��ng! Xin l�o b�i tr� t�i!/make_colorfulcage", "Ta s� quay l�i sau!/oncancel");
end;

--������ʵ���
function make_colorfulcage()
	local szCageName = "L�ng ��n k�o qu�n";
	--����Ƿ��Ѿ�����300��
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local w = GetWorldPos();
	local szCityLGName = "midautumn2006_city_"..tostring(w);
	local n_wc_Count = gb_GetTask(szCityLGName, 2);
	if (gb_GetTask(szCityLGName, 1) ~= nDate) then
		gb_SetTask(szCityLGName, 1, nDate);
		n_wc_Count = 0;
	end;
	
	if (n_wc_Count >= AU06_COLORED_LIMITED) then
		Say("H�m nay ta �� l�m<color=yellow>3000 c�i l�ng ��n k�o qu�n<color> r�i, ta �� qu� m�t, h�m kh�c quay l�i nh�.", 0);
		return
	end;
	
	--������
	local bEnough = 1;
	if (GetCash() < 5000) then
		bEnough = 0;
	end;
	for i = 1221, 1225 do
		if (CalcEquiproomItemCount(6, 1, i, -1) < 1) then
			bEnough = 0;
		end
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (CalcEquiproomItemCount(6, 1, tab_BasicMaterial[i][1], -1) < 1) then
			bEnough = 0;
		end
	end;
	if (bEnough == 0) then
		Say("Kh�ch quan kh�ng �� v�t li�u, <color=red>"..szCageName.."<color> c�n <color=yellow>5 lo�i gi�y ki�ng, 1 thanh tre, 1 d�y c�i, 1 n�n<color> v� <color=red>5000 l��ng<color> ti�n c�ng.", 1, "�� ta �i chu�n b� ��!/oncancel");
		return
	end;
	
	--ɾ������
	if (Pay(5000) == 0) then
		return
	end;
	for i = 1221, 1225 do
		if (ConsumeEquiproomItem(1, 6, 1, i, -1) ~= 1) then
			return
		end
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (ConsumeEquiproomItem(1, 6, 1, tab_BasicMaterial[i][1], -1) ~= 1) then
			return
		end
	end;
	
	local nSeed = random(1, 10);
	if (nSeed <= 8) then
		gb_SetTask(szCityLGName, 2, n_wc_Count + 1);
	--������Ʒ
		AddItem(6, 1, 1234, 1, 0, 0, 0);
	--����
		Say("<color=red>"..szCageName.."<color> �� l�m xong, Kh�ch quan v�a � ch�?!", 0);
		Msg2Player("B�n nh�n ���c <color=yellow>"..szCageName.."(".."��c bi�t"..")<color>");
	else
	--������Ʒ
		local iIdx = AddItem(6, 1, 1246, 1, 0, 0, 0);
		if (iIdx > 0) then
			SetSpecItemParam(iIdx, 1, 1);
			SyncItem(iIdx);
		end;
	--����
		Say("<color=red>"..szCageName.."<color> �� l�m xong, nh�ng kh�ng ���c nh� �. Th�t ng�i qu�!", 0);
		Msg2Player("B�n nh�n ���c <color=yellow>"..szCageName.."<color>");
	end;
end;