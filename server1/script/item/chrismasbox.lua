-- ���ʥ����Ʒ�У�������һ��������ߣ�
-- By: zhengfei(2004-12-13)

function main(sel)
	p=random(0,99)
	if (p < 50) then
		AddItem(0,11,70,0,0,0,0)		-- ʥ������
		Msg2Player("Gi�ng Sinh vui v�! B�n nh�n ���c 1 M�t n� �ng gi� Noel!")
	else
		AddItem(0,11,71,0,0,0,0)	        -- ʥ����ʹ
		Msg2Player("Gi�ng Sinh vui v�! B�n nh�n ���c 1 M�t n� Thi�n S� Gi�ng sinh!")
	end
	return 0
end
