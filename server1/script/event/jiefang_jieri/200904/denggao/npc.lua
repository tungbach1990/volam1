Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\denggao.lua");


function main()
	jf0904_InitTaskctrl();
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < jf0904_act_dateS or nDate >= jf0904_act_dateE) then
		Say("Kh�ng thu�c trong th�i gian ho�t ��ng.", 0);
		return
	end
	Say("Ho�ng Li�n L�o L�o: T� 28-04-2009 ��n 31-05-2009 c�c v� ��i hi�p c� th� tham gia cu�c thi �Chinh ph�c ��nh Fanxipan�. ��nh Fanxipan c�n ���c g�i l� �N�c nh� ��ng D��ng�,l� ��nh n�i cao nh�t ��ng D��ng,con ���ng chinh ph�c ��nh Fanxipan r�t kh� kh�n gian kh�,b�ng c� s�c m�nh v� � ch� m�i c� th� th�nh c�ng.Ng��i chi�n th�ng s� ���c ph�n th��ng h�p d�n.��i hi�p c� mu�n tham d� cu�c chinh ph�c n�y kh�ng?", 5,
		"N�p c�c item �� nh�n �i�m t�ch l�y./item_exchange_score",
		"Xem s� �i�m �� t�ch l�y./view_score",
		"Xem danh s�ch TOP 10 ng��i �i�m cao nh�t./view_top10_player",
		"Nh�n th��ng top 10 chinh ph�c ��nh FanXiPan/get_award",
		"Ta ch� ��n xem!/");
end