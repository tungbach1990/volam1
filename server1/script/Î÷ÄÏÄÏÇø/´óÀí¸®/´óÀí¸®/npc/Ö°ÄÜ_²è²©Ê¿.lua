-- ����ְ�ܡ��販ʿ
-- by��Dan_Deng(2003-09-16)

-- ���������ͬ���������ʵ�崦���ļ�
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

function main()
	
	-- ������֮�ص�������
	if taskProcess_002_02:doTaskEntity()~=0 then return end;
	if taskProcess_002_11:doTaskEntity()~=0 then return end;
	
	Talk(3,"","Tr� c�a ch�ng ta n�i ti�ng nh�t V�n Nam, ��i L� ch�ng ta n�i ti�ng l� tr� H� Quan �� Tr�.","H� Quan �� Tr� h�nh th�c kh�ng gi�ng nhau, lo�i l�n nh� ch�n c�m, lo�i nh� nh� n�t �o.","X�a c� c�u 'H� Quan Tr�, �� Giang Th�y' H� Quan Tr� nh�t ph�i d�ng n��c s�ng pha m�i ��ng. Tr� pha xong c� m�u v�ng cam, m�i v� th�m n�ng, tr� pha �� l�u v�n l� c�c ph�m.")
end;
