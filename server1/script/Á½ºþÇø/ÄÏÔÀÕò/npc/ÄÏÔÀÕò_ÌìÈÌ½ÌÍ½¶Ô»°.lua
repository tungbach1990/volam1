--������ ������ ���̽�ͽ�Ի�

function main(sel)
Talk(2, "select", "Gi�o ch� c�a b�n gi�o l� Ho�n Nhan H�ng Li�t. Danh ch�n thi�n h�! Ho�ng �� Kim qu�c c�ng ph�i nh��ng 3 ph�n", "Cao th� c�a b�n gi�o nhi�u v� s�! Nh�n t�i ng�a h� t�ng long")
end;

function select()
Say("C� mu�n gia nh�p b�n gi�o kh�ng?", 2, "Gia nh�p. /yes", "Kh�ng gia nh�p/no");
end;


function yes()
if (GetSeries() ~= 3) then								--�����Ҳ����ڻ�ϵ
	Say("Ng��i kh�ng thu�c h� H�a, kh�ng th� gia nh�p b�n gi�o!", 0)
else
	if (GetFaction() ~= "") then							--�������Ѿ����ڻ�ϵ��ĳһ����
		Say("Ch�a gia nh�p m�n ph�i kh�c m�i c� th� gia nh�p b�n gi�o", 0)
	else
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			SetFaction("tianren")      					--��Ҽ������̽�
			--NewWorld(45, x, y)						--����Ҵ��͵��������
			--SetFightState(1)						--���ת����ս��״̬
			--SetRevPos(ID)	 						--����������
			--SetTask(4, 10)
			Say("Hoan Ngh�nh b�n gia nh�p Thi�n Nh�n gi�o! ",0)  
		else
			Say("�� t� b�n gi�o to�n l� anh h�ng xu�t ch�ng. K�m c�i nh� ng��i kh�ng x�ng ��ng v�o b�n gi�o!", 0)
		end		
	end	
end
end;	

function no()
end;

