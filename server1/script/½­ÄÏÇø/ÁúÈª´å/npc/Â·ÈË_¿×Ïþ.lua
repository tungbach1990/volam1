--��Ȫ�� ·�� ����
--��Ȫ���������񣺺���ò���
-- By: Dan_Deng(2003-09-03)

function main(sel)
	UTask_world18 = GetTask(18)
	if (UTask_world18 == 3) then		-- ������
		Talk(5,"W18_step","Kh�ng Hi�u! C� ph�i ng��i r�t gh�t ng��i cha sau kh�ng?","T�i sao ng��i l�i n�i nh� v�y?","Kh�ng ph�i sao?","���ng nhi�n l� kh�ng! �ng �y l� m�t ng��i t�t. ��i ��i v�i m� con ta r�t t�t!","Th�t v�y �? V�y th� t�t r�i N�u bi�t ���c nh� v�y th� �ng �y s� r�t vui")
	else				-- ������Ի�
		Talk(1,"","M� con ta tr��c ��y ��u b� m�i ng��i khinh r�,t� khi ���c �ng �y b�o b�c th� m�i th� ��u �� th�t s� thay ��i")
	end
end;

function W18_step()
	SetTask(18,6)
	Talk(1,"","� ")
	AddNote("�� hi�u ���c t�m t� c�a Kh�ng Hi�u, l�p t�c �i n�i l�i v�i �ng ch� t�p h�a cho �ng �y y�n t�m ")
	Msg2Player("�� hi�u ���c t�m t� c�a Kh�ng Hi�u, l�p t�c �i n�i l�i v�i �ng ch� t�p h�a cho �ng �y y�n t�m ")
end
