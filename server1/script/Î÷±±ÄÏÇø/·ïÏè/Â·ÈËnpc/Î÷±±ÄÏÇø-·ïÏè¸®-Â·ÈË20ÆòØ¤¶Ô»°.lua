--�������� ���踮 ·��20��ؤ�Ի� ��������

function main(sel)

--UTask_world36 = GetTask(64);

--if (UTask_world36 == 0) then 
--Talk(3, "select", "��ؤ��������", "С�磬��ô���Ⱖ��̾���ģ�", "��ؤ��������������İɣ�û�����ٸ�ǰ�ĸ�ʾ���⼸�쳯͢������ʹ�������Ӳ죬������ؤ�������Ͻ����֣�˵���а����ݣ���˵������ʹ�����Ӳ��������ЩҪ������ʲô��ϵ���⼸�����������⣬��һ�Ҵ�С����ô������")
--return
--end;

--if (UTask_world36 == 1) then 
Say("Nh�n anh ch�c l� ng��i n�i kh�c, anh kh�ng th�y c�o th� tr��c c�a nha m�n sao? M�y ng�y n�y tri�u ��nh c� quan m�t s� ��n th� s�t n�i ��y. V� v�y �n xin kh�ng ���c ra ���ng. Quan m�t s� ��n v�i vi�c ch�ng ta xin c�m th� c� li�n quan g� ch�? M�y ng�y nay kh�ng l�m ���c g�, c� nh� l�y g� m� s�ng.", 0)
--end;

end;


function select()
Say("Nh�n anh ta th�t ��ng th��ng� ", 2, "Cho ti�n /accept", "Kh�ng cho ti�n /refuse");
end;


function accept()

if (GetCash() > 1000) then							--�ο�ֵ
	Talk(2, "select1", "Ti�u ca! ��y c� �t ng�n l��ng, huynh c�m �� m� d�ng!", "Ch�ng ta b�o n��c t��ng ph�ng, ng��i l�i cho ta nhi�u ng�n l��ng nh� v�y, th�t l� m�t ng��i tr��ng ngh�a! Th� th�...ta l�n l�n tr�n giang h� c�ng c� kh�ng �t kinh nghi�m, ta s� truy�n l�i �� ng��i ph�ng th�n")	
else
	Say("Xem ra ng��i c�ng kh�ng gi�u c� g�, ta ch� nh�n h�o � c�a ng��i th�i.", 0)
end;

end;


function refuse()
end;


function select1()
Pay(GetCash()/3)
AddOwnExp(1000)	
SetTask(64, 1)
end;