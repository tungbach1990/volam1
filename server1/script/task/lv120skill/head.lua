Include("\\script\\global\\login_head.lua")
-- 120����������ͷ�ļ�

LV120_SKILL_STATE = 2450	-- ��ŵ�ǰ����״̬��ȫ�������������ʼֵΪ1��Ϊ0��ʾ�����Ѿ����
LV120_SKILL_ID = 2463		-- ��¼���120������ID
LOCK_MAP_SEQUENCE =		-- ��Ž���ͼ˳���ȫ���������
{
	{2451, 2452, 2453, 2454, 2455, 2456},	-- ��һ��������ͼ˳��
	{2457, 2458, 2459, 2460, 2461, 2462},	-- �ڶ���������ͼ˳��
}

DGJ_WULINMIJI	= {6, 1, 1120}	-- ��̫Ѱ���������ؼ�
COFFIN_MAP		= {6, 1, 1119}	-- �꾩�����·����ͼ
COFFIN			= {6, 1, 1121}	-- ���ع�ľ
LOCK_MAP1		= {6, 1, 1122}	-- ��ľ����ͼ ��һ����
LOCK_MAP2		= {6, 1, 1123}	-- ��ľ����ͼ �ڶ�����
CADAVER			= {6, 1, 1124}	-- ������ʬ
LV120SKILLBOOK	= {6, 1, 1125}	-- 120�����ܾ�Ҫ

COFFIN_POSITION = {37, 1832, 3439, 6, 6}	-- �ײ�����λ��{��ͼ, X����, Y����, X���, Y���}

LV120SKILL_NEW_NPC =	-- �½�NPC�б�
{	-- ��ʽ {NpcId, MapId, X, Y, Name, Script},
	{1203, 57, 1583, 3203, " ", "\\script\\task\\lv120skill\\npc\\��ɽ����_���½��������ؼ�.lua"},
}

ORG_WULIMIJI	= {6, 1, 26}		-- ��ͨ�������ؼ�
BANRUOXINJING	= {6, 1, 12}		-- �����ľ�
XISUIJING		= {6, 1, 22}		-- ϴ�辭
XINGHONGBAOSHI	= {4, 353, 1}		-- �ɺ챦ʯ
CRYSTAL =
{
	{4, 238, 1},		-- ��ˮ��
	{4, 239, 1},		-- ��ˮ��
	{4, 240, 1},		-- ��ˮ��
}
BLUE_C = 1
PURPLE_C = 2
GREEN_C = 3

LOCK_MAP1_KEY =			-- ��һ������
{
	{1,  CRYSTAL[GREEN_C]},
	{3,  CRYSTAL[PURPLE_C]},
	{11, CRYSTAL[BLUE_C]},
	{14, CRYSTAL[BLUE_C]},
	{22, CRYSTAL[PURPLE_C]},
	{24, CRYSTAL[GREEN_C]},
}

LOCK_MAP2_KEY =			-- �ڶ�������
{
	{2,  CRYSTAL[GREEN_C]},
	{6,  CRYSTAL[PURPLE_C]},
	{10, CRYSTAL[BLUE_C]},
	{15, CRYSTAL[BLUE_C]},
	{19, CRYSTAL[GREEN_C]},
	{23, CRYSTAL[PURPLE_C]},
}

FACTION_TEXT = 			-- ��������ı�����
{
	[0] = {"<link=image[0,14]:\\spr\\npcres\\enemy\\enemy037\\enemy037_pst.spr>", "Huy�n nh�n ph��ng tr��ng", "Ph��ng tr��ng"},	-- ����
	[1] = {"<link=image[0,11]:\\spr\\npcres\\enemy\\enemy084\\enemy084_pst.spr>", "D��ng Anh", "Bang ch� "},		-- ����
	[2] = {"<link=image[0,13]:\\spr\\npcres\\enemy\\enemy077\\enemy077_pst.spr>", "���ng C�u", "Ch��ng m�n"},		-- ����
	[3] = {"<link=image[0,12]:\\spr\\npcres\\enemy\\enemy091\\enemy091_pst.spr>", "H�c Di�n Lang Qu�n", "Gi�o ch�"},	-- �嶾
	[4] = {"<link=image[0,11]:\\spr\\npcres\\enemy\\enemy055\\enemy055_pst.spr>", "Thanh Hi�u S� Th�i ", "Ch��ng m�n"},	-- ����
	[5] = {"<link=image[0,9]:\\spr\\npcres\\enemy\\enemy098\\enemy098_pst.spr>", "Do�n H�m Y�n", "Ch��ng m�n"},		-- ����
	[6] = {"<link=image[0,19]:\\spr\\npcres\\enemy\\enemy071\\enemy071_pst.spr>", "H� Nh�n Ng� ", "Bang ch� "},	-- ؤ��
	[7] = {"<link=image[0,9]:\\spr\\npcres\\enemy\\enemy103\\enemy103_pst.spr>", "Ho�n Nhan Ho�nh Li�t", "Gi�o ch�"},	-- ����
	[8] = {"<link=image[0,13]:\\spr\\npcres\\enemy\\enemy046\\enemy046_pst.spr>", "��o Nh�t Ch�n Nh�n", "Ch��ng m�n"},	-- �䵱
	[9] = {"<link=image[0,22]:\\spr\\npcres\\enemy\\enemy065\\enemy065_pst.spr>", "Tuy�n C� T� ", "Ch��ng m�n"},	-- ����
}

FACTION_BOOK =			-- ���ɼ�����
{
	[0] = {{6, 1, 56}, {6, 1, 57}, {6, 1, 58}},				-- ����
	[1] = {{6, 1, 37}, {6, 1, 38}, {6, 1, 39}},				-- ����
	[2] = {{6, 1, 27}, {6, 1, 28}, {6, 1, 45}, {6, 1, 46}},	-- ����
	[3] = {{6, 1, 47}, {6, 1, 48}, {6, 1, 49}},				-- �嶾
	[4] = {{6, 1, 42}, {6, 1, 43}, {6, 1, 59}},				-- ����
	[5] = {{6, 1, 40}, {6, 1, 41}},							-- ����
	[6] = {{6, 1, 54}, {6, 1, 55}},							-- ؤ��
	[7] = {{6, 1, 35}, {6, 1, 36}, {6, 1, 53}},				-- ����
	[8] = {{6, 1, 33}, {6, 1, 34}},							-- �䵱
	[9] = {{6, 1, 50}, {6, 1, 51}, {6, 1, 52}},				-- ����
}

DIALOG_UI_TEXT =			-- �Ի�UI��ʾ
{
	{"<link=image[0,10]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr>", "��c C� Ki�m"},			-- 1 ���½�
	{"<link=image[0,9]:\\spr\\npcres\\passerby\\passerby040\\passerby040s2.spr>", "Xa phu Bi�n Kinh"},	-- 2 �꾩����
	{"<link=image[0,9]:\\spr\\npcres\\passerby\\passerby072\\passerby072s1.spr>", "Gi?Th�n To�n"},	-- 3 ������
	{"<link=image:\\spr\\Ui3\\120����������\\task_wulin.spr>", "V� L�m M�t T�ch"},						-- 4 ��Ѱ���������ؼ�
	{"<link=image:\\spr\\Ui3\\120����������\\bianjing_southeast.spr>", "B�n �� n�i ph�t sinh s� vi�c xa phu Bi�n Kinh"},	-- 5 �꾩�����·����ͼ
	{"<link=image:\\spr\\Ui3\\120����������\\task_coffin.spr>", "Quan t�i th�n b�"},					-- 6 ���ع�ľ
	{"<link=image:\\spr\\Ui3\\120����������\\task_lockinfo.spr>", "B�n �� gi�i t�a quan t�i"},				-- 7 ��ľ����ͼ
	{"<link=image:\\spr\\Ui3\\120����������\\task_corpse.spr>", "C��ng Thi"},					-- 8 ������ʬ���˹�ǰ��
	{"<link=image:\\spr\\Ui3\\120����������\\task_corpse1.spr>", "C��ng Thi"},					-- 9 ������ʬ���˹���
	{"<link=image:\\spr\\Ui3\\120����������\\task_stunt.spr>", "K� n�ng c�p 120"},				-- 10 120�����ܾ�Ҫ
	{"<link=image:\\spr\\Ui3\\120����������\\������1-01.spr>", "M�nh 1 b�n �� gi�i t�a quan t�i"},			-- 11-16 ��ľ����ͼһ ��Ƭ
	{"<link=image:\\spr\\Ui3\\120����������\\������1-02.spr>", "M�nh 1 b�n �� gi�i t�a quan t�i"},
	{"<link=image:\\spr\\Ui3\\120����������\\������1-03.spr>", "M�nh 1 b�n �� gi�i t�a quan t�i"},
	{"<link=image:\\spr\\Ui3\\120����������\\������1-04.spr>", "M�nh 1 b�n �� gi�i t�a quan t�i"},
	{"<link=image:\\spr\\Ui3\\120����������\\������1-05.spr>", "M�nh 1 b�n �� gi�i t�a quan t�i"},
	{"<link=image:\\spr\\Ui3\\120����������\\������1-06.spr>", "M�nh 1 b�n �� gi�i t�a quan t�i"},
	{"<link=image:\\spr\\Ui3\\120����������\\������2-01.spr>", "M�nh 2 b�n �� gi�i t�a quan t�i"},			-- 17-22 ��ľ����ͼ�� ��Ƭ
	{"<link=image:\\spr\\Ui3\\120����������\\������2-02.spr>", "M�nh 2 b�n �� gi�i t�a quan t�i"},
	{"<link=image:\\spr\\Ui3\\120����������\\������2-03.spr>", "M�nh 2 b�n �� gi�i t�a quan t�i"},
	{"<link=image:\\spr\\Ui3\\120����������\\������2-04.spr>", "M�nh 2 b�n �� gi�i t�a quan t�i"},
	{"<link=image:\\spr\\Ui3\\120����������\\������2-05.spr>", "M�nh 2 b�n �� gi�i t�a quan t�i"},
	{"<link=image:\\spr\\Ui3\\120����������\\������2-06.spr>", "M�nh 2 b�n �� gi�i t�a quan t�i"},
}

LV120SKILL_LIST =			-- 120�������б�
{
	[0] = {709, 1, 0, 120, "K� n�ng c�p 120", "��i Th�a Nh� Lai Ch�"},	-- ����
	[1] = {708, 1, 1, 120, "K� n�ng c�p 120",	"��o H� Thi�n"},		-- ����
	[2] = {710, 1, 2, 120, "K� n�ng c�p 120",	"M� �nh Tung"},		-- ����
	[3] = {711, 1, 3, 120, "K� n�ng c�p 120",	"H�p Tinh Y�m"},		-- �嶾
	[4] = {712, 1, 4, 120, "K� n�ng c�p 120",	"B� Nguy�t Ph�t Tr�n"},	-- ����
	[5] = {713, 1, 5, 120, "K� n�ng c�p 120",	"Ng� Tuy�t �n"},		-- ����
	[6] = {714, 1, 6, 120, "K� n�ng c�p 120",	"H�n Thi�n Kh� C�ng"},	-- ؤ��
	[7] = {715, 1, 7, 120, "K� n�ng c�p 120",	"Ma �m Ph� Ph�ch"},	-- ����
	[8] = {716, 1, 8, 120, "K� n�ng c�p 120",	"Xu�t � B�t Nhi�m"},	-- �䵱
	[9] = {717, 1, 9, 120, "K� n�ng c�p 120",	"L��ng Nghi Ch�n Kh�"},	-- ����
}

g_DescTable = {}		-- ȫ����ʱ�Ի��ַ�������

function init_lv120skill()					-- ��ʼ������
	if (GetTask(LV120_SKILL_STATE) == 0) then
		SetTask(LV120_SKILL_STATE, 1)
	end
	SyncTaskValue(LV120_SKILL_STATE)
	SyncTaskValue(LV120_SKILL_ID);
	lv120skill_debug()	-- �Զ������쳣
end

function describe_talk(tDialog, szCall)		-- �Ի�����
	local i = 0
	if (getn(tDialog) == 0) then return end
	repeat
		i = i + 1
	until (g_DescTable[i] == nil)
	g_DescTable[i] = tDialog
	if (szCall == nil) then szCall = "" end
	describe_basic(1, i, szCall)	
end

function describe_basic(nSeq, idxTable, szCallback)		-- �Ի��ݹ麯�����ڲ���
	local tDialog = g_DescTable[idxTable]
	if (nSeq == getn(tDialog)) then
		if (szCallback == "") then
			Describe(tDialog[nSeq], 1, "K�t th�c ��i tho�i/quit")
		else
			Describe(tDialog[nSeq], 1, "Ti�p t�c ��i tho�i /"..szCallback)
		end
		g_DescTable[idxTable] = nil
		return
	end
	Describe(tDialog[nSeq], 1, "Ti�p t�c ��i tho�i /#describe_basic("..(nSeq + 1)..", "..idxTable..", [["..szCallback.."]])")
end

function npc_string(nNpc, szDisplay, bFaction)			-- ���NPC�����˵�����ַ���
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1]..tab[2].."<link>:"..szDisplay
end

function speak_string(nNpc, szDisplay, bFaction)		-- �����Ҷ�NPC��˵�����ַ���
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1]..GetName().."<link>:"..szDisplay
end

function self_string(nNpc, szDisplay, bFaction)			-- �������԰��ַ���
	if (nNpc == 0) then		-- 0��ʾ��ͼʾ
		return "<color=orange>"..szDisplay.."<color>"
	end
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1].."<link><color=orange>"..szDisplay.."<color>"
end

function add_lv120skillnpc()			-- �������NPC
	for i = 1, getn(LV120SKILL_NEW_NPC) do
		local Tab = LV120SKILL_NEW_NPC[i]
		local idxMap = SubWorldID2Idx(Tab[2]);
		if (idxMap >= 0) then
			local idxNpc = AddNpc(Tab[1], 1, idxMap, Tab[3] * 32, Tab[4] * 32, 1, Tab[5])
			SetNpcScript(idxNpc, Tab[6])
		end
	end
end

function generate_sequence(tab)			-- �����������

	local nCount = getn(tab)
	local temp, nSeq, bAct = {}, 0, 0

	for i = 1, nCount do
		tinsert(temp, i)
		if (GetTask(tab[i]) < 1) or (GetTask(tab[i]) > getn(tab)) then bAct = 1 end	-- ����в��Ϸ�������ȫ���ؽ�
	end

	if (bAct == 1) then
		for i = 1, nCount do
			nSeq = random(1, getn(temp))
			SetTask(tab[i], temp[nSeq])
			SyncTaskValue(tab[i])
			tremove(temp, nSeq)
		end
	end

end

function add_item(tab)							-- ��ӵ���
	return AddItem(tab[1], tab[2], tab[3], 1, 0, 0)
end

function display_clip(nLockMap, nSeq, szCall)	-- ��ʾһ����Ƭ
	local nIndex = 10 + 6 * (nLockMap - 1) + GetTask(LOCK_MAP_SEQUENCE[nLockMap][nSeq])
	Describe(DIALOG_UI_TEXT[nIndex][1]..DIALOG_UI_TEXT[nIndex][2].."<link>", 2, "Tr� l�i/"..szCall, "��ng/quit")
end

function lv120skill_report()					-- �����ű������
	local tDialog
	local nFaction = GetLastFactionNumber()
	local szCall = FACTION_TEXT[nFaction][3]
	if (nFaction == 0) or (nFaction == 8) or (nFaction == 6) or (nFaction == 4) then	-- ����
		tDialog =
		{
			npc_string(nFaction, "�i ch�, th� ra ng��i c�ng �� bi�t ���c c�n c� c�u chuy�n r�i! G�n ��y giang h� ��t nhi�n bi�n ��i, trong T�ng qu�c t� ��u ��n cu�i ��u bao tr�m m�t ��m m�y u �m, ta c�ng �� nghi s�m �i�u n�y, nh�ng v� th�n l�"..szCall.."  kh�ng ti�n t� ch�c �i�u tra vi�c n�y. Sau �� m�t s� v� �n s� giang h� c�a b�n m�n l�n l��t t�i xu�t giang h�, ng�m ng�m �i�u tra s� vi�c n�y. B�n h� ph�t hi�n manh m�i c�ng ng�y c�ng l� r� h�n, c�c manh m�i n�y ��u ng�m ng�m �m ch� ch� m�u l�: Thi�n Nh�n Gi�o!", 1),
			speak_string(nFaction, "Xem ra ch�n t��ng �� l� r� ho�n to�n, ��ch th� ��y l� Thi�n Nh�n ch� m�u! Ch� c� �i�u c�c lo�i ��ng v�t ph�t �i�n v� c�c v�t ��nh tr�n x�c ch�t ch�a xu�t hi�n tr�n giang h� l�n n�o, ngo�i ra xu�t hi�n r�t nhi�u con d�i d� th��ng, ph�i ch�ng ��y l� lo�i t� thu�t m�i c�a Thi�n Nh�n?", 1),
			npc_string(nFaction, "�� b�o v� ��i T�ng v� b�o v� ch�nh ngh�a ta �� chu�n b� ��i s�ch cho vi�c n�y. Ta v� m�t s� cao th� b� quan s�ng ch� ra m�t chi�u th�c tuy�t h�c th��ng th�a. Ng��i th�n th� 1 m�nh m� t�m ra ���c m�t ��u m�i r�t quan tr�ng, th�t ��ng khen th��ng. Nay ta quy�t ��nh truy�n ng��i m�n v� c�ng th��ng th�a n�y, hi v�ng sau n�y ng��i l�y nhi�m v� c�a thi�n h� s� l� nhi�m v� c�a m�nh.", 1),
			speak_string(nFaction, "�a t� "..szCall.."Tu�n theo"..szCall.."gi�o hu�n.", 1),
			npc_string(nFaction, "Do th�i gian g�p g�p, n�n c�ng l�c c�a m�n v� c�ng n�y ch� truy�n cho ng��i m�t ph�n, sau n�y d�a v�o c�n c� si�ng n�ng c�a ng��i m� ph�t tri�n m�n v� c�ng n�y l�n.  Chi�u v� c�ng n�y ch� truy�n cho ng��i, nh�ng �� t� v� c�c m�n ph�i kh�c v�n c�n ch�a ���c bi�t ��u. �� tr�nh tai v�ch m�ch d�ng,  ta �� vi�t t�t c� nh�ng kh�u quy�t c�n thi�t r�i, ng��i t� nghi�n c�u nh�. D�a v�o t� ch�t hi�n t�i c�a ng��i s� r�t d� d�ng l�nh ng�. � ��ng r�i,   ng��i �i chu�n b� <color=white> t�t c� k� n�ng c�a b�n m�n th�nh 1 quy�n<color>.", 1),
			speak_string(nFaction, "Nghe"..szCall.." d�n d�, �� t� li�n t�c t�c ��n ��y ph�c m�nh.", 1),
		}
	elseif (nFaction == 2) or (nFaction == 1) or (nFaction == 5) then					-- ����
		tDialog =
		{
			npc_string(nFaction, "�i ch�, th� ra ng��i c�ng �� bi�t ���c c�n c� c�u chuy�n r�i! G�n ��y giang h� ��t nhi�n bi�n ��i m�t c�ch b�t th��ng, s� sinh t�n c�a b�n m�n bao tr�m m�t ��m m�y u �m, v�n �� n�y ta c�ng �� li�u tr��c, nh�ng v� th�n l�"..szCall.."  kh�ng ti�n t� ch�c �i�u tra vi�c n�y. Sau �� m�t s� v� �n s� giang h� c�a b�n m�n l�n l��t t�i xu�t giang h�, ng�m ng�m �i�u tra s� vi�c n�y. B�n h� ph�t hi�n manh m�i c�ng ng�y c�ng l� r� h�n, c�c manh m�i n�y ��u ng�m ng�m �m ch� ch� m�u l�: Thi�n Nh�n Gi�o!", 1),
			speak_string(nFaction, "Xem ra ch�n t��ng �� l� r� ho�n to�n, ��ch th� ��y l� Thi�n Nh�n ch� m�u! Ch� c� �i�u c�c lo�i ��ng v�t ph�t �i�n v� c�c v�t ��nh tr�n x�c ch�t ch�a xu�t hi�n tr�n giang h� l�n n�o, ngo�i ra xu�t hi�n r�t nhi�u con d�i d� th��ng, ph�i ch�ng ��y l� lo�i t� thu�t m�i c�a Thi�n Nh�n?", 1),
			npc_string(nFaction, "�� tr�nh Thi�n Nh�n g�y b�t l�i cho ta, ta �� ti�n h�nh t�ch c�c �m th�m �i�u tra. Ta v� m�t s� cao th� b� quan s�ng ch� ra m�t chi�u th�c tuy�t h�c th��ng th�a. Ng��i th�n th� 1 m�nh m� t�m ra ���c m�t ��u m�i r�t quan tr�ng, th�t ��ng khen th��ng. Nay ta quy�t ��nh truy�n ng��i m�n v� c�ng th��ng th�a n�y, hi v�ng sau n�y ng��i gi�p b�n m�n vinh danh thi�n h�.", 1),
			speak_string(nFaction, "�a t� "..szCall.."Tu�n theo"..szCall.."gi�o hu�n.", 1),
			npc_string(nFaction, "Do th�i gian g�p g�p, n�n c�ng l�c c�a m�n v� c�ng n�y ch� truy�n cho ng��i m�t ph�n, sau n�y d�a v�o c�n c� si�ng n�ng c�a ng��i m� ph�t tri�n m�n v� c�ng n�y l�n.  Chi�u v� c�ng n�y ch� truy�n cho ng��i, nh�ng �� t� v� c�c m�n ph�i kh�c v�n c�n ch�a ���c bi�t ��u. �� tr�nh tai v�ch m�ch d�ng,  ta �� vi�t t�t c� nh�ng kh�u quy�t c�n thi�t r�i, ng��i t� nghi�n c�u nh�. D�a v�o t� ch�t hi�n t�i c�a ng��i s� r�t d� d�ng l�nh ng�. � ��ng r�i,   ng��i �i chu�n b� <color=white> t�t c� k� n�ng c�a b�n m�n th�nh 1 quy�n<color>.", 1),
			speak_string(nFaction, "Nghe"..szCall.." d�n d�, �� t� li�n t�c t�c ��n ��y ph�c m�nh.", 1),
		}
	elseif (nFaction == 3) or (nFaction == 9) then										-- а��
		tDialog =
		{
			npc_string(nFaction, "�i ch�, th� ra ng��i c�ng �� bi�t ���c c�n c� c�u chuy�n r�i! G�n ��y giang h� ��t nhi�n bi�n ��i m�t c�ch b�t th��ng, c� h�i �� b�n m�n vang danh l�c th�i lo�n n�y,  nh�ng v� th�n l�"..szCall.."  kh�ng ti�n t� ch�c �i�u tra vi�c n�y. Sau �� m�t s� v� �n s� giang h� c�a b�n m�n l�n l��t t�i xu�t giang h�, ng�m ng�m �i�u tra s� vi�c n�y. B�n h� ph�t hi�n manh m�i c�ng ng�y c�ng l� r� h�n, c�c manh m�i n�y ��u ng�m ng�m �m ch� ch� m�u l�: Thi�n Nh�n Gi�o!", 1),
			speak_string(nFaction, "Xem ra ch�n t��ng �� l� r� ho�n to�n, ��ch th� ��y l� Thi�n Nh�n ch� m�u! Ch� c� �i�u c�c lo�i ��ng v�t ph�t �i�n v� c�c v�t ��nh tr�n x�c ch�t ch�a xu�t hi�n tr�n giang h� l�n n�o, ngo�i ra xu�t hi�n r�t nhi�u con d�i d� th��ng, ph�i ch�ng ��y l� lo�i t� thu�t m�i c�a Thi�n Nh�n?", 1),
			npc_string(nFaction, "B�n m�n l� n�o l�i l� ng��i ��n sau? V� v�y ta �� ng�m ng�m �i�u tra, ��ng th�i c� d� ��nh : kh�ng �� cho Thi�n Nh�n g�y b�t l�i v�i ta, l�i d�ng th�i th� h�n lo�n n�i danh thi�n h�, v� l�m anh h�ng th�i lo�n, ha ha ha. Ta v� m�t s� cao th� b� quan s�ng ch� ra m�t chi�u th�c tuy�t h�c th��ng th�a. Ng��i ��n th��ng ��c m� m� �i�u tra ���c ng�n ngh�nh nh� v�y, r�t ��ng khen"..szCall.."N�m �� r�t nhi�u anh h�ng gan d� m�i c� th� ��m ���ng, nh�ng ng��i ch� m�t th�n m�t m�nh �i�u tra ���c manh m�i quan tr�ng nh� v�y, th�t ��ng khen th��ng. Ta quy�t ��nh truy�n m�n v� c�ng tuy�t h�c l�i cho ng��i, sau n�y gi�p ta vang danh thi�n h� nh�.", 1),
			speak_string(nFaction, "�a t� "..szCall.."Tu�n theo"..szCall.."gi�o hu�n.", 1),
			npc_string(nFaction, "Do th�i gian g�p g�p, n�n c�ng l�c c�a m�n v� c�ng n�y ch� truy�n cho ng��i m�t ph�n, sau n�y d�a v�o c�n c� si�ng n�ng c�a ng��i m� ph�t tri�n m�n v� c�ng n�y l�n.  Chi�u v� c�ng n�y ch� truy�n cho ng��i, nh�ng �� t� v� c�c m�n ph�i kh�c v�n c�n ch�a ���c bi�t ��u. �� tr�nh tai v�ch m�ch d�ng,  ta �� vi�t t�t c� nh�ng kh�u quy�t c�n thi�t r�i, ng��i t� nghi�n c�u nh�. D�a v�o t� ch�t hi�n t�i c�a ng��i s� r�t d� d�ng l�nh ng�. � ��ng r�i,   ng��i �i chu�n b� <color=white> t�t c� k� n�ng c�a b�n m�n th�nh 1 quy�n<color>.", 1),
			speak_string(nFaction, "Nghe"..szCall.." d�n d�, �� t� li�n t�c t�c ��n ��y ph�c m�nh.", 1),
		}
	elseif (nFaction == 7) then															-- ����
		tDialog =
		{
			npc_string(nFaction, "Th�t kh�ng h� danh �� t� c�a Thi�n Nh�n Gi�o, kh�ng c� c�i g� qua ���c m�t ng��i! Th�i gian g�n ��y giang h� b�ng nhi�n ��i lo�n, th�t kh�ng ngh� t�i  ��y l� nh�ng h�nh vi n�y c�a Thi�n Nh�n Gi�o ta g�y ra, ha ha. Ng��i �� �o�n ���c th� ta c�ng kh�ng gi�u ng��i l�m g�.  G�n ��y Thi�n Nh�n Gi�o �� l�i k�o kh�ng �t v� l�m cao th� �� �n danh, luy�n th�nh 1 thu�t �m t� c�c m�nh.  Nh�ng ��ng v�t ph�t cu�ng v� nh�ng thi th� d� th��ng n�m trong q uan t�i l� th�nh qu� c�a ta, v� c�ng t� r� ��i Kim qu�c c�a ch�ng ta s� ti�n h�nh m�t cu�c chinh ph�t.", 1),
			speak_string(nFaction, "Gi�o ch� anh minh, ta s� v� ��i nghi�p c�a kim qu�c t�n t�m t�n l�c th�ng nh�t thi�n h�.", 1),
			npc_string(nFaction, "L�n ho�t ��ng n�y v� c�ng k�n ��o, tin t�c n�y c�ng kh�ng lan truy�n trong m�n ph�i, c� ng��i v�a m�i h� l� th�ng tin li�n t�c th� ch�t lu�n. Nh�ng x�c ch�t �� l� nh�ng gi�n �i�p ph�i t� T�ng qu�c, v�a v�n �� ta d�ng l�m v�t th� nghi�m. Ta l�m c�n th�n nh� v�y nh�ng c�ng kh�ng ch� ng��i v�ch tr�n s� vi�c, may m� ng��i l� ng��i c�a b�n m�n. Nh�ng m� ng��i h�u d�ng h�u m�u gan d� h�n ng��i c� th� giao ���c nhi�m v� l�n, ha ha. Nay ta truy�n cho ng��i m�n tuy�t h�c n�y, v� ��ng n�n ph� s� t�n nhi�m c�a Kim Qu�c!", 1),
			speak_string(nFaction, "�a t� "..szCall.."Tu�n theo"..szCall.."gi�o hu�n.", 1),
			npc_string(nFaction, "Do th�i gian g�p g�p, n�n c�ng l�c c�a m�n v� c�ng n�y ch� truy�n cho ng��i m�t ph�n, sau n�y d�a v�o c�n c� si�ng n�ng c�a ng��i m� ph�t tri�n m�n v� c�ng n�y l�n.  Chi�u v� c�ng n�y ch� truy�n cho ng��i, nh�ng �� t� v� c�c m�n ph�i kh�c v�n c�n ch�a ���c bi�t ��u. �� tr�nh tai v�ch m�ch d�ng,  ta �� vi�t t�t c� nh�ng kh�u quy�t c�n thi�t r�i, ng��i t� nghi�n c�u nh�. D�a v�o t� ch�t hi�n t�i c�a ng��i s� r�t d� d�ng l�nh ng�. � ��ng r�i,   ng��i �i chu�n b� <color=white> t�t c� k� n�ng c�a b�n m�n th�nh 1 quy�n<color>.", 1),
			speak_string(nFaction, "Nghe"..szCall.." d�n d�, �� t� li�n t�c t�c ��n ��y ph�c m�nh.", 1),
		}
	end
	describe_talk(tDialog)
	SetTask(LV120_SKILL_STATE, 18)
	SyncTaskValue(LV120_SKILL_STATE)
end

function lv120skill_submit()				-- �ύ����ȫ��������UI
	GiveItemUI("Giao to�n b� s�ch k� n�ng c�a b�n m�n", "B� t�t c� s�ch k� n�ng c�a b�n m�n v�o th� thu ���c b� quy�t k� n�ng c�p 120.", "submit_skillbook", "quit")
end

function submit_skillbook(nCount)			-- �ύ����ȫ��������

	local nFaction = GetLastFactionNumber()
	local szCall = FACTION_TEXT[nFaction][3]
	local idxBook, g, d, p = 0, 0, 0, 0
	local book, temp = {}, {}

	if (nCount == 0) then
		lv120skill_submit()
		return
	end

	for i = 1, getn(FACTION_BOOK[nFaction]) do
		tinsert(temp, FACTION_BOOK[nFaction][i])
	end

	for i = 1, nCount do
		idxBook = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxBook)
		for j = 1, getn(temp) do
			if (g == temp[j][1]) and (d == temp[j][2]) and (p == temp[j][3]) then
				tremove(temp, j)
				tinsert(book, idxBook)
				break
			end
		end
	end

	if (getn(temp) == 0) then
		local tDialog =
		{
			npc_string(nFaction, "Th�t kh�ng h� danh nh�n t�i kh� g�p, h�nh s� th�t l� lanh lх..  Ta �� ��a cho ng��i b� quy�t r�i ng��i t� �i nghi�n c�u 1 l�c l� c� th� l�nh ng� 1 trong s� tuy�t chi�u.", 1),
			speak_string(nFaction, "�a t� "..szCall.."C�m �n �� ch� d�y, b�y gi� ta �i tu luy�n ��y.", 1),
			self_string(10, "Sau m�t h�i quanh co, ��i hi�p �� ��t ���c m�t tuy�t k� th��ng th�a trong v� l�m��"),
		}
		describe_talk(tDialog)
		for i = 1, getn(book) do
			if (RemoveItemByIndex(book[i]) ~= 1) then		-- ȡ��������ϵļ�����
				WriteLog("Nhi�m v� k� n�ng c�p 120 - G�i cho b�n m�n ph�i t�t c� s�ch k� n�ng -- X�a b� c�c s�ch k� n�ng d� th��ng.  Player ="..GetName().." Time = "..date("%y.%m.%d"))
				Msg2Player("H� th�ng ph�t sinh l�i, xin m�i li�n h� v�i nh� ph�t h�nh �� gi�i quy�t v�n �� n�y!")
				return
			end
		end
		idxBook = add_item(LV120SKILLBOOK)	-- ���120��������
		Msg2Player("Ng��i thu ���c 1"..GetItemName(idxBook))
		SetTask(LV120_SKILL_STATE, 19)
		SyncTaskValue(LV120_SKILL_STATE)
	else
		Describe("C�n ph�i b� v�o 1 cu�n c� t�t c� k� n�ng, �� cho"..szCall.." �� l�m th�nh s�ch tuy�t k� th��ng th�a c�p 120.", 2, "L�m l�i/lv120skill_submit", "��ng/quit")
	end

end

function calc_item(tab)
	return	CalcItemCount(-1, tab[1], tab[2], tab[3], -1)
end

-- ��������쳣
function lv120skill_debug()
	local state = GetTask(LV120_SKILL_STATE)
	if (state <= 1) or (state >= 19) then return end
	if (state == 5) then debug_item(DGJ_WULINMIJI) return end
	if (state == 9) then debug_item(COFFIN_MAP) return end
	if (state >= 10) and (state <= 15) then debug_item(COFFIN) return end
	if (state == 16) then debug_item(CADAVER) return end
end

function debug_item(Item)
	if (calc_item(Item) < 1) then
		if (CalcFreeItemCellCount() < 1) then
			Msg2Player("Trong nhi�m v� k� n�ng c�p 120 xu�t hi�n l�i, xin m�i d�n d�p l�i h�nh trang, xu�t hi�n m�t � tr�ng ��ng th�i xin m�i ��ng nh�p tr� l�i �� h� th�ng tr� l�i �� �� m�t cho ��i hi�p.")
			return
		end
		local idxItem = add_item(Item)
		Msg2Player("��i hi�p �� thu ���c �� v�a m�i b� m�t"..GetItemName(idxItem)..", b�y gi� c� th� ti�p t�c nhi�m v� k� n�ng 120.")
	end
end

function quit()
end


-- 120��������һ�
function lvl120skill_learn()
	Describe("C� �i�u g� nan gi�i kh�ng?",4,
		"Ta mu�n ��i s�ch k� n�ng c�p 120/lvl120skill_getbook",
		"L�m sao �� h�c ���c k� n�ng c�p 120/lvl120skill_learninfo",
		"C�ch luy�n k� n�ng c�p 120/lvl120skill_skillinfo",
		"�� ta suy ngh� k� l�i xem/no");
end;

function lvl120skill_skillinfo()
	local szInfo = format("%s%s%s%s%s%s%s%s%s%s",
			"<enter><color=green>1. ��nh qu�i nh�n ���c <color>",
			"<enter>Qu�i t�i c�c khu v�c luy�n c�p: ��nh qu�i th��ng, boss xanh, boss Ho�ng Kim;",
			"<enter>Qu�i trong ho�t ��ng: ��nh qu�i trong c�c ho�t ��ng 'V��t �i th� nh�t', 'Boss s�t th�';",
			"<enter>Qu�i trong nhi�m v�: ��nh qu�i trong c�c nhi�m v� Ho�ng Kim;",
			"<enter>Chi�n tr��ng T�ng Kim: s� d�ng �i�m t�ch l�y �� ��i �i�m kinh nghi�m, tuy nhi�n kh�ng th� v��t qua gi�i h�n qui ��nh m�i ng�y.", 
			"<enter><color=green>2. Ch�c n�ng �y th�c<color>",
			"<enter>S� d�ng B�ch C�u Ho�n k� n�ng, ��i B�ch C�u Ho�n k� n�ng, ��i B�ch C�u Ho�n k� n�ng ��c bi�t.",
			"<enter>B�ch C�u Ho�n k� n�ng: sau khi s� d�ng s� n�ng cao �� r�n luy�n k� n�ng 120, m�i 5 ph�t th� �� r�n luy�n s� t�ng m�t l�n;",
			"<enter>��i B�ch C�u Ho�n k� n�ng: hi�u qu� g�p r��i B�ch C�u Ho�n k� n�ng th��ng, m�i 5 ph�t th� �� r�n luy�n s� t�ng m�t l�n;",
			"<enter>��i B�ch C�u ho�n k� n�ng ��c bi�t: hi�u qu� g�p ��i B�ch C�u Ho�n k� n�ng th��ng, m�i 5 ph�t th� �� r�n luy�n s� t�ng m�t l�n;"
			);
	Describe(szInfo,
		2,
		"Tr� v�/lvl120skill_learn",
		"K�t th�c ��i tho�i/no")
end;

function lvl120skill_learninfo()
	Describe("Nh�ng cao th� ��t c�p 120 c� th� ��n m�n ph�i c�a m�nh �� ��i s�ch k� n�ng c�p 120. Sau khi s� d�ng s�ch s� h�c ���c k� n�ng c�p 120, m�i nh�n v�t ch� c� th� ��i m�t l�n. <enter>�� ��i l�y s�ch c�n ph�i thu th�p ��: 1 quy�n B�n Nh��c T�m Kinh, 1 b� s�ch k� n�ng 90 c�a m�n ph�i m�nh, 1 vi�n Tinh H�ng B�o Th�ch v� 1 vi�n Th�y Tinh.", 
		2,
		"Tr� v�/lvl120skill_learn",
		"K�t th�c ��i tho�i/no")
end;

function lvl120skill_getbook()
	-- ԭ������е�19����������ԭֵ���һ�������ɹ���ֱ����Ϊ19
	local nstate = GetTask(LV120_SKILL_STATE);
	local nlevel = GetLevel();
	local nfact = GetLastFactionNumber();
	if (nstate == 19) then
		Describe("Th�t ��ng ti�c, ng��i �� ��i s�ch k� n�ng 120 r�i.",1 , "K�t th�c ��i tho�i/no");
	elseif (nlevel < 120) then
		Describe("��ng c�p ch�a �� 120, kh�ng �� �i�u ki�n ��i s�ch.",1 , "K�t th�c ��i tho�i/no");
	elseif (nfact < 0 or nfact > 9) then
		Describe("Ng��i ch�a gia nh�p m�n ph�i, kh�ng �� �i�u ki�n ��i s�ch.",1 , "K�t th�c ��i tho�i/no");
	else
		if (lvl120skill_delallitem() == 1) then
			SetTask(LV120_SKILL_STATE, 19);
			add_item(LV120SKILLBOOK);
			Msg2Player("��i s�ch k� n�ng c�p 120 th�nh c�ng!")
			WriteLog(format("[LvL120Skill]\t%s\tName:%s\tAccount:%s\tget a lvl120skillbook",
				GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount()))
		else
			Describe("Th�t ��ng ti�c, v�t ph�m mang ��n kh�ng ��ng y�u c�u, h�y ki�m tra l�i!", 1,"K�t th�c ��i tho�i/no");
			Msg2Player("V�t ph�m c�n thu th�p: 1 quy�n B�n Nh��c T�m Kinh, 1 b� s�ch k� n�ng 90 c�a m�n ph�i m�nh, 1 vi�n Tinh H�ng B�o Th�ch v� 1 vi�n Th�y Tinh.");
		end;
	end;
end;
-- 120��������һ�

function lvl120skill_delallitem()
	if (lvl120skill_calccount(BANRUOXINJING) < 1) then
		return 0;
	end;
	local nfact = GetLastFactionNumber();
	for i = 1, getn(FACTION_BOOK[nfact]) do
		if (lvl120skill_calccount(FACTION_BOOK[nfact][i]) < 1) then
			return 0;
		end;
	end;

	if (lvl120skill_calccount(XINGHONGBAOSHI) < 1) then
		return 0;
	end;
	
	if (lvl120skill_calccrystal() < 1) then
		return 0;
	end;
	
	lvl120skill_delitem(BANRUOXINJING, 1);
	for i = 1, getn(FACTION_BOOK[nfact]) do
		lvl120skill_delitem(FACTION_BOOK[nfact][i], 1);
	end;
	lvl120skill_delitem(XINGHONGBAOSHI, 1);
	lvl120skill_delscrystal(1);
	return 1;
end;

function lvl120skill_calccount(tb_item)
	return CalcEquiproomItemCount(tb_item[1], tb_item[2], tb_item[3], -1);
end;
function lvl120skill_delitem(tb_item, ncount)
	if (ncount <= 0) then
		return 0;
	end;
	local np = ConsumeEquiproomItem(ncount, tb_item[1], tb_item[2], tb_item[3], -1);
	if (np == 1) then
		WriteLog(format("[LvL120Skill]\t%s\tName:%s\tAccount:%s\tDeleteItem Count=%d,G=%d,D=%d,P=%d,L=%d",
					GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
					ncount, tb_item[1], tb_item[2], tb_item[3], -1));
	else
		print(format("Error!!!! DeleteItem Fail!!! Count=%d,G=%d,D=%d,P=%d,L=%d",
				ncount, tb_item[1], tb_item[2], tb_item[3], -1));
	end;
end;
function lvl120skill_calccrystal()
	local nsum = 0;
	for i = 1, getn(CRYSTAL) do
		nsum = nsum + lvl120skill_calccount(CRYSTAL[i]);
	end;
	return nsum;
end;
function lvl120skill_delscrystal(ncount)
	for i = 1, getn(CRYSTAL) do
		local ncrst = lvl120skill_calccount(CRYSTAL[i]);
		if (ncrst > ncount) then
			ncrst = ncount;
		end;
		lvl120skill_delitem(CRYSTAL[i], ncrst);
		ncount = ncount - ncrst;
		if (ncount <= 0) then
			break
		end;
	end;
end;



-- //Խ�ϰ治��������ʱ���������ʼ��
if (GetProductRegion() ~= "vn") then
	login_add(init_lv120skill, 2)
end
