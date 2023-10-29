-- ���е�ͼ
ARY_CITY_MAP =
{
	[11]	=	1,	-- �ɶ�
	[1]		=	1,	-- ����
	[37]	=	1,	-- �꾩
	[176]	=	1,	-- �ٰ�
	[162]	=	1,	-- ����
	[78]	=	1,	-- ����
	[80]	=	1,	-- ����
}

-- ���ִ��ͼ
ARY_FRESHMAN_MAP =
{
	[174]	=	1,	-- ��Ȫ
	[121]	=	1,	-- ����
	[153]	=	1,	-- ʯ��
	[101]	=	1,	-- ����
	[99]	=	1,	-- ����
	[100]	=	1,	-- ����
	[20]	=	1,	-- ����
	[53]	=	1,	-- ����
	[54]	=	1,	-- ����
	[175]	=	1,	-- ��ɽ
}

-- ��������ͼ
ARY_TONG_TEMPLATE_MAP_PUBLIC =
{
	[586]	=	1,	-- ��������ͼһ
	[595]	=	1,	-- ��������ͼ��
	[596]	=	1,	-- ��������ͼ��
	[597]	=	1,	-- ��������ͼ��
}

-- �Խ�����ͼ
ARY_TONG_TEMPLATE_MAP_PRIVATE =
{	
	[587]	=	1,	-- ɽ�ǰ���ͼ
	[588]	=	1,	-- �置����ͼ
	[589]	=	1,	-- ɳĮ����ͼ
	[590]	=	1,	-- ��ʦ����ͼ
	[591]	=	1,	-- ��������ͼ
	[593]	=	1,	-- ���ϰ���ͼ
	[594]	=	1,	-- ѩ�����ͼ
}

-- �ж��Ƿ���е�ͼ
function IsCityMap(dwMapID)
	if (ARY_CITY_MAP[dwMapID] == 1) then
		return 1;
	else
		return 0;
	end
end

-- �ж��Ƿ����ִ��ͼ
function IsFreshmanMap(dwMapID)
	if (ARY_FRESHMAN_MAP[dwMapID] == 1) then
		return 1;
	else
		return 0;
	end
end

-- �ж��Ƿ����ͼ��bPublicOrPrivate: nil=���а���ͼ, 0=��������ͼ, 1=�Խ�����ͼ��
function IsTongMap(dwMapID, bPublicOrPrivate)
	local dwSubWorldIdx = SubWorldID2Idx(dwMapID);
	if (dwSubWorldIdx < 0) then
		return 0;
	end
	local dwMapCopyID = SubWorldIdx2MapCopy(dwSubWorldIdx);
	if (bPublicOrPrivate == nil) then
		if (ARY_TONG_TEMPLATE_MAP_PUBLIC[dwMapCopyID] == 1 or ARY_TONG_TEMPLATE_MAP_PRIVATE[dwMapCopyID] == 1) then
			return 1;
		end
	elseif (bPublicOrPrivate == 0) then
		if (ARY_TONG_TEMPLATE_MAP_PUBLIC[dwMapCopyID] == 1) then
			return 1;
		end
	elseif (bPublicOrPrivate == 1) then
		if (ARY_TONG_TEMPLATE_MAP_PRIVATE[dwMapCopyID] == 1) then
			return 1;
		end
	end
	return 0;
end