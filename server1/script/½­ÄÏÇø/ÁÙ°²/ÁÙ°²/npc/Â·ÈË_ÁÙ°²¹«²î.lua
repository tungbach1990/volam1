-- ������ �ٰ� ·��_�ٰ�����.lua ������ɻ�������
-- By: Dan_Deng(2004-05-27)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld43 = GetTask(43)
--	if (Uworld43 < 10) and (GetLevel() >= 70) and (GetReputeLevel(GetRepute()) >= 6) then
		--		Say(10713 ,2,"������Ů��ʮ����֮��Ҽ�֪������ȻҪ�ܡ�/U43_get","û��/no")
	if (Uworld43 == 40) and (HaveItem(381) == 1) then
		Talk(6,"U43_40","Qu� nhi�n kh�ng ngo�i d� �o�n c�a ta. ��m t�c Th�i Hoa n�y v�n l� b�n � L�i V�n tr�i -do M�c Kh�ng Nguy�t c�m ��u","L� c�i t�n M�c Kh�ng Nguy�t 'V�n hoa ch�ng trung qu�; phi�n di�p b�t thi�p th�n' �� sao?!","Ch�nh l� h�n! V�n xu�t th�n t� m�t 'h�o t�c ph� qu�', ti�u ti�n hoang ph�. Sau khi ng��i ti�n nhi�m c�a L�i V�n tr�i qua ��i, h�n ti�p nh�n t� nghi�p. Nh�ng kh�ng ph�t huy ���c, ng��c l�i c�n gi�i t�n s�n tr�i, l�m m�t 'l� t�c ��c h�nh'. Khinh c�ng c�a h�n tuy�t k�, tr��c gi� ch�a ai c� th� b�t ���c. H�n �� h�i kh�ng bi�t bao nhi�u ng��i con g�i trinh b�ch'. ","N�i nh� v�y, ngh�a l� Sai ��i nh�n �� d� ra ���c h�nh tung c�a h�n r�i?","N�u ��n gi�n nh� v�y th� ta �� kh�ng c�n ��n ng��i gi�p s�c. Ng��i n�y ��n - �i kh� li�u. Ch�c ch�n h�n �ang mu�n �i t�m hai chi�c 'V�n, L�i th��c ' (th��c: ch�a kh�a) n�y �� m� c�a l�n! Ng��i �� c� trong tay m�t chi�c 'L�i th��c'r�i! Theo nh� ta t�nh to�n th� chi�c c�n l�i hi�n �ang � trong tay c�a tr�i ch� V�n B� �ng. ","Ta s� �i t�m chi�c c�n l�i. Kh�ng tr� ng��i n�y th� kh�ng bi�t bao nhi�u c� g�i n�a s� b� l�m nh�c")
	elseif (Uworld43 == 80) and (HaveItem(382) == 1) then
		Talk(1,"U43_80","Qu� nhi�n kh�ng ngo�i d� �o�n c�a ta, M�c Kh�ng Nguy�t hi�n �ang �n n�p � trong th�nh L�m An n�y. Ng��i h�y ch�u kh� t�m cho th�t k� l��ng. Theo ta ��c �o�n th� h�n �ang � quanh v�ng T�y H� ")
	elseif (Uworld43 == 10) then
		Talk(1,"","L�u nh� v�y m� v�n ch�a t�m ���c t�ng t�ch g� c�a b�n Th�i Hoa t�c �?")
	elseif (Uworld43 == 20) then
		Talk(1,"","Kh�ng t�m ���c doanh tr�i c�a ch�ng �? N�u t�m ���c chi�c 'V�n th��c' th� t�t t�m ���c n�i b�n ch�ng �ang tr� �n")
	else
		Talk(1,"","D��i ch�n Thi�n T�, sao c�n d�m ph�n ngh�ch! B�t c� k� n�o l�m c�n � th�nh L�m An n�y, t�t nh�t l� ��ng �� r�i v�o tay ta")
	end
end;

function U43_get()
	Talk(1,"","T�t! Theo ta �i�u tra ���c th� b�n t�c Th�i Hoa n�y t� cho m�nh l� phong l�u, th�ch s� d�ng qu�t. Ch�ng �� t�ng xu�t hi�n � Th�c s�n. N�i �� v�n l� s�n tr�i c�a b�n ki�p ph� L�i V�n. Tr��c ti�n ng��i h�y v�o n�i Th�c s�n �� t�m g�p L�i B� Lang ch�. H�n t�t �� bi�t chuy�n n�y. C� �i�u, ng��i n�y v�n nham hi�m, ��c �c. Ng��i ph�i n�n c�n th�n �� ph�ng")
	SetTask(43,10)
	AddNote("Nh�n nhi�m v� do C�ng Sai th�nh L�m An �y th�c: Ti�u di�t b�n t�c Th�i Hoa. �i d� th�m t�nh h�nh c�a ch�ng. Ch�ng �� g�y ra li�n ti�p nhi�u v� �n g�n ��y. ")
	Msg2Player("Nh�n nhi�m v� do C�ng Sai th�nh L�m An �y th�c: Ti�u di�t b�n t�c Th�i Hoa. �i d� th�m t�nh h�nh c�a ch�ng. Ch�ng �� g�y ra li�n ti�p nhi�u v� �n g�n ��y. ")
end;

function U43_40()
	SetTask(43,50)
	Msg2Player("Sau �� l�i �i t�m V�n B� �ng ch� �� �o�t l�y chi�cV�n th��c (ch�a kh�a) ")
end

function U43_80()
	SetTask(43,90)
	Msg2Player("T�m n�i M�c Kh�ng Nguy�t �ang tr� �n � L�m An ")
end

function no()
end;
