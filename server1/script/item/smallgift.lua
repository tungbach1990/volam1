--�´�С���
--Suyu 2004.1.12

function main(sel)
 	--��ʯ��10�������ͱ�ʯһ�ţ�
	p=random(1,100);
	if(p<=10)then
		AddEventItem((238+mod(p,3)))
	end;

 	--�������ֵ10000�ĺ��һ����
	AddItem(6,1,14,1,0,0,0);

 	--�̻���1���̻���
	AddItem(6,0,11,1,0,0,0);
	return 0
end