
-- ====================== �ļ���Ϣ ======================

-- ������Եonline 9-1 ���鲹���ͷ�ļ�
-- Edited by peres
-- 2006/10/30 PM 11:19

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

Include("\\script\\event\\remedy\\remedy_head.lua");
Include("\\script\\task\\task_addplayerexp.lua");

_CRemedy = inherit(CRemedy, {
	
	payProcess = function(self)
		local nExp = GetLevel() * 10 * 20000;
		tl_addPlayerExp(nExp);
		Msg2Player("���õ��˲����ľ��飺<color=yellow>"..nExp.."<color> �㣡");
		return 1;
	end,
	
});

CMyRemedy = new(_CRemedy,
				0,
				61031,
				61106,
				2516,
				50,
				"9 �� 1 ͣ��ά����������");

function Remedy_20061031_Main()
	Say("��٣���Ҫ��ȡ10�·� 9 �� 1 ͣ��ά���Ĳ��������𣿴˴ξ��鲹������ȡ����Ϊ <color=yellow>2006��10��31�� �� 2006��11��06�գ�50������ÿ������һ��<color>��", 
		2,
		"�ǵ�/Remedy_20061031_Get",
		"����/onExit");
end;


function Remedy_20061031_Get()
	local nResult = CMyRemedy:payForPlayer();
	local szErrotMsg = "";

		if nResult==1 then
			Say("��٣����Ѿ��ɹ���ȡ�� 9 �� 1 ͣ��ά���������飬���ྭ����<color=yellow>����֮����Ȼ����<color>�ģ�ף�������и���������", 0);
			return 1;
		else
			for i=1, getn(nResult) do
				szErrotMsg = szErrotMsg..nResult[i];
			end;
			
			Say("��٣��Բ������޷���ȡ�����ľ��飬ԭ���У�<enter>"..szErrotMsg, 0);
			return 0;
		end;	
end;


function onExit()
	Say("��٣�������������һ�����������˰��������͵ľ��鶼��Ҫ��", 0);
end;