-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - ǧ�������
-- �ļ�������qiannian_heshouwu.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-21 12:17:35
-- ת�����ɫʹ�ã�ͨ������Ʒ�����25��Ǳ�ܵ�

-- ======================================================

IncludeLib("SETTING");

TSK_QIANNIAN_HESHOUWU_PROP = 2597;

function main()
	if (GetTask(TSK_QIANNIAN_HESHOUWU_PROP) >= 25) then
		Msg2Player("V�t ph�m n�y kh�ng th� n�ng c�p c�ng l�c c�a ��i hi�p ���c.");
		return 1;
	end
	
	if (ST_IsTransLife() ~= 1) then
		Msg2Player("��i hi�p kh�ng th� thu ���c b�t k� hi�u qu� n�o.");
		return 1;
	end
	
	local tb_prop = {
		{pot=3,msg="M�t �i�m "},
		{pot=4,msg="Ch�a h�a "},
		{pot=5,msg="M�t s� "},
		{pot=6,msg="Kh�ng �t "},
		{pot=7,msg="H�i nhi�u "},
		};
	
	local n_rand = random(1,5);
	local n_prop = tb_prop[n_rand].pot
	if (n_prop + GetTask(TSK_QIANNIAN_HESHOUWU_PROP) > 25) then
		n_prop = 25 - GetTask(TSK_QIANNIAN_HESHOUWU_PROP);
	end
	
	AddProp(n_prop);
	
	SetTask(TSK_QIANNIAN_HESHOUWU_PROP,GetTask(TSK_QIANNIAN_HESHOUWU_PROP)+ n_prop);
	
	Msg2Player(format("Sau khi s� d�ng c� th� thu ���c %s hi�u qu�",tostring(n_prop)));
end
