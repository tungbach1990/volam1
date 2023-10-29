-------------------------------------------------------------------------
-- FileName		:	rename_func.lua
-- Author		:	lailigao
-- CreateTime	:	2006-07-02 16:38:37
-- Desc			:	���߸�������
-- Include("\\script\\misc\\rename\\rename_func.lua")
---------------------------------------------------------------------------

Include("\\script\\global\\rename_head.lua")
Include("\\script\\vng_event\\item\\rename_func.lua")

-- ������Ҹ��Ľ�ɫ���Ի�
function func_online_rename_role(strInfo, strError)
	if (check_renamerole() == 1) then
		Say(strInfo,
			3,
			"<#> T�m hi�u t�n nh�n v�t c�n s� d�ng ���c kh�ng/query_rolename",
			"<#> Thay ��i t�n nh�n v�t c�a m�nh/change_rolename",
			"<#> �� l�n sau ta thay ��i v�y/cancel");
	else
		deny(strError)
	end
end

-- ��ѯ��ɫ��
function query_rolename()
	AskClientForString("on_query_rolename", "", 1, 20, "<#> Xin nh�p t�n nh�n v�t c�n t�m hi�u");
end

function on_query_rolename(new_name)
	QueryRoleName(new_name);
end

-- ������Ҹ��Ľ�ɫ��
function change_rolename()
	Say("<#> C�c b��c c� th�: R�i Bang H�i n�u c�, ��i tho�i v�i NPC, nh�p t�n nh�n v�t c�n thay ��i v�o, b�n s� t� ��ng r�i m�ng. Sau 3 ph�t ��ng nh�p l�i, n�u t�n nh�n v�t �� thay ��i th� ���c xem ��i t�n th�nh c�ng; n�u ch�a thay ��i, m�i b�n th�c hi�n l�i c�c b��c tr�n. N�u xu�t hi�n m�t s� hi�n t��ng l� xin li�n h� GM gi�i quy�t.",
		2,
		"<#> B�t ��u thay ��i t�n nh�n v�t/change_rolename2",
		"<#> �� ta suy ngh� l�i/cancel")
end

function change_rolename2()
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Player(" <color=green>��i hi�p �� c� Bang H�i kh�ng th� ti�n h�nh thao t�c n�y!<color>")
		return
	end
	AskClientForString("on_change_rolename", "", 1, 20, "<#> Xin nh�p t�n nh�n v�t m�i v�o");
end

function on_change_rolename(new_name)
	if (check_renamerole() == 1) then
		if (GetName() == new_name) then
			Talk(1, "", "<#> B�n mu�n ��i t�n g�?")
		else
			--Gi�i h�n s� d�ng item T�nh Danh Chi L�nh - modified by DinhHQ - 20130701
			SetTask(TSK_RENAME_FUNC_LIMIT, GetCurServerTime())
			RenameRole(new_name);
		end
	end
end

-- ���������İ����
function online_rename_tong(strInfo, strError)
	if (check_renametong() == 1) then
		Say(strInfo,
			3,
			"<#> Ki�m tra t�n Bang h�i c�n s� d�ng ���c kh�ng?/query_tongname",
			"<#> S�a ��i t�n Bang h�i c�a m�nh/change_tongname",
			"<#> �� l�n sau ta thay ��i v�y/cancel")
	else
		deny(strError)
	end
end

-- ��ѯ�����
function query_tongname()
	AskClientForString("on_query_tongname", "", 1, 20, "<#> Xin nh�p t�n Bang h�i mu�n t�m hi�u");
end

function on_query_tongname(new_tong)
	if (check_renametong() == 1) then
		QueryTongName(new_tong)
	end
end

-- ���İ����
function change_tongname()
	Say("<#> C�c b��c c� th�: ��i tho�i v�i NPC, nh�p t�n bang h�i c�n thay ��i v�o, b�n s� t� ��ng r�i m�ng. Sau 3 ph�t ��ng nh�p l�i, n�u t�n bang h�i �� thay ��i th� ���c xem ��i t�n th�nh c�ng; n�u ch�a thay ��i, m�i b�n th�c hi�n l�i c�c b��c tr�n. N�u xu�t hi�n m�t s� hi�n t��ng l� xin li�n h� GM gi�i quy�t.", 
		2,
		"<#> B�t ��u thay ��i t�n Bang h�i/change_tongname2",
		"<#> �� ta suy ngh� l�i/cancel");
end

function change_tongname2()
	AskClientForString("on_change_tongname", "", 1, 20, "<#> Xin nh�p t�n Bang h�i m�i v�o");
end

function on_change_tongname(new_tong)
	if (GetTongMaster() ~= GetName()) then
		Talk(1, "", "<#> Ch� c� bang ch� m�i c� th� thay ��i t�n Bang h�i")
	elseif (check_renametong() == 1) then
		old_tong, res = GetTong()
		if (res == 1 and old_tong ~= "") then
			if (old_tong == new_tong) then
				Say("<#> Kh�ng th� thay ��i t�n Bang h�i gi�ng nhau", 1, "<#> Bi�t r�i!/cancel")
			else
				RenameTong(old_tong, new_tong)
			end
		end
	end
end

function deny(strError)
	Say(strError,
		1,
		"<#> Bi�t r�i!/cancel")
end
