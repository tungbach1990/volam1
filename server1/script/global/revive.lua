Include("\\script\\nationalwar\\login.lua")
Include("\\script\\nationalwar\\nationalwar.lua")

function main(type)
	local pos = NW_GetDuty()
	if (pos ~= NWPOSITION_NONE) then
		-- ���¼��ع⻷�ͼ���
		nationalwar_login()
		nationalwar_mapevent(1)
	end
end
