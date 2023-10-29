IncludeLib("ITEM");
IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );
Include( "\\script\\task\\system\\task_string.lua" );
Include("\\script\\lib\\log.lua")

FILE_Recoin_COMPOUND = "recoin_goldenequip.txt";
--��������ص�ͷ�ļ�ת��
-- �ƽ�װ����Ʒ��Ӧ��

function initRecoinConfig()
	g_aryRecoinConfig = {};
	
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	for i = 0, nLatestItemVer do
		local strFullPath = makeItemFilePath( i, FILE_Recoin_COMPOUND );
		TabFile_Load( strFullPath, strFullPath );
		g_aryRecoinConfig[i+1] = {};
		local nRowCount = TabFile_GetRowCount( strFullPath );
		for j = 2, nRowCount do
			
			local szGoldName = TabFile_GetCell( strFullPath, j, "DES_GOLDNAME", "NoITEM" );
			local nGenre = tonumber( TabFile_GetCell( strFullPath, j, "DES_GENRE", -1 ) );
			local nDetailtype = tonumber( TabFile_GetCell( strFullPath, j, "DES_DETAILTYPE", -1 ) );
			local nFirstPieceDetail = tonumber( TabFile_GetCell( strFullPath, j, "MAR_FIRST_DETAIL", -1 ) );
			local nPieceSum = tonumber( TabFile_GetCell( strFullPath, j, "MAR_COUNT", -1 ) );
			local nBadValues = tonumber( TabFile_GetCell( strFullPath, j, "DES_BADVALUES", 0 ) );
			local nStandardValues = tonumber( TabFile_GetCell( strFullPath, j, "DES_STANDARDVALUES", 0 ) );
		
		
			local szgoldkey = format("[%d,%d]",nGenre,nDetailtype)
			if g_aryRecoinConfig[i+1][szgoldkey] == nil then
				g_aryRecoinConfig[i+1][szgoldkey] = {}
			end
			g_aryRecoinConfig[i+1][szgoldkey].m_szGoldName = szGoldName
			g_aryRecoinConfig[i+1][szgoldkey].m_nFirstPieceDetail = nFirstPieceDetail
			g_aryRecoinConfig[i+1][szgoldkey].m_nPieceSum = nPieceSum
			g_aryRecoinConfig[i+1][szgoldkey].m_nBadValues = nBadValues
			g_aryRecoinConfig[i+1][szgoldkey].m_nStandardValues = nStandardValues
			local nNo = 1
			for k = nFirstPieceDetail,nFirstPieceDetail+nPieceSum-1 do 
				local szgoldpiecekey = format("[%d]",k)
				if g_aryRecoinConfig[i+1][szgoldpiecekey] == nil then
					g_aryRecoinConfig[i+1][szgoldpiecekey] = {}
				end
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_szGoldName = szGoldName
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nGenre = nGenre
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nDetailtype = nDetailtype
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nPieceSum = nPieceSum
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nPieceNo = nNo
				nNo = nNo + 1
				--g_aryRecoinConfig[i+1][szgoldpiecekey].m_nBadValues = nBadValues
				--g_aryRecoinConfig[i+1][szgoldpiecekey].m_nStandardValues = nStandardValues
			end
		end
	end
end

initRecoinConfig();

-- �ƽ�װ��������Ʒ��������������������Ӧ��
TB_MARK_ITEM_COUNT =
{
	{6, 1},	-- �ƽ����6��������Ƭ��Ҫ����1������
	{9,	2},	-- �ƽ����9��������Ƭ��Ҫ����2������
};

-- �ƽ�װ����ָ�����Ʒ�ļ�ֵ��
TB_ENHANCE_ITEM = {
		["6,1,398"] = 100000000,	-- ���ؿ�ʯ
		["6,1,122"] = 600000,		-- ��Ե¶��С��
		["6,1,123"] = 1200000,		-- ��Ե¶���У�
		["6,1,124"] = 3000000,		-- ��Ե¶����
		["4,238,1"] = 5000000,		-- ��ˮ��
		["4,239,1"] = 5000000,		-- ��ˮ��
		["4,240,1"] = 5000000,		-- ��ˮ��
};

MARK_ITEM_ID = "4,979,1";								-- �ƽ�װ����������Ϭ��
GLBID_SPLIT_LAST_DATE = 919;							-- ȫ�ֱ���ID of ���һ��װ����ֵ�����
GLBID_SPLIT_DAILY_COUNT = 920;							-- ȫ�ֱ���ID of ����ִ��װ����ֵĴ���
SPLIT_COUNT_DAILY_THRESHOLD = 500;						-- һ̨GameSvrһ���ڿ�ִ��װ����ֵĴ�������
SPLIT_AVAILABLE_DATE_RANGE = { 20080113, 20080401 };	-- װ����ֹ��ܿ��ŵĿ�ʼ������ʱ��

FRAME_EXCHANGE_COIN = 2;			-- ����װ����Ƭ����֧����ͭǮ����
TASKTMP_EXCHANGE_FRAME = 194;		-- Ҫ������װ����Ƭ������

-- �ƽ�װ�����
-- Fanghao_Wu	2006-06-21
function split_entry()
	local aryDescribe = {};
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	
	aryDescribe =
		{
		"<dec><npc>Ta c� th� ph�n m�nh trang b� Ho�ng Kim. ��y c�ng l� t�m huy�t c� ��i c�a s� ph� ta.",
			"Trang b� Ho�ng Kim n�y c� th� chia th�nh m�y m�nh?/want_split_preview",
			"C� th� gi�p ta ph�n m�nh trang b� Ho�ng Kim n�y ���c kh�ng?/#want_split(0)",
			"C�ch ph�n m�nh trang b� Ho�ng Kim./about_split",
			"��ng quan t�m, ta ch� thu�n mi�ng n�i ra th�i./cancel",
		};
	CreateTaskSay(aryDescribe);
end

function want_split_preview()
	GiveItemUI("Xem th� ph�n m�nh trang b�.", "��t v�o trang b� Ho�ng Kim, Kim T�, Kho�ng th�ch th�n b�, Ph�c Duy�n L� ta s� cho ng��i bi�t s� l��ng m�nh trang b� c� th� ph�n ra.", "do_split_preview", "cancel", 1);
end

function want_split(bNoConfirm)
	if (_is_split_available() ~= 1) then
		return
	end
	if (bNoConfirm ~= 1 and CalcFreeItemCellCount() < 9) then
		CreateTaskSay(	{	"<dec><npc>H�nh trang kh�ng �� kho�ng tr�ng, h�y s�p x�p sao cho c�n d� 9 � tr�ng. N�u kh�ng, m�nh trang b� r�t ra s� b� ng��i kh�c l�y m�t, l�c �� ��ng tr�ch ta kh�ng nh�c nh�.",
							"H�nh trang �� �� ch� tr�ng r�i, xin h�y ti�p t�c!/#want_split(1)",
							"V�y �� ta s�p x�p l�i h�nh trang ��!/cancel"	}	);
	else
		GiveItemUI("Ph�n m�nh trang b�", "��t trang b� Ho�ng Kim, Kim T�, Kho�ng th�ch th�n b�, Th�y Tinh, Ph�c Duy�n L� v�o ta m�i c� th� gi�p ng��i ph�n m�nh, N�u trang b� ��t v�o trong tr�ng th�i b� kh�a th� m�nh trang b� ph�n ra c�ng s� � tr�ng th�i n�y!", "do_split", "cancel");
	end
end

function about_split()
	local aryDescribe =
	{
		"<dec><npc>Mu�n ph�n m�nh trang b� th� ��a n� cho ta l� ���c, nh�ng ta c�n m�t th� g�i l� <color=yellow>Kim T�<color>. Ch� � trang b� Ho�ng Kim c� th� ph�n th�nh 4, 6, 9 m�nh t�y theo trang b�. Ph�n 4 m�nh th��ng kh�ng c�n d�ng <color=yellow>Kim T�<color> c�ng ���c. Mu�n ph�n 6 m�nh th� y�u c�u ph�i c� �t nh�t 1 <color=yellow>Kim T�<color>, mu�n ph�n 9 m�nh th� c�n 2 <color=yellow>Kim T�<color>, ngo�i ra n�u ��a ta nhi�u <color=yellow>Kim T�<color>, <color=yellow>Kho�ng th�ch th�n b�<color>, <color=yellow>Th�y Tinh<color> v� <color=yellow>Ph�c Duy�n L�<color> th� m�nh trang b� ph�n th�nh c� th� ���c nhi�u h�n. Ta nh� <color=yellow>Kim T�<color> c� b�n trong <color=blue>K� Tr�n C�c<color>.",
		"Ta bi�t r�i!/split_entry",
	};
	CreateTaskSay(aryDescribe);
end

function do_split(nItemCount)
	_do_split_process(nItemCount, 0);
end

function do_split_preview(nItemCount)
	_do_split_process(nItemCount, 1);
end

function _do_split_process(nItemCount, bPreview)
	local nComposeEntryIdx = 0;
	local nMarkItemCount = 0;
	local nSrcItemValueSum = 0;
	local szContinueFunc = "";
	local szItemInfo = "";
	if (bPreview ~= 1) then
		if (_is_split_available() ~= 1) then
			return
		end
		szContinueFunc = "#want_split(0)";
	else
		szContinueFunc = "#want_split_preview()";
	end
	
	local nItemBindState;	--ԭ�ϻƽ�İ�״̬
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_ENHANCE_ITEM do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end;
	local nversion,nFirstPiece,nPieceSum,nBadVaules,nStandardValues,szgoldName;
	-- У����Ʒ�Ƿ�ƥ��
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		local nCurItemValue = 0;
		if (nCurItemQuality == 1) then
			--�������װ��(��������װ��)
			if (tbCurItemProp[1] ~= 0) then
				CreateTaskSay(	{	"<dec><npc>Ngo�i <color=yellow>trang b� Ho�ng Kim<color> v� <color=yellow>Kim T�<color> ra, ch� c� <color=yellow>Kho�ng th�ch th�n b�<color>, <color=yellow>Th�y Tinh<color> v� <color=yellow>Ph�c Duy�n L�<color> l� nguy�n li�u ta c�n, nh�ng th� kh�c h�y c�t l�i �i.",
					format("Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./%s",szContinueFunc),
					"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
				return
			end
			
			
			if (nExpiredTime > 0) then -- �б����ڵ�װ�������ܲ�
				CreateTaskSay(	{	"<dec><npc>Trang b� c� <color=fire>th�i h�n s� d�ng<color> th� kh�ng th� r�n ���c.",
									"Th�t l� th� l�i, ta l�i b� nh�m n�a r�i. M�t l�c sau quay l�i nh�/cancel"	}	);
				return
			end
			
			
			nversion = ITEM_GetItemVersion( nCurItemIdx ) + 1;
			
			local szgoldkey = format("[0,%d]",GetGlodEqIndex(nCurItemIdx))
			if nFirstPiece == nil then
				if (g_aryRecoinConfig[nversion][szgoldkey])~= nil then
							szgoldName = g_aryRecoinConfig[nversion][szgoldkey].m_szGoldName
							nFirstPiece = g_aryRecoinConfig[nversion][szgoldkey].m_nFirstPieceDetail
							nPieceSum = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceSum
							nBadVaules = g_aryRecoinConfig[nversion][szgoldkey].m_nBadValues
							nStandardValues = g_aryRecoinConfig[nversion][szgoldkey].m_nStandardValues
				end
			else
				CreateTaskSay(	{	"<dec><npc>Kh�ch quan mu�n ph�n m�nh trang b� Ho�ng Kim n�o? Ta kh�ng hoa m�t ch�?",
									format("Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./%s",szContinueFunc),
									"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
				return
			end
			
			if (nFirstPiece == nil) then
				CreateTaskSay(	{	format("<dec><npc>Th�t ��ng ti�c, v�i kh� n�ng hi�n th�i c�a ta, kh�ng th� gi�p ng��i ph�n m�nh trang b� Ho�ng Kim <color=yellow>%s<color> n�y.",GetItemName(nCurItemIdx)),
									format("Ch� t�o trang b� Ho�ng Kim kh�c./%s",szContinueFunc),
									"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
				return
			end
			nCurItemValue = nBadVaules;
			nItemBindState = GetItemBindState(nCurItemIdx)	--��ȡ��״̬
			szItemInfo = getItemInfo(nCurItemIdx);
			writeRecoinLog("[Nguy�n li�u ch�nh ph�n m�nh Ho�ng Kim]", szItemInfo);
		else
			local szItemKey = format("%s,%s,%s",tbCurItemProp[1],tbCurItemProp[2],tbCurItemProp[3])
			if (szItemKey == MARK_ITEM_ID) then
				nMarkItemCount = nMarkItemCount + 1;
				nCurItemValue = ITEM_CalcItemValue(nCurItemIdx);
			else
				if (TB_ENHANCE_ITEM[szItemKey] == nil) then
					CreateTaskSay(	{	"<dec><npc>Ngo�i <color=yellow>trang b� Ho�ng Kim<color> v� <color=yellow>Kim T�<color> ra, ch� c� <color=yellow>Kho�ng th�ch th�n b�<color>, <color=yellow>Th�y Tinh<color> v� <color=yellow>Ph�c Duy�n L�<color> l� nguy�n li�u ta c�n, nh�ng th� kh�c h�y c�t l�i �i.",
										format("Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./%s",szContinueFunc),
										"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
					return
				end
				nCurItemValue = TB_ENHANCE_ITEM[szItemKey];
				tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + 1;
				tb_enhanceitem_count[szItemKey][2] = nCurItemName;
			end
		end
		nSrcItemValueSum = nSrcItemValueSum + nCurItemValue;
	end
	if (szgoldName == nil) then
		CreateTaskSay(	{	"<dec><npc>N�u mu�n ta gi�p ph�n m�nh trang b� th� h�y �em trang b� �� ��n ��y, kh�ng c� trang b� ta kh�ng th� gi�p ng��i.",
							format("Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./%s",szContinueFunc),
							"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
		return
	end
	for i = getn(TB_MARK_ITEM_COUNT), 1, -1 do
		if (nPieceSum >= TB_MARK_ITEM_COUNT[i][1]) then
			if (nMarkItemCount < TB_MARK_ITEM_COUNT[i][2]) then
				CreateTaskSay(	{	format("<dec><npc>Ph�n m�nh trang b� n�y c�n �t nh�t <color=yellow>%s Kim T�<color>, n�u kh�ng ph�i trang b� Ho�ng Kim th� c� th� s� b� h�ng. �i t�m �� <color=yellow>Kim T�<color> r�i h�y quay l�i. Ta nh� v�t n�y c� b�n � <color=blue>K� Tr�n C�c<color>.",TB_MARK_ITEM_COUNT[i][2]),
									format("�� �� r�i, �� ta th� l�i xem!/%s",szContinueFunc),
									"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
				return
			end
			break;
		end
	end
	
	-- У����Ʒƥ��ɹ���������Ƭ����������
	local aryProb = { { 0, 0 }, { 0, 0 } };
	local dFrameCount = nSrcItemValueSum / nStandardValues * nPieceSum;
	if (dFrameCount >= nPieceSum) then
		-- Ͷ����������Ƭ���ܼ�ֵ�����ٷְٳ������Ƭ
		aryProb[1][1] = nPieceSum;
		aryProb[1][2] = 1;
	else
		aryProb[1][1] = ceil(dFrameCount);
		aryProb[1][2] = 1 - (ceil(dFrameCount) - dFrameCount);
		aryProb[2][1] = aryProb[1][1] - 1;
		aryProb[2][2] = 1 - aryProb[1][2];
	end
	
	if (bPreview == 1) then
		local szPrompt = "<dec><npc>"
		for i = 1, 2 do
			if (aryProb[i][2] > 0) then
				if (aryProb[i][1] > 0) then
					szPrompt = szPrompt..format("trang b� Ho�ng Kim n�y c� x�c su�t \n<color=yellow>%5.2f%%<color> c� th� ph�n th�nh <color=yellow>%d<color> m�nh\n", aryProb[i][2] * 100, aryProb[i][1]);
				else
					szPrompt = szPrompt..format("trang b� n�y c� \n<color=yellow>%5.2f%%<color> kh� n�ng ph�n m�nh th�t b�i\n", aryProb[i][2] * 100);
				end
			end
		end
		CreateTaskSay(	{	szPrompt,
							"H�y gi�p ta xem trang b� kh�c c� th� ph�n th�nh bao nhi�u m�nh./want_split_preview",
							"C� th� gi�p ta ph�n m�nh trang b� Ho�ng Kim n�y ���c kh�ng?/#want_split(0)",
							"Ta bi�t r�i, xin �a t�./cancel"	}	);
		return
	else
		-- ɾԭ��
		for i = 1, nItemCount do
			if (RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
				WriteLog(format("[Ph�n m�nh trang b� Ho�ng Kim] %s\t%s\t%s\t x�a v�t ph�m th�t b�i \t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i))));
				return
			end
		end
		-- ����Ƭ
		if (random() <= aryProb[1][2]) then
			dFrameCount = aryProb[1][1];
		else
			dFrameCount = aryProb[2][1];
		end
		local aryFrameDetailType = {};
		local szExpendableLog = "";
		local szFrameNameLog = "";
		for i = 1, nPieceSum do
			aryFrameDetailType[i] = nFirstPiece + i - 1;
		end
		for i = 1, dFrameCount do
			local nRandNum = random(getn(aryFrameDetailType));
			local nIdx = NewItemEx(4, 0, 0, 4, aryFrameDetailType[nRandNum], 1, 0, 0, 0);
			if nItemBindState ~= 0 then 
				--����Ƭ����ΪԴ�ƽ�װ���İ�״ֵ̬
				SetItemBindState(nIdx, nItemBindState)
			end
			AddItemByIndex(nIdx);
			szFrameNameLog = szFrameNameLog..szgoldName..format("M�nh [%s]\t",aryFrameDetailType[nRandNum]);
			tremove(aryFrameDetailType, nRandNum);
		end
		if (dFrameCount > 0) then
			CreateTaskSay(	{	format("<dec><npc> Trang b� <color=yellow>%s<color> ph�n m�nh xong r�i, h�y mang <color=yellow>%s<color> m�nh n�y �i. N�u ng�y n�o mu�n h�p th�nh ch�ng l�i th� h�y mang c�c m�nh n�y ��n g�p ta.",szgoldName,dFrameCount),
								"Xin �a t�!/cancel"	}	);
		else
			CreateTaskSay(	{	format("<dec><npc>Ph�n m�nh <color=yellow>%s<color> th�t b�i, l�n sau h�y d�ng nhi�u nguy�n li�u h�n.",szgoldName),
								"Ta bi�t r�i!/cancel"	}	);
		end
		-- ��¼ÿ��װ�����ִ�д���
		SetGlbValue(GLBID_SPLIT_DAILY_COUNT, GetGlbValue(GLBID_SPLIT_DAILY_COUNT) + 1);
		-- ��¼Log
		for szkey, tb_item in tb_enhanceitem_count do
			if (tb_enhanceitem_count[szkey][1] > 0) then
			szExpendableLog = szExpendableLog..tb_enhanceitem_count[szkey][2]..format("[%s](%s#)\t",szkey,tb_enhanceitem_count[szkey][1]);
			end;
		end;
	WriteLog(format("[Ph�n m�nh Ho�ng Kim] %s\t%s\t%s\t%s\t ti�u hao: Kim T� (%s)\t%s ph�n th�nh %s m�nh:",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szgoldName,nMarkItemCount,szExpendableLog,dFrameCount,szFrameNameLog));
		writeRecoinLog("[Ph�n m�nh trang b� Ho�ng Kim]", szItemInfo);
		return
	end
end

-- �ж��Ƿ���Խ���װ����֣����ڿ��������ڣ����һ�û���ﵱ��װ����ִ�������
function _is_split_available()
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	--reloadRecoinGoldenDate();
	
	local nLastDate = GetGlbValue(GLBID_SPLIT_LAST_DATE);
	if (nLastDate ~= nTodayString) then
		SetGlbValue(GLBID_SPLIT_LAST_DATE, nTodayString);
		SetGlbValue(GLBID_SPLIT_DAILY_COUNT, 0);
	else
		local nDailySplitCount = GetGlbValue(GLBID_SPLIT_DAILY_COUNT);
		if (nDailySplitCount >= SPLIT_COUNT_DAILY_THRESHOLD) then
			CreateTaskSay(	{	"<dec><npc>Xin th� l�i, h�m nay ta �� qu� m�t, ng�y mai h�y quay l�i nh�!",
								"V�y ta s� quay l�i sau!/cancel"	}	);
			return 0;
		end
	end
	return 1;
end

-- �ƽ�װ����Ƭ�ϳ�
-- С�˶��
function compose_entry()
	local aryDescribe =
	{
		"<dec><npc>Ch� c�n ��a ta to�n b� m�nh trang b�, kh�ng d� kh�ng thi�u ho�c c� 2 m�nh trang b� gi�ng nhau, ta s� gi�p ng��i h�p th�nh.",
		"Ta c� �� b� m�nh trang b� mu�n nh� �ng h�p th�nh./want_compose",
		"Ta ch� gh� xem cho bi�t./cancel",
	};
	CreateTaskSay(aryDescribe);
end

function want_compose(bNoConfirm)
--	if (bNoConfirm ~= 1 and CalcFreeItemCellCount() < 6) then
--		CreateTaskSay(	{	"<dec><npc>�㱳����ʣ��ռ䲻���ˣ��������һ������6��ռ���������ϳɺõĻƽ�װ�������ϱ����˼��߿ɱ����û������Ŷ��",
--							"�����ռ乻�ˣ�û��ϵ��������/#want_compose(1)",
--							"����������һ�±�����/cancel"	}	);
--	else
		GiveItemUI("H�p th�nh trang b�", "Mu�n h�p th�nh trang b� ph�i c� �� b� c�c m�nh c�a trang b� ��. N�u m�nh trang b� �ang trong tr�ng th�i b� kh�a th� trang b� h�p th�nh v�n s� trong tr�ng th�i kh�a.", "do_compose", "cancel", 1);
--	end
end

function do_compose(n_count)
	if (n_count <= 0) then
		CreateTaskSay(	{	"<dec><npc>N�u mu�n h�p th�nh trang b� th� h�y �em c�c m�nh trang b� cho ta, n�u kh�ng �� b� ta kh�ng gi�p ng��i ���c.",
							"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_compose",
							"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
		return
	end

	--�����ǲ���������Ʒ����ͬһ����
	local n_goldgenre,n_golddetail,nversion,szgoldname,nPieceSum,nFirstPiece
	local tb_tgot = {}
	for i = 1, n_count do 
		local n_itemidx = GetGiveItemUnit(i)
		
		nversion = ITEM_GetItemVersion( n_itemidx ) + 1;

		local tb_p
		tb_p = pack(GetItemProp(n_itemidx))
		local szgoldkey = format("[%d]",tb_p[2])

--		print(GetItemProp(n_itemidx))
		if (tb_p[1] ~= 4 or g_aryRecoinConfig[nversion][szgoldkey] == nil ) then
			CreateTaskSay(	{	"<dec><npc>H�p th�nh trang b� ch� c�n c� m�nh trang b� t��ng �ng l� ���c, nh�ng th� kh�c ng��i h�y c�t l�i �i.",
								"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_compose",
								"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
			return
		elseif (GetItemStackCount(n_itemidx) ~= 1) then
			CreateTaskSay(	{	"<dec><npc>m�nh trang b� kh�ng th� x�p ch�ng. Ng��i kh�ng nghe ta d�n r�i!",
								"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_compose",
								"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
			return
		elseif not n_golddetail then	--���ݵ�һ����Ʒ�ҵ�Ҫ�ϳɵ���������Ƭ

				nPieceSum = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceSum
				n_goldgenre = g_aryRecoinConfig[nversion][szgoldkey].m_nGenre
				n_golddetail = g_aryRecoinConfig[nversion][szgoldkey].m_nDetailtype
				szgoldname = g_aryRecoinConfig[nversion][szgoldkey].m_szGoldName
				
				if (n_count > nPieceSum) then
					CreateTaskSay(	{	format("<dec><npc>Kh�ch quan mu�n h�p th�nh <color=yellow]>%s<color>? ��a ta nhi�u �� v�y �� l�m g�? Ch� c�n <color=yellow>%s<color> m�nh l� ���c.",szgoldname,nPieceSum),
											"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_compose",
											"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
						return
				elseif (n_count < nPieceSum) then
					CreateTaskSay(	{	format("<dec><npc>Kh�ch quan mu�n h�p th�nh <color=yellow>%s<color>? Kh�ng c� �� m�nh trang b�, kh�ng th� h�p th�nh.",szgoldname),
											"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_compose",
											"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
						return
				end
					n_type = 1

		elseif (g_aryRecoinConfig[nversion][szgoldkey].m_nDetailtype ~= n_golddetail) then	--����һ���⣬������Ƭ��Ӧ��ͬһ����
			CreateTaskSay(	{	"<dec><npc>H�p th�nh trang b� c�n c� m�nh trang b�, ng��i ��a ta m�nh trang b� kh�ng ��ng, kh�ng th� h�p th�nh.",
								"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_compose",
								"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
			return
		end

		local n_sid = tb_p[2]
		if tb_tgot[n_sid] then	--��������ͬ������Ƭ����
			CreateTaskSay(	{	format("<dec><npc>Ta kh�ng c�n 2 m�nh trang b� gi�ng nhau, h�p th�nh <color=yellow>%s<color> c�n <color=yellow>%s<color>  <color=yellow>m�nh %s<color>, h�y nh� k�!",szgoldname,nPieceSum,szgoldname),
								"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_compose",
								"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
			return
		end
		tb_tgot[n_sid] = 1	--������Ƭ���
	end
	--��ȫ��飬���������ɾ������������ĵĻ���
	local szkey = format("[0,%d]",n_golddetail)
	if g_aryRecoinConfig[nversion][szkey] == nil then
			CreateTaskSay(	{	"<dec><npc>Ph�t sinh l�i h� th�ng?", "Cho�ng.../cancel"	}	);
			local str = "do_compose ERROR!!! not tb_tgot "..i;
			WriteLog(format("[H�p th�nh m�nh trang b� Ho�ng Kim] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));		
	end
	for i = g_aryRecoinConfig[nversion][szkey].m_nFirstPieceDetail,g_aryRecoinConfig[nversion][szkey].m_nPieceSum-1 do
		if not tb_tgot[i] then
			CreateTaskSay(	{	"<dec><npc>Ph�t sinh l�i h� th�ng?", "Cho�ng.../cancel"	}	);
			local str = "do_compose ERROR!!! not tb_tgot "..i;
			WriteLog(format("[H�p th�nh m�nh trang b� Ho�ng Kim] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));
			return
		end
	end
	--ɾԭ��
	local bBind = nil
	for i=1, n_count do
		local nIdx = GetGiveItemUnit(i)
		if (GetItemBindState(nIdx) ~= 0) then
			bBind = 1
		end
		if (RemoveItemByIndex(nIdx) ~= 1) then
			WriteLog(format("<H�p th�nh m�nh Ho�ng Kim> %s\t%s\t%s\t x�a v�t ph�m th�t b�i \t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i))));
			return
		end
	end
	--����Ʒ
	
	local str = format("H�p th�nh <color=yellow>%s<color> th�nh c�ng!",szgoldname)
	Msg2Player(str)
	local nItem = AddGoldItem(n_goldgenre,n_golddetail)
	local szItemInfo = getItemInfo(nItem);
	--ֻҪԭ�����а󶨻���״̬���ϳ��Ļƽ�Ϊ��
	if (bBind) then
		BindItem(nItem)
	end
	--AddGlobalNews("�ݴ��� "..GetName().." ��װ����Ƭ�ɹ��ϳ���"..szgoldname.."��")
	WriteLog(format("[H�p th�nh m�nh trang b� Ho�ng Kim] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));
	writeRecoinLog("[M�nh Ho�ng Kim h�p th�nh Ho�ng Kim]", szItemInfo);
end

-- �ƽ�װ����Ƭ����
--
function exchange_entry()
	local aryDescribe =
	{
		format("<dec><npc>Ch� c�n ��a <color=yellow>%s ti�n ��ng<color> ta s� gi�p ng��i ��i m�nh trang b� t��ng �ng.",FRAME_EXCHANGE_COIN),
		"��ng quan t�m, ta ch� thu�n mi�ng n�i ra th�i./cancel",
	};
	for i = 9, 1, -1 do
		tinsert(aryDescribe, 2, format("M�nh th� %d/#want_exchange(%d)",i,i));
	end
	CreateTaskSay(aryDescribe);
end

function want_exchange(nFrameIdx)
	if (CalcItemCount(3, 4, 417, 1, -1) < FRAME_EXCHANGE_COIN) then
		CreateTaskSay(	{	format("<dec><npc>Kh�ng c� ti�n ��ng l�m sao ��i m�nh trang b�. H�y t�m �� <color=yellow>%s ti�n ��ng<color> r�i h�y quay l�i g�p ta.",FRAME_EXCHANGE_COIN),
							"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
		return
	end
	SetTaskTemp(TASKTMP_EXCHANGE_FRAME, nFrameIdx);
	GiveItemUI("��i m�nh trang b�", "��t v�o 1 m�nh trang b� mu�n ��i. Ti�n ��ng s� t� ��ng b� kh�u tr�.", "do_exchange", "cancel", 1);
end

function do_exchange(nItemCount)
	if (nItemCount ~= 1) then
		CreateTaskSay(	{	"<dec><npc>M�t l�n ch� c� th� ��i 1 m�nh.",
							"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./exchange_entry",
							"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
		return
	end
	local nItemIdx = GetGiveItemUnit(1);
	local tbItemProp = pack(GetItemProp(nItemIdx));
	local nFirstPiece,nPieceSum,nPieceNo,nFirstPiece
	if GetItemStackCount(nItemIdx) ~= 1 then
		CreateTaskSay(	{	"<dec><npc> M�nh trang b� kh�ng th� x�p ch�ng, m�i l�n ch� c� th� ��i 1 m�nh.",
							"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./exchange_entry",
							"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
		return		
	end
	if (tbItemProp[1] == 4) then
		local szgoldkey = format("[%d]",tbItemProp[2])
		local nversion = ITEM_GetItemVersion( nItemIdx ) + 1;
		
		if g_aryRecoinConfig[nversion][szgoldkey] ~= nil then
			--nFirstPiece = g_aryRecoinConfig[nversion][szgoldkey].m_nFirstPieceDetail
			nPieceSum = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceSum
			szGoldName = g_aryRecoinConfig[nversion][szgoldkey].m_szGoldName
			nPieceNo = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceNo
			nFirstPiece = tbItemProp[2] - (nPieceNo - 1)
		end
	end
	if nPieceSum == nil then
		CreateTaskSay(	{	"<dec><npc>Ta ch� c� th� gi�p ng��i ��i m�nh trang b� Ho�ng Kim, ng��i ��a ta c�i g� v�y?",
							"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./exchange_entry",
							"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
		return
	end
	local nExchangeFrameIdx = GetTaskTemp(TASKTMP_EXCHANGE_FRAME);
	if (nExchangeFrameIdx < 1 or nExchangeFrameIdx > nPieceSum) then
		CreateTaskSay(	{	format("<dec><npc>M�nh <color=yellow>%s<color> mu�n ��i t�ng c�ng c� <color=yellow>%s<color> m�nh, kh�ng c� m�nh th� <color=yellow>%s<color>.",szGoldName,nPieceSum,nExchangeFrameIdx),
							"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./exchange_entry",
							"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
		return
	end
	if (CalcItemCount(3, 4, 417, 1, -1) < FRAME_EXCHANGE_COIN) then
		CreateTaskSay(	{	format("<dec><npc>Kh�ng c� ti�n ��ng l�m sao ��i m�nh trang b�. H�y t�m �� <color=yellow>%s ti�n ��ng<color> r�i h�y quay l�i g�p ta.",FRAME_EXCHANGE_COIN),
							"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
		return
	end
	if (ConsumeItem(3, FRAME_EXCHANGE_COIN, 4, 417, 1, -1) ~= 1) then
		WriteLog(format("[��i m�nh Ho�ng Kim] %s\t%s\t%s\t X�a ti�n ��ng th�t b�i.",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName()));
		return
	end
	if (RemoveItemByIndex(nItemIdx) ~= 1) then
		WriteLog(format("[��i m�nh Ho�ng Kim] %s\t%s\t%s\t X�a v�t ph�m th�t b�i \t%s",GetLocalDate("%Y-%m-%d %H:%M:%S",GetAccount(),GetName(),GetItemName(nItemIdx))));
	end
	AddItem(4, nFirstPiece + nExchangeFrameIdx - 1, 1, 0, 0, 0);
	CreateTaskSay(	{	format("<dec><npc>T�m th�y m�nh th�  <color=yellow>%s<color> c�a  <color=yellow>%s<color>, h�y c�m l�y �i!",nExchangeFrameIdx,szGoldName),
						"Xin �a t�!/cancel"	}	);
	WriteLog(format("[��i m�nh Ho�ng Kim] %s\t%s\t%s\t%s m�nh(%s) ��i th�nh (%s)",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szGoldName,tbItemProp[2],(nFirstPiece + nExchangeFrameIdx - 1)));
end

function pack(...)
	return arg
end

function cancel()
end

--{randseed,q,g,d,P,level,series,lucky,<magic1,magic2,magic3,magic4,magic5,magic6>}(gentime)(platinalvl)

--[ʱ��]	[�ƽ���]	Account	Name
--[ʱ��]	��Ҫ���ϣ�

function writeRecoinLog(szTitle, szLog)
	WriteLog(format("  %s\t%s\tNAME:%s\tACCOUNT:%s",GetLocalDate("%Y-%m-%d %H:%M:%S"), szTitle,GetName(),GetAccount()));
	WriteLog(format("  %s\t%s", GetLocalDate("%Y-%m-%d %H:%M:%S"), szLog));
end;

function reloadRecoinGoldenDate()
	local tb_NewAvailableDate = {gb_GetTask("RECOIN_GOLDENEQUIP",1), gb_GetTask("RECOIN_GOLDENEQUIP",2)};
	if (tb_NewAvailableDate[1] ~= 0 and tb_NewAvailableDate[2] ~= 0 and tb_NewAvailableDate[2] ~= SPLIT_AVAILABLE_DATE_RANGE[2]) then
		SPLIT_AVAILABLE_DATE_RANGE[1] = tb_NewAvailableDate[1];
		SPLIT_AVAILABLE_DATE_RANGE[2] = tb_NewAvailableDate[2];
	end;
end;