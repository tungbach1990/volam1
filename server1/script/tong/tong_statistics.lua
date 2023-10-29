--��һ�����������г���2��������ͳ�ƣ�
if (not __TONG_STATICS_H__) then
	__TONG_STATICS_H__ = 1;
IL("TONG");
GLB_UPDATEDATE = 921;	--��¼�÷����ڰ�����ݸ��µ�����
T_STATICS = {[2] = {}, [3] = {}, [4] = {}, [5] = {} };

--һ�ո���һ��
function init_statics()
	local nTongID = TONG_GetFirstTong()
	local nLevel;
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	
--	if (nDate == GetGlbValue(GLB_UPDATEDATE)) then --����Ѿ����¹�
--		return
--	end;
	
	SetGlbValue(GLB_UPDATEDATE, nDate);
	--��ԭ���ı����
	for i = 2, 5 do
		T_STATICS[i] = {};
	end;
	--�����������µı������е�2�����ϣ�����2�����ҳ�����
	while (nTongID > 0) do
		nLevel = TONG_GetBuildLevel(nTongID);
		if (nLevel > 1 and nLevel < 6) then
			if (TONG_GetTongMap(nTongID) > 604) then --���ӵ�ж����İ���ͼ��
				tinsert(T_STATICS[nLevel], nTongID);
			end;
		end;
		nTongID = TONG_GetNextTong(nTongID);
	end
	return 1
end;

function get_tonglist(nWorkshopIdx, nLevel)
	local nTongID;
	local nWorkshopLevel;
	local tab_TongList= {};
	local nWorkshopID;
	init_statics()	--�������ݸ��£���һ��ֻ����һ��
	for i = 2, 5 do
		for j = 1, getn(T_STATICS[i]) do
			nTongID = T_STATICS[i][j];
			if (nTongID > 0) then
				nWorkshopID = TWS_GetFirstWorkshop(nTongID, nWorkshopIdx)
				nWorkshopLevel = TWS_GetLevel(nTongID, nWorkshopID);
				if (nWorkshopLevel >= nLevel) then
					tinsert(tab_TongList, nTongID);
				end;
			end;
		end;
	end;
	return tab_TongList;
end;

function get_tongmap_list(nWorkshopID, nLevel)
	local tab_TongList = get_tonglist(nWorkshopID, nLevel);
	local tab_MapList = {};
	for i = 1, getn(tab_TongList) do
		if (tab_TongList[i] > 0) then
			tinsert(tab_MapList, TONG_GetTongMap(tab_TongList[i]));
		end;
	end;
	return tab_MapList;
end;

function get_workshop_count(nWorkshopID, nLevel)
	local tab_TongList = {};
	tab_TongList = get_tonglist(nWorkshopID, nLevel);

	local nCount = getn(tab_TongList);
	_, nTongID = GetTongName();
	local nWorkshopIdx = TWS_GetFirstWorkshop(nTongID, nWorkshopID);
	if (TWS_GetLevel(nTongID, nWorkshopIdx) >= nLevel) then
		nCount = nCount - 1;
	end;
	return nCount
end;

end; --// end of __TONG_STATICS_H__
