--�����꾩trap��
--

Include("\\script\\lib\\getrectangle_point.lua") --��þ��ε�

function add_trap_bianjingximen()
	local tbpoint =
	{
		tbtoppoint={1583,2989},
		nleftstep = 6,
		nrightstep = 3,
	}
	local nMapID = 37 --�꾩
	local szScriptfile = "\\script\\��ԭ����\\�꾩\\�꾩\\trap\\�꾩����.lua"
	local tballpoint = getRectanglePoint(tbpoint)
	for nx,tbp in tballpoint do
		AddMapTrap(nMapID,floor(tbp[1]*32),floor(tbp[2]*32),szScriptfile)
	end
end