IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")

KILLBOSSTIEUEXPAWARD = 1000000
KILLBOSSTIEUNEAREXPAWARD = 500000


local tbBossItemDropAward = {

	{{szName="V� L�m M�t T�ch",tbProp={6,1,26,1,0,0},nCount=1,nRate=0.5},},
	{{szName="T�y T�y Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=0.5},},
 	{{szName="Thi�t La H�n",tbProp={6,1,23,1,0,0},nCount=1,nRate=10},},	
	{{szName="T� Th�y Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=2},},
	{{szName="Lam Th�y Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=2},},
	{{szName="L�c Th�y Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=2},},
	{{szName="Tinh H�ng B�o Th�ch",tbProp={4,353,1,1,0,0},nCount=1,nRate=2},},
	{{szName="B�ch Qu� L�",tbProp={6,1,73,1,0,0},nCount=1,nRate=10},},
	{{szName="Phi Phong",tbProp={6,1,15,1,0,0},nCount=1,nRate=20},},
	-- {{szName="Ph�c Duy�n (ti�u)",tbProp={6,1,122,1,0,0},nCount=1,nRate=30},},
	-- {{szName="Ph�c Duy�n (trung)",tbProp={6,1,123,1,0,0},nCount=1,nRate=30},},
	-- {{szName="Ph�c Duy�n (��i)",tbProp={6,1,124,1,0,0},nCount=1,nRate=10},},
	-- {{szName="��i l�c ho�n",tbProp={6,0,3,1,0,0},nCount=1,nRate=9},},
	-- {{szName="��i l�c ho�n",tbProp={6,0,6,1,0,0},nCount=1,nRate=10},},
	--{{nExp = 1000000, nRate=25},},

}

function OnDeath( nNpcIndex )
	--AddExp(1000000)
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbBossItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))	
	--local szNews = format("��i hi�p <color=yellow>%s<color> t�i <color=yellow>%s<color> �� ti�u di�t th�nh c�ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	--AddGlobalNews(szNews);
	--LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
--==--
local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSTIEUEXPAWARD, 0, format("%s ph�n th��ng","Kinh nghi�m �� b�i BOSS ti�u "));
			Msg2Player("��i hi�p nh�n ���c kinh nghi�m team gi�t boss: "..KILLBOSSTIEUEXPAWARD)
		end
	else -- һ����
		szName = GetName();
		PlayerFunLib:AddExp(KILLBOSSTIEUEXPAWARD, 0, format("%s ph�n th��ng","Kinh nghi�m �� b�i BOSS ti�u "));
		Msg2Player("��i hi�p nh�n ���c kinh nghi�m gi�t boss: "..KILLBOSSTIEUEXPAWARD)
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSTIEUNEAREXPAWARD, 0, format("%s ph�n th��ng","Kinh nghi�m ��ng g�n l�c BOSS ti�u "));
		Msg2Player("��i hi�p nh�n ���c kinh nghi�m ��ng g�n boss: "..KILLBOSSTIEUNEAREXPAWARD)
	end
		--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbBossItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))	

	local szNews = format("��i hi�p <color=yellow>%s<color> t�i <color=yellow>%s<color> �� ti�u di�t th�nh c�ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	AddGlobalNews(szNews);
--==--
end;

