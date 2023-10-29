Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\head_qianzhuang.lua")
TV_LAST_APPLY_TIME = 1571 -- �ϴ����봫��ʱ��
TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr><link>"

function chuangong_login()
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then
			Describe(strimg.."Hi�n ng��i <color=yellow>�� chu�n b� xong truy�n c�ng<color>, c� th� ��n ch� ta truy�n c�ng b�t k� l�c n�o!", 2, "Ta bi�t r�i!/cg_OnCancel", "Ta kh�ng mu�n truy�n c�ng!/cg_undo");
		else
			Describe(strimg.."B�n hi�n �� <color=yellow>chu�n b� ho�n t�t"..(num2datestr(applytime)).." <color>, �� c� th� l�p t�c truy�n c�ng!", 2, "�a t� Minh ch� th�c t�nh! V�n b�i c�o bi�t!/cg_OnCancel", "Ta kh�ng mu�n truy�n c�ng!/cg_undo");
		end
	end
end

function chuangong_msg()
	print("msgmsg")
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then
			Msg2Player("Hi�n t�i <color=yellow>b�n �� ��ng k� th�nh c�ng truy�n c�ng<color=>, c� th� ��n ch� ��c C� Ki�m �� truy�n th�. Truy�n c�ng c�n 2 Ng�n phi�u, xin h�y chu�n b�!")
		else
			Msg2Player("Hi�n t�i <color=yellow>b�n �� ��ng k� th�nh c�ng truy�n c�ng, th�i gian truy�n c�ng t�i"..(num2datestr(applytime)).."<color>. Truy�n c�ng c�n 2 Ng�n phi�u, xin h�y chu�n b�!")
		end
	end
end

function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
	return year.."n�m"..month.."nguy�t "..day.."nh�t "
end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then
		Describe(strimg.."Ta ��n"..num2datestr(nowday).."l� c� th� truy�n c�ng cho ng��i, c� th�t ng��i kh�ng mu�n truy�n c�ng kh�ng?",2,"Kh�ng! Ta kh�ng mu�n truy�n c�ng!/cg_undo_sure", "V�ng! Ta mu�n truy�n c�ng./cg_OnCancel")
	else
		Describe(strimg.."Ng��i ch�a xin ph�p truy�n c�ng, c�n g� h�y b�!",1,"K�t th�c ��i tho�i/cg_OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.."���c! Nguy�n li�u n�y ta t�m gi� l�i, n�u l�n sau mu�n truy�n c�ng th� ��n ��y!",1,"C�m �n Minh ch�!/cg_OnCancel")
end

function cg_OnCancel()
		
end

if (GetProductRegion() ~= "vn") then
	login_add(chuangong_msg, 2)
end
