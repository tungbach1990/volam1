SKILLTYPE = 670;
SKILLLEVEL2 = 5;
SKILLLEVEL3 = 0;
SKILLEFECT = "T�ng t�c �� di chuy�n trong 10 gi�y";

function main()
	AddSkillState(SKILLTYPE, SKILLLEVEL2, SKILLLEVEL3, 10 * 18); --�ڶ��������Ǽ��ܵļ���
	Msg2Player("<#>Ng��i nh�n ���c <color=0xB5FDD7>"..SKILLEFECT.."<color>");
end
