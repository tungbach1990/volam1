Include("\\script\\missions\\zhaojingling\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	[1]={nExp_tl=1,nRate = 50.0,nCount = 40000,},
	[2]={nExp_tl=1,nRate = 14.0,nCount = 80000,},
	[3]={nExp_tl=1,nRate = 5.0,nCount = 150000,},
	[4]={nExp_tl=1,nRate = 1.0,nCount = 300000,},
	[5]={szName="Gia T�c ho�n",tbProp={6,1,2794,1,0,0},nRate = 5.0,},
	[6]={szName="Huy�n Hu�n H�m T�nh",tbProp={6,1,2795,1,0,0},nRate = 5.0,},
	[7]={szName="B�y l�m ch�m",tbProp={6,1,2796,1,0,0},nRate = 5.0,},
	[8]={szName="Thi�n L�i Ng�c",tbProp={6,1,2797,1,0,0},nRate = 5.0,},
	[9]={szName="H�n Phong Ng�c",tbProp={6,1,2798,1,0,0},nRate = 5.0,},
	[10]={szName="��n ��a ph� ",tbProp={6,1,2799,1,0,0},nRate = 5.0,},	
}

function main()
	local nNpcIndex = GetLastDiagNpc()
	if (GetNpcParam(nNpcIndex, 1) ~= 1) then
		SetNpcParam(nNpcIndex, 1, 1)
		local nCount = GetTask(TSK_COUNT_ONETIME)
		SetTask(TSK_COUNT_ONETIME, nCount + 1)
		tbAwardTemplet:GiveAwardByList(%tbAward, "T�m th�yM�c Nh�n nh�n ���c ph�n th��ng")
		DelNpc(nNpcIndex)
	end
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end