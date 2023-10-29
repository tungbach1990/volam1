Include("\\script\\missions\\citywar_global\\head.lua")
Include("\\script\\tong\\tong_header.lua")
IncludeLib("LEAGUE")
IncludeLib("TONG")

function main(nItemIndex)
	if checkBangHuiLimit() == 0 then
			Say("Xin l�i! ��i hi�p ch�a gia nh�p bang h�i n�o c�!",0);
			return 1
	end
	local szTongName, nTongID = GetTongName();
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure ~= TONG_MASTER) then
		Say("Th�t ��ng ti�c, ch� c� bang ch� m�i c� th� nh�n ph�n th��ng.", 0)
		return 1
	end
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, 10000, "", "");
	Msg2Player("��i hi�p n�p th�nh c�ng 10.000 Khi�u Chi�n L�nh cho Bang H�i !")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."TuiQuaKhieuChienLenh"..GetAccount().."\t"..GetName().."\t".."N�p th�nh c�ng 10000 KCL cho Bang H�i")
	return 0
end