--������ ������ ��̯�ϰ�Ի�

function main(sel)
	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","Ng��i ��n d� la tin t�c c�i ch�t c�a Th� Lang �h? H�i, g�n ��y d��i ch�n n�i Ho�nh S�n c� nhi�u ng��i ch�t l�m. V� b� kho�i H�a Nh� Gia hay ��n qu�n ta �n u�ng c�ng ch�t m�t c�ch k� l�, quan ph� ��n gi� ch�a t�m ra th� ph�m n�a, l�m ng��i ta s� qu�, kh�ng bi�t c� manh m�i m�i ch�a? ta c�ng kh�ng r� n�a, ng��i �i h�i th� ng��i kh�c xem sao.")
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		return
	end;
		 
	i = random(0,2)
	if (i == 0) then
		Talk(1,"","Kh�ch quan! �� ��n Ho�nh s�n nh�t ��nh ph�i th� tr� V�n V� � ch� ch�ng ta ��y. ")
	elseif (i == 1) then
		Talk(1,""," 'Danh s�n danh th�y xu�t danh tr�', tr� V�n V� l� ��c s�n c�a Ho�nh s�n ch�ng ta t� l�u �� th�nh danh, s�m �� ���c li�t v�o danh s�ch c�ng ph�m ��i ���ng. ")
	else
		Talk(1,"","M�i v� tr� V�n V� r�t n�ng, h��ng kh� ng�o ng�t, tinh khi�t m� kh�ng nh�t, n�ng m� kh�ng ch�t, pha l�n 1 �m tr�, kh�ng ch� c� th� ���c gi�i kh�t m� c�n c� th� gi�i ��c")
	end
end
