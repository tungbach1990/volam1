jf0904_TSK_version		= 1760	-- ��汾��
jf0904_TSK_jiuexp		= 1761	-- �ƺ�«�����Ѿ�ʹ�ú��õľ���
jf0904_TSK_jiuexplt		= 1762	-- �ƺ�«�����Ѿ�ʹ�ú��õľ�������

jf0904_TSK_jinnangsj	= 1763;	-- �Ƿ��Ѿ�ʹ�ù������¼�

jf0904_TSK_shuizei_GetTask 			= 1764;		-- �Ƿ��Ѿ�������ˮ������
jf0904_TSK_shuizei_FulfilTaskTime 	= 1765; 	-- �ϴν�ˮ�������ʱ��
jf0904_TSK_hailongzhu_ndate			= 1936;		-- ÿ��ֻ��������������
jf0904_TSK_hailongzhu_UseTime		= 2625;		-- ÿ��ڼ���ʹ�ú�����

jf0904_TSK_denggao_ndate		= 1937;		-- ÿ�������500���֣��ж��ǲ��ǵ�����������
jf0904_TSK_denggao_curscore		= 1938;		-- �Ǹ߻ÿ���Ѿ���õĻ���
jf0904_TSK_denggao_totscore		= 1940;		-- �Ǹ߻һ����õĻ���
jf0904_TSK_denggao_totexp		= 1941;		-- �Ǹ߻��һ����õľ���
jf0904_TSK_denggao_nidx			= 1942;		-- Ŀǰ�һ����˵ڼ��㽱��
jf0904_TSK_denggao_gettoptimes	= 1943;		-- �ڼ��δﵽ��ֵ
jf0904_TSK_denggao_getaward		= 1944;		-- �Ƿ��Ѿ��콱

jf0904_item_expiredtime	= 20090601
jf0904_jiu_expiredtime	= 20090608

jf0904_act_dateS 	= 20090428; 
jf0904_act_dateE	= 20090601;

function jf0904_InitTaskctrl()	
	if (GetTask(jf0904_TSK_version) ~= 200904) then
		SetTask(jf0904_TSK_version, 200904);
		
		SetTask(jf0904_TSK_jiuexp, 0);
		SetTask(jf0904_TSK_jiuexplt, 15000);	-- ȫ������10w
		
		SetTask(jf0904_TSK_jinnangsj, 0);
		
		SetTask(jf0904_TSK_shuizei_GetTask, 0);
		SetTask(jf0904_TSK_shuizei_FulfilTaskTime, 0);
		
		SetTask(jf0904_TSK_denggao_ndate, 0);
		SetTask(jf0904_TSK_denggao_curscore, 0);
		SetTask(jf0904_TSK_denggao_totscore, 0);
		SetTask(jf0904_TSK_denggao_totexp, 0);
		SetTask(jf0904_TSK_denggao_nidx, 1);
		SetTask(jf0904_TSK_denggao_gettoptimes, 0);
		SetTask(jf0904_TSK_denggao_getaward, 0);
	end
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate~= GetTask(jf0904_TSK_denggao_ndate)) then
		SetTask(jf0904_TSK_denggao_ndate, ndate);
		SetTask(jf0904_TSK_shuizei_FulfilTaskTime, 1);
	end
end

