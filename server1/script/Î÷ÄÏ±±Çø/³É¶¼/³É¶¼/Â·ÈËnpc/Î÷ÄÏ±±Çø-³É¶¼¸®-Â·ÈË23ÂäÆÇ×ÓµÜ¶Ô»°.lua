--���ϱ��� �ɶ��� ·��23�����ӵܵĶԻ� ��������
--author: yuanlan	
--date: 2003/3/19


function main(sel)

i = random(0,4)									--���������Ļ�����20%

if (i == 0) then  -- ��ʱ�ر�
-- Say("�����ӵܣ��ˣ�������ҵı�������һ����֪�����Ǹ�ʶ�����ˣ����ƣ�������ҵĴ���֮������Ҫ������ͷʵ�ڽ��úܣ��һ��᲻�����أ�", 2, "��/accept", "����/refuse")
Say("V�a nh�n th� bi�t ngay l� ng��i tinh m�t! N�o! N�o! Ch�n m�t th� �i!", 0)
return
end;

if (i == 1) or (i == 2) then  
Say("Xem c�i g� m� xem! ��ng t��ng ta kh�ng bi�t, ng��i c� � ��nh l�y b�o b�i c�a ta �?", 0)
return
end;

if (i == 3) or (i == 4) then  
Say("��ng th�y ta �n m�c r�ch r��i nh� th� n�y...n�i cho ng��i bi�t ta l� danh m�n chi h�u, nh� n�m �� ", 0)
return
end;

end;


function accept()

if (GetCash() >= 5000) then					--�ο�ֵ
	j = random(0, 9)					--�������
	k = random(2, 8)					--�ȼ�������������ɵ�����Ʒ�ļ۸�ΧΪ500��50000
	m = random(0, 4)					--ϵ��
	if (j == 0) then 					--closeweapon
		n = random(0, 5)				--��ϸ���
		AddItem(0, 0, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 1) then 					--rangeweapon
		n = random(0, 2)				--��ϸ���
		AddItem(0, 1, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 2) then 					--armor
		n = random(0, 9)				--��ϸ���
		AddItem(0, 2, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 3) then 					--ring
		AddItem(0, 3, 0, k, m, 1)						
		Pay(5000)
	end
	if (j == 4) then 					--amulet
		n = random(0, 1)				--��ϸ���
		AddItem(0, 4, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 5) then 					--boots
		n = random(0, 3)				--��ϸ���
		AddItem(0, 5, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 6) then 					--belt
		n = random(0, 1)				--��ϸ���
		AddItem(0, 6, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 7) then 					--helm
		n = random(0, 8)				--��ϸ���
		AddItem(0, 7, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 8) then 					--cuff
		n = random(0, 1)				--��ϸ���
		AddItem(0, 8, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 9) then 					--pendant
		n = random(0, 1)				--��ϸ���
		AddItem(0, 9, n, k, m, 1)						
		Pay(5000)
	end
else
	Say("Th� ra ch� l� m�t k� ngh�o m�c", 0)
end;

end;


function refuse()
Say("H�a ra c�ng ch� l� m�t k� l��ng g�t.", 0);
end;
