-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - ���ת��ͷ�ļ�
-- �ļ�������task_head.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-02-04 16:21:20

-- ======================================================
--print(10e6)
IncludeLib("FILESYS")

TB_LEVEL_REMAIN_PROP = {
		--[�ȼ�level] = { {magicpoint, prop, resist}<,{}>};
			}

NTRANSLIFE_MAX = 8  -- ת����������			

function Load_TransLifeSetting()
	local b1 = TabFile_Load("\\settings\\task\\metempsychosis\\translife.txt", "TransLifeSetting")
	if b1~=1 then
		print("Load TransLifeSetting Failed!")
		return
	end
	local nRowCount = TabFile_GetRowCount("TransLifeSetting", "LEVEL")
	
	for y = 2, nRowCount do
		local n_level = tonumber(TabFile_GetCell("TransLifeSetting", y, "LEVEL"));
		
		local tb = {};
		
		for z = 1, NTRANSLIFE_MAX do
			
			local n_magicpoint = tonumber(TabFile_GetCell("TransLifeSetting", y, "MAGICPOINT"..z));
			local n_prop = tonumber(TabFile_GetCell("TransLifeSetting", y, "PROP"..z));
			local n_resist = tonumber(TabFile_GetCell("TransLifeSetting", y, "RESIST"..z));
			local n_addskilll = tonumber(TabFile_GetCell("TransLifeSetting", y, "SKILLLIMIT"..z));
			
			if (n_magicpoint) then
				tb[z] = {n_magicpoint, n_prop, n_resist, n_addskilll};
			end
			
		end
		
		if (n_level ~= nil) then
			TB_LEVEL_REMAIN_PROP[n_level] = tb;
		end
	end	
end

Load_TransLifeSetting()

TB_LEVEL_LIMIT = {160, 170, 180, 200, 200, 200, 200, 200};
TB_TRANSTIME_LIMIT = {0, 0, 0, 0, 0, 0, 0, 0}; --translife time delta limit
-- 4ת��Ҫ����������
TBITEMNEED_4 = {
	[1] = {szName = "T�ch L�ch ��n", tbProb = {6,1,2973}, nCount = 999},	-- ������
	[2] = {szName = "<B�c ��u Tr��ng Sinh Thu�t���i Th�a T�m Ph�p>", tbProb = {6,1,2974}, nCount = 1},  -- ����������������ķ�
	}

-- �����������������ֵ
TB_BASE_STRG = {35,20,25,30,20};
TB_BASE_DEX = {25,35,25,20,15};
TB_BASE_VIT = {25,20,25,30,25};
TB_BASE_ENG = {15,25,25,20,40};

ZHUANSHENG_DESC		= "METEMPSYCHOSIS";
ZHUANSHENG_TUITION	= 100000000;	-- ת������JXB
ZHUANSHENG_XIANDAN_MINEXP	= 2*10e8;	-- �����ɵ�����Ҫ20��
ZHUANSHENG_XIANDAN_BASEEXP		= 10e6;	-- �����ɵ���λ�� 1000w
ZHUANSHENG_ITEM_BEGIN	= 20090420---20090420;		-- �����ɵ���ʼʱ�� 0��
ZHUANSHENG_ITEM_ENDLE	= 20090503;		-- �����ɵ�����ʱ�� 24��
ZHUANSHENG_ITEM_EXTIME	= 20090601;		-- �ɵ���Чʹ��ʱ��

LG_SHITULEAGUE = 1;				-- ʦͽս��
LG_WLLSLEAGUE = 5;				-- ��������ս��

TSK_ZHUANSHENG_FLAG = 2547;
TSK_ZHUANSHENG_1 = 2548;	-- ת�� ������������Ե�����������ӵ��ֽڿ�ʼ���α���𡢱���������������
TSK_ZHUANSHENG_2 = 2549;			-- ת�� ������������Ե��������������ֽڱ�����������ԣ������ֽ�δʹ��
TSK_ZHUANSHENG_XIANDAN	= 2581;		-- ���������ɵ�
TSK_ZHUANSHENG_AWARD	= 2582;		-- byte1:3תǰ10����ȡ����;1:δ��,255:����ȡ


TSK_KILLER_ID = 1082;
TSK_MESSENGER_FENG = 1201;
TSK_MESSENGER_SHAN = 1202;
TSK_MESSENGER_QIAN = 1203;
TSK_TASKLINK_STATE = 1028;
TSK_TASKLINK_CancelTaskLevel = 2571;
TSK_TASKLINK_CancelTaskExp1 = 2570;
TSK_TASKLINK_CancelTaskExp2 = 2575;

TSK_ZHUANSHENG_GRE = {2577, 2578, 2579, 4107}	-- ÿ��ת����ѡ�ȼ��Ϳ���
TSK_ZHUANSHENG_LASTTIME = 2580;			-- ��������ת����ServerTime ����ǣ����1700-0-0��Ŀǰ��������
TSKM_ZHUANSHENG_RESISTID = 199;			-- ��ʱ���ѡ�����ӵĿ���
--���Ա�ţ�0����1������2:����3:�磬4:����
TB_BASE_RESIST = {
	[0] = "Ph�ng l�a",
	[1] = "Ph�ng b�ng",
	[2] = "Ph�ng ��c",
	[3] = "Ph�ng s�m",
	[4] = "Ph�ng Th� V�t L�",
	}

TSK_TRANSLIFE_4 = 2908		-- �����Ƿ������4ת����	
TSK_LEAVE_SKILL_POINT_4 = 2909		-- ����ʣ���4ת���ܵ�ʣ�༼�ܵ�	
TSK_USED_SKILL_POINT_4 = 2899		-- �����Ѿ�ʹ���˶��ټ��ܵ�
TSK_LAST_UP_LEVEL_4 = 2910		-- �������һ�θ���4ת���ܵ�ʣ�༼�ܵ�ĵȼ� 
ZHUANSHENG_TUITION_4	= 100000000;	-- ��4��ת������JXB
CLEAR_SKILL_4_PRICE = 10000000	-- 4ת���ܵ�ϴ��ļ۸�
--TB_SKILL_4 = {{1123,0},{1124,0},{1125,0},{1126,0},{1127,0},{1128,0},{1129,0},{1130,0}}		-- ����4ת���ܵ����id
--TB_SKILL_6 = {{}}
TB_SKILL_4 = {{1123, 10, "V� Uy Thu�t"},{1124, 10, "Nh��c Th�y Thu�t"},{1125, 10, "Tr�n Nh�c Thu�t"},{1126, 10, "Y�n Ba Thu�t"},{1127, 0, "Tr��ng Sinh Thu�t"},{1128, 20, "B�t H�i Thu�t"},{1129, 20, "Th�n Tu� Thu�t"},{1130, 20, "Truy �nh Thu�t"}}
TB_SKILL_6 = {{1336, 10, "V� Uy Thu�t (tr�ng sinh 6)"},{1337, 10, "Nh��c Th�y Thu�t (tr�ng sinh 6)"},{1338, 10, "Tr�n S�n Thu�t (tr�ng sinh 6)"},{1339, 10, "Y�n Ba Thu�t (tr�ng sinh 6)"},{1340, 0, "Tr��ng Sinh Thu�t (tr�ng sinh 6)"},{1341, 20, "B� H�i Thu�t (tr�ng sinh 6)"},{1342, 20, "Th�n Tu� Thu�t(tr�ng sinh 6)"},{1343, 20, "Truy C�nh Thu�t (tr�ng sinh 6)"}}

NSTARTLEVEL_4 = 105		-- 4ת���ܴ�105����ʼ��ü��ܵ�
NPERPOINTNEEDLEVEL = 5  -- ÿ5�����һ�����ܵ�

BEIDOU_TRANSFER_MAX = 5

-- 5ת
TSK_TRANSLIFE_5 = 4017		   -- �����Ƿ������5ת����
N_TRANSLIFE_TREE_MIN = 40   -- 5ת����Ҫ��

-- 5ת��Ҫ����������
TBITEMNEED_5 = {
	--[1] = {szName = "�޼��ɵ�", tbProb = {6,1,3277}, nCount = 400},	
	--[2] = {szName = "�����ɵ�", tbProb = {6,1,3278}, nCount = 50},	
	[1] = {szName = "Chuy# sinh thu#(c# 5)", tbProb = {6,1,30246}, nCount = 2},
	}
	
TB_TRANSLIFE_ERRORMSG = {
	[1] = "<dec><npc>Tu luy�n B�c ��u Tr��ng Sinh Thu�t c�n ph�i c�i b� t�t c�  trang b� tr�n ng��i!",
	[2] = "<dec><npc>H�nh nh� ti�n v�n ch�a �� <color=red>100000000<color>.",
	[3] = "<dec><npc>Tu luy�n B�c ��u Tr��ng Sinh Thu�t c�n ph�i b� quan h� S� ��",
	[4] = "<dec><npc>V� thi�u hi�p n�y v�n ch�a h�c <B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n>, v�t n�y � K� Tr�n C�c c� b�n.",
	[5] = "<dec><npc>V� ��i hi�p n�y, c�p �� c�a ng��i v�n ch�a ��, ng��i h�y �i r�n luy�n th�m �i.",
	[6] = "<dec><npc>C�n h�y b� quan h� chi�n h�u V� L�m Li�n ��u m�i c� th� ti�n h�nh tr�ng sinh.",
	[7] = "<dec><npc> Hi�n t�i s� l�n Tr�ng sinh �� ��n gi�i h�n",
	[8] = "<dec><npc>Nhi�m v� s�t th� v�n ch�a ho�n th�nh! H�y ho�n t�t nhi�m v� r�i quay l�i nh�.",
	[9] = "<dec><npc>Nhi�m v� t�n s� v�n ch�a ho�n th�nh! H�y ho�n t�t nhi�m v� r�i quay l�i nh�.",
	[10]= "<dec><npc>Nhi�m v� d� t�u v�n ch�a ho�n th�nh! H�y ho�n t�t nhi�m v� r�i quay l�i nh�.",
	[11]= "<dec><npc>D� t�u thu ���c c� h�i h�y b� nhi�m v�! H�y ho�n t�t nhi�m v� n�y r�i quay l�i nh�.",
	[12]= "<dec><npc>Kho�ng c�ch 2 l�n tr�ng sinh ph�i l� %d ng�y.",
	[13]= "<dec><npc>Chuy�n sinh 4 c�n c� <color=red> 200 v�n <color> l��ng, xin h�y chu�n b� �� r�i ��n ��y.",
	[14]= "<dec><npc>Chuy�n sinh 4 c�n c� <color=red> 999 <color> c�i T�ch L�ch ��n, xin h�y chu�n b� �� r�i ��n ��y.",
	[15]= "<dec><npc>Chuy�n sinh 4 c�n c� <color=red> �B�c ��u Tr��ng Sinh Thu�t���i Th�a T�m Ph�p�<color>, xin h�y chu�n b� �� r�i ��n ��y.",
	[16]= format("<dec><npc>Tr�ng sinh 5 c�n c�<color=red>%d<color> c�i %s, Xin h�y chu�n b� �� r�i ��n ��y.", TBITEMNEED_5[1].nCount, TBITEMNEED_5[1].szName),
--	[17]= format("<dec><npc>5��ת����Ҫ<color=red>%d<color>��%s����׼�����������ɡ�", TBITEMNEED_5[2].nCount, TBITEMNEED_5[2].szName),
--	[18]= format("<dec><npc>5��ת����Ҫ<color=red>%s<color>����׼�����������ɡ�", TBITEMNEED_5[3].szName),
	[17]= "",
	[18]= "",
	[19]= format("<dec><npc>Tr�ng sinh 5 c�n ph�i tr�ng<color=red>%d<color>C�y Tr�ng Sinh, h�y chu�n b� �� r�i ��n ��y.", N_TRANSLIFE_TREE_MIN), 
	[20] = "<dec><npc>V� ��i hi�p n�y, �i�m kinh nghi�m hi�n t�i c�a ng��i �� �m, ng��i h�y x� l� ho�n t�t h�t �i�m �i�m �m r�i ��n ��y.",
}