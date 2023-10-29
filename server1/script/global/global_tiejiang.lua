

Include("\\script\\global\\recoin_goldenequip.lua")
Include("\\script\\global\\equipenchase_help.lua") 
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\��ɫ���ƽ�װ������.lua")
Include("\\script\\global\\shenmi_chapman.lua");	--��װ������
Include("\\script\\global\\equip_system.lua"); -- T�nh n�ng: Ch� t�o �� t�m v� hkmp
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")



--------�̶��Ի� ����--------
function tiejiang_city(...)
	
	local nNpcIndex = GetLastDiagNpc();
	--local szNpcName = GetNpcName(nNpcIndex);
	--if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local szNpcName = "Th� r�n trong th�nh"
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	
	local aryParam = arg;
	
	if (getn(aryParam) == 0) then
		tbDailog.szTitleMsg = TIEJIANG_DIALOG
	else
		for i = 1, getn(aryParam) do
			if (i == 1) then
				tbDailog.szTitleMsg = TIEJIANG_DIALOG
			else
				local _,_, szOpt, szFun = strfind(aryParam[i], "([^/]+)/([^/]+)")
				local fn = getglobal(szFun)
				if fn then
					tbDailog:AddOptEntry(szOpt, fn);	
				end
			end;
		end;
	end;
	
	
	tbDailog.szTitleMsg = gsub(tbDailog.szTitleMsg, "<dec>", "")
	tbDailog:AddOptEntry("Giao d�ch", yes);
	--tbDailog:AddOptEntry("C�a h�ng tinh l�c", energy_sale);
	tbDailog:AddOptEntry("V�t ph�m ��c", onFoundry);
	--tbDailog:AddOptEntry("V�t ph�m kh�m n�m", jewel_yes);
	tbDailog:AddOptEntry("X� l� <trang b� �� b� h�ng>", deal_brokenequip);
	--tbDailog:AddOptEntry("Ta ��n nh�n nhi�m v� S� nh�p", education_tiejiang);	
	--tbDailog:AddOptEntry("Nh�n ti�n gh� qua th�i", no, {});
	tbDailog:Show()
end;
--------�̶��Ի� ���ִ�------
function tiejiang_village(...)
	local aryParam = arg;
	local aryDescribe = {
		--szDialog,		--������˵�����ڸ�����������
		"Giao d�ch/yes",
		
		--Change request 04/06/2011, ��ng ch� t�o trang b� b�ch kim - Modified by DinhHQ - 20110605
		"V�t ph�m ��c/onFoundry",
		
		--"Ta ��n nh�n nhi�m v� S� nh�p/tboss",
		"Nh�n ti�n gh� qua th�i/no",
	};
	
	if (getn(aryParam) == 0) then
		tinsert(aryDescribe, 1, TIEJIANG_DIALOG)
	else
		for i = 1, getn(aryParam) do
			if (i == 1) then
				tinsert(aryDescribe, 1, aryParam[i]);
			else
				tinsert(aryDescribe, 2, aryParam[i]);
			end;
		end;
	end;
	CreateTaskSay(aryDescribe);
end;

--------��Ƕ--------
function jewel_yes()
	CreateTaskSay({"<dec><npc>Th�y tinh kh�m n�m li�n quan ��n s� c�n b�ng ng� h�nh, ph��ng ph�p chuy�n linh kh� tuy�t nhi�n kh�ng th� d�ng s�c ng��i ���c, kh�ng h�n nh� ��i hi�p hi v�ng th�nh v�t ph�m tuy�t th� nh�n gian, m� v� kh� �� ph� v� v�c ngo�i k� tr�n ch� gi�p chuy�n ��i ��ng c�p c�a trang b�. C�c h� mu�n kh�m n�m trang b� n�y kh�ng?", "B�t ��u kh�m n�m/jewel_yes1", "Li�n quan kh�m n�m/help", "�� ta suy ngh� k� l�i xem/no"});
end

function jewel_yes1()
	EnchaseItem()
end

-------No--------
function no()
end;

------����-------
function energy_sale()
	CreateStores();
	AddShop2Stores(174, "C�a h�ng tinh l�c", 15, 100, "fBuyCallBack(%d,%d)");
	OpenStores();
end

function fBuyCallBack(nItemIdx, nPrice)
	local nCount = 1
	local itemgenre, itemdetail, itemParticular = GetItemProp(nItemIdx)
	if itemgenre == 6 and itemdetail == 1 and itemParticular == 2317 then
		-- ������
		AddStatData("jlxiaohao_shiliantiegoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2355 then
		-- �������
		AddStatData("jlxiaohao_xuantiangoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2369 then
		-- �����
		AddStatData("jlxiaohao_qingjulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2353 then
		-- ��¹��
		AddStatData("jlxiaohao_yunlulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2352 then
		-- ������
		AddStatData("jlsxiaohao_canglanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2351 then
		-- ��Գ��
		AddStatData("jlxiaohao_xuanyuanlinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2350 then
		-- ������
		AddStatData("jlxiaohao_zimanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2744 then
		-- ����Կ��
		AddStatData("jlxiaohao_ruyiyaoshigoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 1617 then
		-- �׵���
		AddStatData("jlxiaohao_yandilinggoumai", nCount)
	end											
	return 1
end
