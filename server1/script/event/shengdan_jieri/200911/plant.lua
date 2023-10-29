-------------------------------------
-- description 	: ����ʥ����
-- author		: wangbin
-- date			: 2009.11.25
-------------------------------------

Include("\\script\\lib\\pay.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IL("SETTING")

GAME_FPS 			= 18
LIMIT_JOINCOUNT		= 7					-- ÿ��μӴ�������
LIMIT_PLANTCOUNT	= 1					-- ÿ��������������
TASK_JOINDATE  		= 1912				-- YMMDD * 100 + �μӴ���������Ϊ��ǰ���-2000
TASK_PLANTDATE 		= 1913				-- YMMDD * 100 + ��������������Ϊ��ǰ���-2000
LOG_HEAD			= "2009CHRISTMAS"
SCRIPT_TREE			= "\\script\\event\\shengdan_jieri\\200911\\tree.lua"

-- ���ִ��ͼID
NewbieMapTable = {
	20,		-- �����
	53,		-- ������
	174,	-- ��Ȫ��
	121,	-- ������
	153,	-- ʯ����
	101,	-- �����
	99,		-- ������
	100,	-- ������
	1,		-- ����
	11,		-- �ɶ�
	37,		-- �꾩
	78,		-- ����
	80,		-- ����
	162,	-- ����
	176,	-- �ٰ�
}

-- ���������
AwardTable = {
	Leader = {10000000, 15000000, 20000000},	-- �ӳ��Ĺ̶�������δת����1ת��2ת
	Member = {5000000,  8000000,  12000000},	-- ��Ա�Ĺ̶�������δת����1ת��2ת
	Extend = {0, 20, 30, 40, 50, 60, 70, 80}	-- ���⽱������������Ϊ1-8�˵İٷֱ�
}

-- ����ʥ����NPCINDEX�����Ķ�������
TreeTable = {}

function DelTree(TreeIdx)
	DelNpc(TreeIdx)
	TreeTable[TreeIdx] = nil
end

-- �׶δ�����
function Process(TreeIdx, Table)
	DelTree(TreeIdx)
	for Name, Step in Table.MemberState do
		if (Table.Step ~= Step) then
			BroadCast(Table, "C�y gi�ng sinh �� bi�n m�t")
			WriteLog(format("[%s]Tree[%d] timeout: Step(%d), Captain(%s), MemberCount(%d)",
				LOG_HEAD,
				TreeIdx,
				Table.Step,
				Table.Captain,
				Table.MemberCount))
			return 0
		end
	end
	-- ������һ���׶ε�NPC
	local NextStep = Table.Step + 1
	NewTree = CreateTree(ProcTable[NextStep].NpcId, Table)
	if (NewTree == 0) then
		WriteLog(format("[%s ERROR]Failed to create new tree: Tree[%d], Captain(%s), Step(%d)",
			LOG_HEAD,
			TreeIdx,
			Table.Captain,
			Table.Step))
		return 0
	end
	TreeTable[NewTree] = Table
	BroadCast(Table, ProcTable[NextStep].Hint)
	WriteLog(format("[%s]TreeChange[%d]=>[%d], Captain(%s), CurrentStep(%d)",
		LOG_HEAD,
		TreeIdx,
		NewTree,
		Table.Captain,
		Table.Step))
	return NewTree
end

function Wait(TreeIdx, Table)
	WriteLog(format("[%s]Tree[%d] stop award", LOG_HEAD, TreeIdx))
	return TreeIdx
end

function Destroy(TreeIdx, Table)
	DelTree(TreeIdx)
	WriteLog(format("[%s]Tree[%d] destroy", LOG_HEAD, TreeIdx))
	return 0
end

-- װ��ʥ����
function DecorateTree(TreeIdx, Table)
	local Step = Table.Step
	local Name = GetName()
	if (Table.MemberState[Name] ~= Step) then
		local Msg = ProcTable[Step].DlgMsg
		BroadCast(Table, format(Msg, Name))
		Table.MemberState[Name] = Step
	else
		Say(ProcTable[Step].ErrMsg)
	end
end

-- �����Ķ����ڹ㲥
function BroadCast(Table, Msg)
	local CurrentPlayerIdx = PlayerIndex
	for Name, _ in Table.MemberState do
		PlayerIndex = SearchPlayer(Name)
		if (PlayerIndex > 0) then
			Msg2Player(Msg)
		end
	end
	PlayerIndex = CurrentPlayerIdx
end

-- �Ƿ��ڶ�����
function InMemberList(Player, Table)
	for Name, _ in Table.MemberState do
		if (Name == Player) then
			return 1
		end
	end
	return 0
end

-- �콱
function Award(TreeIdx, Table)
	local Name = GetName()
	local Step = Table.MemberState[Name]
	if (Step == nil) then
		Say("H�y t�m c�y gi�ng sinh c�a m�nh �� l�nh th��ng!")
		return
	elseif (Step == Table.Step) then
		Say("��i hi�p �� nh�n th��ng r�i!")
		return
	end
	local IsCaptain = 0
	if (Name == Table.Captain) then
		IsCaptain = 1
	end
	local Exp = AwardExp(IsCaptain, ST_GetTransLifeCount(), Table.MemberCount)
	AddOwnExp(Exp)
	Table.MemberState[Name] = Table.Step
	
	Msg2Player(format("T� ��i c� %d ng��i, ��i hi�p nh�n %u �i�m kinh nghi�m", Table.MemberCount, Exp))
	WriteLog(format("[%s]Tree[%d]: %s get exp(%d)", LOG_HEAD, TreeIdx, Name, Exp))
	Say(format("Ch�c m�ng ��i hi�p �� nh�n ���c ph�n th��ng <color=red>%d<color> kinh nghi�m.", Exp))
end

-- �����콱����
function AwardExp(IsCaptain, TranCount, MemberCount)
	local BaseAward = AwardTable.Member
	local ExtAward = AwardTable.Extend
	if (IsCaptain == 1) then
		BaseAward = AwardTable.Leader
	end
	local BaseIdx = TranCount + 1
	if (BaseIdx > getn(BaseAward)) then
		BaseIdx = getn(BaseAward)
	end
	local ExtIdx = MemberCount
	if (ExtIdx > getn(ExtAward)) then
		ExtIdx = getn(ExtAward)
	end
	local Exp = BaseAward[BaseIdx]
	return Exp + floor(Exp * ExtAward[ExtIdx] / 100)
end

ProcTable = {
	[1] = {
		OnTimeout = Process,					-- ��ʱ�����ڴ����ĺ���
		Dialog = DecorateTree,					-- ��NPC�Ի�ѡ����ĺ���
		Timeout = 60,							-- ��ʱ��ʱ�䣨������
		DlgMsg = "Th�nh vi�n %s �� treo t�o th�nh c�ng l�n c�y gi�ng sinh.",	-- ���������ʾ
		ErrMsg = "�� treo t�o l�n c�y r�i.",			-- ����ʧ����ʾ
		Hint = "Xin m�i treo t�o l�n c�y gi�ng sinh!",			-- �׶ο�ʼʱ����ʾ
		Option = "Xin m�i treo t�o l�n c�y gi�ng sinh!",		-- �Ի�ѡ��,
		NpcId = 1490,							-- ��ͺͺ��ʥ����
		},
	[2] = {
		OnTimeout = Process,
		Dialog = DecorateTree,
		Timeout = 60,
		DlgMsg = "Th�nh vi�n %s �� treo ��n th�nh c�ng l�n c�y gi�ng sinh.",
		ErrMsg = "�� treo ��n l�n c�y r�i",
		Hint = "Xin m�i treo ��n l�n c�y gi�ng sinh!",
		Option = "Xin m�i treo ��n l�n c�y gi�ng sinh!",
		NpcId = 1491,	-- ����ƻ����ʥ����
		},
	[3] = {
		OnTimeout = Process,
		Dialog = DecorateTree,
		Timeout = 60,
		DlgMsg = "Th�nh vi�n %s �� treo k�o th�nh c�ng l�n c�y gi�ng sinh.",
		ErrMsg = "�� treo k�o l�n c�y r�i",
		Hint = "Xin m�i treo k�o l�n c�y gi�ng sinh",
		Option = "Xin m�i treo k�o l�n c�y gi�ng sinh",
		NpcId = 1492,	-- ���Ϲ����õ����
		},
	[4] = {
		OnTimeout = Process,
		Dialog = DecorateTree,
		Timeout = 60,
		DlgMsg = "Th�nh vi�n %s �� treo chu�ng th�nh c�ng l�n c�y gi�ng sinh.",
		ErrMsg = "�� treo chu�ng l�n c�y r�i.",
		Hint = "Xin m�i treo chu�ng l�n c�y gi�ng sinh.",
		Option = "Xin m�i treo chu�ng l�n c�y gi�ng sinh.",
		NpcId = 1493,	-- �����ǹ���õ����
		},
	[5] = {
		OnTimeout = Process,
		Dialog = DecorateTree,
		Timeout = 60,
		DlgMsg = "Th�nh vi�n %s �� treo ng�i sao th�nh c�ng l�n c�y gi�ng sinh.",
		ErrMsg = "�� treo ng�i sao l�n c�y r�i",
		Hint = "Xin m�i treo ng�i sao l�n c�y gi�ng sinh!",
		Option = "Xin m�i treo ng�i sao l�n c�y gi�ng sinh!",
		NpcId = 1494,	-- �����ӵ�õ����I
		},
	[6] = {
		OnTimeout = Wait,	
		Dialog = Award,
		Timeout = 300,
		Hint = "Ch�c m�ng c�c ��i hi�p, ch�ng ta �� c� 1 c�y gi�ng sinh th�t l�ng l�y v� �m �p!",
		Option = "Ta mu�n nh�n th��ng",
		NpcId = 1495,	-- �������ǵ�õ����
		},
	[7] = {
		OnTimeout = Destroy,
		Timeout = 24 * 3600 - 300,
		Option = nil,
	}
}

-- ����ʥ����
function CreateTree(Id, Table)
	local TreeIdx = AddNpc(Id, 1, Table.Pos[1], Table.Pos[2] * 32, Table.Pos[3] * 32, 1, Table.Captain)
	if (TreeIdx <= 0) then
		return 0
	end
	SetNpcScript(TreeIdx, SCRIPT_TREE)
	return TreeIdx
end

-- ����Ƿ������ִ�
function InNewbieCity()
	local MapId, _, _ = GetWorldPos()
	for i = 1, getn(NewbieMapTable) do
		if (MapId == NewbieMapTable[i]) then
			return 1
		end
	end
	return 0
end

-- �����ںʹ����ϳ��������ֵ
function EncodeTask(Date, Count)
	return Date * 100 + Count
end

-- ���������ֵ�ֽ�����ںʹ���
function DecodeTask(Task)
	local Date = floor(Task / 100)
	local Count = mod(Task, 100)
	return Date, Count
end

-- �ۼӴ���
function IncTaskCount(Task, CurrDate)
	local Date, Count = DecodeTask(Task)
	if (Date == CurrDate) then
		Count = Count + 1
	else
		Date = CurrDate
		Count = 1
	end
	return EncodeTask(Date, Count)
end

-- ��������ͲμӵĹ�������
function CheckCommonCondition(Err)
	-- Ҫ���ǳ�ֵ���
	if (IsCharged() == 0) then
		Err.Msg = format("Th�nh vi�n %s ch�a �� �i�u ki�n tham gia ho�t ��ng.", GetName())
		return 0
	end
	-- δת����>=150������ת����>=90��
	local ReqLevel = 90
	if (ST_IsTransLife() == 0) then
		ReqLevel = 150
	end
	if (GetLevel() < ReqLevel) then
		Err.Msg = format("Th�nh vi�n %s ch�a �� �i�u ki�n tham gia ho�t ��ng.", GetName())
		return 0
	end
	return 1
end

-- �����������
function CheckPlantCondition(CurrDate, Err)
	-- ֻ�ܶӳ�����
	local TeamId = GetTeam()
	if (TeamId == nil or IsCaptain() == 0) then
		Err.Msg = "Ph�i l� ��i tr��ng m�i c� th� trang tr� c�y gi�ng sinh!"
		return 0
	end
	-- ���������������
	local TaskDate, PlantCount = DecodeTask(PlayerFunLib:GetActivityTask(TASK_PLANTDATE))
	if (TaskDate == CurrDate and PlantCount >= LIMIT_PLANTCOUNT) then
		Err.Msg = format("M�t ng�y ch� c� th� tr�ng %d c�y gi�ng sinh!", LIMIT_PLANTCOUNT)
		return 0
	end
	return 1
end

-- ���μ�����
function CheckJoinCondition(CurrDate, Err)
	-- ÿ�˲μӴ�������
	local Task = PlayerFunLib:GetActivityTask(TASK_JOINDATE)
	if (Task ~= 0) then
		local TaskDate, JoinCount = DecodeTask(Task)
		if (CurrDate == TaskDate and JoinCount >= LIMIT_JOINCOUNT) then
			Err.Msg = format("%s �� tham gia �� %d l�n.", GetName(), LIMIT_JOINCOUNT)
			return 0
		end
	end
	return 1
end

-- �������Ա�Ƿ��������
function CheckTeamCondition(CurrDate, Err)
	local MemberCount = GetTeamSize()
	local Captain = PlayerIndex
	for i = 1, MemberCount do
		local Idx = GetTeamMember(i)
		-- �ӳ��Ѿ�������
		if (Idx ~= Captain) then
			PlayerIndex = Idx
			if (CheckCommonCondition(Err) == 0 or CheckJoinCondition(CurrDate, Err) == 0) then
				PlayerIndex = Captain
				return 0
			end
		end
	end
	PlayerIndex = Captain
	return 1
end

-- ����Ƿ��������������
function CheckCondition()
	-- ���ִ��ս����
	if (InNewbieCity() == 0 or GetFightState() == 1) then
		Msg2Player("Ch� c� th� � t�n th� th�n v� th�nh th� s� d�ng.")
		return 0
	end
	local CurrDate = mod(tonumber(GetLocalDate("%Y%m%d")), 100000)
	local Err = {Msg = ""}
	-- ��������ʸ�
	if (CheckCommonCondition(Err) == 0 or CheckPlantCondition(CurrDate, Err) == 0) then
		Msg2Player(Err.Msg)
		return 0
	end
	-- �������Ա����
	if (CheckTeamCondition(CurrDate, Err) == 0) then
		Msg2Team(Err.Msg)
		return 0	
	end
	return 1
end

-- ��ʼ��ʥ����������1���ɹ�������0��ʧ�ܣ�
function PlantTree()
	local Name = GetName()
	local Table = {
		Pos = {},
		Step = 1,
		Captain = Name,
		MemberState = {},
		MemberCount = 0
		}
	-- ���õ�ǰλ��
	Table.Pos[1] = SubWorld
	_, Table.Pos[2], Table.Pos[3] = GetWorldPos()
	local TreeIdx = CreateTree(ProcTable[Table.Step].NpcId, Table)
	if (TreeIdx == 0) then
		WriteLog(format("[%s ERROR]%s failed to plant tree", LOG_HEAD, Name))
		return 0
	end
	-- �ۼ���������
	local CurrDate = mod(tonumber(GetLocalDate("%Y%m%d")), 100000)
	local Task = IncTaskCount(PlayerFunLib:GetActivityTask(TASK_PLANTDATE), CurrDate)
	PlayerFunLib:SetActivityTask(TASK_PLANTDATE, Task)
	-- ����Ա�ۼӲμӴ���
	local CurrentPlayerIdx = PlayerIndex
	local MemberCount = GetTeamSize()
	Table.MemberCount = MemberCount
	for i = 1, MemberCount do
		PlayerIndex = GetTeamMember(i)
		if (PlayerIndex ~= CurrentPlayerIdx) then
			-- �����˲��ۼӲμӴ���
			Task = IncTaskCount(PlayerFunLib:GetActivityTask(TASK_JOINDATE), CurrDate)
			PlayerFunLib:SetActivityTask(TASK_JOINDATE, Task)
		end
		Table.MemberState[GetName()] = 0
	end
	PlayerIndex = CurrentPlayerIdx
	TreeTable[TreeIdx] = Table
	AddTimer(ProcTable[1].Timeout * GAME_FPS, "OnTime", TreeIdx)
	BroadCast(Table, format("%s �� ti�n h�nh tr�ng C�y gi�ng sinh, h�y nhanh ch�ng ti�n h�nh trang tr�!", Name))
	BroadCast(Table, "Xin m�i treo t�o l�n c�y gi�ng sinh!")
	WriteLog(format("[%s]%s plant Tree[%d]", LOG_HEAD, Name, TreeIdx))
	return 1
end

-- ��ʱ���ص�����
function OnTime(TreeIdx)
	local Table = TreeTable[TreeIdx]
	if (Table == nil) then
		WriteLog(format("[%s ERROR]OnTime: Tree[%d] is nil", LOG_HEAD, TreeIdx))
		return 0
	end
	local Result = ProcTable[Table.Step].OnTimeout(TreeIdx, Table)
	if (Result == 0) then
		return 0
	else
		local Step = Table.Step + 1
		Table.Step = Step
		return ProcTable[Step].Timeout * GAME_FPS, Result
	end
end

-- ��ʥ�����Ի�
function Dlg2Tree()
	local TreeIdx = GetLastDiagNpc()
	local Table = TreeTable[TreeIdx]
	if (Table == nil) then
		WriteLog(format("[%s]Dlg2Tree: Tree[%d] is nil", LOG_HEAD, TreeIdx))
	elseif (InMemberList(GetName(), Table) == 0) then
		Say("Xin m�i t�m ��n c�y gi�ng sinh c�a m�nh")
	else
		ProcTable[Table.Step].Dialog(TreeIdx, Table)
	end
end

function TreeDialog()
	local TreeIdx = GetLastDiagNpc()
	local Table = TreeTable[TreeIdx]
	if (Table == nil) then
		local Msg = format("[%s ERROR]TreeDialog: Tree[%d] is nil", LOG_HEAD, TreeIdx)
		WriteLog(Msg)
		return
	end
	local Caption = "��y l� m�t c�y gi�ng sinh th�t l�ng l�y v� �m �p."
	local Option = ProcTable[Table.Step].Option
	if (Option ~= nil) then
		Say(Caption,
			2,
			format("%s/%s", Option, "Dlg2Tree"),
			"Ta mu�n xem th� /Cancel")
	else
		Say(Caption)
	end
end
