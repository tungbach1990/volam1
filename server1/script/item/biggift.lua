--�´������
--Suyu 2004.1.12

function main(sel)
	--װ����10��������Ѥ������һ��
	p=random(1,100);
	if(p<=10)then
		AddItem(6,1,15,1,0,0,0)
	end;

 	--��ʯ��50�������ͱ�ʯһ�ţ�
	p=random(1,100);
	if(p<=50)then
		AddEventItem((238+mod(p,3)))
	end;

 	--�������ֵ100000�ĺ��һ����
	AddItem(6,1,13,1,0,0,0);

 	--�̻���2���̻���
	AddItem(6,0,11,1,0,0,0);
	AddItem(6,0,11,1,0,0,0); 
	return 0
end