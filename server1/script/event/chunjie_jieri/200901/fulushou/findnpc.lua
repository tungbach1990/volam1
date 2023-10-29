-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ�һ 2009������-��»��С��Ϸ

-- Edited by �ӷ��~
-- 2009/01/07 16:10
-- 
-- ======================================================

-- ��� ��»�������趨��Ѱ��·��

Include("\\script\\missions\\basemission\\lib.lua")	-- 
Include("\\script\\event\\chunjie_jieri\\200901\\fulushou\\findnpc_head.lua");	-- 

function chunjie0901_findnpc(nLineID, nTimed, nArryId)
	if(not TB_CHUNJIE0901_FINDNPC.tbLine[nLineID]) then
		
		return 0;
	end
	
	local tb_line = TB_CHUNJIE0901_FINDNPC.tbLine[nLineID]
	for i = 1, getn(tb_line) do
		local tb_npc = TB_CHUNJIE0901_FINDNPC.tbFuLuShouNpc[tb_line[i][1]];
		
		ClearMapNpcWithName(tb_npc.nMapId, tb_npc.szName);
		
		local n_ranpos = random(getn(tb_npc.tbPos));
		
		local n_npcidx = basemission_CallNpc(tb_npc, tb_npc.nMapId, tb_npc.tbPos[n_ranpos][1] * 8*32,tb_npc.tbPos[n_ranpos][2] * 16*32);
		
		if (n_npcidx) then
			SetNpcParam(n_npcidx, TB_CHUNJIE0901_FINDNPC.nNpcParam_selfid, tb_line[i][1]);
			SetNpcParam(n_npcidx, TB_CHUNJIE0901_FINDNPC.nNpcParam_nextid, tb_line[i][2]);
			SetNpcParam(n_npcidx, TB_CHUNJIE0901_FINDNPC.nNpcParam_ntimed, nTimed);
			SetNpcParam(n_npcidx, TB_CHUNJIE0901_FINDNPC.nNpcParam_ntype, TB_CHUNJIE0901_FINDNPC.tbArry[nArryId][i]);
			--Msg2SubWorld(format("%s-%d,%d,%d  %d",tb_npc.szName, tb_npc.nMapId, tb_npc.tbPos[n_ranpos][1] * 8,tb_npc.tbPos[n_ranpos][2] * 16, nTimed));
		end
	end
end
