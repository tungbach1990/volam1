--description: ����30������ ���ɽ���ƶ����
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+20) then 
		Talk(1,"","H�! Mu�n ��nh b�i ta �! ��ng t��ng r�ng d� d�ng �o�t ���c 'H�a Kh� Ph�'. Th�nh th�t n�i v�i ng��i, 'H�a Kh� Ph�' �ang �� trong r��ng b�u. Ch�a kh�a r��ng ta �� trong ��ng, ng��i c� gi�i h�y v�o ��ng m� t�m!")
		SetTask(2, 30*256+30)
		AddNote("��nh b�i ��i ��u M�c Cu�ng Sa, bi�t ���c Ho� Kh� Ph� ���c c�t trong m�t b�o r��ng. C�n ph�i t�m ���c ch�a kh�a! ")
		Msg2Player("��nh b�i ��i ��u M�c Cu�ng Sa, bi�t ���c Ho� Kh� Ph� ���c c�t trong m�t b�o r��ng. C�n ph�i t�m ���c ch�a kh�a! ")
	end
end;	
