-- ReputeHead.lua
-- By: Dan_Deng(2003-08-23) ����������ع���

function ReturnRepute(default_repute,max_level,reduce_rate)		-- ���ձ�׼��������������ȼ���Ȼ��������ʵ�ʵȼ�����Ӧ������������
	player_level = GetLevel()
	if (GetLevel() <= max_level) then		-- �����ҵȼ������������׼�ȼ�10��������Ի��������������
		player_repute = default_repute
	else															-- ������10������ÿ����һ����3%��������
		player_repute = floor(default_repute * (1 - (player_level - max_level) * reduce_rate / 100))
		if (player_repute < 1) then				-- �����������С��1������1������
			player_repute = 1 
		end
	end
	return player_repute				-- ����Ӧ����������
end

function GetLevelRepute(i)			-- ����ÿһ�ȼ���������
	Repute_level = {0,8,30,75,150,240,450,750,1200,2250,3600}			-- ÿһ�ȼ��������壨ע����£�
	if (i <= 0) then
		return 0
	else
		return Repute_level[i + 1]
	end
end

function GetReputeLevel(i)			-- ���������ȼ��������и��������ȼ��жϣ����ȼ��������ڴ˴�ͳһ���ƣ�
	if (i >= 3600) then				-- ȱʡ24000,10��
		return 10
	elseif (i >= 2250) then		-- ȱʡ15000,9��
		return 9
	elseif (i >= 1200) then			-- ȱʡ8000,8��
		return 8
	elseif (i >= 750) then			-- ȱʡ5000,7��
		return 7
	elseif (i >= 450) then			-- ȱʡ3000,6��
		return 6
	elseif (i >= 240) then			-- ȱʡ1800,5��
		return 5
	elseif (i >= 150) then			-- ȱʡ1000,4��
		return 4
	elseif (i >= 75) then			-- ȱʡ500,3��
		return 3
	elseif (i >= 30) then			-- ȱʡ200,2��
		return 2
	elseif (i >= 8) then			-- ȱʡ50,1��
		return 1
	elseif (i >= 0) then			-- 0��0��
		return 0
	else								-- ������
		return -1
	end
end

function GetReputeStr(Repute_Level)
	if (Repute_Level == 1) then
		Repute_title = "S� Xu�t Giang H� "
	elseif (Repute_Level == 2) then
		Repute_title = "V� Danh Ti�u B�i"
	elseif (Repute_Level == 3) then
		Repute_title = "M�c M�c V� V�n"
	elseif (Repute_Level == 4) then
		Repute_title = "S� Hi�n Phong Mang"
	elseif (Repute_Level == 5) then
		Repute_title = "Ti�u H�u Danh Kh� "
	elseif (Repute_Level == 6) then
		Repute_title = "Danh ��u H��ng L��ng"
	elseif (Repute_Level == 7) then
		Repute_title = "Uy Tr�n Nh�t Ph��ng"
	elseif (Repute_Level == 8) then
		Repute_title = "Ng�o Th� Qu�n H�ng"
	elseif (Repute_Level == 9) then
		Repute_title = "Nh�t ��i T�ng s� "
	elseif (Repute_Level == 10) then
		Repute_title = "Ti�u Ng�o giang h� "
	else
		Repute_title = "B�nh d�n b� t�nh"
	end
	return Repute_title
end

function nothing()
end
