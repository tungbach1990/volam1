--====Storm LogOut�ű�====--
Include("\\script\\event\\storm\\function.lua")	--Storm

function storm_logout()
	if storm_valid_game(2) then	--ɱ������֮�籩��սû�н���
		storm_add_pointex(2, 40)
		storm_end(2, 1)
	end
end
