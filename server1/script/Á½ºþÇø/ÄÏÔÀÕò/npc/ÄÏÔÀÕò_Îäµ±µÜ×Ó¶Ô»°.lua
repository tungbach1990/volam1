--������ ������ �䵱���ӶԻ�

function main(sel)
Talk(3, "select", "Thi�n h� v� h�c, 'B�c t�n Thi�u l�m, nam s�ng V� �ang'. Ch�c ng��i �� t�ng nghe qua?", "V� c�ng b�n ph�i l�y t�nh ch� ��ng, l�y nhu kh�c c��ng, l�y ng�n th�ng d�i, l�y ch�m ��nh nhanh, l�y � v�n kh�, l�y kh� v�n th�n, ��nh sau t�i tr��c. Khi�m t�n �i�m ��m, l�y v� h�nh th�ng h�u h�nh, �� l� c�nh gi�i v� h�c t�i cao!", "V� ngh� b�n m�n c� 'ng� b�t truy�n': y�u �u�i, hi�m ��c, h�o th�ng, cu�ng t�u, gian d�m s� kh�ng truy�n v� c�ng")
end;


function select()
Say("C� mu�n gia nh�p b�n m�n kh�ng?", 2, "Gia nh�p. /yes", "Kh�ng gia nh�p/no");
end;


function yes()
if (GetSeries() ~= 4) then								--�����Ҳ�������ϵ
	Say("Ng��i kh�ng thu�c h� Th�, kh�ng th� gia nh�p b�n m�n!", 0)
else
	if (GetFaction() ~= "") then							--�������Ѿ�������ϵ��ĳһ����
		Say("Ch�a gia nh�p m�n ph�i kh�c m�i c� th� gia nh�p b�n m�n", 0)
	else
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			SetFaction("wudang")      					--��Ҽ����䵱
			--NewWorld(mapID, x, y)						--����Ҵ��͵��������
			--SetFightState(1)						--���ת����ս��״̬
			--SetRevPos(ID)	 						--����������
			--SetTask(5, 10)
			Say("Hoan Ngh�nh b�n gia nh�p V� �ang ph�i! ",0)  
		else
			Say("�� t� b�n m�n to�n l� anh h�ng xu�t ch�ng. K�m c�i nh� ng��i kh�ng x�ng ��ng v�o b�n m�n!", 0)
		end		
	end	
end
end;	

function no()
end;

