Include("\\script\\lib\\file.lua")

tangburan = "\\settings\\maps\\��������\\Ī�߿�\\tangburanboss.txt"

wangzuo = "\\settings\\maps\\������\\Į����ԭ\\wangzuoboss.txt"
qingxiaoshitai = "\\settings\\maps\\������\\Į����ԭ\\qingxiaoshitaiboss.txt"
shansinan = "\\settings\\maps\\������\\Į����ԭ\\shansinanboss.txt"

yanxiaoqian = "\\settings\\maps\\��ԭ����\\����ɱ���\\yanxiaoqianboss.txt"
baiyingying = "\\settings\\maps\\��ԭ����\\����ɱ���\\baiyingyingboss.txt"
herenwo = "\\settings\\maps\\��ԭ����\\������ϰ�\\herenwoboss.txt"

xuanjizi = "\\settings\\maps\\������\\����ɽ´\\xuanjiziboss.txt"
xuanjuedashi = "\\settings\\maps\\������\\����ɽ´\\xuanjuedashiboss.txt"

hanmeng = "\\settings\\maps\\������\\��ɽ��\\hanmengboss.txt"

DAMAHUFILE = "\\settings\\maps\\damahuboss.txt"
DAMAHUMAP = {321, 321, 322, 340, 322, 340, 321}
DAMAHUID = {
			{751, 0},
			{752, 0},
			{753, 1},
			{754, 1},
			{755, 2},
			{756, 2},
			{757, 3},
			{758, 3},
			{759, 4},
			{760, 4}
			}


function main()
	--19:30 
--	if (tonumber(date("%H")) == 19) then
--		mb_mapindex = SubWorldID2Idx(341)
--		if (mb_mapindex >= 0 ) then
--			posx3, posy3 = getadata(qingxiaoshitai)--Į����ԭ	19��30
--			AddNpcEx(743, 95, 2, mb_mapindex, posx3*32, posy3*32, 1, "���ʦ̫", 1)		
--			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS3�����ʦ̫����Į����ԭx��"..posx3..",y��".. posy3)
--		end

--		fl_mapindex = SubWorldID2Idx(336)
--		if (fl_mapindex >= 0 ) then
--			posx5, posy5 = getadata(yanxiaoqian)--����ɱ���336	--��ԭ����		19��30
--			AddNpcEx(744, 95, 2, fl_mapindex, posx5*32, posy5*32, 1, "����ٻ", 1)		
--			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS5������ٻ���ڷ���ɱ���x��"..posx5..",y��".. posy5)
--		end
	
--		fl_mapindex = SubWorldID2Idx(336)
--		if (fl_mapindex >= 0 ) then
--			posx7, posy7 = getadata(herenwo)--������ϰ�336	--��ԭ����	19��30
--			AddNpcEx(745, 95, 3, fl_mapindex, posx7*32, posy7*32, 1, "������", 1)			
--			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS7�������ҡ��ڷ�����ϰ�x��"..posx7..",y��".. posy7)	
--		end;
	
--		cbn_mapindex = SubWorldID2Idx(321)--����ɽ��321		--������		19��30
--		if (cbn_mapindex >= 0) then
--			posx8, posy8 = getadata(xuanjizi)
--			AddNpcEx(747, 95, 4, cbn_mapindex, posx8*32, posy8*32, 1, "�����", 1)		
--			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS8������ӡ��ڳ���ɽ��x��"..posx8..",y��".. posy8)	
--		end
--	end
	
	--21:00
	if (tonumber(date("%H")) == 21) then
--		mb_mapindex = SubWorldID2Idx(341)--Į����ԭ	21��00
--		if (mb_mapindex >= 0 ) then
--			posx4, posy4 = getadata(shansinan)
--			AddNpcEx(746, 95, 4, mb_mapindex, posx4*32, posy4*32, 1, "��˼��", 1)		
--			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS4����˼�ϡ���Į����ԭx��"..posx4..",y��".. posy4)
--		end;
	
--		fl_mapindex = SubWorldID2Idx(336)--����ɱ���	21��00
--		if (fl_mapindex >= 0 ) then
--			posx6, posy6 = getadata(baiyingying)
--			AddNpcEx(742, 95, 1, fl_mapindex, posx6*32, posy6*32, 1, "��ӨӨ", 1)		
--			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS6����ӨӨ���ڷ���ɱ���x��"..posx6..",y��".. posy6)
--		end

--		xsy_mapindex = SubWorldID2Idx(342)		--��ɽ��342		������		21��00
--		if (xsy_mapindex >= 0) then
--			posx10, posy10 = getadata(hanmeng)
--			AddNpc(748, 95, xsy_mapindex, posx10*32, posy10*32, 1, "����", 1)
--			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS9�����ɡ�����ɽ��x��"..posx10..",y��".. posy10)
--		end
		
		damahu_boss()	--�ƽ�boss���������������Ī�߿ߡ�����ɽ�ϡ�����ɽ��
	end
	
	--23:00
--	if (tonumber(date("%H")) == 23) then
--		mg_mapindex = SubWorldID2Idx(340)--Ī�߿�340	--��������	23��00
--		if (mg_mapindex >= 0 ) then
--			posx1, posy1 = getadata(tangburan)
--			AddNpcEx(741, 95, 1, mg_mapindex, posx1*32, posy1*32, 1, "�Ʋ�Ⱦ", 1)		
--			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS1���Ʋ�Ⱦ����Ī�߿�x��"..posx1..",y��".. posy1)
--		end;

--		mb_mapindex = SubWorldID2Idx(341)--Į����ԭ341	--����	23��00
--		if (mb_mapindex >= 0 ) then
--			posx2, posy2 = getadata(wangzuo)
--			AddNpcEx(739, 95, 0, mb_mapindex, posx2*32, posy2*32, 1, "����", 1)			
--			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS2����������Į����ԭx��"..posx2..",y��".. posy2)
--		 end
	 
--		cbb_mapindex = SubWorldID2Idx(322)--����ɽ��322		--������		23��00
--		if (cbb_mapindex >= 0) then
--			posx9, posy9 = getadata(xuanjuedashi)
--			AddNpcEx(740, 95, 0, cbb_mapindex, posx9*32, posy9*32, 1, "������ʦ", 1)	
--			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS9��������ʦ���ڳ���ɽ��x��"..posx9..",y��".. posy9)
--		end
--	end
end
	
		
		
function getadata(file)
	local totalcount = GetTabFileHeight(file);
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function damahu_boss()
	--�����������ͼ���һ��
	local d = tonumber(date("%d"))
	local m = tonumber(date("%m"))
	local y = tonumber(date("%y"))
	local w = tonumber(date("%W"))
	local xx = tonumber(date("%w"))
	local ss = d + m + y + w + xx
	local zz = mod(xx, 7)
	if (zz == 0) then
		zz = 7
	end
	damahu_mapid = DAMAHUMAP[zz]
    damahu_mapindex = SubWorldID2Idx(damahu_mapid)
    if (damahu_mapid == 321) then
    	mapname = "Tr��ng B�ch s�n Nam "
    	file = "\\settings\\maps\\������\\����ɽ´\\xuanjiziboss.txt"
   elseif (damahu_mapid == 322) then
    	mapname = "Tr��ng B�ch s�n B�c"
    	file = "\\settings\\maps\\������\\����ɽ´\\xuanjuedashiboss.txt"
    elseif (damahu_mapid == 340) then
    	mapname = "M�c Cao Qu�t"
    	file = "\\settings\\maps\\��������\\Ī�߿�\\tangburanboss.txt"
    end
    
    if (damahu_mapindex >= 0) then
    --������ô������������ԡ���ģ��id
	rannum = random(10)
    	posx,posy =getadata(file)
    	local npcidx = AddNpcEx(DAMAHUID[rannum][1], 95, DAMAHUID[rannum][2], damahu_mapindex, posx*32, posy*32, 1, "��i M� H� ", 1)
    	SetNpcDeathScript(npcidx, "\\script\\missions\\boss\\bossdeath.lua");
	WriteLog("Th�i gian"..date("%H%M%S")..": Xu�t hi�n BOSS Ho�ng Kim '��i M� H�' mapid:"..damahu_mapid..", t�a �� x:"..posx..", y:".. posy..". ��i M� H� (ID l�:"..DAMAHUID[rannum][1]..", thu�c t�nh ng� h�nh:"..DAMAHUID[rannum][2])
	AddGlobalNews("��i M� H� xu�t hi�n t�i "..mapname.." ("..floor(posx/8)..","..floor(posy/16)..")")
	end
end
