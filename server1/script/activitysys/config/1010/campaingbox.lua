Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");

if MODEL_GAMESERVER == 1 then
	IncludeLib("TONG")
	Include("\\script\\tong\\tong_header.lua")
end

function  main()
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local nBuildFund = 5000
	local _, nTongID = GetTongName()
	if(nTongID == 0) then
		Msg2Player("Ch�a gia nh�p bang h�i, kh�ng th� s� d�ng ��o c� n�y.");
		return 1
	end
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_MASTER)then
		TONG_ApplyAddWarBuildFund(nTongID, nBuildFund)		
		Msg2Player(format("N�p th�nh c�ng %d �i�m Chi�n b�", nBuildFund))
		%tbLog:PlayerAwardLog("ChienBiLebao", "SuDungVatPhamNhanDuoc5000diemChienBi")
		return 0;
	else
		Msg2Player("Kh�ng ph�i l� bang ch�, kh�ng th� s� d�ng ��o c� n�y.");
		return 1
	end
end