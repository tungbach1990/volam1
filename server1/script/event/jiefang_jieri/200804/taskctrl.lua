-- �ļ�������taskctrl.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-15 11:16:09



--������� ˵��
--2473	Խ���Ϸ���Ż �汾��
--2474	Խ���Ϸ���Ż ʹ������Ƭ�ĸ���
--2475	Խ���Ϸ���Ż ʹ���������ľ�������
--2556	Խ���Ϸ���Ż ��¼���ܱ����ĵ�ͼId
--2557	Խ���Ϸ���Żռ��
--2333	Խ���Ϸ���Żռ��


jiefang_0804_ActTimeH_S = 2008120500
jiefang_0804_ActTimeH_E = 2009010424

jiefang_0804_TSK_Version		= 2473
jiefang_0804_TSK_FlagCount		= 2474
jiefang_0804_TSK_FlagExpLimit	= 2475
jiefang_0804_TSK_MapId			= 2557
jiefang_0804_TSK_AwardState		= 2333
jiefang_0804_TSKV_FlagCount		= 1975
jiefang_0804_TSKV_FlagExpLimit	= 1200000000

--�ڻ���ʱ���� ���� �汾������ʼʱ�䲻һ�£�����������������
function jiefang_0804_ResetTask()
	local nDateH = tonumber(GetLocalDate("%Y%m%d%H"))
	--���ʼ�����ҽ�����
	if nDateH >= jiefang_0804_ActTimeH_S and nDateH <= jiefang_0804_ActTimeH_E then
		
		if GetTask(jiefang_0804_TSK_Version) ~= jiefang_0804_ActTimeH_S then
			SetTask(jiefang_0804_TSK_Version, jiefang_0804_ActTimeH_S)
			SetTask(jiefang_0804_TSK_FlagCount, 0)
			SetTask(jiefang_0804_TSK_FlagExpLimit, 0)
			SetTask(jiefang_0804_TSK_MapId, 0)
			SetTask(jiefang_0804_TSK_AwardState, 0)
		end
	end
	
end