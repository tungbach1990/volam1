
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����ϵͳ DEBUG ����ļ�
-- Edited by peres
-- 2005/06/27 PM 14:04

-- ֻ��������������
-- �����మ
-- ���ǵ�
-- �����ָ�Ħ������Ƥ���ϵ�����
-- ������������Ⱥ������ӹ�
-- ��������������ı���ͷ���
-- ����˯ʱ������ӳ�������
-- ���ǵã��峿���ѹ�����һ�̣������������
-- �������۾��������͸������һ��һ����������
-- ����������Ϊ�Ҹ�����ʹ

-- ======================================================


-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

CDebug = {

	-- �Ƿ��� DEBUG ģʽ
	-- 0 Ϊ������
	-- 1 Ϊ����
	DebugMode = 0,
	
	-- ���������ģʽ
	-- 1 Ϊ print
	-- 2 Ϊ Msg2player
	OutputMode = 1,

	-- �������Ϸ��Ļ���ߵ��Ա�������Ϣ
	-- strOut����Ҫ�������Ϣ�ı�
	-- nMode��1 Ϊ�� print �����2 Ϊ�� Msg2Player �����Ĭ��Ϊ 1��
	MessageOut = function(self, strOut, nMode)
		if nMode==nil then nMode=self.OutputMode; end;
		
		if self.DebugMode==1 then
		
			if nMode==1 then
				print ("Debug:"..strOut);
			else
				Msg2Player("Debug:"..strOut);
			end;
			
		end;
	end,

}


function OnTaskExit()
	
end;
