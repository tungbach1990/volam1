--SKILLTYPE
--SKILLLEVEL
--SKILLNAME
--SKILLDESCRIBE

Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	local tabidx = itemmapcheck(TAB_ACTION);
	if (0 ~= tabidx) then
		CastSkill(SKILLTYPE, SKILLLEVEL);
		Msg2Player("B�n �� s� d�ng m�t <color=0xB5FDD7>"..SKILLNAME.."<color>?"..SKILLDESCRIBE);
		local nGroupId = GetTask(TAB_ACTION[tabidx][3]);
		Msg2MSGroup(TAB_ACTION[tabidx][2], "<color=0xB5FDD7>"..GetName().."<color> s� d�ng <color=0xB5FDD7>"..SKILLNAME.."<color>"..SKILLDESCRIBE, nGroupId);
		return 0;
	end;
	------��ѯ�±�
	tabidx = race_ItemMapCheck()
	
	if tabidx ~= 0 then --�±����ж���
		local tbRace = RACE_TAB_ACTION[tabidx]
		CastSkill(SKILLTYPE, SKILLLEVEL);
		Msg2Player("B�n �� s� d�ng m�t <color=0xB5FDD7>"..SKILLNAME.."<color>?"..SKILLDESCRIBE);
		local nGroupId = 0
		if type(tbRace.GetGroupId) == "function" then
			nGroupId = tbRace:GetGroupId()
		end
		Msg2MSGroup(tbRace.nMissionId, "<color=0xB5FDD7>"..GetName().."<color> s� d�ng <color=0xB5FDD7>"..SKILLNAME.."<color>"..SKILLDESCRIBE, nGroupId);
		return 0;
	end
	Talk(1, "", "��o c� n�y kh�ng d�ng ���c � khu v�c n�y.");
	return 1
end;
