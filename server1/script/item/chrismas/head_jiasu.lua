--ITEMTYPE
--SKILLTYPE
--SKILLLEVEL2
--SKILLLEVEL3
--SKILLLEVEL41
--SKILLLEVEL42
--SKILLEFECT

Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	local tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx and race_ItemMapCheck() == 0) then
		Talk(1, "", "��o c� n�y kh�ng d�ng ���c � khu v�c n�y.");
		return 1;
	end;
	AddSkillState(SKILLTYPE, SKILLLEVEL2, SKILLLEVEL3, SKILLLEVEL41 * SKILLLEVEL42); --�ڶ��������Ǽ��ܵļ���
	Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7>"..SKILLEFECT.."<color>");
end;