--Edit by Youtube PGaming  --
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")

function main()
if (GetTask(169) == 42)  then
Talk(5,"L40_question_1","L�u Vi�n Ngo�i: T� C� T��ng Qu�n Chi�n Th��ng Tr��ng, d�ch gi� ��u tr� thu b�nh gi�n. S�t ph�t quy�t �o�n t�y t�m �, ng� t� s� cu�ng b�t d� ti�n. ha ha!","Ng��i ch�i: �� nghe k� ngh� c�a v��ng ngo�i t� l�u, kh�ng bi�t t�i h� c� th� th�nh gi�o 1 v�n kh�ng?","L�u Vi�n Ngo�i: Ha ha, trong ��i ta th�ch nh�t l� ch�i c�, ch� ti�c l� ng��i ch�i c� hay th� nhi�u, nh�ng ng��i hi�u l� lu�n v� c� r�t �t, h�m nay ���c b�n lu�n c�ng c�c h� th�t l� t�t qu�!","Ng��i ch�i: ���ng nhi�n l� ���c.")
elseif (GetTask(169) == 43)then
Say("T� c� Trung v� H�, h�y n�i v�i ��i th�, ti�n c�_____h�,_____Y B�ng.",3,"Thi�n Nguy�n, B�o Gi�c./L40_wrong","T� ��o, B�o Gi�c./L40_question_3","T� Gi�c, B�o bi�n./L40_wrong")
elseif (GetTask(169) == 44)then
Say("Ph� K�_____, _____, ��c khinh vu n�i, n�i khinh vu t?, gi�p h�u h� th�c, �� h�u t�nh ng�y.",3,"Gi�c b�t nh� bi�n, bi�n b�t nh� ph�c./L40_wrong","Ph�c b�t nh� bi�n, bi�n b�t nh� gi�c./L40_wrong","Bi�n b�t nh� gi�c, gi�c b�t nh� ph�c./L40_correct")
else
Talk(1,"","L�u Vi�n Ngo�i: Ta th�ch nh�t l� c�ng ng��i kh�c u�ng r��u ��i �m v� ��nh c�.")
end
end;

function L40_question_1()
	Say("Ng��i mi�n B�c c�ng r�t th�ch ��nh c� v�y. C�c T�t Ph��ng Ch�nh, _____;_____, Th�n Minh ��c D�; c� c� ph�n bi�t tr�ng �en, �m d��ng, Bi�n la li�t b�,_____.",3,"T��ng thi�n t�c d�, ��o t�t kh�c chi�t, hi�u tinh h�n d�./L40_wrong","T��ng ��a t�c d�, ��o t�t kh�c chi�t, hi�u tinh h�n d�./L40_wrong","T��ng ��a t�c d�, ��o t�t ch�nh tr�c, hi�u tinh v�n d�./L40_question_2")
end;

function L40_question_2()
	SetTask(169,43)
	Say("T� c� Trung v� H�, h�y n�i v�i ��i th�, ti�n c�_____h�,_____Y B�ng.",3,"Thi�n Nguy�n, B�o Gi�c./L40_wrong","T� ��o, B�o Gi�c./L40_question_3","T� Gi�c, B�o bi�n./L40_wrong")
end;

function L40_question_3()
SetTask(169,44)
	Say("Ph� K�_____, _____, ��c khinh vu n�i, n�i khinh vu t�, gi�p h�u h� th�c, �� h�u t�nh ng�y.",3,"Gi�c b�t nh� bi�n, bi�n b�t nh� ph�c./L40_wrong","Ph�c b�t nh� bi�n, bi�n b�t nh� gi�c./L40_wrong","Bi�n b�t nh� gi�c, gi�c b�t nh� ph�c./L40_correct")
end;

function L40_wrong()
	Talk(1,"","L�u Vi�n Ngo�i: Kh�ng ��ng, c�c h� h�y suy ngh� l�i.")
end;

function L40_correct()
SetTask(169,45)
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3950,0,0,0}, nBindState=-2}, "test", 1);
Talk(1,"","L�u Vi�n Ngo�i: Kh�ng sai, xem ra c�c h� c�ng c� t�i n�ng v� phong th�i, b� V�n T� Tr�c Thu B�nh n�y ta t�ng l�i cho c�c h� l�m qu�.")
AddNote("Ch�nh th�c tr� l�i 3 c�u h�i c�a L�u Vi�n Ngo�i nh�n ���c V�n T� Tr�c Thu B�nh.")
Msg2Player("Ch�nh th�c tr� l�i 3 c�u h�i c�a L�u Vi�n Ngo�i nh�n ���c V�n T� Tr�c Thu B�nh.")
end;
