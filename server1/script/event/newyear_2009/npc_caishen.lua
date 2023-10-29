Include("\\script\\event\\newyear_2009\\lucky_bag\\hongbaohecheng.lua");
Include("\\script\\event\\newyear_2009\\lucky_bag\\wuguohecheng.lua");
Include("\\script\\event\\newyear_2009\\xinnianyanhua\\xinnianyanhua.lua");
Include("\\script\\event\\qingren_jieri\\200902\\event.lua");

function main()
	local arytalk = {"<dec><npc>Hi�n t�i �ang � th�i gian t�t, ��i hi�p c�n ch�n ch� g� n�a?"};
	
	if (newyear0901_hongbao_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "Ho�t ��ng bao l� x� may m�n/#newyear0901_hongbao_dialogmain()";
	end
	
	if (newyear0901_wuguo_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "Ho�t ��ng m�m ng� qu�/#newyear0901_wuguo_dialogmain()";
	end
	
	if (newyear0901_yanhua_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "Ho�t ��ng ph�o hoa m�ng xu�n/#newyear0901_yanhua_dialogmain()";
	end
	
	if (valentine2009_isCarryon() == 1) then
		arytalk[getn(arytalk)+1]	= "Ho�t ��ng l� t�nh nh�n/#valentine2009_main()";
	end
	
	arytalk[getn(arytalk)+1]	= "B�y gi� ta �ang c� vi�c b�n, h�y ��n v�o d�p kh�c nh�./OnCancel";
	
	CreateTaskSay(arytalk);
end