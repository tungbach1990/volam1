Include([[\script\missions\tong\tong_springfestival\head.lua]]);

-- LLG_ALLINONE_TODO_20070802
Include([[\script\item\springfestival2006\itemhead.lua]]);

function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
    if (0 == itemuseplacecheck(2)) then
		return 1;
	end;
    local i;
    for i = 668, 674 do
        AddSkillState(i, 10, 0, 0);
    end;
    AddSkillState(309, 10, 0, 5 * 18); --���ܹ���
    Msg2Player("B�n �� s� d�ng m�t <color=0xB5FDD7>Kim Thi�n C�<color>, trong <color=0xB5FDD7>5 gi�y<color> t�ng ph�ng th� tuy�t ��i.");
end;