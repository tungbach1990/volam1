--���ϱ��� ����� ��ʦ�Ի� ���ִ����Ṧ����(�����ظ�������)
-- Update: Dan_Deng(2003-08-09)
-- ����Ҫ��: �ȼ�(>=2), ��Ǯ(>=100��)
-- Update: Dan_Deng(2003-11-04)��Ϊģ�巽ʽ��ȫ��ͳһ����һ������������ά������չ

Include("\\script\\global\\���ɽ�������\\�Ṧ_��ʦģ��.lua")

function main(sel)
	UTask_world20 = GetTask(44)		-- ���Ӱ�ʦ����
	if (UTask_world20 == 10) then			-- ���Ӱ�ʦ���������
		Talk(1,"","�a? H� T� mu�n h�c v� �? ��a tr� n�y ng�y th��ng r�t hi�u ��ng, xem ra t� ch�t kh�ng t�i. ���c, v� n�i v�i cha n�, ta thu H� T� l�m �� ��. ��u l� ng��i trong l�ng c�, ��ng t�nh t�i chuy�n ti�n nong! M�i d�p l� t�t mang l�n x�u th�t s�y l� ���c r�i!")
		SetTask(44, 20)
		AddNote("V� s� ��ng � d�y v� mi�n ph� cho H� t�, mau v� b�o tin n�y cho cha c�a H� t� bi�t ")
		Msg2Player("V� s� ��ng � d�y v� mi�n ph� cho H� t�, mau v� b�o tin n�y cho cha c�a H� t� bi�t ")
	else
		learn()
	end
end;
