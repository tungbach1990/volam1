-- �ٰ���·�ˡ�����
-- by��Dan_Deng(2003-09-16)

-- ���������ͬ���������ʵ�崦���ļ�
Include ("\\script\\task\\partner\\master\\partner_master_main_03.lua");

function main()

	-- ����ƪ
	if taskProcess_003_02:doTaskEntity()~=0 then return end;
	if taskProcess_003_04:doTaskEntity()~=0 then return end;

	-- ����ƪ
	if rewindProcess_003_02:doTaskEntity()~=0 then return end;
	if rewindProcess_003_04:doTaskEntity()~=0 then return end;


	Talk(1,"","L� ng��i Kim ch� l� m�t ��m man di m�i r�, h�u d�ng v� m�u. L�m sao ch�ng c� th� l�m ��i th� c�a ��i T�ng? Vi�c g� ch�ng ta c� ph�i khinh s� ch�ng, t� h� d�a m�nh? �� c� Ho�ng Th��ng � ��y, ta tin t��ng b�n ng��i Kim kia s� kh�ng th� t�n c�ng ��n L�m An n�y. ")

end;
