--������ ������ �������ڶԻ�

function main(sel)
Talk(3, "select", "Bang ch� D��ng Anh v� ngh� cao c��ng, gan d� h�n ng��i, kh�ng k�m g� tu mi nam t�!", "B�n m�n quy lu�t uy nghi�m, ng��i ��ng th� m�nh! Kh�ng ai trong thi�n h� d�m coi khinh!", "B�n bang v�a ch�ng Kim v�a kh�ng T�ng! Huynh �� ��u xu�t th�n l� d�n ngh�o, phi�u b�t giang h� l� v� k� sinh nhai! Ai l�m vua b�n ta ch� c�n quan t�m")
end;

function select()
Say("C� mu�n gia nh�p b�n gi�o kh�ng?", 2, "Gia nh�p. /yes", "Kh�ng gia nh�p/no");
end;


function yes()
if (GetSeries() ~= 0) then								--�����Ҳ����ڽ�ϵ
	Say("�� t� b�n bang to�n l� anh h�ng xu�t ch�ng. K�m c�i nh� ng��i kh�ng x�ng ��ng v�o b�n bang!", 0)
else
	if (GetFaction() ~= "") then							--�������Ѿ����ڽ�ϵ��ĳһ����
		Say("Ch�a gia nh�p m�n ph�i kh�c m�i c� th� gia nh�p b�n bang", 0)
	else	
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			if ( GetSex() == 1 ) then 					--�������Ա�ΪŮ
				Say("Thi�n V��ng bang luy�n t�p c�c kh�, y�u �u�i nh� c� n��ng kh�ng th�ch h�p ��u!", 0)
			else								-- ����Ա�Ϊ��
    				SetFaction("tianwang")       				--��Ҽ���������
    				--NewWorld(59, 1425, 3472)				--����Ҵ��͵��������
				--SetFightState(1)					--���ת����ս��״̬	
    				--SetRevPos(21)		  				--����������
    				--SetTask(3, 10)
    				Say("Hoan Ngh�nh b�n gia nh�p Thi�n V��ng bang! ",0)  
			end
		else
			Say("C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!", 0)	
		end
	end
end;			
end;


