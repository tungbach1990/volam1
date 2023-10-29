--ITEMTYPE
--SKILLTYPE
--SKILLLEVEL2
--SKILLLEVEL3
--SKILLLEVEL41
--SKILLLEVEL42
--ITEMNAME
--ITEMDFFECT

Include([[\script\missions\tong\tong_springfestival\head.lua]]);
Include([[\script\item\springfestival2006\itemhead.lua]]);

-- LLG_ALLINONE_TODO_20070802

function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	if (0 == itemuseplacecheck(ITEMTYPE)) then --�������߼��
		return 1;
	end;
	local i;
	local nGroupId = GetTask(TK_GROUPID);
	
	nGroupId = festival_getgroupid(nGroupId);
	if ("nil" == type(nGroupId)) then
	    Talk(1, "", "��o c� s� d�ng b� l�i!");
	end;
	if (nGroupId < 1 or nGroupId > SF_SMALLMAPCOUNT * 2) then
	    Talk(1, "", "��o c� s� d�ng b� l�i!");
	    return 1;
	end;
	
	local OldPlayer = PlayerIndex;
	local OldName = GetName();
	local idx = 0;
	local pidx;
	for i = 1, SF_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(SF_MISSIONID, idx, nGroupId);
		
		if (pidx > 0 and pidx ~= OldPlayer) then	--ѡ������������ж��֣�
			PlayerIndex = pidx;
			AddSkillState(SKILLTYPE, SKILLLEVEL2, SKILLLEVEL3, SKILLLEVEL41 * SKILLLEVEL42);
			Msg2Player("<#><color=0xB5FDD7>"..OldName.."<color> s� d�ng <color=0xB5FDD7>"..ITEMNAME.."<color>?"..ITEMDFFECT)
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	PlayerIndex = OldPlayer;
	Msg2Player("<#> B�n �� s� d�ng m�t <color=0xB5FDD7>"..ITEMNAME.."<color>?"..ITEMDFFECT);
end;