--��head�е�һЩ����������������Include���ƶ������
Include("\\script\\missions\\newcitydefence\\head.lua")

function OnNpcTrap(nNpcIdx)
--print("npc",nTrapId )

	local targetfile;
	local x, y;
	local addpatrol = mod(nTrapId, 100) * 5;
	targetfile = [[\settings\maps\newcitydefence\trappos]]..(nTrapId + 1)..[[.txt]];
	x, y = bt_getadata(targetfile);
--	print("Npc:"..nNpcIdx..",Goto"..(nTrapId + 1)..","..x..","..y)
	SetNpcAI(nNpcIdx,9,(20 + addpatrol),-1,-1,-1,-1,-1,0,x ,y );
	if nTrapId == 1014 or nTrapId == 2012 or nTrapId == 3013 then
			local szNpcName = GetNpcName(nNpcIdx)
			local citycamp = GetMissionV( MS_CITYCAMP )
			local npccamp = 1
			local npcname = "Qu�n T�ng"
			if ( citycamp == 1 ) then
				npccamp = 2
				npcname = "Qu�n Kim"
			end
			if szNpcName == format("%s%s",npcname,tbSOLDIER_NAME[6]) then
				DelNpc(nNpcIdx)
				local ndefence = GetMissionV( MS_HOMEDEFENCE )
				SetMissionV( MS_HOMEDEFENCE,ndefence - NHOMEDEFENCE_DAMAGE )
				Msg2MSAll(MISSIONID, format("<color=yellow>%s qu�n ��i ph��ng �ang t�n c�ng, �i�m th� th�nh gi�m 1 �i�m, hi�n t�i c�n l�i %s �i�m!!!",tbSOLDIER_NAME[6],ndefence-1))
				if ndefence == 1 then
					CloseMission( MISSIONID )
				end
			end
	end
end;

function main()
--local w, x, y =GetWorldPos()
--print(nTrapId.."trapid "..(x*32).."	"..(y*32))
	if (nTrapId == 1013 or nTrapId == 2012 or nTrapId == 3012) then
		if (GetMissionV(MS_STATE) == 1) then
			Talk(1, "", "Tr��c khi khai chi�n c�c t��ng s� trong th�nh ��i l�nh, chu�n b� ngh�nh ��ch!")
			if (nTrapId == 1013) then
				SetPos(1605, 3200)
			elseif (nTrapId == 2012) then
				SetPos(1659, 3257)
			elseif (nTrapId == 3012) then
				SetPos(1714, 3312)
			end
		end
	end
end