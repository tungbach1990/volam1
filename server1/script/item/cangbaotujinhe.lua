-----------------------------------------------------
--�ļ���		��	cangbaotujinhe.lua
--������		��	�ӷ��~
--����ʱ��		��	2008-01-17
--��������		��	�Ҽ����ʹ�ú�ɻ��12Ƭ�ر�ͼ��Ƭ
--��Ʒ���		��	6,1,1651,1,0,0
------------------------------------------------------

function main()
	
	if (CalcFreeItemCellCount() < 12)  then		--�����ռ��жϣ�����Ԥ��12��
		Say("Xin h�y s�p x�p l�i h�nh trang tr��c ��!");
		return 1;
	end;
	
	for i = 490, 501 do							--�ر�ͼ��Ƭ ���
		AddEventItem(i);
	end;
	
	Msg2Player("Nh�n ���c 12 m�nh t�ng b�o ��.");
	
	WriteLog(format("%s\t%s\tName:%s\tAccount:%s\t",
				"H�p g�m",
				GetLocalDate("%Y-%m-%d %X"),
				GetName(),
				GetAccount(),
				"Nh�n ���c 12 m�nh t�ng b�o ��."));
end;