TONGNAMERES_SUCCESS = 0			-- �ɹ�
TONGNAMERES_FAILURE = 1			-- ʧ��
TONGNAMERES_INVALID = 2			-- ������Ƿ�
TONGNAMERES_FREE	= 3			-- ���������ʹ��
TONGNAMERES_USED	= 4			-- ������Ѿ���ʹ��
TONGNAMERES_APPLY	= 5			-- ������Ѿ�����

TASKVALUE_BLEND 	= 2320		-- �������������

function cancel()
end

-- ����Ƿ�����޸Ľ�ɫ��
function check_renamerole()
	if (GetBit(GetTask(TASKVALUE_BLEND), 1) == 1) then
		return 1;
	end
	return 0;
end

-- ����Ƿ�����޸İ����
function check_renametong()
	local value = GetTask(TASKVALUE_BLEND)
	if (GetBit(value, 2) == 1) then
		return 1;
	end
	return 0;
end

--  ����Ƿ������ȡԭ��������
function check_castellan_remedy()
	local value = GetTask(TASKVALUE_BLEND)
	if (GetBit(value, 3) == 1) then
		return 1;
	end
	return 0;
end
