--ITEMTYPE
--SKILLTYPE
--SKILLLEVEL
--SKILLNAME

Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx and race_ItemMapCheck() == 0) then
		Talk(1, "", "��o c� n�y kh�ng d�ng ���c � khu v�c n�y.");
		return 1;
	end;
	CastSkill(SKILLTYPE, SKILLLEVEL)
	Msg2Player("<#> B�n �� b� tr� m�t <color=0xB5FDD7>"..SKILLNAME.."<color>");
end;
