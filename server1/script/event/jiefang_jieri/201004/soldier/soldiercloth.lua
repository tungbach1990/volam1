Include("\\script\\event\\jiefang_jieri\\201004\\soldier\\main.lua")

-- return 1: ��ɾ����ǰ����Ʒ�� return 0: ɾ����ǰ��Ʒ
function main(itemidx)
	if (FreedomEvent2010:IsActive() ~= 1 or Soldier2010:UseSoldierCloth() ~= 1) then
		return 1;
	else
		return 0;
	end
end