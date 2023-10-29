Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

repute_reward_taskid	= 1865;
repute_reward_date_s	= 20081205;
repute_reward_date_e	= 20090104;

function christmas_repute_main()
	local n_dateD	= tonumber(GetLocalDate("%y%m%d"));
	local n_dateH	= tonumber(GetLocalDate("%H"));
	local n_dateW	= tonumber(GetLocalDate("%w"));
	
	if (n_dateW ~= 0 or n_dateH < 12 or n_dateH >= 14) then	-- �ʱ���ж�
		Say("L� Quan: Hi�n t�i v�n ch�a ��n th�i gian nh�n th��ng. Xin m�i c�c h� quay tr� l�i sau.", 0);
		return
	end
	
	if (GetLevel() < 50) then	-- �ȼ��ж�
		Say("L� Quan: ��i hi�p v�n ch�a ��n c�p 50. H�y luy�n t�p th�m r�i nh�n th��ng nh�.", 0);
		return
	end
	
	if (GetRepute() < 450) then
		Say("L� Quan: �i�m danh vong c�a c�c h� v�n ch�a �� 450, kh�ng th� nh�n ���c ph�n th��ng n�y.", 0);
		return
	end
	
	if (GetTask(repute_reward_taskid) == n_dateD) then	-- һ��ֻ����ȡһ�ε��ж�
		Say("L� Quan: H�m nay ��i hi�p �� nh�n v�t ph�m n�y r�i.", 0);
		return
	end
	
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng!",0);
		return
	end
	
	SetTask(repute_reward_taskid, n_dateD);
	local szName 		= "";
	local nItemIndex	= 0;
	if (GetRepute() > 10000) then
		nItemIndex	= AddItem(6, 1, 1838, 1, 0, 0);
		szName	= "B�ch Kim B�i";		
	elseif (GetRepute() > 3600) then
		nItemIndex	= AddItem(6, 1, 1837, 1, 0, 0);
		szName	= "Ho�ng Kim B�i";
	else
		nItemIndex	= AddItem(6, 1, 1836, 1, 0, 0);
		szName	= "B�ch Ng�n B�i";
	end
	if (ITEM_GetExpiredTime(nItemIndex) == 0) then
		ITEM_SetExpiredTime(nItemIndex,christmas_box_expiredtime);
		SyncItem(nItemIndex);
	end
	Msg2Player(format("Ch�c m�ng ��i hi�p �� thu ���c 1 %s!", szName));
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",
			"Ho�t ��ng gi�ng sinh 2008 �� Nh�n Th��ng Theo C�p �� Danh V�ng",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			szName));
end

function christmas_repute_info()
	Say("L� Quan: Ho�t ��ng nh�n th��ng theo danh v�ng ���c di�n ra t� 05-12-2008 ��n 04-01-2009 ch� nh�t h�ng tu�n v�o 12:00 ��n 14:00. Trong th�i gian ho�t ��ng, c�c v� ��ng ��o ��n NPC L� Quan v� ��i tho�i �� nh�n th��ng. Ng��i ch�i ph�i ��t ��ng c�p t� 50 tr� l�n v� danh v�ng ph�i ��t 450 m�i c� th� nh�n ���c ph�n qu� t��ng �ng.", 0);
end