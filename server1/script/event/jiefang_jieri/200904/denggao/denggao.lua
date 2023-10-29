IncludeLib("RELAYLADDER")

Include("\\script\\lib\\awardtemplet.lua");
tbDenggaoItemAward =
{
	[1]		= {szName = "T�i th�c �n",		tbProp = {3, 6, 1, 2018, -1},	nScore = 10},
	[2]		= {szName = "B�nh n��c", 		tbProp = {3, 6, 1, 2019, -1},	nScore = 30},
	[3]		= {szName = "T�i v�t d�ng c� nh�n", 	tbProp = {3, 6, 1, 2016, -1},	nScore = 260},
	[4]		= {szName = "T�i Y T�", 		tbProp = {3, 6, 1, 2017, -1},	nScore = 60},
};

tbDenggaoScore =
{
	[1]	= {500, 	2000000,	"Xin ch�c m�ng! B�n �� ��t ��n �� cao 500m, con ���ng ph�a tr��c s� r�t cheo leo v� hi�m tr�, h�y c� l�n nh�!"},
	[2]	= {1000, 	3000000,	"Xin ch�c m�ng! B�n �� ��t ��n �� cao 1000m, con ���ng ph�a tr��c s� r�t cheo leo v� hi�m tr�, h�y c� l�n nh�!"},
	[3]	= {1500, 	5000000,	"Xin ch�c m�ng! B�n �� ��t ��n �� cao 1500m, con ���ng ph�a tr��c s� r�t cheo leo v� hi�m tr�, h�y c� l�n nh�!"},
	[4]	= {2000, 	10000000,	"Xin ch�c m�ng! B�n �� ��t ��n �� cao 2000m, con ���ng ph�a tr��c s� r�t cheo leo v� hi�m tr�, h�y c� l�n nh�!"},
	[5]	= {2200, 	15000000,	"M�t tr�i �� ��ng b�ng, h�y d�ng ch�n 1 l�t. T� ��y tr� �i, ch�ng ta s� ph�i v��t qua r�t nhi�u ng�n n�i cao h�n"},
	[6]	= {2800, 	20000000,	"Tr�i �� t�i r�i, h�y d�ng l�u �� ngh� ng�i, ��m nay ch�ng ta s� c�ng ��t l�a v� ca h�t!"},
	[7]	= {2900, 	20000000,	"Ch�c h�n s�c kh�e c�a b�n �� h�i ph�c sau 1 ��m ngon gi�c. C�n ch�n ch� g� n�a, h�y t�ng t�c th�t nhanh �� c�ng l�n ��nh Fansipan n�o"},
	[8]	= {3000, 	20000000,	"C� g�ng l�n n�o. Ch�ng ta �� nh�n th�y ��nh Fansipan r�i!"},
	[9]	= {3143, 	30000000,	"Ch�c m�ng! B�n �� chinh ph�c ��nh FanXiPan r�i!"},
};

tbTop10Award	=
{
	[1]	=
	{
		[1]	= {szName = "Thi�n S�n Tuy�t Li�n", tbProp = {6, 1, 1431, 1, 0, 0}}, 
		[2]	= {szName = "Huy�n Ch�n ��n",	tbProp = {6, 1, 1678, 1, 0, 0}, tbParam = {1500000000}},
		[3]	= {szName = "Th�n b� kho�ng th�ch", tbProp = {6, 1, 398, 1, 0, 0}},
	},
	[2]	=
	{
		[1]	= {szName = "Thi�n S�n Tuy�t Li�n", tbProp = {6, 1, 1431, 1, 0, 0}}, 
		[2]	= {szName = "Huy�n Ch�n ��n",	tbProp = {6, 1, 1678, 1, 0, 0}, tbParam = {1500000000}},
	},
	[3]	=
	{
		[1]	= {szName = "Thi�n S�n Tuy�t Li�n", tbProp = {6, 1, 1431, 1, 0, 0}},
		[3]	= {szName = "Th�n b� kho�ng th�ch", tbProp = {6, 1, 398, 1, 0, 0}},
	},
	[4]	= {szName = "Thi�n S�n Tuy�t Li�n", tbProp = {6, 1, 1431, 1, 0, 0}},
	[5]	= {szName = "Thi�n S�n Tuy�t Li�n", tbProp = {6, 1, 1431, 1, 0, 0}},
	[6]	= {szName = "Thi�n S�n Tuy�t Li�n", tbProp = {6, 1, 1431, 1, 0, 0}},
	[7]	= {szName = "Thi�n S�n Tuy�t Li�n", tbProp = {6, 1, 1431, 1, 0, 0}},
	[8]	= {szName = "Thi�n S�n Tuy�t Li�n", tbProp = {6, 1, 1431, 1, 0, 0}},
	[9]	= {szName = "Thi�n S�n Tuy�t Li�n", tbProp = {6, 1, 1431, 1, 0, 0}},
	[10]= {szName = "Thi�n S�n Tuy�t Li�n", tbProp = {6, 1, 1431, 1, 0, 0}},
};

function item_exchange_score()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("��i hi�p v�n ch�a �� c�p 50 ho�c v�n ch�a n�p th�, v� v�y kh�ng th� tham gia ho�t ��ng", 0);
		return
	end
	local ndate = tonumber(GetLocalDate("%m%d"));
	if (GetTask(jf0904_TSK_denggao_ndate) ~= ndate) then
		SetTask(jf0904_TSK_denggao_ndate, ndate);
		SetTask(jf0904_TSK_denggao_curscore, 0);
	end
	tbDialog = {};
	for i = 1, getn(tbDenggaoItemAward) do
		tinsert(tbDialog, format("%s/#useitem(%d)", tbDenggaoItemAward[i].szName, i));
	end
	tinsert(tbDialog, getn(tbDialog)+1, "Ta ch� ti�n ���ng ��n ch�i./OnCancel");
	Say("Xin m�i ch�n v�t ph�m mu�n ��i", getn(tbDialog), unpack(tbDialog));
end

function useitem(nIdx)
	local nCount = CalcItemCount(unpack(tbDenggaoItemAward[nIdx].tbProp));	-- �����еĵ�ǰ��Ʒ����
	
	if (nCount == 0) then
		Say(format("Trong h�nh trang kh�ng c� %s!", tbDenggaoItemAward[nIdx].szName), 0);
		return
	end
	
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_totscore, 3143);
		Say("�i�m t�ch l�y c�a ��i hi�p �� ��n gi�i h�n cao nh�t, h�y ��i ph�n th��ng tr��c �i ��.", 0);
		return
	end
	
	local nCurScore = GetTask(jf0904_TSK_denggao_curscore);
	if (nCurScore + tbDenggaoItemAward[nIdx].nScore > 500) then
		Say(format("M�i ng��i m�i ng�y ch� ���c  500 �i�m t�ch l�y t� ho�t ��ng, h�m nay �� thu ���c %d �i�m, kh�ng th� s� d�ng th�m %s", nCurScore, tbDenggaoItemAward[nIdx].szName));
		return
	end
	
	if (floor((500 - nCurScore)/tbDenggaoItemAward[nIdx].nScore) < nCount) then
		nCount = floor((500 - nCurScore) / tbDenggaoItemAward[nIdx].nScore);
	end
	SetTaskTemp(114, nIdx);
	AskClientForNumber("exchangeitem", 0, nCount, "Nh�p s� c�n ��i")
end

function exchangeitem (nCount)
	local nIdx = GetTaskTemp(114);
	local tbProp = tbDenggaoItemAward[nIdx].tbProp;
	
	local n_Count 	= CalcItemCount(unpack(tbProp));	-- �����еĵ�ǰ��Ʒ����
	local nCurScore	= GetTask(jf0904_TSK_denggao_curscore);
	if (floor((500 - nCurScore)/tbDenggaoItemAward[nIdx].nScore) < n_Count) then
		n_Count = floor((500 - nCurScore) / tbDenggaoItemAward[nIdx].nScore);
	end
	if (nCount > n_Count) then
		Msg2Player("Nh�p s� sai!", 0);
		return
	end
	
	local bP = ConsumeItem(tbProp[1], nCount, tbProp[2], tbProp[3], tbProp[4], tbProp[5]); --  ����1�۳��ɹ�������0ʧ�ܣ�nCountΪָ���۳�������
	if (bP <= 0) then
		print(format("Tr� %s th�t b�i!", tbDenggaoItemAward[nIdx].szName));
		return
	end
	
	local nAddedScore = nCount * tbDenggaoItemAward[nIdx].nScore;
	SetTask(jf0904_TSK_denggao_curscore, GetTask(jf0904_TSK_denggao_curscore) + nAddedScore);	-- ÿ��Ļ���Ҫ�Ӹ���ǰ�ķ���
	Say(format("��i th�nh c�ng %d %s, �i�m t�ch l�y h�m nay l� %d.", nCount, tbDenggaoItemAward[nIdx].szName, GetTask(jf0904_TSK_denggao_curscore)), 0);
	SetTask(jf0904_TSK_denggao_totscore, GetTask(jf0904_TSK_denggao_totscore) + nAddedScore);
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_totscore, 3143);
		Say("�i�m t�ch l�y �� ��t ��n gi�i h�n cao nh�t, tr��c ti�n h�y ��i �i�m th�nh ph�n th��ng �i ��.", 0);
	end
end

function view_score()
	Say(format("�i�m t�ch l�y hi�n th�i l� %d, ��i hi�p c� mu�n ��i ph�n th��ng kh�ng?", GetTask(jf0904_TSK_denggao_totscore)), 2, "Mu�n/turn_score_2_exp", "Ta ch� h�i qua cho bi�t/OnCancel");
end

function turn_score_2_exp()
	if (GetTask(jf0904_TSK_denggao_totscore) < tbDenggaoScore[GetTask(jf0904_TSK_denggao_nidx)][1]) then
		Say("Hi�n t�i ��i hi�p kh�ng th� ��i th�nh ph�n th��ng ���c.", 0);
		return
	end
	
	for i = GetTask(jf0904_TSK_denggao_nidx), getn(tbDenggaoScore) do
		if (GetTask(jf0904_TSK_denggao_totscore) >= tbDenggaoScore[i][1]) then
			Say(tbDenggaoScore[i][3], 0);
			if (tbDenggaoScore[i][2] + GetTask(jf0904_TSK_denggao_totexp) > 500000000)then
				AddOwnExp(500000000 - GetTask(jf0904_TSK_denggao_totexp))
				SetTask(jf0904_TSK_denggao_totexp, 500000000);
			else
				AddOwnExp(tbDenggaoScore[i][2]);
				SetTask(jf0904_TSK_denggao_totexp, GetTask(jf0904_TSK_denggao_totexp) + tbDenggaoScore[i][2]);	
			end
		else
			SetTask(jf0904_TSK_denggao_nidx, i);
			break;
		end
	end
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_nidx, 1);
		SetTask(jf0904_TSK_denggao_totscore, 0);
		SetTask(jf0904_TSK_denggao_gettoptimes, GetTask(jf0904_TSK_denggao_gettoptimes)+1);
		if (GetTask(jf0904_TSK_denggao_gettoptimes) == 1) then
			Ladder_NewLadder(10262, GetName(), 3143, 0);
		end
	end
end

function view_top10_player()
	tbRoleName = {};
	for i = 1, 10 do
		RoleName = Ladder_GetLadderInfo(10262, i);
		if (RoleName == "" and i == 1) then
			Say("B�ng x�p h�ng t�m th�i ch�a c� th�ng tin!", 0);
			return
		end
		tinsert(tbRoleName, getn(tbRoleName)+1, "h�ng th� "..i.."Th� h�ng: \t"..RoleName.."/OnCancel");
	end
	tinsert(tbRoleName, getn(tbRoleName)+1, "Ta ch� ��n xem!/OnCancel");
	Say("B�ng x�p h�ng:", getn(tbRoleName), unpack(tbRoleName));
end

function get_award()
	if CalcFreeItemCellCount() < 3 then
		Say("�� b�o ��m an to�n cho v�t ph�m, xin m�i �� h�nh trang c�n th�a 3 � tr�ng", 0);
		return
	end
	local nrank = 0;
	for i = 1, 10 do
		RoleName = Ladder_GetLadderInfo(10262, i);
		if (RoleName == GetName()) then
			nrank = i;
			break;
		end
	end
	if (nrank <= 0 or nrank > 10) then
		Say("��i hi�p v�n ch�a v�o b�ng x�p h�ng n�n kh�ng th� nh�n th��ng ���c", 0);
		return
	end
	if(GetTask(jf0904_TSK_denggao_getaward) == 0) then
		tbAwardTemplet:GiveAwardByList(tbTop10Award[nrank], "Nh�n th��ng top 10 chinh ph�c ��nh FanXiPan");
		Say(format("Ch�c m�ng ��i hi�p l� ng��i th� %d chinh ph�c ��nh FanXiPan!  ��y l� ph�n th��ng c�a ng��i xin h�y nh�n l�y!", nrank),0);
		AddGlobalNews(format("Ch�c m�ng %s l� ng��i th� %d chinh ph�c ��nh FanXiPan!", GetName(), nrank));
		SetTask(jf0904_TSK_denggao_getaward, 1);
	else
		Say("Ng��i �� nh�n ph�n th��ng n�y r�i", 0);
	end
end

function about_denggao()
	Say("L� Quan: Ho�t ��ng chinh ph�c FanXiPan di�n ra t� 28-04-2009 ��n 24:00 31-05-2009. Trong th�i gian ho�t ��ng, c�c v� ��i hi�p c� th� ��n Ho�ng Li�n L�o L�o (390/317) ��ng k� chinh ph�c ��nh FanXiPan.", 0);
end