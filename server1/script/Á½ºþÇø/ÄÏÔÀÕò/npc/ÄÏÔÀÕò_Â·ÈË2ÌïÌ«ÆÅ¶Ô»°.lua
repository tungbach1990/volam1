--������ ������ ·��2��̫�ŶԻ�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(201) == 1 then
		allbrother_0801_FindNpcTaskDialog(201)
		return 0;
	end
	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","Kh�kh�kh�kh�, ch�c ta kh�ng ���c r�i, kh�ng bi�t b� sao n�a s�ng th�c d�y c�m th�y ��u nh�c d� d�i. Kh�kh�, kh�ng bi�t b�nh n�y l�y kh�ng n�a, ng��i mau r�i kh�i �i!")	 
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		return
	end

Say("Con ta c�n s�ng c�ng l�n gi�ng nh� ng��i, r�i ch� ��ng ti�c l�c n� 15 tu�i �� b� b�nh ch�t �� m�t m�nh l�o s�ng c� ��c th� n�y",0)

end;

