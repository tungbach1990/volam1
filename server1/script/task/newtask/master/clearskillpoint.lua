
-- 40 ����ǰ����ϴ�㺯��
-- 2005 �� 03 �� 03 ������˹�޸Ĺ�ϴ���еļ��ܵ�


function ClearMagicPoint()
	i = HaveMagic(210)		-- �Ṧ�������
	j = HaveMagic(400)		-- ���ٸ���ƶ���������
	n = RollbackSkill()		-- ������ܲ��������м��ܵ㣨�����Ṧ�����⼼�ܣ�
	x = 0
	if (i ~= -1) then x = x + i end					-- �������ж����ų���δѧ���Ṧ���˷���-1�Ӷ����µ�������������
	if (j ~= -1) then x = x + j end
	rollback_point = n - x							-- �Ѽ��ܵ㵱�����е������������ȿ۳��Ṧ��
	if (rollback_point + GetMagicPoint() < 0) then	-- ���ϴ���˸���������0��Ϊ�Ժ���ϴ�㱣����
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210,i) end			-- ���ѧ���Ṧ��ӻ�ԭ�еȼ�
	if (j ~= -1) then AddMagic(400,j) end			-- ���ѧ�����ٸ���ƶ��ͬ������
end;