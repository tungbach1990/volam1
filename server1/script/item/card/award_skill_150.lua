Include("\\script\\misc\\daiyitoushi\\toushi_head.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_feature\\getskills.lua")

if not tbGMCommand then tbGMCommand = {} end

TB_FACTION_SKILL_150 = 
{
	shaolin =
	{
		{"Thi�u L�m Quy�n", 1055},
		{"C�n Thi�u L�m", 1056},
		{"Thi�u L�m �ao", 1057},	
	},
	tianwang =
	{
		{"Ch�y Thi�n V��ng", 1058},	
		{"Th��ng Thi�n V��ng", 1059},	
		{"�ao Thi�n V��ng", 1060},	
	},
	wudu =
	{	
		{"Ng� ��c ch��ng",1066},
		{"Ng� ��c �ao", 1067},	
	},
	tangmen =
	{
		{"���ng M�n phi �ao", 1069},
		{"���ng M�n n�", 1070},	
		{"���ng M�n ti�u", 1071},
		{"���ng M�n H�m T�nh", 1110},
	},
	emei =
	{
		{"Nga Mi ki�m", 1061},	
		{"Nga Mi ch��ng", 1062},	
		{"Nga My Buff", 1114},
	},
	cuiyan =
	{
		{"Th�y Y�n �ao", 1063},	
		{"Th�y  Y�n n�i", 1065},	
	},
	gaibang =	
	{
		{"C�i Bang ch��ng", 1073},
		{"C�i Bang c�n", 1074},	
	},
	tianren =	
	{
		{"Thi�n Nh�n chi�n", 1075},	
		{"Thi�n Nh�n ma", 1076},	
	},
	wudang =
	{
		{"V� �ang kh�", 1078},	
		{"V� �ang ki�m", 1079},	
	},
	kunlun =
	{
		{"�ao C�n L�n", 1080},	
		{"Ki�m C�n L�n", 1081},	
	},
	huashan =
	{
		{"Hoa S�n Ki�m", 1369},	
		{"Hoa S�n Kh�", 1384},	
	}
}

function tbGMCommand:ShowDialogSkill150()
	local tbOpt = {}
	local szTitle = "Xin h�i ��i hi�p t�m ta c� vi�c g�?"
	tinsert(tbOpt, "Nh�n skill 1x - 12x /#tbGMCommand:GiveAwardSkill2()")
	tinsert(tbOpt, "Nh�n skill 150 /#tbGMCommand:GiveAwardSkill()")	
	tinsert(tbOpt, "H�y Skill 150 /#tbGMCommand:reDuceSkill()")
	tinsert(tbOpt,"Tho�t/#tbGMCommand:Cancel()")
	Say(szTitle,getn(tbOpt),tbOpt)
end
 
 function tbGMCommand:GiveAwardSkill2()
 	local nFaction = GetLastFactionNumber()
  	if nFaction < 0 then
  		Talk("", 1, "��i hi�p v�n ch�a nh�p ph�i kh�ng th� nh�n k� n�ng n�y.")
  		return
  	end
  	ST_LevelUp(200 -  GetLevel())
  	local tbSkill = TB_DAIYITOUSHI_FACTS[nFaction + 1].tbSkillID
  	if not tbSkill then
  		Talk("", 1, "H�c k� n�ng th�t b�i, vui l�ng li�n h� nh� ph�t h�nh �� ���c h� tr�")
  		return
  	end
  	
  	for key, val in tbSkill do
	  	if key ~= 150 and key ~= "150" then	
	  		--print("==key "..key)
	  		for i = 1, getn(val) do
	  			if type(val[i]) == "table" then
	  				--print("val "..val[i][1])
	  				AddMagic(val[i][1], 20)
	  			elseif key < 90 then
	  				--print("val "..val[i])
	  				AddMagic(val[i], 20)
	  			elseif key >=  90 then
	  				--print("val "..val[i])
	  				AddMagic(val[i], 20)
	  			end
	  			--AddMagic(val[i], 20)	  			
	  		end
	  	end	 	
  	end
  	Msg2Player("Nh�n skill m�n ph�i th�nh c�ng")
  	
  	local szFaction = GetFaction()
  	%SetAllTasks(szFaction)
  	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)--xu�t s� ch� ��
 end
 
 function tbGMCommand:GiveAwardSkill()
 	if (GetLastFactionNumber() == -1) then
		Talk(1,"","��i hi�p ch�a gia nh�p m�n ph�i")
		return 
	end
	if (ST_GetTransLifeCount() < 2 ) then
		Talk(1,"","��i hi�p ph�i tr�ng sinh l�n 2 m�i ���c nh�n skill 150")
		return
	end
	if (PlayerFunLib:CheckLevel(150,"default",">=") ~= 1) then
		return
	end
 	--AskClientForNumber("GiveAwardSkill150",1,25,"Nh�p c�p �� skill 150  t� 1 ��n 25")
 	GiveAwardSkill150(21)
 end
 
function GiveAwardSkill150(nCount)
	if (nCount <= 0 or nCount > 25) then
		return
	end
	local szFaction = GetLastAddFaction()
	local tbFactionSkill = TB_FACTION_SKILL_150[szFaction]
	if (getn(tbFactionSkill) > 0) then
		for i = 1, getn(tbFactionSkill) do
			AddMagic(tbFactionSkill[i][2], nCount)
		end
	end
	Msg2Player("Nh�n skill 150 m�n ph�i th�nh c�ng")
  	
end

function tbGMCommand:reDuceSkill()
 	local  nRet = 0
 	local szFaction = GetLastAddFaction()
	local tbFactionSkill = TB_FACTION_SKILL_150[szFaction]
	if (getn(tbFactionSkill) > 0) then
		for i = 1, getn(tbFactionSkill) do
			if(HaveMagic(tbFactionSkill[i][2])) then
				DelMagic(tbFactionSkill[i][2])
			end
		end
	else
		Msg2Player("��i hi�p Kh�ng c� skill 150")
	end
	UpdateSkill()
	if nRet == 1 then 	Msg2Player("�� h�y th�nh c�ng Skill 150") 	end
 end

