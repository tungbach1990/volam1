Include("\\script\\event\\jiefang_jieri\\201004\\plant\\main.lua")

-- return 1: ��ɾ����ǰ����Ʒ�� return 0: ɾ����ǰ��Ʒ
function main(itemidx)
	local now = tonumber(GetLocalDate("%Y%m%d"))
	if (FreedomSeed2010:CheckTime(now) ~= 1 or FreedomSeed2010:Use() ~= 1) then
		return 1;
	else
		return 0;
	end
end