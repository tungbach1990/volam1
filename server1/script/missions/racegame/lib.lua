-- �ļ�������lib.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-16 09:29:13
--��mission�޹صĺ���
IncludeLib("FILESYS")
Include("\\script\\lib\\coordinate.lua");
--ֻ�ܷ���һ������ֵ
function doFunByPlayer(nPlayerIndex, fun, ...)	
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex
	local re = call(fun, arg);
	PlayerIndex = nOldPlayer;
	return re
end


--
function doFunInWorld(nSubWorld, fun, ...)
	local nOldSubWorld = SubWorld;
	SubWorld = nSubWorld
	local re = call(fun, arg);
	SubWorld = nOldSubWorld;
	return re
end

function racegame_CallNpc(tbNpc, nMapId, nPosX, nPosY)
	nMapId	= nMapId or tbNpc.nMapId
	nPosX	= nPosX or tbNpc.nPosX 
	nPosY	= nPosY or tbNpc.nPosY
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then		
		local nNpcIndex = AddNpcEx(
			tbNpc.nNpcId,  --npc Id
			tbNpc.nLevel or 1,		-- �ȼ�
			tbNpc.nSeries or random(0,4),		-- ����
			nMapIndex,	-- ��ͼ
			nPosX,	-- X����
			nPosY,	-- Y����
			1,			-- ������
			tbNpc.szName,		-- ����
			tbNpc.nIsboss or 0
		);	-- �Ƿ�BOSS
		if tbNpc.szDeathScript then
			SetNpcDeathScript(nNpcIndex, tbNpc.szDeathScript);
		end
			
		if tbNpc.szScriptPath then 
			SetNpcScript(nNpcIndex, tbNpc.szScriptPath)
		end
		if tbNpc.nTime then
			SetNpcTimer(nNpcIndex, 18*tbNpc.nTime);
		end
	else
		--print("��ͼ "..nMapId.." û�м���")
	end
end