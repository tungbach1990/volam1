Include("\\script\\global\\login_head.lua")

function offlive_login()
	SetTask(2534,0)
end

--����һ��if�жϣ����Ա�����ؽű�ʱ�ı�����ʵ����ʹ����Ҳ���ᷢ������
if login_add then login_add(offlive_login, 0) end
