--����ű�������Ե���ʹ�ã�
--szItem
--szEffect
--nSkillId
--nSkillLevel
--nTime;
-- LLG_ALLINONE_TODO_20070802

Include([[\script\item\springfestival2006\itemhead.lua]]);
tabidx = 0;
function main(itemIdx)
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	local i;
	local nGroupId = GetTask(TAB_ACTION[tabidx][3]);
	if (TAB_ACTION[tabidx][5][1] == 1) then
		nGroupId = getgroupid(nGroupId, TAB_ACTION[tabidx][5][2]);
	end;
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	
	local szName;
	local idx = 0;
	local pidx;
	local j = 1;
	for i = 1, TAB_ACTION[tabidx][4] do
		idx, pidx = GetNextPlayer(TAB_ACTION[tabidx][2], idx, nGroupId);
		if (pidx > 0 and pidx ~= OldPlayer) then	--ѡ������������ж��֣�
			PlayerIndex = pidx;
			tabPlayer[j] = make_option("useyu");
			j = j + 1;
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	PlayerIndex = OldPlayer;
	tabPlayer[ getn(tabPlayer) + 1 ] = "H�y b� /giveback_yu"
	Say("B�n mu�n s� d�ng ��o c� <color=0xB5FDD7>"..szItem.."<color> n�y cho ��i th� n�o?", getn(tabPlayer), tabPlayer);
end;

function useyu(szName)
	local pidx = check_pl(szName, TAB_ACTION[tabidx][2]);
	if (not pidx) then
		giveback_yu()
		return
	end
	
	local OldName = GetName()
	local OldPlayer = PlayerIndex;
	PlayerIndex = pidx;
	AddSkillState(nSkillId, nSkillLevel, 0, nTime * 18)
	Msg2Player("<#><color=0xB5FDD7>"..OldName.."<color> �� nh�m v�o b�n s� d�ng <color=0xB5FDD7>"..szItem.."<color>?"..szEffect);
	
	PlayerIndex = OldPlayer;
	Msg2Player("<#> B�n<color=0xB5FDD7>"..szName.."<color> s� d�ng <color=0xB5FDD7>"..szItem.."<color>?"..szEffect);
end;


function giveback_yu()
	AddItem(6,1,nDetail,1,1,1)
end