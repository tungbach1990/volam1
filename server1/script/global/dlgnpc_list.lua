-- �Ի�NPC�б� 
-- wangbin 2010.12.10
-- �������Ͳ�����Ϊ�½��Ի�NPC���öԻ��ű���ֻҪֱ��ʵ��һ����Ϳ���

-- ���磺��������Ľű�������ʵ��һ����NpcChefu
-- ����
-- NpcChefu = {
-- 	m_Caption = "����Ҫ����ȥ���",
-- 	m_Options = {
-- 		"��Ҫȥ�ɶ�",
-- 		"��Ҫȥ����",
-- 		"��Ҫȥ�꾩",
-- 		"��Ҫȥ����",
-- 		"��Ҫȥ����",
-- 		"��Ҫȥ�ٰ�",
-- 		"�Ķ�Ҳ��ȥ"
-- 	}
-- }
-- ����ֵ��string, {string, string, ...}
-- ���ߣ�string
-- function NpcChefu:Say(player, param)
-- 	return self.m_Caption, self.Options
-- end
-- 
-- sel��m_Options������
-- function NpcChefu:OnAnswer(player, sel, param)
-- 	if (sel > 0 and sel < 8) then
-- 		local mapid, x, y = GetStationPos(sel)
-- 		if (mapid ~= nil and NewWorld(mapid, x, y) == 1) then
-- 			Msg2Player("�����ˣ������߆���")
-- 		end
-- 	end
-- end
-- ���ӳ���NPC����������Ϊ�����֣�npcid��mapid, x, y, ʵ����
-- nNpcIndex = DlgNpcManager:AddNpc("����", 238, 949, 51264, 101984, NpcChefu)
-- ɾ������NPC:
-- DlgNpcManager:DelNpc(nNpcIndex)

Include("\\script\\global\\playerlist.lua")

DlgNpcManager = {
	m_Npcs = {},
	m_Idxs = {},
	m_Index = 0,
}

function DlgNpcManager:AddNpc(name, npcid, mapid, x, y, npc, param)
	local index = AddNpc(npcid, 1, SubWorldID2Idx(mapid), x, y, 1, name, 0)
	if (index <= 0) then
		WriteLog(format("[ERROR]Failed to create dialog npc(%s,%d,%d,%d,%d)", name, npcid, mapid, x, y))
		return 0
	end
	local tb = {}
	tb.Npc = npc
	tb.Index = index
	tb.PackNo = curpack()
	tb.Param = param
	SetNpcScript(index, "\\script\\global\\dlgnpc_list.lua", index)
	self.m_Index = self.m_Index + 1
	self.m_Npcs[self.m_Index] = tb
	self.m_Idxs[index] = self.m_Index
	return self.m_Index
end

function DlgNpcManager:DelNpc(index)
	local tb = self.m_Npcs[index]
	if (tb ~= nil) then
		if (tb.Index > 0) then
			DelNpc(tb.Index)
		end
		self.m_Npcs[index] = nil
		self.m_Idxs[tb.Index] = nil
	end
end

function DlgNpcManager:GetNpcIndex(index)
	local tb = self.m_Npcs[index]
	if (not tb) then
		return 0 
	end
	return tb.Index
end

function DlgNpcManager:GetNpc(index)
	local nIndex = self.m_Idxs[index]
	if (not nIndex) then
		return nil
	end
	return self.m_Npcs[nIndex]
end

function say(player, index, caption, options)
	if (caption ~= nil) then
		base = base or 0
		if (not options) then
			player:Say(caption)
		elseif (type(options) == "table") then
			local answers = {}
			for i = 1, getn(options) do
				tinsert(answers, format("%s/#select(%d,%d)", options[i], index, i))
			end
			player:Say(caption, getn(answers), answers)
		elseif (type(options) == "string") then
			local option = format("%s/select(%d,%d)", options, index, 1)
			player:Say(caption, 1, option)
		end
	end
end

function main(index)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return
	end
	local tb = DlgNpcManager:GetNpc(index)
	if (not tb or not tb.Npc or not tb.Npc.Say) then
		return
	end
	local pack = usepack(tb.PackNo)
	local caption, options, base = tb.Npc:Say(player, tb.Param)
	say(player, index, caption, options)
	usepack(pack)
end

function select(index, sel)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return
	end
	local tb = DlgNpcManager:GetNpc(index)
	if (not tb or not tb.Npc or not tb.Npc.OnAnswer) then
		return
	end
	local pack = usepack(tb.PackNo)
	local caption, options = tb.Npc:OnAnswer(player, sel, tb.Param)
	say(player, index, caption, options)
	usepack(pack)
end
