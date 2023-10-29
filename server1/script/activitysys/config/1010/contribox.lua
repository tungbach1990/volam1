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
	local nBuildFund = 10000
	local _, nTongID = GetTongName()
	if(nTongID == 0) then
		Msg2Player("Ch�a gia nh�p bang h�i, kh�ng th� s� d�ng ��o c� n�y.");
		return 1
	end
	AddContribution(nBuildFund)
	Msg2Player(format("B�n nh�n ���c %d �i�m c�ng hi�n c� nh�n", nBuildFund))
	%tbLog:PlayerAwardLog("CongHienLebao", "SuDungVatPhamNhanDuoc10000000diemCongHien")
	return 0
end