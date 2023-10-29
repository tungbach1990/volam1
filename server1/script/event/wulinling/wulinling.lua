--������
--By С��
--2007-03-29
Include( "\\script\\event\\wulinling\\head.lua" )

function wulinling_main()
	local aryTalk = {}
	tinsert(aryTalk,"<dec><npc>Nh�n d�p Sinh nh�t <color=yellow>V� l�m Truy�n K� tr�n 2 n�m<color> (11/06/2005 - 11/06/2007), hoan ngh�nh m�i ng��i ��n tham gia ho�t ��ng thu th�p V� l�m l�nh b�i!");
	tinsert(aryTalk,"Ta mu�n t�m hi�u ho�t ��ng n�y/wulinling_about");
	
	if wulinling_date() == 1  then
		tinsert(aryTalk,"Ta ��n giao l�nh b�i!/wulinling_give");
	end
	tinsert(aryTalk,"Ta mu�n xem s� l��ng V� l�m l�nh c�a c�c bang h�i �� giao/wulinling_query");
	tinsert(aryTalk,"Ta s� quay l�i sau!/OnCancel");
	
	CreateTaskSay(aryTalk);
end

function wulinling_query()
	local szary = "<dec><npc>L�c 00:00 s� c�p nh�t s� l��ng l�nh b�i c�a t�ng bang h�i giao n�p trong ng�y v� th�ng k� x�p h�ng. \n\n";
	local nDate = tonumber(WULINLING_DATE[2]..date("%M"))
	if tonumber(GetLocalDate("%Y%m%d%H%M")) > (nDate + 5) then --�Ƴ�10����.��ֹRelay�ӳ�����
		checkwulinlingPh();
		if WULINLING_PHTB[1][1] ~= nil then
			szary = format("Ho�t ��ng %s �� k�t th�c, ch�c m�ng bang h�i <color=red>%s<color> �� nh�n ���c t� c�ch tham d� cu�c thi <color=yellow> Thi�n H� �� Nh�t Bang <color> v�o th�ng 5. \n",szary,WULINLING_PHTB[1][1][1]);
		end
	end
	CreateTaskSay({ szary,
			 "Ta mu�n xem s� l��ng V� l�m l�nh �� ���c bang h�i thu th�p/wulinling_queryMy",
			 "Ta mu�n xem s� l��ng V� l�m l�nh c�a 10 bang h�i x�p h�ng ��u ti�n/wulinling_queryFirst",
			 "K�t th�c ��i tho�i/OnCancel"
		 });
end

function wulinling_queryFirst()
	if tonumber(GetLocalDate("%Y%m%d%H")) < ( tonumber(WULINLING_DATE[1]) + 100 ) then
		CreateTaskSay({"<dec><npc>Hi�n ch�a c�ng b� s� l��ng V� l�m l�nh c�a 10 bang h�i x�p h�ng ��u ti�n","K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end
	checkwulinlingPh();
	local szary = "<dec><npc>X�p h�ng Bang h�i thu th�p V� l�m l�nh\n";
	for szkey,szName in WULINLING_PHTB[1] do
		szary = format("%s H�ng <color=yellow>%2s<color>: <color=red>%-25s<color> <color=yellow>%d<color><enter>",
							szary, tostring(szkey),szName[1],szName[2]);
	end
	CreateTaskSay({szary,"K�t th�c ��i tho�i/OnCancel"});
end

function wulinling_queryMy()
	
	if checkwulinlingLimit() == 0 then
		CreateTaskSay({"Xin l�i! ��i hi�p ch�a gia nh�p bang h�i n�o c�!", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end
	local szlgname = GetTongName();
	--****�ж��Ƿ񴴽��˸�����
	checkCreatLG(szlgname);
	
	--**�ж��Ƿ�����˸�����
	checkJoinLG(szlgname);
	
	local nLgTaskSum = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK)
	local nLgTaskPh = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKPH) --����
	--local nLgMemberTaskSum = LG_GetMemberTask(WULINLING_LGTYPE, szlgname,GetName(), WULINLING_LGMEMTASK); --��Ա�ύ��
	local szPh = "";
	if nLgTaskPh == 0 or nLgTaskPh == nil then
		szPh = "<color=yellow>hi�n ch�a<color>";
	else
		szPh = format("<color=yellow>%d<color>", nLgTaskPh);
	end
	CreateTaskSay({format("<dec><npc> K�t qu� tham gia thu th�p<enter>Bang n�y x�p h�ng: %s<enter>T�ng s� thu ���c: <color=yellow>%d<color><enter> ", szPh, nLgTaskSum),"K�t th�c ��i tho�i/OnCancel"});
	
end


function wulinling_give()
	if checkwulinlingLimit() == 0 then
		CreateTaskSay({"Xin l�i! ��i hi�p ch�a gia nh�p bang h�i n�o c�!", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end
	local szlgname = GetTongName();
	--****�ж��Ƿ񴴽��˸�����
	checkCreatLG(szlgname);
	
	--**�ж��Ƿ�����˸�����
	checkJoinLG(szlgname);
	
	--**�ύ������
	wulinling_process(szlgname);
	
end

function wulinling_process(szlgname)
	local nSumCount = CalcEquiproomItemCount(6,1,WULINLING_ITEM,-1);
	--print(nSumCount);
	if nSumCount == 0 then
		CreateTaskSay({"<dec><npc>��i hi�p ch�a c� l�nh b�i n�o trong ng��i!","K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end
	--ɾ��Ʒ
	if ConsumeEquiproomItem(nSumCount,6,1,WULINLING_ITEM,-1) ~= 1 then
		WriteLog(format("[V� L�m l�nh]\t%s\tAccount:%s\tName:%s\tX�a v�t ph�m th�t b�i: V� l�m l�nh ",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName() ));
		CreateTaskSay({"<dec><npc>Kh�ng th� giao V� l�m l�nh !","K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end
	--���ñ���
	local nLgTaskSum = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK)
	if nLgTaskSum == nil then
		LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK, 0 , "", "");
	end
	LG_ApplyAppendLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK, nSumCount, "", "")
	LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKDATA, date("%m%d%H%M%S") , "", "");

	--LG_ApplyAppendMemberTask(WULINLING_LGTYPE, szlgname, GetName(), WULINLING_LGMEMTASK, nSumCount, "","");
	
	--LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKPH, 1 , "", "");
	WriteLog(format("[V� L�m l�nh]\t%s\tAccount:%s\tName:%s\t giao V� l�m l�nh th�nh c�ng. T�ng s�: %d",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(), nSumCount));
	CreateTaskSay({"<dec><npc>B�n �� giao th�nh c�ng " .. nSumCount .. " V� l�m l�nh", "K�t th�c ��i tho�i/OnCancel"});
end

function wulinling_about()
	CreateTaskSay({"<dec><npc>T� <color=yellow>ng�y 6 th�ng 4<color> ��n <color=yellow>24h ng�y 26 th�ng 4<color>, qu�i v�t t�i c�c khu v�c luy�n c�ng t� c�p 50 tr� l�n s� ng�u nhi�n r�i ra V� l�m l�nh. Bang h�i n�o thu th�p v� giao cho V� l�m Truy�n nh�n t�i c�c th�nh th� nhi�u nh�t s� nh�n ���c t� c�ch tham gia cu�c thi ��u <color=yellow>Thi�n h� �� nh�t bang<color> (Xem th�ng tin chi ti�t tr�n trang ch�)!","K�t th�c ��i tho�i/OnCancel"});
end


function OnCancel()
	
end
