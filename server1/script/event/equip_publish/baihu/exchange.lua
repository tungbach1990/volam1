Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

--local tbFormula = 
--{
--	szName = "B�ch H� Kim B�i",
--	tbMaterial = {{szName="H�nh Hi�p L�nh",tbProp={6,1,2566,1,0,0},nCount = 1000,},},
--	tbProduct = {szName="B�ch H� Kim B�i",tbProp={6,1,3183,1,0,0},},
--	nWidth = 1,
--	nHeight = 1,
--	nFreeItemCellLimit = 1,
--}
--local tbCompose_XinXiaLing2BaiHuJinPai = tbActivityCompose:new(tbFormula, "xingxialin2baihujinpai")
--
--
--pEventType:Reg("H�ng rong", "Mua B�ch H� Kim B�i", tbCompose_XinXiaLing2BaiHuJinPai.ComposeDailog, {tbCompose_XinXiaLing2BaiHuJinPai})

--D�ng Phong V�n Th�ch ��i B�ch H� L�nh - Modified By DinhHQ - 20120612
local tbFormula2 = 
{
	szName = "B�ch H� L�nh",
	tbMaterial = {{szName="Phong V�n Th�ch",tbProp={6,1,30224,1,0,0},nCount = 10,},},
	tbProduct = {szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},},
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
}
local tbCompose_PVT2BHL = tbActivityCompose:new(tbFormula2, "DungPhongVanThachDoiBachHoLenh")
pEventType:Reg("H�ng rong", "��i B�ch H� L�nh", tbCompose_PVT2BHL.ComposeDailog, {tbCompose_PVT2BHL})