--���ϱ��� �ɶ��� �����ſڸ�ʾ��1
-- Update: Dan_Deng(2004-02-27) �����������(�ɶ�ɱҰ��)
-- ���ظ������ظ����ڣ���ʵʱ��1�죩

function main(sel)
	Uworld11 = GetTask(11)
	Udate = tonumber(date("%Y%m%d"))						-- ��Ҫת������ֵ����ֱ�ӽ��бȽ�
	if (GetSex() == 0) then			-- ��Ů���ݲ�ͬ
		sexstr = "Tr�ng s� "
	else
		sexstr = "N� hi�p"
	end

	if (Uworld11 == 0) or ((Uworld11 > 255) and (Uworld11 < Udate)) then		-- ���Խ�����
		Say("Th�ng c�o: G�n ��y c�c v�ng ngo�i � b� heo r�ng qu�y nhi�u, ph� ho�i m�a m�ng, th�t l� phi�n ph�c, �� treo gi�i 500 l�ng b�c �� t�m d�ng s� di�t b�y heo r�ng n�y. H� gi�t ���c b�n ch�ng th� ��n nha m�n l�nh th��ng.",2,"B�ng ni�m y�t /W11_get","Kh�ng m�ng /no")
	elseif (Uworld11 <= 255) then		-- ���������
		Talk(1,"","Nha d�ch ph� Th�nh ��: "..sexstr..GetName().."Nhi�u hi�p s� h�ng h�i v� d�n tr� ho�, �em l�i s� y�n b�nh cho d�n ch�ng, chu�n b� ��n nh�ng tr�ng s� chi�n th�ng tr� v�. ")
	else				-- δ���ظ�ʱ��
		Talk(1,"","Nha d�ch ph� Th�nh ��: "..sexstr..GetName().."V� d�n tr� h�a, ai di�t ���c m�i ho� heo r�ng � 4 v�ng, b�n ph� th��ng ngay 500 l�ng v� bi�u d��ng h�nh ��ng ngh�a hi�p. B� c�o. ")
	end
end;

function W11_get()
	Talk(1,"","B�n gi�t l�y b�n th�ng c�o, quy�t t�m tr� h�i gi�p b� t�nh!")
	SetTask(11,1)
end

function no()
end
