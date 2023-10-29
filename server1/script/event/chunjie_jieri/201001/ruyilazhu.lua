Include("\\script\\global\\judgeoffline_limit.lua");
Include("\\script\\missions\\basemission\\lib.lua")

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= 20100329) then
		Msg2Player("V�t ph�m n�y �� qu� h�n.");
		return 0;
	end
	
	if (offlineCheckPermitRegion() ~= 1) then
		Msg2Player("Kh�ng ���c s� d�ng v�t ph�m n�y t�i ��y");
		return 1;
	end
	
	local nTeamSize = GetTeamSize();
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			doFunByPlayer(GetTeamMember(i), AddSkillState, 892, 1, 1, 64800);
		end
	else -- һ����
		AddSkillState(892, 1, 1, 64800);
	end
	
	
  local nMapId, nPosX16, nPosY16 = GetWorldPos();
  local SId = SubWorldID2Idx(nMapId);
  local nNpcIndex;
  if (SId >= 0) then
	  if (random(1,100) <= 50) then
	  	nNpcIndex = AddNpc(1333, 1, SId, nPosX16 * 32, nPosY16 * 32, 1, "C�y ��o");
	  	if nNpcIndex > 0 then
	  		SetNpcScript(nNpcIndex,"\\script\\event\\chunjie_jieri\\201001\\taoshu.lua");
	  		SetNpcTimer(nNpcIndex, 24*60*60*18);
	  	end
	  else
	  	nNpcIndex = AddNpc(1334, 1, SId, nPosX16 * 32, nPosY16 * 32, 1, "C�y Mai");
	  	if nNpcIndex > 0 then
	  		SetNpcScript(nNpcIndex,"\\script\\event\\chunjie_jieri\\201001\\taoshu.lua");
	  		SetNpcTimer(nNpcIndex, 24*60*60*18);
	  	end
	  end
	end
	
	return 0;
end