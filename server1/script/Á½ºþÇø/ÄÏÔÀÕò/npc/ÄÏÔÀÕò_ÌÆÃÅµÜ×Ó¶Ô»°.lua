--������ ������ ���ŵ��ӶԻ�

function main(sel)
Talk(4, "select", "���ng m�n h�ng c� Xuy�n Th�c, �m kh� v� h�a kh� �� l�ng danh thi�n h�. ", "Ng��i trong giang h� nghe ��n ���ng m�n th�y ��u bi�n s�c, �� th�y s� l�i h�i c�a b�n m�n", "C�i g� l� 'V� l�m ch�nh ��o, d�n t�c ��i ngh�a'? To�n l� b�n l�o to�t. B�n m�n kh�ng �a b�n ch�nh ��o, c�ng ch�ng k�t giao v�i t� ��o. ", "Mu�n gia nh�p b�n m�n kh�ng ph�i l� chuy�n ��n gi�n!")
end;


function select()
Say("C� mu�n gia nh�p b�n ph�i kh�ng?", 2, "Gia nh�p. /yes", "Kh�ng gia nh�p/no");
end;


function yes()
if (GetSeries() ~= 1) then								--�����Ҳ�����ľϵ
	Say("Ng��i kh�ng thu�c h� M�c, kh�ng th� gia nh�p b�n m�n!", 0)
else
	if (GetFaction() ~= "") then							--�������Ѿ�����ľϵ��ĳһ����
		Say("Ch�a gia nh�p m�n ph�i kh�c m�i c� th� gia nh�p b�n m�n", 0)
	else
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			SetFaction("tangmen")      					--��Ҽ�������
			NewWorld(25, 3972, 5247)					--����Ҵ��͵��������
			SetFightState(1)						--���ת����ս��״̬
			SetRevPos(15)	 						--����������
			SetTask(2, 10)
			Say("Hoan Ngh�nh b�n gia nh�p ���ng M�n!",0)  
		else
			Say("C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!", 0)			
		end		
	end		
end
end;	

function no()
end;

