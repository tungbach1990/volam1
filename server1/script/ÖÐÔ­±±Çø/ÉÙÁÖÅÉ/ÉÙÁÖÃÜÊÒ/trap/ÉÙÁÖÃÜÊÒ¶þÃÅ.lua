--���ֺ�ɽ���� ���� trap
-- by��Dan_Deng(2003-08-04)

function main(sel)
	UTask_sl = GetTask(7)
	UTask_sl40tmp = GetTaskTemp(43)
	if (UTask_sl >= 40*256+20) and (UTask_sl < 50*256) then		-- �����������в��ܽ��룬����ÿ�ν��붼Ҫ�ش�����
		Say("Kh�u quy�t m� th�ch m�n l�: ",4,"�n Ma Ni B�t M� H�ng /L40_S2_wrong","H�ng B�i M� Ma Ni �n /L40_S2_wrong","B�t M� Ni H�ng �n Ma /L40_S2_wrong","�n B�t Ni Ma M� H�ng. /L40_S2_correct")
	else
		Talk(1,"","B�n l�n ��y m�y l�n th�ch m�n, nh�ng th�ch m�n tr�n tr��t kh�ng c� m�t �i�m t�a n�o.")
--		SetPos()		--������Ƴ�trap��
	end
--	AddTermini(47)		--����ʲô������
end;

function L40_S2_correct()
	Talk(1,"","Kh�u quy�t v�a ni�m xong, th�ch m�n t� t� m� ra.")
--	NewWorld(74, 2040 ,3259)		-- �ȴ��ṩ��ͼ����
end;

function L40_S2_wrong()
	Talk(1,"","Sau khi ��c kh�u quy�t xong, th�ch m�n v�n kh�ng c� ph�n �ng g� h�t, kh�ng bi�t c� nh� nh�m kh�u quy�t kh�ng?")
--	SetPos()		--������Ƴ�trap��
end;
