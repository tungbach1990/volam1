-- ���������Ʒ��������һ����Ʒ��
-- By: Dan_Deng(2004-06-01)

function main(sel)
	p=random(0,99)
	if (p < 5) then
		p = random(238,240)
		AddEventItem(p)			-- ˮ��
		Msg2Player("B�n nh�n ���c m�t vi�n Th�y Tinh. ")
	elseif (p < 10) then
		AddEventItem(353)			-- �ɺ�
		Msg2Player("B�n nh�n ���c m�t vi�n Tinh H�ng B�o Th�ch. ")
	elseif (p < 20) then
		AddItem(6,1,15,1,0,0,0)		-- ����
		Msg2Player("B�n nh�n ���c m�t t�m �o kho�c. ")
	elseif(p < 40) then
		AddItem(6,1,18,1,0,0,0)		-- ������ӡ
		Msg2Player("B�n nh�n ���c m�t c�i T�m T�m T��ng �n ph�! ")
	elseif (p < 65) then
		AddItem(6,1,19,1,0,0,0)		-- �����
		Msg2Player("B�n nh�n ���c m�t c�i T�m T�m T��ng �n ph�! ")
	else
		AddItem(6,0,20,1,0,0,0)		-- õ����
		Msg2Player("B�n nh�n ���c m�t c�nh hoa h�ng. ")
	end
	return 0
end
