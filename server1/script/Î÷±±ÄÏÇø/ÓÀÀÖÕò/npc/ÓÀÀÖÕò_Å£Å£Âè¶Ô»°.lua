--description: ������_ţţ��
--author: wangzg
--date: 2003/7/18
--modify 2003/7/21 wangzg
--update 2003/7/22 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main(sel)
	UTask_world37=GetTask(65)
	if ((UTask_world37==0) and (GetLevel() >= 2)) then		-- Ҫ��ȼ�����2��
		Say("Th�ng Ng�u Ng�u nh� ta c� th�ch l�m ��i hi�p, b�y gi� l�i kh�ng bi�t �� ch�y �i ��u r�i� ",2,"��ng lo l�ng, ta gi�p t�u t�m /yes", "T�m kh�ng ra /no")
	elseif (UTask_world37==2) then
		Talk(1,"","��ng lo l�ng, ta gi�p t�u t�m n�!")
	else
		Talk(1,"","Kh�p n�i ng�y c�ng kh�ng y�n b�nh, con ta l�i kh�ng nghe l�i, th�t l� bu�n l�ng!")
	end
end;

function yes()
	Talk(1,"","Ng��i th�t l� ng��i t�t, v�y th� l�m phi�n gi�p ta nh�!")
	SetTask(65,2)
	AddNote("Nh�n nhi�m v�: gi�p m� Ng�u Ng�u t�m con trai ")
	Msg2Player("Nh�n nhi�m v�: gi�p m� Ng�u Ng�u t�m con trai ")
end

function no()
end
