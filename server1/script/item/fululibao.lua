--����������
--��»���
--ʰȡʱ�����ð��׷ۡ���ɰ�ǡ���ɳ������4�ֲ����е�һ��
--���� 80�� ��������ң���ֵ�û�

Include("\\script\\event\\jxanniversary3\\head.lua");

function PickUp(nItemIndex, nPlayerIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 0;
	end;
	
	local nrand = random(100);
	local naddrate = 0;
	for i = 1, getn(tb_JXAN_RESOURCERATE) do
		naddrate = naddrate + tb_JXAN_RESOURCERATE[i][3];
		if (naddrate >= nrand) then
			AddItem(tb_JXAN_RESOURCERATE[i][1][1],tb_JXAN_RESOURCERATE[i][1][2],tb_JXAN_RESOURCERATE[i][1][3],1,1,1);
			Msg2Player("B�n nh�n ���c m�t"..tb_JXAN_RESOURCERATE[i][2]);
			break
		end;
	end;
end

function IsPickable(nItemIndex, nPlayerIndex)
	--��ڽ���ʰȡ��Ʒ������Ч
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nCurDate > JXANNIVERSARY3_ENDDATE) then
		Say("Ho�t ��ng l�n n�y �� k�t th�c!", 0);
		return 1;
	end;

	if (JxAn_cloud_join() ~= 1) then
		return 0;
	end;

	return 1;
end;