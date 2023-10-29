-- �׵�ͼ����Ƭ
-- by С�˶��
-- 2008.02.25
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..

Include("\\script\\lib\\composeclass.lua");

function YDBZ_tradeYandiTuTeng()
	local nCount = CalcEquiproomItemCount(6,1,1685,-1);
	local tbarytalk = {
		format("<npc>Gom �� 9 m�nh r�i ��a ta, ta s� gi�p ng��i gh�p th�nh 1 �� ��ng to�i phi�n. Ng��i mu�n gh�p b�y gi�?\nH�nh trang c� <color=yellow>%s<color> �� ��ng to�i phi�n",nCount),
		"Ta mu�n ��i Vi�m �� �� ��ng/YDBZ_SureDoTrade",
		"Ta ch� gh� ngang/NoChoice",
	}
	CreateTaskSay(tbarytalk);
end

function YDBZ_SureDoTrade()
	local tbarytalk = {
		format("<npc>Gom �� 9 m�nh r�i ��a cho ta, ta s� gi�p ng��i gh�p th�nh 1 Vi�m �� �� ��ng. Ng��i x�c nh�n mu�n gh�p?",nCount),
		"��ng r�i, �a t� c� n��ng/YDBZ_DoTrade",
		"Ta ch� gh� ngang/NoChoice",
	}
	CreateTaskSay(tbarytalk);	
end
function YDBZ_DoTrade()
	local nCount = CalcEquiproomItemCount(6,1,1685,-1);
	if nCount < 9 then
		Say("Tr�n h�nh trang kh�ng �� 9 �� ��ng to�i phi�n!!!",0);
		return 0;
	end
	ConsumeEquiproomItem(9,6,1,1685,-1);
	AddItem(6,1,1606,1,0,0);
	Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c 1<color=yellow> Vi�m �� �� ��ng<color>");
end

function YDBZ_tradeYandiLingQi()
	
	local tbarytalk = {
		"<dec>Xin h�y ch�n c�ch ��i:",
		"2 Vi�m �� �� ��ng/#YDBZ_SureDoTradeLingQi(1)",
		"2 Vi�m �� �� ��ng + 1 xu/#YDBZ_SureDoTradeLingQi(2)",
		"Ta ch� gh� ngang/NoChoice",
	}
	CreateTaskSay(tbarytalk);
end

function YDBZ_SureDoTradeLingQi(n_sel)
	local tbFormula = {
			[1] = {
						tbMaterial = {{tbProp = {6,1,1606, -1}, szName = "Vi�m �� �� ��ng", nCount = 2}},
						tbProduct = {tbProp = {6,1,2532,1,0,0}, szName = "Vi�m �� L�nh K�"},
			},
			[2] = {
						tbMaterial = {
							{tbProp = {6,1,1606, -1}, szName = "Vi�m �� �� ��ng", nCount = 2},
							{tbProp = {4,417,1, -1}, szName = "Ti�n ��ng", nCount = 1},
						},
						tbProduct = {tbProp = {6,1,2532,1,0,0}, szName = "Vi�m �� L�nh K�"},
			},
	};
	
	--�������Ϊ�գ�ʹ��Ĭ��ֵ
	local szLogTitle	= "yandi_tradeLingQi";
	
	local tbMaterial	= tbFormula[n_sel].tbMaterial
	local tbProduct		= tbFormula[n_sel].tbProduct
	
	local nComposeCount = 1
	
	local nFreeItemCellLimit = 1
	
	if CalcFreeItemCellCount() < nFreeItemCellLimit then
		Say(format("�� b�o ��m an to�n t�i s�n, xin h�y ��m b�o h�nh trang c�n th�a %d � tr�ng.", nFreeItemCellLimit))
		return 0
	end
	
	if tbComposeClass:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if tbComposeClass:ConsumeMaterial(tbMaterial, nComposeCount, szLogTitle) ~= 1 then
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end
	local n_ran = random(100);
	if (n_sel == 1 and n_ran > 60) then
		Msg2Player("Ch� t�o th�t b�i ��ng th�i m�t nguy�n li�u ch� t�o.");
		return
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, szLogTitle, nComposeCount)
	end
	
end


function YDBZ_tradeXuanYuanLing()
	local n_count = CalcItemCount(3, 6, 1, 2532, -1);
	if (n_count >= 100) then
		ConsumeItem(3, 100, 6,1,2532, -1);
		tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2351,1,0,0}, szName = "Huy�n Vi�n L�nh"}, "yandi_tradeXuanyuan");
	else
		CreateTaskSay({format("<dec>%s c�n: <enter>%s", "��i Huy�n Vi�n l�nh" ,format("%d %s", 100, "Vi�m �� L�nh K�")), "Ta bi�t r�i!/NoChoice"});
	end
end
