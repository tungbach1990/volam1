-- �ٰ���ְ�ܡ��Ƶ��ϰ�
-- by��Dan_Deng(2003-09-16)

function main()
	i = random(0,2)
	if (i == 0) then
		Talk(1,"","Kh�ch quan, xin m�i ng�i! Ng�i d�ng g�?")
	elseif (i == 1) then
		Talk(1,"","Danh t�u ��c s�n th�nh L�m An ch�ng ta, m�i n�m thu� r��u ��u ��ng nhi�u nh�t c� n��c. R��u L�m An ch�ng ta kh�c v�i nh�ng n�i kh�c, n��c n�u r��u l� l�y � t�n T�y H�, v� v�y m� u�ng v�o mi�ng r�t cay m� ng�t. ")
	else
		Talk(1,"","R��u n�i ti�ng nh�t T�y Ti�n l�u ch�ng ta g�i l� 'T�y T� Ng�c Nh��ng', kh�ch quan c� mu�n d�ng th� kh�ng? ")
	end
end;
