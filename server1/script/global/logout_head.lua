TB_LOGOUT_FILEFUN = {
	{"\\script\\missions\\sevencity\\loginout.lua", "logout"},				-- �߳Ǵ�ս
	{"\\script\\global\\jingli.lua", 				"WorldEntranceLogout"},	-- ����ϵͳ
	{"\\script\\global\\offlineaward.lua",			"logout"},				-- �����콱
}

-- ����¼���������ע�ⲻ���޸����������Ϊ�޸ĵ�������ݲ��ᱻ���棡����
TB_EXCHANGE_FILEFUN = {
	{"\\script\\global\\jingli.lua", 				"WorldEntranceLogout"},	-- ����ϵͳ
	{"\\script\\global\\offlineaward.lua",			"logout"},				-- �����콱
}

function IsLogoutFileFunction(script, func)
	for i = 1, getn(TB_LOGOUT_FILEFUN) do
		local tb = TB_LOGOUT_FILEFUN[i]
		if (tb[1] == script and tb[2] == func) then
			return 1
		end
	end
	return 0
end

function AddLogoutFileFunction(script, func)
	local tb = {}
	tinsert(tb, script)
	tinsert(tb, func)
	tinsert(TB_LOGOUT_FILEFUN, tb)
end

function IsExchangeFileFunction(script, func)
	for i = 1, getn(TB_EXCHANGE_FILEFUN) do
		local tb = TB_EXCHANGE_FILEFUN[i]
		if (tb[1] == script and tb[2] == func) then
			return 1
		end
	end
	return 0
end

function AddExchangeFileFunction(script, func)
	local tb = {}
	tinsert(tb, script)
	tinsert(tb, func)
	tinsert(TB_EXCHANGE_FILEFUN, tb)
end
