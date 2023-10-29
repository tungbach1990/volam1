-- �ļ�������techan_xiulianmuren.lua
-- �����ߡ���wangjingjun
-- ���ݡ��������������ľ�ˣ��ܹ����ӣ���Ϊ10����������ľ��		IB shop ����
-- ����ʱ�䣺2011-07-15 17:32:35

IncludeLib("SETTING"); --����SETTING�ű�ָ���
IncludeLib("FILESYS")
IncludeLib("TONG")
IncludeLib("ITEM")

Include("\\script\\global\\forbidmap.lua")
TSK_MAXCOUNT = 1574;				-- ��¼���һ��ʹ������Byte1
									-- ��¼�������ʹ�õĴ���Byte2
local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		--�����ͼ����
		if( %tbUseOnlyInMap[i] == nMapId ) then
			return 1
		end
	end
	return 0
end

function main(nItemIndex)
	local n_cur_date = tonumber(GetLocalDate("%d"));
	local n_my_value = GetTask(TSK_MAXCOUNT);
	local n_my_date = GetByte(n_my_value, 1);
	local n_my_count = GetByte(n_my_value, 2);
	
	if (n_cur_date ~= n_my_date) then						-- ���ʹ��ʱ���ǽ��죬��ʼ��ʹ�ô�������
		n_my_date =  n_cur_date;
		n_my_value = SetByte(n_my_value, 1, n_cur_date);
		
		n_my_count = 0;
		n_my_value = SetByte(n_my_value, 2, 0);
		
		SetTask(TSK_MAXCOUNT, n_my_value);
	end
	
	
	if %checkOnlyUseInMap() ~= 1 then
		Msg2Player("Kh�ng th� s� d�ng v�t ph�m n�y t�i ��y.")
		return 1
	end
	
	
	
	if (n_my_count >= 100) then
		Msg2Player("M�i ng��i ch�i m�i ng�y ch� ���c s� d�ng nhi�u nh�t 100 Tu luy�n m�c nh�n.");
		return 1;
	end
	
	if (GetFightState() == 1) then
		local w,x,y = GetWorldPos()
		local mapindex = SubWorldID2Idx(w)
		if ( mapindex < 0 ) then
			Msg2Player("Get MapIndex Error.")
			return 1
		end
		if ( CheckAllMaps(w) == 1 ) then
			Msg2Player("� ��y l�m sao m� t�p luy�n ���c ch�? H�y ra b�n ngo�i kia.")
			return 1
		end
	--	local nParam1 = GetItemParam(nItemIndex, 2)	--����ľ��ʱ������ʹ�õȼ�
		local nParam1 = 10  -- �����ľ�ˣ�ʹ�õȼ���Ϊ10��
		--local nParam2 = GetItemParam(nItemIndex, 3)
		local posx = x*32
		local posy = y*32
		bossid = 1161
		bosslvl = 100
		--local key = random(1,100000)
		local npcindex = AddNpc(bossid,bosslvl,mapindex,posx,posy,1,GetName().."M�c nh�n",2)
		if (npcindex > 0) then
			SetNpcParam(npcindex, 2, nParam1)
			local playerid = String2Id(GetName())
			SetNpcParam(npcindex, 3, floor( playerid/100000 ) )
			SetNpcParam(npcindex, 4, mod( playerid, 100000 ) )
			SetNpcDeathScript(npcindex, "\\script\\tong\\npc\\muren_death.lua")
			Msg2Player("M�c nh�n �� xu�t hi�n, h�y mau �i luy�n t�p.")
			
			SetTask(TSK_MAXCOUNT, SetByte(n_my_value, 2, n_my_count+1));		-- ����ʹ�ô�������
			--SetTask(1740, key)
		end
		return 0
	else
		Msg2Player("M�c nh�n ch� c� th� s� d�ng � khu v�c chi�n ��u.")
		return 1
	end
end