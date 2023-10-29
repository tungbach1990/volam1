jiefang_0804_NpcList =
{
	{szName = "Thi�t Ng�u ��i V��ng", nLevel = 95, nIsboss = 1, nNpcId = 1340, szDeathScript = "\\script\\event\\jiefang_jieri\\200804\\mieshanzei\\bossdeath.lua"},
	{szName = "S�n t�c ��u l�nh", nLevel = 95, nIsboss = 1, nNpcId = 725},
	
}

function jiefang_0804_CallBoss(nMapId, nX, nY)
	jiefang_0804_CallNpc(jiefang_0804_NpcList[1], nMapId, (nX*8+random(-3,3)) *32, (nY*16+random(-7,7))*32)
	
end


function jiefang_0804_CallReinforce(nMapId, nX, nY, nCount)
	for i= 1, nCount do
		jiefang_0804_CallNpc(jiefang_0804_NpcList[2], nMapId, (nX*8+random(-3,3)) *32, (nY*16+random(-7,7))*32)
	end
end

function jiefang_0804_CallNpc(tbNpc, nMapId, nPosX, nPosY)
	nMapId	= nMapId or tbNpc.nMapId
	nPosX	= nPosX or tbNpc.nPosX 
	nPosY	= nPosY or tbNpc.nPosY
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then		
		local nNpcIndex = AddNpcEx(
			tbNpc.nNpcId,  --npc Id
			tbNpc.nLevel,		-- �ȼ�
			tbNpc.nSeries or random(0,4),		-- ����
			nMapIndex,	-- ��ͼ
			nPosX,	-- X����
			nPosY,	-- Y����
			1,			-- ������
			tbNpc.szName,		-- ����
			tbNpc.nIsboss
		);	-- �Ƿ�BOSS
		if tbNpc.szDeathScript then
			SetNpcDeathScript(nNpcIndex, tbNpc.szDeathScript);
		end
			
		if tbNpc.szScriptPath then 
			SetNpcScript(nNpcIndex, tbNpc.szScriptPath)
		end
	else
		--print("��ͼ "..nMapId.." û�м���")
	end
end