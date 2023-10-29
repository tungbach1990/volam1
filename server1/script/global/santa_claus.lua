-- ��������.lua (ʥ���)
Include([[\script\missions\chrismas\ch_head.lua]]);
Include([[\script\missions\chrismas\xmas_day.lua]]);

tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
500000
};

tabRate = {
	{0, 0.69, 0.27, 0.04},
	{0, 0.83, 0.14, 0.03},
	{0, 0.86, 0.13, 0.01},
	{0, 0.85, 0.15, 0},
	{0, 0.9, 0.1, 0},
	{0, 0.95, 0.05, 0},
	{0.27, 0.68, 0.05, 0},
	{0.37, 0.59, 0.04, 0},
	{0.61, 0.36, 0.03, 0},
	{0.72, 0.26, 0.02, 0}
};

function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20061222) then
		Describe(DescLink_LiGuan.."Ch�c gi�ng sinh vui v�!", 1, "K�t th�c ��i tho�i/oncancel");
	else
		Describe(DescLink_LiGuan.."Ha ha, ch�c gi�ng sinh vui v�! C� mu�n bi�t gi�ng sinh n�m nay c� ho�t ��ng g� kh�ng?", 5, 
			"Nghe n�i �ng b� m�t bao h�nh l�/want_xmasevent",
			"Ta mu�n t�o ng��i tuy�t./want_snowman",
			"Ta mu�n �em ng��i tuy�t ��i qu�./want_gift",
			"Ta mu�n t�m hi�u n�i dung ho�t ��ng/xmas_about",
			"Ta hi�n t�i r�t b�n, khi kh�c s� quay l�i./oncancel");
	end;
end;

function want_xmasevent()
	if (isXmasTime() ~= 1) then
		Describe(DescLink_LiGuan.."C�m �n ng��i, ta �� t�m l�i ���c bao h�nh l�.",1, "K�t th�c ��i tho�i/oncancel");
		return 0;
	end;
	Describe(DescLink_LiGuan.."Ta v�a b� m�t bao h�nh l�, b�n trong c� r�t nhi�u qu� gi�ng sinh c�a m�i ng��i. Ng��i c� th� gi�p ta t�m l�i kh�ng?", 4,
	"���ng nhi�n l� ���c r�i./onok",
	"Ta �� t�m ra b�n ch�ng r�i./award",
	"Gi�i thi�u ho�t ��ng gi�ng sinh./detail",
	"Ta hi�n t�i r�t b�n, khi kh�c s� quay l�i./oncancel")
end;


function onok()
	if (50 > GetLevel()) then
		strTalk = DescLink_LiGuan.."B�n ch�a ��t ��n c�p 50, kh�ng th� tham gia ho�t ��ng Gi�ng Sinh.";
		Describe(strTalk, 1, "K�t th�c ��i tho�i/oncancel");
		return
	end;
	Describe(DescLink_LiGuan.."C�m �n ng��i nhi�u, ta s� ��a ng��i ��n n�i ta l�m r�i bao qu�.", 2, "���c r�i./wantjoin", "Hi�n th�i ta b�n qu�, kh�ng c� th�i gian ��u./oncancel");
end;

function award()
	local nCount = GetTask(TK_COUNT_ONETIME);
	local nRank = GetTask(TK_RANK);
	SetTask(TK_COUNT_ONETIME, 0);
	SetTask(TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Describe(DescLink_LiGuan.."H�nh nh� ng��i v�n ch�a t�m ���c c�c m�n qu� c�a ta.", 1, "K�t th�c ��i tho�i/oncancel");
		return
	end;
	local strSay = format("�i, ��y ch�nh l� qu� m� ta l�m m�t ��y m�! �� ta xem, ng��i t�m ���c t�ng c�ng %d bao <color=yellow>qu� gi�ng sinh<color>, x�p h�ng th� %d trong nh�m ng��i �i t�m. ��y l� qu� c�a ng��i, h�y nh�n l�y.", nCount, nRank);
	Describe(DescLink_LiGuan..strSay, 1, "Nh�n l�y l� v�t./oncancel");
	giveaward(nRank);
end;

function detail()
	Describe(DescLink_LiGuan.."Ho�t ��ng t�m qu� gi�ng sinh th�t l�c m�i ��t chia th�nh <color=yellow>15<color> ph�t, trong �� c� <color=yellow>5<color> ph�t �� b�o danh v� chu�n b�. Khi b�o danh xong, ng��i ch�i s� ���c ��a ��n m�t b�n �� chung �� chu�n b�. Khi ch�nh th�c b�t ��u ��t t�m ki�m qu�, ng��i ch�i s� ���c ��a ng�u nhi�n ��n khu v�c ho�t ��ng �� tham gia t�m ki�m qu� b� th�t l�c. Khi ph�t hi�n qu�, nh�p chu�t tr�i v�o <color=yellow>qu� gi�ng sinh<color> �� nh�t ch�ng. Trong l�c �i t�m, ng��i ch�i s� ph�i s� d�ng c�c ��o c� �� ng�n c�n v� tho�t kh�i s� c�n tr� c�a ng��i ch�i kh�c. Nh�t c�ng nhi�u qu�, ph�n th��ng nh�n ���c s� c�ng l�n.", 1, "C� th�n k� nh� v�y kh�ng? �� ta th� xem./oncancel");
end;

function giveaward(nRank)
	expaward(nRank);
	goodsaward(nRank);
end;

function expaward(nRank)
	AddOwnExp(tabExp[nRank]);
end;

function goodsaward(nRank)
	local nGoodsType = getgoodtype(nRank);
	if (nGoodsType == 1) then
		AddItem(6, 1, 1008, 1, 0, 0, 0);
		local strsay = "B�n nh�n ���c m�t h�t Ho�ng Kim"
		Msg2Player(strsay);
	elseif (nGoodsType == 2) then
		AddItem(6, 1, 1007, 1, 0, 0, 0);
		local strsay = "B�n nh�n ���c m�t h�t Th�y Tinh"
		Msg2Player(strsay);
	elseif (nGoodsType == 3) then
		AddItem(6, 1, 1006, 1, 0, 0, 0);
		local strsay = "B�n nh�n ���c m�t h�t Hoa h�ng"
		Msg2Player(strsay);
	elseif (nGoodsType == 4) then
		AddItem(6, 1, 1005, 1, 0, 0, 0);
		local strsay = "B�n nh�n ���c m�t h�t May m�n"
		Msg2Player(strsay);
	end;
end;

function getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 4 do
		nRate[i] = tabRate[nRank][i] * 100;
	end;
	local nBase = 0;
	for i = 1, 4 do
		nBase = nBase + nRate[i];
		if (nBase >= nSeed) then
			return (5 - i);
		end;
	end;
end;

function onsale()

end;

function wantjoin()
	local w, x, y;
	w, x, y = GetWorldPos();
	SetTask(TK_LEAVERMAPID, w);	--�洢����뿪������
	SetTask(TK_LEAVERPOSX, x);
	SetTask(TK_LEAVERPOSY, y);
	joingame() --���뵽��Ϸ��
end;

function xmas_about()
	Describe(DescLink_LiGuan.."Trong th�i gian ho�t ��ng, ng��i ch�i s� ph�i ��nh qu�i v�t �� thu th�p h�p qu�, b�n trong s� c� <color=yellow>b�ng tuy�t, c� r�t, c�nh th�ng, n�n, c�y th�ng, kh�n cho�ng<color>, l� c�c nguy�n li�u d�ng �� t�o ra <color=yellow>ng��i tuy�t ��c bi�t<color>. N�u ch� t�o th�t b�i, s� cho ra  <color=yellow>ng��i tuy�t th��ng<color>. Sau ��, c� th� d�ng ng��i tuy�t �� ��i qu� t�i ��y.", 1, "Ta bi�t r�i/main");
end;

function oncancel()	--ȡ��

end;