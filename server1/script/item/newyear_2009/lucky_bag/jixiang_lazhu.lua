IncludeLib("SETTING"); --����SETTING�ű�ָ���
Include("\\script\\item\\newyear_2009\\head.lua");

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_lazhu_expiredtime) then
		Msg2Player("V�t ph�m n�y �� qu� h�n.");
		return 0;
	end
	AddSkillState(440, 1, 1, 64800);
end