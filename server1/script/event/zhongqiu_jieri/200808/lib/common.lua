--zhongchaolong
--һЩ���ú���


function zhongqiu0808_CallNpc(tbNpc, nMapId, nPosX, nPosY)
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
		if tbNpc.tbNpcParam then
			for i =1, getn(tbNpc.tbNpcParam) do 
				if tbNpc.tbNpcParam[i] then
					SetNpcParam(nNpcIndex, i, tbNpc.tbNpcParam[i])
				end
			end
		end
	else
		--print("��ͼ "..nMapId.." û�м���")
	end
end