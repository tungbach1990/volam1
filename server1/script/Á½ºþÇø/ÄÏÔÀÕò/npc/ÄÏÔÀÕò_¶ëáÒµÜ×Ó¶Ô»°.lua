--������ ������ ���ҵ��ӶԻ�

function main(sel)
Talk(4, "select", "Trong thi�n h� c�c m�n ph�i do n� nhi s�ng l�p th� b�n m�n ��ng ��u!", "�� t� b�n m�n kh�ng nh�ng v� ngh� cao c��ng, c�m k� th� h�a ��u tinh th�ng! ", "Ai n�i giang h� l� th� gi�i c�a nam nh�n th� c� nh�n b�n ph�i m� l�m g��ng", "B�n ph�i ch� nh�n �� t� n�.")
end;

function select()
Say("C� mu�n gia nh�p b�n ph�i kh�ng?", 2, "Gia nh�p. /yes", "Kh�ng gia nh�p/no");
end;


function yes()
if (GetSeries() ~= 2) then								--�����Ҳ�����ˮϵ
	Say("Ng��i kh�ng thu�c h� Th�y, kh�ng th� gia nh�p b�n m�n!", 0)
else
	if (GetFaction() ~= "") then							--�������Ѿ�����ˮϵ��ĳһ����
		Say("Ch� c�n ch�a gia nh�p m�n ph�i kh�c l� c� th� gia nh�p b�n m�n!", 0)
	else	
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			if ( GetSex() == 0 ) then     					--�������Ա�Ϊ��
				Say("B�n ph�i ch� nh�n �� t� n�.", 0)
			else								--����Ա�ΪŮ
    				SetFaction("emei")       				--��Ҽ��������
    				NewWorld(13, 1867, 5021)				--����Ҵ��͵��������	
				SetFightState(1)					--���ת����ս��״̬
    				SetRevPos(13)		  				--����������
    				SetTask(1, 10)
    				Say("Hoan Ngh�nh b�n gia nh�p Nga Mi ph�i! ",0)  
			end
		else
			Say("C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!", 0)	
		end
	end
end;			
end;

function no()
end;


