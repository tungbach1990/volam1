-- ��ͭǮ����������Ʒ��NPC
-- Fanghao Wu
-- 2004.11.1

function main()

	Say("Kh�ch quan mu�n b�o v�t g� c� th� tr�c ti�p ��n <color=yellow>K� Tr�n C�c<color> ch�n mua l� ���c, l�o phu cu�i c�ng c�ng ���c ngh� ng�i r�i! Sao? Kh�ng bi�t ���ng ��n <color=yellow>K� Tr�n C�c<color> �?   Nh�n tr�c ti�p <color=green>v�o h�nh tr�n � d��i b�n tay ph�i<color> l� ���c r�i.", 0);
	return
	
	-- Say ( "������ʿ����ѧ����������ʵ�ܼ򵥣���������һ�����Ƶ���������ҾͿ��Խ��㡣��ͬ����߿������ݳɲ�ͬ�����ӣ�����Ҫ��Ҫ��һ����", 3, "����/OnBuy", "��ʱ������/OnCancel", "�����������/OnAbout" );
end

function OnBuy()
	Sale( 95, 3 );
end

function OnCancel()
end

function OnAbout()
	Say( "�em trang b� M�t n� b�t k� ��t v�o n�i trang b�<color=yellow> M�t n� <color>, nh�n v�t  khi mang v�o l�p t�c bi�n th�nh NPC, t�n nh�n v�t v� t�t c� thu�c t�nh ��u<color=yellow> kh�ng thay ��i <color>, c�ng<color=yellow> kh�ng �nh h��ng <color>��n c�c d�ng c� trang b� v� c�ng n�ng c�a nh�n v�t th��ng d�ng. L�c ta c�i b� M�t n� trong � trang b� ra, nh�n v�t s� tr� l�i ban ��u, s� l�n s� d�ng M�t n�<color=yellow> gi�m �i m�t l�n<color>.", 0 );
end