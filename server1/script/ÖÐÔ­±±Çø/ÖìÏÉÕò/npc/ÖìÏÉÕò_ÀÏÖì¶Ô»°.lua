--description: ���ִ�_����
--author: wangzg	
--date: 2003/7/22
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world46=GetTask(74)
	if (UTask_world46==2) then
		Talk(3, "select", "L�o l� L�o Chu?", "�~ chuy�n g�?", "Phu nh�n l�o tr��ng g�i l�o quay v�.")
	elseif (UTask_world46==10) then
		Talk(1,"","Ta ngh� �� th�ng, m�y n�m nay cu�c s�ng kh�ng d� d�ng g�, kh�ng c� g� th� ��ng qu�y r�i ta.")
	else
		Talk(1,"","Ti�u huynh ��i, ��ng nghe l�i ng��i ph� n� kia, b� b�n Man Di th�ng tr�, l�m sao c� ���c cu�c s�ng th�i b�nh?")
	end
end

function select()
	Say("� ~ ��ng nh�c ��n m� d� xoa �y, ta l�m vi�c g� m� �y c�ng mu�n qu�n, ta u�ng ch�t r��u c�ng kh�ng ���c �?", 2, "Khuy�n can /reason","Kh�ng quan t�m ��n chuy�n v� ch�ng ng��i kh�c /no")
end

function reason()
	Talk(2, "prise", "Tu m��i n�m m�i ���c ng�i chung thuy�n, tu tr�m n�m m�i n�m chung g�i, �� l� v� ch�ng �� l� duy�n ph�n, l�o h�y v� l�m h�a v�i v� �i.","�..�m, th�i ���c!c�ng l� v� ch�ng gi� c� r�i, ta s� kh�ng c�i nhau v�i v� n�a.")
end;

function prise()
	Talk(1,"","Ta ��i ch�t m�i quay v�, � ��y c� �t thu�c tr� th��ng, xem ra ng��i l� ng��i luy�n v�, ta t�ng ng��i ��.")
	SetTask(74,10)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddRepute(5)
	AddNote("Thuy�t ph�c th�nh c�ng l�o Chu v� nh�, ho�n th�nh nhi�m v�. ")
	Msg2Player("Thuy�t ph�c th�nh c�ng l�o Chu v� nh�, ho�n th�nh nhi�m v�. ")
	Msg2Player("���c ba g�i Kim Th��ng d��c ")
	Msg2Player("Danh v�ng c�a b�n t�ng th�m 5 �i�m ")
end

function no()
end
