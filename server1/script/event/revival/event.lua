Include ("\\script\\event\\eventhead.lua")
TSK_REVIVAL_AWARD = 2306
TSK_REVIVAL_Nmsg = 2307
function onRevival_Player()
	local tbOpp = {"<#> T�m hi�u ho�t ��ng giang h� /OnHelp_Revival", "<#> Ta ch� ��n ch�i th�i/OnCancel"}
	if (GetTask(TSK_REVIVAL_AWARD) > 0) then
		tinsert(tbOpp, 1, "<#> Nh�n qu� ho�t ��ng giang h� /revival_want2takegift")
	end
	Say("<#> ��c C� minh ch� mu�n tri �n c�c hi�p kh�ch giang h�, �� chu�n b� nhi�u t�ng ph�m nh� ta �i t�ng. N�i dung chi ti�t c� th� xem tr�n trang ch� <color=yellow>www.volam.com.vn<color>.", getn(tbOpp), tbOpp)
end

function revival_want2takegift()
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		Say("<#> ��c C� minh ch� mu�n t�ng ng��i <color=yellow>t�ng ��i �i�m kinh nghi�m trong 48 gi�<color>, nh�n b�y gi� ch�?",2, "��ng, Ta mu�n l�y./revival_sure2takegift", "Ch�a nh�n! S� quay l�i sau!/OnCancel")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		Say("<#> ��c C� minh ch� �� chu�n b� cho ng��i <color=yellow>m�t th�n b� h�ng bao, 200 v�n kinh nghi�m, nh�n ��i �i�m kinh nghi�m trong 48 gi�<color>, nh�n b�y gi� ch�?",2, "��ng, Ta mu�n l�y./revival_sure2takegift", "Ch�a nh�n! S� quay l�i sau!/OnCancel")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		Say("<#> ��c C� minh ch� �� chu�n b� cho ng��i <color=yellow>m�t m�nh trang b� Ho�ng Kim, 500 v�n kinh nghi�m, nh�n ��i �i�m kinh nghi�m trong 48<color>, nh�n b�y gi� ch�?",2, "��ng, Ta mu�n l�y./revival_sure2takegift", "Ch�a nh�n! S� quay l�i sau!/OnCancel")
	else
		print("task error!! revival_player event")
	end
end

function revival_sure2takegift()
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
		AddItem(6,1,402,1,0,0,0)	--���ش���
		AddOwnExp(2000000)
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
		AddEventItem(random(540, 942))	--�ƽ���Ƭ
		AddOwnExp(5000000)
	end
	Say("<#> Qu� c�a ng��i h�y c�t k�, xin ti�p t�c t�m hi�u c�c ho�t ��ng kh�c tr�n trang ch�!", 0)
end

function OnHelp_Revival()
	revival_onhelp_1()
end
function revival_onhelp_1()
	Say("<#> ��ng c�p ng��i ch�i d��i c�p 80, m�t tu�n kh�ng l�n m�ng, sau khi l�n m�ng ��n V� l�m minh ch� nh�n qu� t�ng ��i �i�m kinh nghi�m trong 48 gi�.", 2, "Trang k� /revival_onhelp_2", "Hi�u r�i/OnCancel")
end
function revival_onhelp_2()
	Say("<#> ��ng c�p ng��i ch�i t� 80~120, m�t th�ng kh�ng l�n m�ng, sau khi l�n m�ng c� th� ��n V� l�m minh ch� nh�n m�t th�n b� h�ng bao, 200 v�n kinh nghi�m, nh�n ��i kinh nghi�m trong 48 gi�.", 2,"Trang k� /revival_onhelp_3", "Hi�u r�i/OnCancel")
end
function revival_onhelp_3()
	Say("<#> ��ng c�p ng��i ch�i tr�n 120 c�p, trong m�t th�ng kh�ng l�n m�ng, sau khi l�n m�ng c� th� ��n V� l�m minh ch� nh�n qu� t�ng ng�u nhi�n m�t m�nh trang b� Ho�ng Kim, 500 v�n kinh nghi�m, nh�n ��i �i�m kinh nghi�m trong 48 gi�.",1, "Hi�u r�i/OnCancel")
end

function revival_login()
	local nday = tonumber(date("%d"))
	local pre_login_day = GetByte(GetTask(1075), 2)
	if (nday ~= pre_login_day) then
		SetTask(TSK_REVIVAL_Nmsg, 0)
	end
	if (GetTask(TSK_REVIVAL_Nmsg) > 3) then
		return
	end
	SetTask(TSK_REVIVAL_Nmsg, GetTask(TSK_REVIVAL_Nmsg) + 1)
	
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		Msg2Player("��c C� minh ch� mu�n tri �n c�c hi�p kh�ch giang h�, t�ng <color=yellow>t�ng ��i �i�m kinh nghi�m trong 8 gi�<color>. Xin nhanh ch�ng t�i<color=yellow>L� Quan<color> �� nh�n!")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		Msg2Player("��c C� minh ch� mu�n tri �n c�c hi�p kh�ch giang h�, t�ng <color=yellow>m�t th�n b� h�ng bao, 200 v�n kinh nghi�m, nh�n ��i kinh nghi�m trong 48 gi�<color>. Xinh nhanh ch�ng ��n <color=yellow>L� Quan<color> �� nh�n!")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		Msg2Player("��c C� minh ch� mu�n tri �n c�c hi�p kh�ch giang h�, t�ng <color=yellow>m�t m�nh trang b� Ho�ng Kim, 500 v�n kinh nghi�m, t�ng ��i �i�m kinh nghi�m trong 48 gi�<color>. Xin nhanh ch�ng t�i<color=yellow>L� Quan<color> �� nh�n!")
	end
end

function revival_player(key)
	if REVIVAL_PLAYER then
		if (key >= 7 and GetLevel() < 80) then
			SetTask(TSK_REVIVAL_AWARD, 1)
		elseif (key >= 30 and GetLevel() >= 80 and GetLevel() <= 120) then
			SetTask(TSK_REVIVAL_AWARD, 2)
		elseif (key >= 30 and GetLevel() > 120) then
			SetTask(TSK_REVIVAL_AWARD, 3)
		end
	else
		SetTask(TSK_REVIVAL_AWARD, 0)
	end
end
function OnCancel()
end

if REVIVAL_PLAYER then
	if login_add then login_add(revival_login, 2) end
end
