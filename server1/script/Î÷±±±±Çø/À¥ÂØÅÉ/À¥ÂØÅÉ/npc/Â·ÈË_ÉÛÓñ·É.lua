function main()
Uworld130 = GetTask(130)
	if (Uworld130 == 10)then
		Talk(14,"Uworld130_find","Phi ca! m�i l�n xu�ng n�i l� phong th�i l�i ��nh ��c h�n tr��c. Kh�ng bi�t �� khi�n bao c� g�i xi�u h�n g�i m�ng.  ","Ti�u Ch�n, mu�i l�i c� l�m ta vui, v� c�ng c�a b�n h� l�m g� m� gi�i nh� mu�i!","Ha! Ha! Phi ca l�i n�i ch�i v�i mu�i r�i, v� c�ng c�a mu�i c� g� m� gi�i.","Hi! Hi! N�u kh�ng v� s� quy�n r� nh� nh�ng c�a n�ng, ca ca �� kh�ng ngoan ngo�n v� n�i s�m nh� v�y","Phi Ca nh� kh�ng ph�i l� ti�u Ch�n, m� l� Cu�ng Phong S�u �i�n �ang n�m trong tay c�a Ti�u Ch�n n�y!","Uhmm! Th�i kh�ng ��a n�a! H�y ��a n� cho ta. ","Ca h�y ��a Ng� L�i Ch�nh Ph�p cho Ti�u Ch�n ��c tr��c �i!","He he! Ca�..C� ng��i � g�n ��y. ","L� ai? Ra mau!","T�i h� v�a l�c �i qua ��y, nghe ���c 2 v� �ang th�o lu�n n�o l� L�i, n�o l� �i�n, v�y �� th�t ra l� g� v�y?","Ng��i nghe ���c l�i, �i�n g�?"," (N�u b�n h� bi�t ���c ta �� nghe ���c to�n b� nh�ng g� h� n�i, s� s� gi�t ng��i b�t mi�ng) T�i h� ch�a nghe r�, n�n r�t hy v�ng c�c h� cho bi�t r�!","�! Ch�ng ta ch� �ang th�o lu�n chuy�n m�a gi� m�y h�m nay t�i C�n L�n. ","Ng��i ��ng l� ng��i kh�ng bi�t t� nh�, mau mau tr�ch kh�i ��y!")
	elseif (Uworld130 == 30)then
		Talk(5,"Uworld130_jump","Sao l�i l� ng��i n�a?","N�i th�t nh�! Chuy�n c�c ng��i n�i l�c n�y ta ��u �� nghe!","H�m! C� n��ng ��y c�ng �� �o�n nh� th�. H�m nay ng��i �� quay l�i ��y, v�y th� ��ng h�ng �i ��u n�a!","T�p luy�n v� ngh� quan tr�ng tu�n t� th�ng ti�n, v� c�ng c�c ng��i luy�n ��u kh�c nhau, n�u n�ng l�ng luy�n cao l�n s� d� t�u h�a nh�p ma, l�m nh� v�y c� �ch g� ��u!","Nh�m nh�! L�o t� ta kh�ng luy�n, kh�ng l� ta ch� ng��i kh�c luy�n xong ��n gi�t ta sao? Ti�u t�! Ti�p chi�u �i!")
	elseif (Uworld130 >= 30) and (Uworld130 <40) then
		Talk(1,"Uworld130_jump","H�o ti�u t�! L�c n�y l�o gia �� n��ng tay tha m�ng, ng��ic �n ch�a bi�t ch�t s�ng l� g� �?")
	elseif (Uworld130 >10) and (Uworld130 < 40)then
		Talk(1,"","Con ng��i c�a ng��i sao kh�ng t� nh� nh� th�? Tr�nh ra tr�nh ra!")
	else 
	   Talk(1,"","Hai ng��i �ang n�i chuy�n g� b� m�t, th�i �� kh�c th��ng!")
	end
end

function Uworld130_find()
	SetTask(130,20)
	Msg2Player("B�n ph�t hi�n 2 t�n Ng� Thi�u to nh� b�n t�nh, h�nh nh� mu�n trao ��i b� k�p g� �� ")
	AddNote("B�n ph�t hi�n 2 t�n Ng� Thi�u to nh� b�n t�nh, h�nh nh� mu�n trao ��i b� k�p g� �� ")
end

function Uworld130_jump()
	NewWorld(228,1600,3224)
end
