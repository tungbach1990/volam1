Include([[\script\event\springfestival07\item\libcracker.lua]]);

function main_entrance()
	Say("Ta s� gi�p m�i ng��i l�m ph�o �� ��n n�m m�i r�n r�. Qu� kh�ch mu�n l�m lo�i ph�o n�o?", 7,
	"Ta mu�n l�m Ph�o trung/#confirm_make(1)",
	"Ta mu�n l�m Ph�o ��i/#confirm_make(3)",
	"Ta mu�n l�m phong ph�o ti�u/#confirm_make(2)",
	"Ta mu�n l�m phong ph�o trung/#confirm_make(4)",
	"Ta mu�n l�m phong ph�o ��i/#confirm_make(5)",
	"Ta mu�n t�m hi�u ho�t ��ng ��t ph�o giao th�a/detail",
	"Ta s� quay l�i sau!/no"
	);
end;

function detail()
	Describe("Trong th�i gian ho�t ��ng, ng��i ch�i luy�n c�ng c� th� ng�u nhi�n nh�n ���c Bao l� x�, b�n trong ch�a c�c lo�i ph�o. Ta c� th� gi�p m�i ng��i l�m b�t c� lo�i ph�o n�o. Nh�ng c�ng c� l�c th�t b�i! Hi! Hi! N�u th�nh c�ng s� th�nh Phong ph�o ��c bi�t. N�u th�t b�i s� m�t �i Phong ph�o th��ng. Ch�ng lo�i ph�o kh�c nhau hi�u qu� c�ng kh�c nhau.", 1, "Ta bi�t r�i! (L�n trang tr��c)/main_entrance");
end;

tab_Content = {
	{"Ph�o trung", "3 vi�n ph�o ti�u", 50, {1352, "Ph�o trung"}, {1, 1351, "Ph�o ti�u"}, "N�u l�m th�t b�i, qu� kh�ch s� m�t �i 1 vi�n ph�o ti�u"},
	{"Phong ph�o ti�u", "10 vi�n ph�o ti�u, 2 vi�n ph�o trung v� 1000 l��ng.", 50, {1354, "phong ph�o ti�u ��c bi�t"}, {0, 1357, "phong ph�o ti�u th��ng"}, "N�u l�m th�t b�i, qu� kh�ch s� nh�n ���c 1 Phong ph�o ti�u th��ng. N�u th�nh c�ng, s� nh�n ���c 1 Phong ph�o ti�u ��c bi�t"},
	{"Ph�o ��i", "3 vi�n ph�o trung", 50, {1353, "Ph�o ��i"}, {1, 1352, "Ph�o trung"}, "N�u l�m th�t b�i, qu� kh�ch s� m�t �i 1 vi�n ph�o trung"},
	{"Phong ph�o trung", "10 vi�n ph�o trung, 2 vi�n ph�o ��i v� 3000 l��ng.", 20, {1355, "Phong ph�o trung ��c bi�t"}, {0, 1358, "Phong ph�o trung th��ng"}, "N�u l�m th�t b�i, qu� kh�ch s� nh�n ���c Phong ph�o trung th��ng. N�u th�nh c�ng, s� nh�n ���c Phong ph�o trung ��c bi�t"},
	{"Phong ph�o ��i", "100 vi�n ph�o ��i v� 5000 l��ng.", 15, {1356, "Phong ph�o ��i ��c bi�t"}, {0, 1359, "Phong ph�o ��i th��ng"}, "N�u l�m th�t b�i, qu� kh�ch s� nh�n ���c Phong ph�o ��i th��ng. N�u th�nh c�ng, s� nh�n ���c Phong ph�o ��i ��c bi�t"},
};
function confirm_make(nIndex)
	Say("Mu�n ch� t�o 1 <color=yellow>"..tab_Content[nIndex][1].."<color> c�n c� <color=yellow>"..tab_Content[nIndex][2].."<color>. Nh�ng ch�a ch�c th�nh c�ng ��u nh�! "..tab_Content[nIndex][6].."L�m ch�?", 2, "Ta mu�n l�m /#make_crackers("..nIndex..")", "Ta ch�a s�n s�ng!/no");
end;

tab_material = {
{1351, "Ph�o ti�u"},
{1352, "Ph�o trung"},
{1353, "Ph�o ��i"},
{-1, " l��ng"},
};
tab_Count = {
{3, 0, 0, 0},
{10, 2, 0, 1000},
{0, 3, 0, 0},
{0, 10, 2, 3000},
{0, 0, 100, 5000},
}
function make_crackers(nIndex)
	if (CalcFreeItemCellCount() < 2) then
		Say("Xin h�y s�p x�p l�i h�nh trang tr��c ��!", 0);
		return 1;
	end;
	
	local nSucc = 1;
	for i = 1, 3 do
		if (CalcEquiproomItemCount(6,1,tab_material[i][1],-1) < tab_Count[nIndex][i]) then
			nSucc = 0;
			break;
		end;
	end;
	
	if (GetCash() < tab_Count[nIndex][4]) then
		nSucc = 0;
	end;
	
	if (nSucc == 0) then
		Say("Kh�ch quan ch�a �� v�t li�u! Xin quay l�i sau nh�!", 1, "�! Ta �i chu�n b� th�m!/no");
		return
	end;
	
	Pay(tab_Count[nIndex][4]);
	
	local nSeed = random(1, 100);
	local str;
	if (nSeed <= tab_Content[nIndex][3]) then	-- �ɹ���
		delmaterial(nIndex);
		AddItem(6, 1, tab_Content[nIndex][4][1], 1,0,0,0);
		str = "Th�nh c�ng r�i! ��y l� <color=yellow>"..tab_Content[nIndex][4][2].."<color>.";
		Say(str.." Xin nh�n l�y!", 0);
		Msg2Player(str);
	else
		if (tab_Content[nIndex][5][1] == 1) then
			ConsumeEquiproomItem(1, 6, 1, tab_Content[nIndex][5][2], -1);
			str = "Kh�ng may r�i! Qu� kh�ch �� m�t 1 <color=yellow>"..tab_Content[nIndex][5][3].."<color>.";
			Say(str, 0);
			Msg2Player(str);
		else
			delmaterial(nIndex);
			AddItem(6, 1, tab_Content[nIndex][5][2], 1,0,0,0);
			str = "Kh�ng may r�i! L�n n�y ch� nh�n ���c 1 <color=yellow>"..tab_Content[nIndex][5][3].."<color>."
			Say(str.." Xin nh�n l�y!", 0);
			Msg2Player(str);
		end;
	end;
end;


function delmaterial(nIndex)
	for i = 1, 3 do
		ConsumeEquiproomItem(tab_Count[nIndex][i],6,1,tab_material[i][1],-1);
	end;
end;
