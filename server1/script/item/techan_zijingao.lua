--//////////////////
--�Ͻ��
--ÿ�ι���8Сʱ(8*60)��ʱ��ǵ�TaskID1739
--����ɫ���һ���ʱ���г�������ڳ�����Ʒ�����۳�ʱ�䣬ͬ��ͨ���
VALUE_ZIJIGAO_CONTRIBUTION = 200	--�Ͻ����Ҫ�ĸ��˹��׶�
TASKID_TECHAN_ZIJINGAO = 1739	--�Ͻ��ʹ��ʱ��

function addzijingao_main(nCount)
	if (not nCount) then
		nCount = 1
	end;
	local nCurValue = GetTask(TASKID_TECHAN_ZIJINGAO);
	if (nCurValue < 0) then
		nCurValue = 0;
	end;
	nCurValue = nCurValue + 8 * 60 * nCount;
	SetTask(TASKID_TECHAN_ZIJINGAO, nCurValue);
	nRestH, nRestM = GetMinAndSec(nCurValue);
	return nRestH, nRestM;
end;
