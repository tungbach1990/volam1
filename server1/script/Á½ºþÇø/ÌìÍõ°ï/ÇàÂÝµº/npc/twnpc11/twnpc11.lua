--description: ���ݵ���ͷ����
--author: yuanlan	
--date: 2003/4/28


function main()

if (GetFaction() == "tianwang") then					--����������������ӣ���������Ǯ
	Say("Huynh �� c�a Thi�n V��ng bang th� �i thuy�n mi�n ph�!", 2, "Tu�n l�nh!/yes", "Kh�ng /no")
else	
	Say("N�i �� hi�m nguy l�m! N�u kh�ch quan mu�n �i xin cho th�m �t ti�n!", 2, "to� /yes1", "Kh�ng ng�i/no")
--	Talk(1,"","�������ڣ��㲻�Ǳ�����ӣ���ô�쵽����������ģ���")
end;

end;


function yes()
NewWorld(59, 1425, 3472)						--��������
SetFightState(0)							--ת��Ϊ��ս��״̬
end;


function yes1()
if (GetCash() >= 500) then						--�ο�ֵ
	Pay(500)
	NewWorld(59, 1425, 3472)					--��������
	SetFightState(0)						--ת��Ϊ��ս��״̬
else
	Say("Kh�ng ti�n m� ��i �i lung tung!", 0)		
end;
end;


function no()
end;
