Include("\\script\\global\\systemconfig.lua") -- ϵͳ����

IncludeForRegionVer("\\script\\global\\", "extpointfunc_proc.lua")

function OnExtPointChange(nExtPointIndex, nChangeValue)
	return OnExtPointChange_Proc(nExtPointIndex, nChangeValue);
end
