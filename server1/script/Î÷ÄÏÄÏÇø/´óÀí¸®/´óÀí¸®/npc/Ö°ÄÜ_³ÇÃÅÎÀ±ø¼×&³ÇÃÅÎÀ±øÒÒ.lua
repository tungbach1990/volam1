-- ����ְ�ܡ�����������&����������
-- by��Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-05-27) С��ʧ������

Include("\\script\\global\\repute_head.lua")
Include("\\script\\global\\map_helper.lua")
npc_name = "<#> V� binh Th�nh m�n"

function default_talk()
--	UTask_world42 = GetTask(42)	-- �����������
--	if ((UTask_world42 == 0) and (GetLevel() >= 80) and (GetReputeLevel(GetRepute()) >= 7)) then		-- ���������������ȼ�������ֵ�Ĺ�ϵ���Ǻ���ȷ��Ҫ������
--		Talk(6,"U42_get","���������ף���˵�����������С���޹�ʧ�٣�","���������ң��ǰ�����ԭ�����ͷҶ��������С��Ҳ�����ˣ�����������Ұ����Ҷ��ӡ�","��ң���λ��������ô���£�","���������ף��Ǻǣ���λ�����Ǳ����ã�Ӣ�����䣬��������ܹ��⵵���¿���","��ң�������·����ƽ�ε��������ұ����֡�","���������ң���ѽ������ľ�Ǯ����û��������")
--	else
		Talk(4,"","H�m nay ta �� th�y ���c 9 m� nh�n, kh�ng nh�n th� ti�c, nh�n kh�ng m�t ti�n m�! ","Ti�u t� n�y h�nh nh� ch�n s�ng r�i!","Nh�n h� th� c� nh�n h�, nh�n b�n n�y b�n kia, l�n l�n c�ng t�t!","Kh�ng sai! D�ng v� th�t tuy�t! ")
--	end;
end;

function U42_get()
	Say("��ng v�y! H�y c�n ��ng 5 v�n l��ng.",2,"Hai v� ��i ca th� v� th�t/yes1","D�i ���c ng��i nh�ng kh�ng d�i���c m�nh!/no")
end;

function yes1()
	if (GetCash()>=50000) then 
		Pay(50000)
		Talk(1,"","C�c h� ra tay h�o ph�ng, h�y �i D��c V��ng C�c h�i ��o nh�n ch�n qu�, �ng ta bi�t nh�ng vi�c b� m�t n�y.")
		SetTask(42, 10)
		AddNote("Nhi�m v� Ti�u Nhi m�t t�ch: Ti�p nh�n nhi�m v�, �i D��c V��ng C�c t�m Qua C��c ��o nh�n h�i v� tin t�c c�a ��a tr�.")
		Msg2Player("Nhi�m v� Ti�u Nhi m�t t�ch: Ti�p nh�n nhi�m v�, �i D��c V��ng C�c t�m Qua C��c ��o nh�n h�i v� tin t�c c�a ��a tr�.")
	else
		Talk(1,"","�i �i! Ti�n kh�ng c� l�m ��i hi�p g�, v� qu� l�m ru�ng �i!")
	end
end;

function no()
	Talk(1,"","�i �i! Ti�n kh�ng c� l�m ��i hi�p g�, v� qu� l�m ru�ng �i!")
end;
