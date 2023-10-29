--by ��־ɽ [2006-09-12]
--2006����:��10����ʵ�������ٴ��콱
--Illustration: ���� -- lightcage au06- -- midautumn2006

if (not __H_ITEM_LIGUAN__) then
	__H_ITEM_LIGUAN__ = 1;

Include([[\script\event\mid_autumn06\head.lua]]);

tab_lg_award = {
	{	"V� L�m M�t T�ch",	125,	6,	1,	26, 1},
	{	"T�y T�y Kinh",	125,	6,	1,	22, 1},
	{	"ng�a c�p 80",	250,	0,	10,	2,	4},
	{	"s�ch k� n�ng m�n ph�i",	400,	-1},
	{	"Ti�n Th�o L� v� Ph�c Duy�n L�",	4550,	-1},
	{	"b�nh trung thu B�t Tr�n Ph�c Nguy�t",	4550,	6,	1,	126, 1},
};

tab_sbook_list =
{	-- ��ʽ��{����ID, ����������}
	{27, "'T� Ti�n thu�t. B�o V� L� Hoa' "},
	{28, "'H�m T�nh thu�t. Lo�n Ho�n K�ch' "},
	{33, "Th�i C�c Quy�n Ph�- Quy�n 3 "},
	{34, "'Th�i C�c Ki�m Ph�. Quy�n 2' "},
	--{35, "'V�n Long K�ch. M�u ph�p' "},
	{36, "'L�u Tinh. �ao ph�p' "},
	{37, "'Thi�n V��ng Ch�y Ph�p. Quy�n 1' "},
	{38, "Thi�n V��ng Th��ng ph�p- Quy�n 2 "},
	{39, "Thi�n V��ng �ao ph�p - Quy�n 3 "},
	{40, "'Th�y Y�n �ao ph�p' "},
	{41, "'Th�y Y�n Song �ao' "},
	{42, "'Di�t Ki�m M�t T�ch' "},
	{43, "'Nga Mi Ph�t Quang Ch��ng M�t T�ch' "},
	{45, "'Phi �ao thu�t. Nhi�p H�n Nguy�t �nh' "},
	{46, "'Phi Ti�u thu�t. C�u Cung Phi Tinh' "},
	{47, "'Ng� ��c Ch��ng Ph�p. Quy�n 1' "},
	{48, "'Ng� ��c �ao ph�p. Quy�n 2' "},
	{49, "'Ng� ��c Nhi�p T�m thu�t. Quy�n 3' "},
	{50, "'Ng� Phong thu�t' "},
	{51, "'Ng� L�i thu�t' "},
	{52, "'Ng� T�m thu�t' "},
	{53, "Nhi�p H�n - Tr��c Ch� "},
	{54, "'C�i Bang Ch��ng Ph�p' "},
	{55, "C�i Bang C�n Ph�p "},
	{56, "'Thi�u L�m Quy�n Ph�p. Quy�n 1' "},
	{57, "'Thi�u L�m C�n ph�p. Quy�n 2' "},
	{58, "'Thi�u L�m �ao ph�p. Quy�n 3' "},
	{59, "'Ph� �� M�t T�ch' "},
}

--��ٻ���Ʒ���
function au06_lg_award()
	if (au06_is_inperiod() == 0) then --
		Say("Ho�t ��ng �� k�t th�c.", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("Ch� c� ng��i ch�i n�p th� m�i c� th� tham gia ho�t ��ng Trung thu", 0);
		return
	end;
	
	local tab_Content = {
		"���c th�i! Ta ��i 10 L�ng ��n k�o qu�n ��c bi�t l�y qu� c�a �ng!/au06_shangjialingpai",
		"Ch� ��n th�m �ng ch�t th�i!/oncancel"
	};
	Say("Trung thu vui v�! Ng��i c� mu�n ��i 10 L�ng ��n k�o qu�n ��c bi�t l�y qu� c�a ta kh�ng?", getn(tab_Content), tab_Content);
end;

function au06_shangjialingpai()
	if (CalcEquiproomItemCount(6, 1, 1234, -1) < 10) then
		Say("T�m �� <color=yellow>10 L�ng ��n k�o qu�n ��c bi�t<color> r�i h�y ��n ��y!", 0);
		return
	end;
	
	--�۳���Ʒ
	if (ConsumeEquiproomItem(10, 6, 1, 1234, -1) ~= 1) then
		return
	end
	
	--�漴����
	local nIndex = 6;
	local nSeed = random(1, 10000);
	local nSum = 0;
	for i = 1, getn(tab_lg_award) do
		nSum = nSum + tab_lg_award[i][2];
		if (nSeed <= nSum) then
			nIndex = i;
			break;
		end;
	end;
	
	local szName = tab_lg_award[nIndex][1];
	--���轱��
	if (nIndex == 4) then -- ���Ӽ�����
		local bIdx = random(1, getn(tab_sbook_list));
		AddItem(6, 1, tab_sbook_list[bIdx][1], 1, 0, 0, 0);
		szName = "quy�n"..tab_sbook_list[bIdx][2];
	elseif (nIndex == 5) then -- �����ɲݺ͸�Ե
		AddItem(6, 1, 71, 1, 0, 0, 0);
		AddItem(6, 1, 124, 1, 0, 0, 0);
	elseif (nIndex == 3) then -- �����ɲݺ͸�Ե
		AddItem(0, 10, 2, 4, random(0, 4), 0, 0);
	else
		AddItem(tab_lg_award[nIndex][3], tab_lg_award[nIndex][4], tab_lg_award[nIndex][5], tab_lg_award[nIndex][6], 0, 0, 0);
	end;
	
	--������ʾ
	Say("C� l�ng ��n n�y Trung Thu c�ng th�m vui! T�ng ng��i! Ch�c trung thu vui v�!", 0);
	Msg2Player("B�n nh�n ���c<color=yellow>"..szName.."<color>");
end

end; --//end of __H_ITEM_LIGUAN__