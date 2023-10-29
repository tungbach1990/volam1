-- 16.	����ҽ����ҩʦ��ÿ���˶Ի�����һ����������������������ɼ����ϵ�ҩ�ģ�20�����ӣ�ÿ�����Ӵ���һ��ҩ�ģ���
-- Ȼ���������ҩ�Ľ�����Ҫ�������˶��ش���ȷ1����ܹ��أ����д���������ش������ԾͲ����ټ����Ի��ˡ�
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

tbTASK16_RIDDLE = {
	{"C� H��ng", 		"Th�c ��a"},
	{"D� Qu�c", 		"Sinh ��a"},
	{"L�o Th�c Trung H�u", 	"Hau Ph�c"},
	{"b�nh nh�p cao hoang ",	"M�i D��c"},
	{"V� T�ng S�t T�u",	"Xuy�n T�m Li�n"},
	{"H�i nhi tham ki�n ph� v��ng","Th�i T� Tham"},
	{"��ng cay chua ng�t nh�t",	"Ng� V� T�"},
	{"L�o B�ng Sinh Ch�u",	"B�i M�u"},
	{"L�c L�m H�o H�n", 	"Th�o Kh�u "},
	{"Tam T�nh Ng� Th�n", 	"Ph�ng D�"},
	{"C�u Quy Nh�t", 	"B�ch H�p"},
	{"Kh� Ng�o Tam C�u", 	"nh�n ��ng "},
	{"C�t Khoa Y Sanh",	"t�c �o�n "},
	{"M�u S� Nan ���ng", 	"Kh� Tham"},
	{"H�ng S�c C� V�n", 	"��n Tham"},
	{"Thi�n Ph� Chi B�o",	"Xuy�n B�i"},
	{"Gi� K� Chi Ho�n",	"���ng Quy "},
	{"L�ng Ph� Ti�n T�i",	"Kim Ng�n Hoa"},
	{"H�c S�c Ho�n T�",	"� D��c"},
	{"H�ng Tr�n", 		"Chu Sa "},
}

pTask = Task:New(16)

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_npc = self:GetPosition().t16_npc
	local pos_box = self:GetPosition().t16_box
	self.m_NpcIndex = DlgNpcManager:AddNpc("Li�u D��c S�", 1718, mapid, pos_npc.x, pos_npc.y, self, 0)
	self.m_Box = {}
	for i = 1, 20 do
		local nNpcIndex = DlgNpcManager:AddNpc(tbTASK16_RIDDLE[i][2], 1698, mapid, pos_box[i].x, pos_box[i].y, self, i)
		tinsert(self.m_Box, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_NpcIndex > 0) then
		DlgNpcManager:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	if (self.m_Box) then
		for i = 1, getn(self.m_Box) do
			DlgNpcManager:DelNpc(self.m_Box[i])
		end
		self.m_Box = nil
	end
end

function pTask:Say(player, index)
	if (index == 0) then
		local caption = "Xin c�c ch� v� h�y ��n ch� c�a l�o phu nh�n m�t ��n D��c, c�n c� theo l�i b� �n tr�n ��n D��c l�y m�t lo�i D��c Li�u, sau �� c�c ch� v� h�y h�y l�y ��n D��c v� D��c Li�u th�ch h�p giao cho ta, n�u nh� m�i ng��i ��u t�m ��ng D��c Li�u th� c� th� qua �i, t�m sai th� h�y �o�n l�i"
		-- TODO: local options = {""}
	end
end
