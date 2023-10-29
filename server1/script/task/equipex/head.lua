
-- ====================== �ļ���Ϣ ======================

-- ������Եonline Խ�ϰ���������ű�ͷ�ļ�
-- Edited by bel
-- 2008/05/07 AM 11:02

-- ======================================================

IncludeLib("ITEM");						-- ��Ʒ��֧��
IncludeLib("TASKSYS");					-- ����ϵͳ��֧��
Include("\\script\\lib\\equipex.lua");	-- ������������װ��֧�ֵ�ͷ�ļ�
Include("\\script\\task\\system\\task_debug.lua");		-- ���� DEBUG ��������ļ�
Include("\\script\\task\\system\\task_head.lua");		-- ����WriteTaskLog��Ϣ

ID_EQUIPEX_TASK		= 2536;             -- ��¼�������������
ID_EQUIPEX_FINISH	= 2540;             -- ��¼������������״̬
ID_EQUIPEX_TOTAL  	= 2541;             -- ��¼���������Ƿ�ȫ�����
ID_EQUIPEX_TASK_RANDOMSEED	= 2539;  	-- ��¼�ƽ���������

GLB_EQUIPEX_CLOSE 	= 1244  			-- �����ر��õ���ʱ����
TASK_CHECKITEM_NUM 	= 202;				-- ������ʱ��¼����Ʒ ID ����
TAKS_CHECKITEM_MAX 	= 20;				-- ������ʱ��¼����Ʒ ID �����
TASK_CHECKITEM_START 		= 203;		-- ������ʱ��¼����Ʒ ID ��ʼ������
NUM_PAY_TOPITEMTOPERFECT	= 1000;		-- ��Ʒ�İ��������������շѣ���λ����
NUM_PAY_PERFECTITEM_REVERT 	= 500;


-- ��ͨ�İ�������
aryItem = {
	--   ���������  ��ͨ�����  ��������������   ��ͨ����������   ��Ҫ�̶�������
	[1]	= {211, 165, "An bang Ho�n m� - C�c hoa th�ch ch� ho�n", "An Bang C�c Hoa Th�ch Ch� ho�n", 105},
	[2] = {213, 167, "An bang Ho�n m� - K� huy�t th�ch gi�i ch�", "An Bang K� Huy�t Th�ch Gi�i Ch� ", 102},
	[3] = {210, 164, "An bang Ho�n m� - B�ng tinh th�ch h�ng li�n", "An Bang B�ng Tinh Th�ch H�ng Li�n", 114},
	[4] = {212, 166, "An bang Ho�n m� - �i�n ho�ng th�ch ng�c b�i", "An Bang �i�n Ho�ng Th�ch Ng�c B�i", 101},
}

-- ��Ʒ�İ�������
aryTopItem = {
	--   ���������  ��ͨ�����  ��������������   ��ͨ����������
	[1]	= {425, 409, "[Ho�n M�] C�c Ph�m An Bang C�c Hoa Th�ch Ch� Ho�n", "[C�c ph�m] An Bang C�c Hoa Th�ch Ch� Ho�n"},
	[2] = {427, 411, "[Ho�n M�] C�c Ph�m An Bang K� Huy�t Th�ch Gi�i Ch�", "[C�c ph�m] An Bang K� Huy�t Th�ch Gi�i Ch�"},
	[3] = {424, 408, "[Ho�n M�] C�c Ph�m An Bang B�ng Tinh Th�ch H�ng Li�n", "[C�c ph�m] An Bang B�ng Tinh Th�ch H�ng Li�n"},
	[4] = {426, 410, "[Ho�n M�] C�c Ph�m An Bang �i�n Ho�ng Th�ch Ng�c B�i", "[C�c ph�m] An Bang �i�n Ho�ng Th�ch Ng�c B�i"},	
}

aryNeedItem = {
	--      ��Ʒ����          ����  ����  ϸ��  �ȼ�  ����  �ƽ�  ����  ������Ӽ�¼
	[1] = {{"2 C�c Hoa Th�ch",        4,   963,    1,   -1,   -1,    0,   2,    0},
		   {"1 B�ng Th�ch K�t Tinh",      4,   967,    1,   -1,   -1,    0,   1,    0},
		   {"10 Lam Th�y Tinh",       4,   238,    1,   -1,   -1,    0,   10,   0},
		   {"An Bang C�c Hoa Th�ch Ch� ho�n", 0,   0,      0,   -1,   -1,  165,   1,    1}},
		   	
	[2] = {{"2 B�ng Thi�m T�",        4,   965,    1,   -1,   -1,    0,   2,    0},
		   {"3 K� Huy�t Th�ch",        4,   966,    1,   -1,   -1,    0,   3,    0},
		   {"10 L�c Th�y Tinh",       4,   240,    1,   -1,   -1,    0,   10,   0},
		   {"An Bang K� Huy�t Th�ch Gi�i Ch� ", 0,   0,      0,   -1,   -1,  167,   1,    1}},
		   	
	[3] = {{"2 M� N�o",          4,   964,    1,   -1,   -1,    0,   2,    0},
		   {"1 M�nh thi�n th�ch",      4,   968,    1,   -1,   -1,    0,   1,    0},
		   {"5 T� Th�y Tinh",        4,   239,    1,   -1,   -1,    0,   5,    0},
		   {"1 Th�n B� Kho�ng Th�ch",      6,   1,    398,   -1,   -1,    0,   1,    0},
		   {"An Bang B�ng Tinh Th�ch H�ng Li�n", 0,   0,      0,   -1,   -1,  164,   1,    1}},
		   	
	[4] = {{"10 �i�n Ho�ng Th�ch",       4,   969,    1,   -1,   -1,    0,   10,   0},
		   {"1 T�n s� Kim b�i",     6,   1,    888,   -1,   -1,    0,   1,    0},
		   {"1 Huy�n tinh c�p 8",       6,   1,    147,    8,   -1,    0,   1,    0},
		   {"An Bang �i�n Ho�ng Th�ch Ng�c B�i", 0,   0,      0,   -1,   -1,  166,   1,    1}},
}


function main_talk()
	
	local nTask = equipexTaskState();
	local nFinish = GetTask(ID_EQUIPEX_FINISH);
	
	local aryTalk = {};
	
	if GetGlbValue(GLB_EQUIPEX_CLOSE)==1 then
		Say("Th� r�n th�n b�: H�m nay ta m�t r�i, ��i l�n sau ta s� gi�p ng��i!", 0);
		return
	end;
	
	tinsert(aryTalk, "<dec><npc>L�o phu c� th� gi�p g� v� trang b� An bang Ho�n m�?");
	
	if nTask>=4 and nFinish==1 then
		tinsert(aryTalk, "Ta mu�n �ng gi�p ta ti�p t�c ch� t�o b� An bang./ib_nexttask_talk");
	else
		tinsert(aryTalk, "Ta mu�n ti�n h�nh ch� t�o b� An bang Ho�n m�/main_task_talk");
	end;
	
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		tinsert(aryTalk, "Ta mu�n ph�c h�i l�i b� An bang Ho�n m�/ib_nexttask_revert");
	end;
	
--	tinsert(aryTalk, "��ӵ��[��Ʒ��]�������Σ������ǿ����/top_equipex_dialog");
--	tinsert(aryTalk, "��ӵ��[��Ʒ��]�����������Σ�����һ�ԭ��/top_revert_dialog");
	tinsert(aryTalk, "R�i kh�i/OnExit");
	
	CreateTaskSay(aryTalk);
end;


function main_task_talk()
	local nTask = equipexTaskState();
	local nFinish = GetTask(ID_EQUIPEX_FINISH);
	if nTask==0 then
		CreateTaskSay({"<dec><npc>Xem nh� l� c� duy�n, ta s� gi�p ng��i ho�n th�nh.",
					   "B�t ��u nhi�m v� An bang Ho�n m�/main_task_001",
					   "R�i kh�i/OnExit"});
	end;
	
	if nTask>0 and nTask<=4 and nFinish==0 then
		main_task_give();
	end;
	
	if nTask>0 and nTask<4 and nFinish==1 then
		if nTask==1 then main_task_002(); end;
		if nTask==2 then main_task_003(); end;
		if nTask==3 then main_task_004(); end;
	end;
	
end;



function main_task_001()
	SetTask(ID_EQUIPEX_TASK, 1);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>��u ti�n l� ch� t�o {{An bang c�c hoa th�ch ch� ho�n}}. H�y gi�p ta �i t�m {{2 C�c Hoa Th�ch}} v� {{1 B�ng Th�ch K�t Tinh}}, v� {{10 Lam Th�y Tinh}}, nghe ��n r�ng nh�ng th� n�y c� b�n t�i K� Tr�n C�c, ng��i h�y �i xem, d� nhi�n kh�ng th� thi�u {{An bang c�c hoa th�ch ch� ho�n}} c�a ng��i n�a.",
				   "Hi�u r�i/OnExit"});	
end;

function main_task_002()
	SetTask(ID_EQUIPEX_TASK, 2);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>Ti�p theo l� ch� t�o {{An bang k� huy�t th�ch gi�i ch� }}, h�y gi�p ta �i t�m {{2 B�ng Thi�m T�}}, {{3 K� Huy�t Th�ch}}, v� {{10 L�c Th�y Tinh}}. Nghe ��n r�ng nh�ng th� n�y c� b�n t�i K� Tr�n C�c, ng��i h�y �i xem, d� nhi�n kh�ng th� thi�u {{An bang k� huy�t th�ch gi�i ch� }}.",
				   "Hi�u r�i/OnExit"});	
end;

function main_task_003()
	SetTask(ID_EQUIPEX_TASK, 3);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>Ti�p theo l� ch� t�o {{An bang b�ng tinh th�ch h�ng li�n}}, h�y gi�p ta �i t�m {{2 M� N�o}} v� {{1 M�nh thi�n th�ch}}, v� {{5 T� Th�y Tinh}} v� {{1 Th�n b� kho�ng th�ch}}, Nghe ��n r�ng nh�ng th� n�y c� b�n t�i K� Tr�n C�c, ng��i h�y �i xem, d� nhi�n kh�ng th� thi�u {{An bang b�ng tinh th�ch h�ng li�n}}.",
				   "Hi�u r�i/OnExit"});	
end;

function main_task_004()
	SetTask(ID_EQUIPEX_TASK, 4);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>Cu�i c�ng l� ch� t�o {{An bang �i�n ho�ng th�ch ng�c b�i}}. H�y gi�p ta �i t�m {{10 �i�n Ho�ng Th�ch}}, {{1 T�n s� kim b�i}} v� {{1 Huy�n tinh c�p 8}}, v� d� nhi�n kh�ng th� thi�u {{An bang �i�n ho�ng th�ch ng�c b�i}}.",
				   "Hi�u r�i/OnExit"});	
end;

function main_task_give()
	local nTask = equipexTaskState();
	
	local aryTaskNeed = {}; 
	
	if nTask>0 and nTask<=4 then
		aryTaskNeed = aryNeedItem[nTask];
	end;
	
	local szTask = "";
	local i=0;
	
	for i=1, getn(aryTaskNeed) do
		szTask = szTask.."<color=yellow>"..aryTaskNeed[i][1].."<color><enter>";
	end;
	
	local szTalk = {};
	tinsert(szTalk, "<dec><npc>Ng��i �� thu th�p ��y �� ch�a?<enter><enter>"..szTask);
	tinsert(szTalk, "Giao nguy�n li�u ch� t�o An bang Ho�n m�/giveTaskNeedDialog");
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		tinsert(szTalk, "Ta kh�ng mu�n ti�p t�c ch� t�o n�a./ib_nexttask_cancel");
	end;
	tinsert(szTalk, "R�i kh�i/OnExit");
	
	CreateTaskSay(szTalk);
end;


-- ÿһ���������ʱ�Ĵ���
function main_task_finish()
	
	local nTask = equipexTaskState();
	local nRandomSeed = 0;
	local nGold = 0;
	
	local nItem = GetTaskTemp(TASK_CHECKITEM_NUM);
	local nResult = 0;  -- �Ƿ�ɾ����Ʒ��ȷ
	local i=0;

	-- ɾ����������Ҫ����Ʒ
	for i=1, nItem do
		nResult = RemoveItemByIndex(GetTaskTemp(TASK_CHECKITEM_START + i - 1));
		
		-- �쳣���������ɾ�����ɹ�����ֱ�ӽ������ɻ�û���
		if nResult~=1 then
			Say("Nhi�m v� ph�t sinh l�i, kh�ng th� ho�n th�nh!", 0);
			return
		end;
		
	end;
			
	if nTask>0 and nTask<=4 then
		
		nGold = aryItem[nTask][1];
		
		nRandomSeed = GetTask(ID_EQUIPEX_TASK_RANDOMSEED);
		
		-- AddItemEx ָ����Ҫ���ƽ���� -1
		AddItemEx(4, nRandomSeed, 1, 0, nGold - 1, 0, 0, 0, 0, 0);
		
		CDebug:MessageOut("Ch� t�o th�nh c�ng 1 m�n An bang ho�n m�, m� s�:"..nGold.." Nhi�m v� ng�u nhi�n:"..nRandomSeed);
		WriteTaskLog("Ch� t�o th�nh c�ng 1 m�n An bang ho�n m�, m� s�:"..nGold.." Nhi�m v� ng�u nhi�n:"..nRandomSeed);
		
	end;
	
	SetTask(ID_EQUIPEX_FINISH, 1);
	
	Msg2Player("Ch�c m�ng b�n �� nh�n ���c: <color=yellow>"..aryItem[nTask][3].."<color>!");
	
	-- ��������������ɣ���������ζ���������Ϊ���һ���Ѿ����״̬
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		SetTask(ID_EQUIPEX_TASK, 4);
	end;
	
	if nTask==4 then
		SetTask(ID_EQUIPEX_TOTAL, 1);
	end;
	
end;


function equipexTaskState()
	return GetTask(ID_EQUIPEX_TASK);
end;


function giveTaskNeedDialog()
	GiveItemUI("Giao v�t ph�m cho th� r�n", "H�y ��t c�c nguy�n li�u c�n thi�t v�o!", "checkTaskNeed", "OnExit");
end;


function checkTaskNeed(nCount)
	local aryTaskNeed = aryNeedItem[equipexTaskState()];

	-- ��������Ҫ��Ʒ�� MAP
	local aryNeed = {};
	
	-- ����Ҫɾ����Ʒ������
	local aryDelItem = {};		
	
	-- ��������Ҫ����Ʒ����
	local nNeed = getTaskCollectNum();

	-- ������Ҫ����Ʒ���
	local w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality = 0,0,0,0,0,0,0,0;
	print(-100, w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality);
	-- ��Ҵ���������Ʒ���
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex = 0,0,0,0,0,0,0,0;
	print(1000, nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex);
	-- �����Ʒ��Ҫ��¼������ӣ����¼���
	local nRandomSeedRecord = 0;
	
	local nRandomSeed = 0;
	
	local tmpNeedKey, tmpNeedLevel, tmpNeedFive = "", 0, 0;
	local tmpGetKey, tmpGetLevel, tmpGetFive = "", 0, 0;
	
	-- ��ʵ����Ʒ����
	local nRealCount, nCheckCount = 0, 0;
	
	local i,j,k=0,0,0;
	
	for i=1, nCount do
		local nItemIndex	= GetGiveItemUnit(i)
		nRealCount = nRealCount + GetItemStackCount(nItemIndex);
	end;
	
	-- �����Ʒ������Ҫ�ҵ�����������ֱ�ӷ���
	if nRealCount ~= nNeed then
		Say("S� l��ng v�t ph�m b�n �� v�o kh�ng ch�nh x�c!", 0);
		return 0;
	end;
	
	-- ������������Ҫ��Ʒ�� MAP
	for i=1, getn(aryTaskNeed) do
		
		w_Genre      = aryTaskNeed[i][2];
		w_Detail     = aryTaskNeed[i][3];
		w_Particular = aryTaskNeed[i][4];
		w_Level      = aryTaskNeed[i][5];
		w_GoodsFive  = aryTaskNeed[i][6];
		w_GoodsNum   = aryTaskNeed[i][8];
		
		w_Quality    = aryTaskNeed[i][7];
		
		nRandomSeedRecord = aryTaskNeed[i][9];
		
		if w_Quality==-1 then w_Quality=0; end;
		
		if w_Quality>0 then
			w_Genre = 0;w_Detail = 0;w_Particular = 0;
		end;

		tmpNeedKey = tostring(w_Quality)..","..
					 tostring(w_Genre)..","..
					 tostring(w_Detail)..","..
					 tostring(w_Particular);
		
		-- ���û����� MAP KEY ���ʼ��
		if aryNeed[tmpNeedKey] then
			tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
		else
			aryNeed[tmpNeedKey]={};
			tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
		end;
		CDebug:MessageOut("S� v�t ph�m t�o th�nh: ["..tmpNeedKey.."]:"..w_Level..","..w_GoodsFive..","..w_GoodsNum..","..w_DelGoods);
	end;
	
	
	for i=1, nCount do
		
		nIndex = GetGiveItemUnit(i);
		
		tmpGetKey, tmpLevel, tmpFive = TranKey(nIndex);
		CDebug:MessageOut("Ki�m tra v�t ph�m:"..tmpGetKey);
		nCheckCount = GetItemStackCount(nIndex);
		
		local bCorrect = 0;
		if aryNeed[tmpGetKey] then
			for j=1, getn(aryNeed[tmpGetKey]) do
				
				CDebug:MessageOut("Ki�m tra v�t ph�m:"..tmpGetKey);
			
				-- ���������Ʒ����Ҫ�ж����л��ߵȼ���
				if aryNeed[tmpGetKey][j][1]==-1 then tmpLevel=-1; end;
				if aryNeed[tmpGetKey][j][2]==-1 then tmpFive=-1; end;
				
				CDebug:MessageOut("Tham s� v�t ph�m:"..tmpGetKey.."level:"..tmpLevel.."  five:"..tmpFive);
				CDebug:MessageOut("Tham s� nhi�m v�:"..tmpGetKey.."level:"..aryNeed[tmpGetKey][j][1].."  five:"..aryNeed[tmpGetKey][j][2]);
				
				-- ������Ӧ�� KEY �����к͵ȼ������ϵĻ�
				if aryNeed[tmpGetKey][j][1]==tmpLevel and aryNeed[tmpGetKey][j][2]==tmpFive then
					
					-- ���������������Ʒ��Ҫ��¼������ӣ����¼
					-- ��¼�ĸ�ʽΪ��[������][����������][����������]
					if aryNeed[tmpGetKey][j][5]==1 then
						
						-- �������ƽ��Ƿ��б�����
						local nExpiredTime = ITEM_GetExpiredTime(nIndex);
						if nExpiredTime > 0 then
							CreateTaskSay({"<dec><npc>Kh�ch quan ��t v�o kh�ng ��ng trang b� ta c�n!",
										   "Ta �� giao nh�m r�i!/OnExit"});
							return
						end;
						
						nRandomSeed = ITEM_GetItemRandSeed(nIndex);
						SetTask(ID_EQUIPEX_TASK_RANDOMSEED, nRandomSeed);
					end;
										
					aryNeed[tmpGetKey][j][3] = aryNeed[tmpGetKey][j][3] - nCheckCount;
					bCorrect = 1;
					CDebug:MessageOut("Ki�m tra v�t ph�m:"..tmpGetKey.." Th�ng qua!");
					break;
				end;
			end;
		end;
		
		if (bCorrect == 1) then
			tinsert(aryDelItem, nIndex);
		else
			
			-- ��շ�������������
			aryDelItem = {};
			
			Say("V�t ph�m b�n �� v�o kh�ng ch�nh x�c!", 0);
			return 0;
		end;
		
	end;
	
	-- ����ǲ������е���Ʒ����ȷ
	for i,j in aryNeed do
		for k=1, getn(j) do
			if j[k][3]~=0 then
				Say("V�t ph�m b�n �� v�o kh�ng ch�nh x�c!", 0);
				return 0;
			end;
		end;
	end;
	
	-- ��¼һ���ж��ٸ���Ʒ��Ҫɾ��
	SetTaskTemp(TASK_CHECKITEM_NUM, getn(aryDelItem));
	
	CDebug:MessageOut("Li�t k� nh�ng v�t ph�m c�n lo�i b�:"..getn(aryDelItem));
	
	for i=1, getn(aryDelItem) do
		SetTaskTemp(TASK_CHECKITEM_START + i - 1, aryDelItem[i]);
		CDebug:MessageOut("C�n ph�i lo�i b�:"..aryDelItem[i]);
	end;
	
	-- �������ʱ�Ĵ���
	main_task_finish();
	
	return 1;

end;

-- ����һ����������Ҫ����Ʒ����
function getTaskCollectNum()
	local aryTaskNeed = aryNeedItem[equipexTaskState()];
	local nNum = 0;
	local i=0;
	
	for i=1, getn(aryTaskNeed) do
		nNum = nNum + aryTaskNeed[i][8];
	end;
	
	return nNum;
end;


-- ��һ������������Ʒ����ת����һ�� STRING �� KEY���Լ����صȼ�������
function TranKey(nIndex)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
CDebug:MessageOut("Ki�m tra v�t ph�m aaa:"..nGenre..","..nDetail..","..nParticular);
local nQuality = GetGlodEqIndex(nIndex);

local strKey = "";

	if nQuality==0 or nQuality<0 then
	
		strKey = tostring(nQuality)..","..
			     tostring(nGenre)..","..
			     tostring(nDetail)..","..
			     tostring(nParticular);
	
	else
		strKey = tostring(nQuality)..","..
			     tostring(0)..","..
			     tostring(0)..","..
			     tostring(0);	
	end;

	return strKey, nLevel, nGoodsFive;

end;


-- ������һ��������������а��������
function ib_nexttask_talk()
	CreateTaskSay({"<dec><npc>Ng��i �� nh�n ���c m�t b� An bang Ho�n m� nh� v�o nh�ng n� l�c ��ng kh�ch l�. N�u c�n mu�n ti�p t�c ch� t�o, c� th� ��n t�m l�o phu.",
				   "Ta mu�n ti�p t�c ch� t�o An bang ho�n m� - C�c hoa th�ch ch� ho�n/#ib_nexttask_main(1)",
				   "Ta mu�n ti�p t�c ch� t�o An bang Ho�n m� - K� huy�t th�ch gi�i ch�/#ib_nexttask_main(2)",
				   "Ta mu�n ti�p t�c ch� t�o An bang Ho�n m� - B�ng tinh th�ch h�ng li�n/#ib_nexttask_main(3)",
				   "Ta mu�n ti�p t�c ch� t�o An bang Ho�n m� - �i�n ho�ng th�ch ng�c b�i/#ib_nexttask_main(4)",
				   "�� ta suy ngh� l�i./OnExit"});	
end;


-- ���¸���ҿ�ʼһ������
function ib_nexttask_main(nSelect)
	if nSelect==1 then main_task_001(); end;
	if nSelect==2 then main_task_002(); end;
	if nSelect==3 then main_task_003(); end;
	if nSelect==4 then main_task_004(); end;
end;


-- ȡ������
function ib_nexttask_cancel()
	SetTask(ID_EQUIPEX_TASK, 4);
	SetTask(ID_EQUIPEX_FINISH, 1);
	Msg2Player("<color=yellow>B�n �� h�y b� l�n ch� t�o n�y<color>!");
end;


-- ���Ҫ��ԭװ���ĶԻ�
function ib_nexttask_revert()
	CreateTaskSay({"<dec><npc>V�n kh�ng c�m th�y h�i l�ng sao? Th�i ���c, ta c� th� gi�p {{Kh�i ph�c nguy�n tr�ng}} th�nh {{Trang b� An bang ph� th�ng}}, {{Thu�c t�nh c� th� s� kh�c ch�t so v�i tr��c ��y}}. Kh�ch quan n�n suy ngh� k�!",
				   "Ta mu�n kh�i ph�c l�i An Bang C�c Hoa Th�ch Ch� Ho�n/#ib_nexttask_revert_talk(1)",
				   "Ta mu�n kh�i ph�c l�i K� Huy�t Th�ch Gi�i Ch�/#ib_nexttask_revert_talk(2)",
				   "Ta mu�n kh�i ph�c l�i B�ng Tinh Th�ch H�ng Li�n/#ib_nexttask_revert_talk(3)",
				   "Ta mu�n kh�i ph�c l�i B�ng �i�n Ho�ng Th�ch Ng�c B�i/#ib_nexttask_revert_talk(4)",
				   "�� ta suy ngh� l�i./OnExit"});
end;

-- ��ԭ��ȷ�Ϲ���
function ib_nexttask_revert_talk(nId)
	CreateTaskSay({"<dec><npc>Kh�ch quan th�t s� mu�n kh�i ph�c nguy�n tr�ng trang b� An bang n�y sao? Chi ph� l� {{300  v�n l��ng}}, c� ��ng � kh�ng?",
				   "���c, ta ��ng �!/#ib_nexttask_revert_dialog("..nId..")",
				   "�� ta suy ngh� l�i./OnExit"});
end;


-- �����������
function ib_nexttask_revert_dialog(nId)
	if GetCash()<3000000 then
		CreateTaskSay({"<dec><npc><sex> x�c nh�n mang theo �� {{300  v�n l��ng}} ch�?", "K�t th�c ��i tho�i/OnExit"});
	else
		GiveItemUI("Giao trang b� An bang", "H�y ��t"..aryItem[nId][3].." v�o.", "ib_nexttask_revert_main", "OnExit");
	end;	
end;


-- ��ԭ��������
function ib_nexttask_revert_main(nCount)
	
	local nIndex = 0;
	local nQuality = 0;
	local nSelect = 0;
	local nResult = 0;
	local nCreateResult = 0;
	local aryCreateIndex = {};
	local i = 0;
	
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>Ta ch� c�n {{1 m�n}} {{Trang b� An bang}} Ho�n m� l� �� r�i, h�y ki�m tra l�i!",
					   "K�t th�c ��i tho�i/OnExit"});
		return
	end;
	
	nIndex = GetGiveItemUnit(nCount);
	nQuality = GetGlodEqIndex(nIndex);
	
	for i=1, 4 do
		if nQuality==aryItem[i][1] then
			nSelect = i;
			break;
		end;
	end;
	
	if nSelect==0 then
		CreateTaskSay({"<dec><npc>Ta ch� c�n {{1 m�n}} {{Trang b� An bang}} Ho�n m� l� �� r�i, h�y ki�m tra l�i!",
					   "K�t th�c ��i tho�i/OnExit"});
		return
	end;
	
	-- ��ʼ������ʱװ���������Ƿ����
	nCreateResult, aryCreateIndex = createLikeEquip(nIndex, aryItem[nSelect][2], aryItem[nSelect][5], 10);
	
	if nCreateResult>0 then

		-- ��ɾ��ԭ���Ļƽ�װ��
		nResult = RemoveItemByIndex(nIndex);
		
		-- �쳣����ɾ����Ʒ���ɹ�ʱ
		if nResult~=1 then
			CreateTaskSay({"<dec><npc>Th�t ��ng ti�c, l�n n�y ta th�t b�i r�i, l�n sau gh� l�i th� xem sao.",
						   "K�t th�c ��i tho�i/OnExit"});	
			WriteTaskLog("[L�i nghi�m tr�ng]Kh�i ph�c 1 trang b� An bang th�t b�i:"..aryItem[nSelect][4]);
			return
		end;
		
		CDebug:MessageOut("Nh�n ���c tr� s� ch�nh x�c:"..nCreateResult);
		
		AddItemByIndex(nCreateResult);
		
		WriteTaskLog("Kh�i ph�c nguy�n tr�ng Trang b� An bang th�nh c�ng:"..aryItem[nSelect][4]);
		
		-- ɾ�����ɵ���ʱװ����������ȷ���Ǹ�
		for i=1, getn(aryCreateIndex) do
			if aryCreateIndex[i]~=nCreateResult then
				RemoveItemByIndex(aryCreateIndex[i]);
			end;
		end;

		CreateTaskSay({"<dec><npc>Cu�i c�ng c�ng kh�i ph�c m�n {{"..aryItem[nSelect][3].."}} tr� v� nguy�n tr�ng, kh�ch quan c� th� mang �i ���c r�i!",
				       "K�t th�c ��i tho�i/OnExit"});	
		-- ��Ǯ
		Pay(3000000);
		Msg2Player("B�n �� giao cho Th� r�n <color=yellow>300 v�n ti�n c�ng<color>!");
		       		
	else
		CreateTaskSay({"<dec><npc>Kh�i ph�c nguy�n tr�ng {{th�t b�i r�i}}, th�t ng�i qu�, ta {{ch� nh�n m�t n�a ti�n c�ng}} th�i!",
					   "K�t th�c ��i tho�i/OnExit"});	
					   
		-- ɾ�����ɵ���ʱװ��
		for i=1, getn(aryCreateIndex) do
			RemoveItemByIndex(aryCreateIndex[i]);
		end;
		
		-- ��Ǯ
		Pay(1500000);
		Msg2Player("B�n �� tr� cho Th� r�n <color=yellow>150 v�n ti�n c�ng<color>!");

		WriteTaskLog("Kh�i ph�c nguy�n tr�ng Trang b� An bang th�t b�i:"..aryItem[nSelect][4]);		
	end;
	
	return
	
end;


-- ��Ʒ��������
function top_equipex_dialog()
	CreateTaskSay({"<dec><npc>Giao trang b� An bang C�c ph�m cho ta, ta s� gi�p ch� tao th�nh {{Trang b� An bang ho�n m� c�c ph�m}}, d� nhi�n l� r�t kh� kh�n, {{ti�n c�ng m�i l�n"..NUM_PAY_TOPITEMTOPERFECT.."  v�n l��ng}}, c� ��ng � kh�ng?",
				   "T�t qu�, h�y gi�p ta ch� t�o th�nh trang b� Ho�n m�/top_equipex_give",
	               "�� ta suy ngh� k� l�i xem/OnExit"});
end;

function top_equipex_give()
	if GetCash()<NUM_PAY_TOPITEMTOPERFECT*10000 then
		CreateTaskSay({"<dec><npc><sex> c� mang theo ��  {{"..NUM_PAY_TOPITEMTOPERFECT.."  v�n l��ng}} tr�n ng��i ch�?", "K�t th�c ��i tho�i/OnExit"});
	else
		GiveItemUI("Giao trang b� An bang C�c ph�m", "Xin h�y ��t v�o Trang b� An bang C�c ph�m", "top_equipex_main", "OnExit", 1);
	end;		
end;

function top_equipex_main(nCount)
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>Ta ch� c�n {{1 m�n trang b� An bang C�c ph�m}} l� �� r�i, h�y ki�m tra l�i!",
					   "K�t th�c ��i tho�i/OnExit"});
		return
	end;
	
	local nIndex = GetGiveItemUnit(nCount);
	local nQuality = GetGlodEqIndex(nIndex);
	local nAryIndex = 0;
	local nCheck = 0;
	
	-- �������ƽ��Ƿ��б�����
	local nExpiredTime = ITEM_GetExpiredTime(nIndex);
	if nExpiredTime > 0 then
		CreateTaskSay({"<dec><npc>Kh�ch quan ��t v�o kh�ng ��ng trang b� ta c�n!",
					   "Ta �� giao nh�m r�i!/OnExit"});
		return
	end;
	
	for i=1, getn(aryTopItem) do
		if aryTopItem[i][2]==nQuality then
			nAryIndex = i;
			nCheck = 1;
			break;
		end;
	end;
	
	if nCheck==0 then
		CreateTaskSay({"<dec><npc>V� <sex> n�y, v�t ph�m ��t v�o kh�ng ph�i l� {{Trang b� An bang C�c ph�m}}, h�y ki�m tra l�i!",
					   "K�t th�c ��i tho�i/OnExit"});		
		return
	end;
	
	Pay(NUM_PAY_TOPITEMTOPERFECT * 10000);
	
	local nItemBindState = GetItemBindState(nIndex)	-- ��ȡ��״̬
	local nResult = RemoveItemByIndex(nIndex);
	
	if nResult~=1 then return end;

	-- AddItemEx ָ����Ҫ���ƽ���� -1
	-- AddGoldItem(0, aryTopItem[nAryIndex][1]);
	local nServerItemIndex = NewItemEx(4, 0, 1, 0, aryTopItem[nAryIndex][1] - 1, 0, 0, 0, 0, 0);	
	
	if nItemBindState~=0 then
		SetItemBindState(nServerItemIndex, nItemBindState)
	end;
	
	AddItemByIndex(nServerItemIndex);
	
	Msg2Player("B�n �� giao cho Th� r�n <color=yellow>"..NUM_PAY_TOPITEMTOPERFECT.." v�n ti�n c�ng<color>!");
	Msg2Player("Ch� t�o th�nh c�ng: <color=yellow>"..aryTopItem[nAryIndex][3].."<color>!");
	
	WriteTaskLog("Ch� t�o th�nh c�ng:"..aryTopItem[nAryIndex][3]);
end;


-- ��Ʒ�������ԭ
function top_revert_dialog()
	CreateTaskSay({"<dec><npc>V�n kh�ng c�m th�y h�i l�ng v�i {{Trang b� An bang ho�n m� [C�c ph�m]}} sao? Th�i ���c, ta c� th� gi�p {{Kh�i ph�c nguy�n tr�ng}} th�nh {{Trang b� An bang C�c ph�m}}, {{Thu�c t�nh ho�n to�n gi�ng tr��c ��y}}. {{Chi ph� l�"..NUM_PAY_PERFECTITEM_REVERT.."  v�n l��ng}}, c� ��ng � kh�ng?",
				   "T�t qu�, h�y gi�p ta ch� t�o th�nh trang b� Ho�n m�/top_revert_give",
	               "�� ta suy ngh� k� l�i xem/OnExit"});	
end;


function top_revert_give()
	if GetCash()<NUM_PAY_PERFECTITEM_REVERT*10000 then
		CreateTaskSay({"<dec><npc><sex> c� mang theo ��  {{"..NUM_PAY_PERFECTITEM_REVERT.."  v�n l��ng}} tr�n ng��i ch�?", "K�t th�c ��i tho�i/OnExit"});
	else
		GiveItemUI("Giao Trang b� An bang Ho�n m� [C�c ph�m]", "Xn h�y ��t v�o Trang b� An bang Ho�n m� [C�c ph�m]", "top_revert_main", "OnExit", 1);
	end;		
	
end;


function top_revert_main(nCount)
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>Ta ch� c�n {{1 m�n Trang b� An bang Ho�n m� [C�c ph�m]}} l� �� r�i, h�y ki�m tra l�i!",
					   "K�t th�c ��i tho�i/OnExit"});
		return
	end;
	
	local nIndex = GetGiveItemUnit(nCount);
	local nQuality = GetGlodEqIndex(nIndex);
	local nAryIndex = 0;
	local nCheck = 0;
	
	CDebug:MessageOut("M� Trang b� An bang ho�n m� c�c ph�m l�:"..nQuality);
	
	for i=1, getn(aryTopItem) do
		if aryTopItem[i][1]==nQuality then
			nAryIndex = i;
			nCheck = 1;
			break;
		end;
	end;
	
	if nCheck==0 then
		CreateTaskSay({"<dec><npc>V� <sex> n�y, v�t ph�m ��t v�o kh�ng ph�i l� {{Trang b� An bang Ho�n m� [C�c ph�m]}}, h�y ki�m tra l�i!",
					   "K�t th�c ��i tho�i/OnExit"});		
		return
	end;
	
	Pay(NUM_PAY_PERFECTITEM_REVERT * 10000);
	
	local nItemBindState = GetItemBindState(nIndex)	-- ��ȡ��״̬
	local nResult = RemoveItemByIndex(nIndex);
	
	if nResult~=1 then return end;
	
	-- AddGoldItem(0, aryTopItem[nAryIndex][2]);
	local nServerItemIndex = NewItemEx(4, 0, 1, 0, aryTopItem[nAryIndex][2] - 1, 0, 0, 0, 0, 0);	
	
	if nItemBindState~=0 then
		SetItemBindState(nServerItemIndex, nItemBindState)
	end;
	
	AddItemByIndex(nServerItemIndex);
		
	Msg2Player("B�n �� giao cho Th� r�n <color=yellow>"..NUM_PAY_PERFECTITEM_REVERT.." v�n ti�n c�ng<color>!");
	Msg2Player("Kh�ng ph�c nguy�n tr�ng th�nh c�ng: <color=yellow>"..aryTopItem[nAryIndex][4].."<color>!");
	
	WriteTaskLog("Kh�ng ph�c nguy�n tr�ng th�nh c�ng:"..aryTopItem[nAryIndex][4]);		
end;


function OnExit()
	
end;