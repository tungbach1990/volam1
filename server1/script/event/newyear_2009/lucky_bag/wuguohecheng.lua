Include("\\script\\lib\\string.lua");
Include("\\script\\event\\newyear_2009\\taskctrl.lua");

local wuguo_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "<color=red>Ch� d�ng m�y nguy�n li�u n�y th� kh�ng th� ��i ph�n th��ng Ng� Qu� M�ng Xu�n ���c, ��i hi�p ph�i t�m �� nguy�n li�u �i ��<color>",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "M�ng C�u",	tbProp={6, 1, 1886, 1, 0, 0}, 	nCount = 2},
			{szName = "D�a", 	tbProp={6, 1, 1887, 1, 0, 0}, 	nCount = 1},
			{szName = "�u ��", tbProp={6, 1, 1888, 1, 0, 0}, 	nCount = 1},
			{szName = "Xo�i", 	tbProp={6, 1, 1889, 1, 0, 0},	nCount = 1},
			{szName = "Sung",	tbProp={6, 1, 1890, 1, 0, 0},	nCount = 3},
		},
		tbProduct = 
		{
			szName = "Ph�n th��ng Ng� Qu� M�ng Xu�n",
			[1] =
			{
				{szName="Thi�p Nh� � ", 	tbProp={6, 1, 1016, 1, 0, 0},	nRate = 50},
				{szName="Thi�p m�u", tbProp={6, 1, 1053, 1, 0, 0}, 	nRate = 50},
			},
			[2] = {nExp = 8e6},
			[3] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(newyear0901_TSK_GetExp_Wuguo, 800 + GetTask(newyear0901_TSK_GetExp_Wuguo));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(newyear0901_TSK_GetExp_Wuguo) + 800 > 40000) then
				Msg2Player("��i hi�p �� ��t ��n kinh nghi�m cao nh�t, kh�ng th� nh�n th�m ph�n th��ng t� ho�t ��ng Ng� Qu� M�ng Xu�n n�a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
}

function newyear0901_wuguo_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	newyear0901_ResetTask();
	
	if (newyear0901_wuguo_IsActDate() ~= 1) then
		return Talk(1, "", "Ho�t ��ng �� k�t th�c.")
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("��i hi�p v�n ch�a �� c�p 50 ho�c v�n ch�a n�p th� n�n kh�ng th� tham gia ho�t ��ng n�y.", 0);
		return 1;
	end
	
	tbFormulaList = tbFormulaList or %wuguo_tbFormulaList
	newyear0901_wuguo_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
	local tbSay = newyear0901_wuguo_Compose:MakeOptByProductName("Ta mu�n nh�n l�nh", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."N�u nh� t�m �� 5 lo�i hoa qu� 'M�ng C�u, D�a, �u ��, Xo�i, Sung' th� s� thu ���c c�ng nhi�u may m�n.");
	tinsert(tbSay , getn(tbSay)+1, "K�t th�c ��i tho�i/OnCancel");
	CreateTaskSay(tbSay);
end

function newyear0901_wuguo_IsActDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20090116 or nDate > 20090215) then
		return 0;
	else
		return 1;
	end
end


--ֻ�ڶԻ�ʱ����һ��
function newyear0901_wuguo_MakeComposeClas(tbFormulaList)
	if  type(newyear0901_wuguo_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("newyear0901_wuguo_Compose", tbFormulaList)
	end
end
