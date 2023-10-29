TB_LOGIN_FUN = {}	--�������������¼����Ҫ���ص�Login����

--���һ��Login������ʱͬ����ʱҪ���صĺ���
--���������
--	fun		Ҫ���ӵ�function
--	n_time	��ʱ���У�0��Loginʱ��1����һ����ʱͬ��ʱ��2���ڶ�����ʱͬ��ʱ������
function login_add(fun, n_time)
	if (not fun) then
		return
	end
	if (not n_time) then
		n_time = 0
	end
	local tb = TB_LOGIN_FUN[n_time]
	if (not tb) then
		TB_LOGIN_FUN[n_time] = {fun}
	else
		local count = getn(tb)
		for i = 1, count do
			if (tb[i] == fun) then
				return
			end
		end
		tb[count + 1] = fun
	end
end

TB_LOGIN_FILEFUN = {
	{"\\script\\missions\\sevencity\\loginout.lua", "login"},				-- �߳Ǵ�ս
	{"\\script\\global\\jingli.lua", 				"WorldEntranceLogin"},	-- ����ϵͳ
}



function IsLoginFileFunction(script, func)
	for i = 1, getn(TB_LOGIN_FILEFUN) do
		local tb = TB_LOGIN_FILEFUN[i]
		if (tb[1] == script and tb[2] == func) then
			return 1
		end
	end
	return 0
end

function AddLoginFileFunction(script, func)
	local tb = {}
	tinsert(tb, script)
	tinsert(tb, func)
	tinsert(TB_LOGIN_FILEFUN, tb)
end
