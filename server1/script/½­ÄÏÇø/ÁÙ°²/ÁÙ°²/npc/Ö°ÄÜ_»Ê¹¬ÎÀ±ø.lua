-- �ٰ���ְ�ܡ��ʹ���������������ؤ��50������
-- by��Dan_Deng(2003-09-16)

function main()
		UTask_gb = GetTask(8)
	if ((UTask_gb >= 50*256+30) and (UTask_gb <60)) then		-- �������Σ�
		Talk(3,"","T�o c�ng c�ng c� l�nh! Kh�ng c� ph�n s� kh�ng ���c nh�p cung! �i �i!",":Ta c� L�nh b�i th�ng h�nh","C� l�nh b�i th�ng h�nh c�ng kh�ng ���c v�o! ")
--		SetTask(8,50*256+40)
	elseif (UTask_gb == 50*256+20) and (HaveItem(139) == 1) then	-- ���ڶ��Σ�
		Msg2Player("Ki�m tra l�nh b�i kh�ng sai, ti�n v�o Ho�ng cung. ")
		NewWorld(177, 1569, 3169)
	elseif (UTask_gb == 50*256+10) then		--����50�����񣨵�һ����
		Talk(3,"","��ng l�i! ��ng l�i! Ng��i ch�n s�ng hay sau m� ch�y lung tung n�i ��y?","T�i h� l� �� t� C�i Bang, c� m�t th� c�c k� quan tr�ng ph�i d�ng cho Ho�ng th��ng","C� ph�i ai c�ng ���c g�p Ho�ng th��ng ��u? Kh�ng c� l�nh b�i th�ng h�nh c�a Khu m�t s� Tr��ng ��i nh�n, ai c�ng kh�ng ���c v�o! ")
		SetTask(8,50*256+20)
	else
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","��ng l�i! ��ng l�i! Ng��i ch�n s�ng hay sau m� ch�y lung tung n�i ��y?")
		elseif (i == 1) then
			Talk(1,"","Ho�ng cung c�m ��a! Mau �i �i! ")
		else
			Talk(1,"","��ng l�i! ��ng l�i! Ng��i ch�n s�ng hay sau m� ch�y lung tung n�i ��y?")
		end
	end
end;
