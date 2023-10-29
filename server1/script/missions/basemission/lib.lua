-- �ļ�������lib.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-16 09:29:13
--��mission�޹صĺ���
IncludeLib("FILESYS")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\coordinate.lua");
--ֻ�ܷ���һ������ֵ
function doFunByPlayer(nPlayerIndex, fun, ...)	
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex
	local re = pack(call(fun, arg));
	PlayerIndex = nOldPlayer;
	return unpack(re)
end


--
function doFunInWorld(nSubWorld, fun, ...)
	local nOldSubWorld = SubWorld;
	SubWorld = nSubWorld
	local re = pack(call(fun, arg));
	SubWorld = nOldSubWorld;
	return unpack(re)
end

function basemission_CallNpc(tbNpc, nMapId, nPosX, nPosY)
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
			tbNpc.bNoRevive or 1,			-- ������
			tbNpc.szName,		-- ����
			tbNpc.nIsboss or 0
		);	-- �Ƿ�BOSS
		if nNpcIndex <= 0 then
			return nil
		end
		if tbNpc.szDeathScript then
			SetNpcDeathScript(nNpcIndex, tbNpc.szDeathScript);
		end
			
		if tbNpc.szScriptPath then 
			SetNpcScript(nNpcIndex, tbNpc.szScriptPath)
		end
		if tbNpc.nTime then
			SetNpcTimer(nNpcIndex, 18*tbNpc.nTime);
		end
		
		if tbNpc.nCurCamp then
			SetNpcCurCamp(nNpcIndex, tbNpc.nCurCamp)
		end
		if tbNpc.tbNpcParam then
			for i =1, getn(tbNpc.tbNpcParam) do 
				if tbNpc.tbNpcParam[i] then
					SetNpcParam(nNpcIndex, i, tbNpc.tbNpcParam[i])
				end
			end
		end
		if tbNpc.pCallBack then
			tbNpc:pCallBack(nNpcIndex)
		end
		return nNpcIndex;
	else
		--print("��ͼ "..nMapId.." û�м���")
		return nil
	end
end