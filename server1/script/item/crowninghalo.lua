Include([[\script\lib\string.lua]]);
Include([[\script\lib\coordinate.lua]]);
IL("TIMER")
IL("TONG")
MAPFILE = [[\settings\item\004\mask.txt]];

--====Task Value====--
TIMER_ID	= 78				-- ID����д��\settings\timertask.txt
TIMER_LAST	= 3 * 60 * 60 * 18	-- ��ʹ����ʱ�䣬10����
TIMER_FREQ	= 10 * 18			-- �ͷ�Ƶ�ʣ�5��
USE_YES = 1						-- ����ʹ��
USE_NO = 0						-- û��ʹ��

TTK_FACE = {1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033};
WSSZ_TK_USING = 1758		--�Ƿ�����ʹ����˫ɱ��
TK_MASK = 1759;				--��˫ɱ����ߵ�Idx

function main(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	
	if (nRestCount <= 0) then
		Say("V� song s�t tr�n �� m� ra, c� mu�n ��ng l�i kh�ng?", 2, "��ng/#closebook("..nItem..")", "T�m d�ng/no")
			--, "�ٸ�һ��/addbook", "ѡ������Ҫ�����/selectface")
	else
		Say("V� song s�t tr�n �� ��ng, c� mu�n m� ra kh�ng?", 2, "M� ra /#openbook("..nItem..")", "T�m d�ng/no")
		--, "�ٸ�һ��/addbook", "ѡ������Ҫ�����/selectface")
	end
	return 1;
end

function addbook()
	local nItem = AddItem(6,1,1106,1,0,0,0)	-- Ҫ��һ������Ʒ��magicscript.txt
	set_rest_count(nItem, TIMER_LAST/TIMER_FREQ)
end

function openbook(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	ItemGenre, DetailType, ParticualrType = GetItemProp(nItem); --�õ���Ʒ���
	if (PlayerIndex ~= GetItemBelong(nItem) or ItemGenre ~= 6 or DetailType ~= 1 or ParticualrType ~= 1106) then
		return
	end;
	
	if (GetTask(WSSZ_TK_USING) == USE_YES) then
		Say("�� m� ra 1 V� song s�t tr�n", 0);
		Msg2Player("�� m� ra 1 V� song s�t tr�n");
		return
	end;
	
	SetTaskTemp(193, nItem);
	local nMaskIdx = GetItemParam(nItem, 2);
	Say("V� song s�t tr�n v�n ch�a ch�n khu�n m�u, c� th� ch�nh s�a lo�i h�nh �� c�. C� mu�n l�a ch�n khu�n m�u kh�ng?", 2, 
	"Ch�n khu�n m�u ��c s�c/sel_face", 
	"Ta c�m th�y lo�i n�y c�ng t�t r�i/select_no");
end

function sel_face()
	nItem = GetTaskTemp(193);
	_, nTongID = GetTongName();
	local tab_face = {};
	local nMaskIdx;
	local szMaskName = "";
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_face, szMaskName.."khu�n m�u kh� t�t/#sel_mask("..i..")");
		end;
	end;
	
	if (getn(tab_face) == 0) then
		Say("Qu� bang ch�a th�m v�o h�nh th� V� song s�t tr�n, bang ch� ho�c tr��ng l�o c� th� ��n C�t bi�u t��ng �� thay ��i. T�i �a c� 10 khu�n m�u, c� ��ng � s� d�ng V� song s�t tr�n kh�ng?", 2,
		"Ta c�m th�y khu�n m�u nh�m c�ng t�t/select_no",
		"K�t th�c ��i tho�i/no");
		return
	end;
	
	tinsert(tab_face, "K�t th�c ��i tho�i/no");
	Say("H�nh th� V� song s�t tr�n qu� bang hi�n c� g�m nh�ng c�i b�n d��i, t�i �a c� 10 c�i, bang ch� ho�c tr��ng l�o c� th� ��n C�t bi�u t��ng c�a bang �� thay ��i, ng��i ch�n khu�n m�u n�o", getn(tab_face), tab_face);
end;

function select_no()
	SetTask(TK_MASK, 35);
	start_book(0);
end;

function sel_mask(nMaskIdx)
	local nItem = GetTaskTemp(193);
	if (nItem <= 0) then
		return
	end;
	local nMask = TONG_GetTaskValue(nTongID, TTK_FACE[nMaskIdx]);
	if (nMask == 0) then
		nMask = 35;
	end
	SetTask(TK_MASK, nMask);
	
	SetSpecItemParam(nItem, 2, nMaskIdx);
	SyncItem(nItem);
	start_book(nMaskIdx)
end;
	
function start_book(nMaskIdx)
	local nItem = GetTaskTemp(193);
	if (nItem <= 0) then
		return
	end;
	
	_, nTongID = GetTongName();
	local nRestCount = GetItemParam(nItem, 1)
	local nRestTime = getresttime(nRestCount) * 18;
	local nMask = 35;
	if (nMaskIdx > 0 and nMaskIdx <= 10) then
		nMask = TONG_GetTaskValue(nTongID, TTK_FACE[nMaskIdx]);
	end;

	if (nRestCount > 0) then
		-- TM_SetTimer(Ƶ�ʣ�ID�����������ͣ�0-������ʧ,1-��ʵʱ��,2-����ʱ��)
		TM_SetTimer(TIMER_FREQ, TIMER_ID, nRestCount, 2)
		nt_setTask(WSSZ_TK_USING, USE_YES);
		set_rest_count(nItem, 0)
		
		emitskill(nMask, nRestCount)
		Msg2Player("B�n �� m� ra V� song s�t tr�n!")
	end
end

function getresttime(nTimes)
	if (nTimes <= 0) then
		return 0
	end;
	return nTimes * 5;
end;

function closebook(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	ItemGenre, DetailType, ParticualrType = GetItemProp(nItem); --�õ���Ʒ���
	if (PlayerIndex ~= GetItemBelong(nItem) or ItemGenre ~= 6 or DetailType ~= 1 or ParticualrType ~= 1106) then
		return
	end;
	if (nRestCount <= 0) then
		nRestCount = TM_GetRestCount(TIMER_ID)
		-- ���ﻹҪ�ж�һ������timer����ļ��ܺ͸���˫ɱ���ǲ������ף�����ж�����˫ɱ��Ļ���
		-- if (������) then nRestCount = 0 end
		TM_StopTimer(TIMER_ID)
		if (not nRestCount or nRestCount <= 0) then
			Msg2Player("V� song s�t tr�n n�y �� ti�u hao h�t!")
			RemoveItemByIndex(nItem)
		else
			ChangeOwnFeature( 1, 0, 12);
			SetPkReduceState(0, 80, 80, 50);
			Msg2Player("V� song s�t tr�n �� ��ng l�i!")
			set_rest_count(nItem, nRestCount)
		end
		nt_setTask(WSSZ_TK_USING, USE_NO);
	else
		Say("B�n ch�a m� ra V� song s�t tr�n", 0);
		Msg2Player("B�n ch�a m� ra V� song s�t tr�n");
	end
end

function GetDesc(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	if (nRestCount <= 0) then
		return "<color=blue>V� song s�t tr�n n�y �� m�<color>"
	else
		return format("<color=blue>V� song s�t tr�n n�y c�n c� th� s� d�ng trong %d gi� %.2f ph�t<color>", floor(nRestCount / 360), mod(nRestCount, 360) / 6)
	end
end

function set_rest_count(nItem, nRestCount)
	SetSpecItemParam(nItem, 1, nRestCount)
	SyncItem(nItem)
end

function no()
	SetTaskTemp(193, 0);
end

function OnTimer()
	local nRestCount = TM_GetRestCount(TIMER_ID)

	if (nRestCount == 0) then --�������Ϊ0��
		nt_setTask(WSSZ_TK_USING, USE_NO);
		Msg2Player("V� song s�t tr�n n�y �� ti�u hao h�t.")
		return
	end
	
	_, nTongID = GetTongName();
	local nMask = GetTask(TK_MASK);
	
	emitskill(nMask, nRestCount);
	if (mod(nRestCount, 30) == 0 and nRestCount > 0) then
		Msg2Player("B�n �� m� ra <color=yellow>V� song s�t tr�n<color>, c� th� t�c d�ng <color=yellow>"..floor(nRestCount / 360).."<color> gi� <color=yellow>"..floor(mod(nRestCount, 360) / 6).."<color> ph�t.");
	end;
end

function emitskill(nMask, nRestCount) --������
	local nCamp = GetCamp();
	local nTongID;
	_, dwTongID = GetTongName();
	local tab_P = GetMapPlayerList( nCamp, 1, dwTongID );--������Ѱȫ��
	local nOrgPlayerIdx = PlayerIndex;
	--������Ȼ�������ϼ���  
	local nRestTime = 15 * 18;
	local nMaskIdx = GetTabFileData(MAPFILE, nMask + 2, 15);
	
	for i = 1, getn(tab_P) do
		PlayerIndex = tab_P[i];
		if (PlayerIndex > 0) then
			SetPkReduceState(nRestTime, 80, 80, 50);
			--������
			ChangeOwnFeature( 1, nRestTime, nMaskIdx);
		end;
	end
	
	PlayerIndex = nOrgPlayerIdx;
end;

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end
