-- ְ�ܡ�����
-- by��Li_Xin(2004-07-26)


function help()
        Say("G�n ��y trong giang h� xu�t hi�n v�i quy�n �� ph� v� kh�, theo h��ng d�n c� th� n�ng cao ��ng c�p v� kh�. Ta c� m�t v�i manh m�i ��y, ng��i c� mu�n bi�t kh�ng? ",11,"Qu� tr�nh th�ng c�p �� ph� v� kh� /onhelp","L�ng V��ng Th��ng �o�n T�o T�n bi�n/onhelp","Huy�n V� Ch�y Chi ��c T�o thu�t /onhelp","Long Ng�m Ki�m �o�n T�o �� /onhelp","Gia C�t C� Qu�t M�t y�u /onhelp","Li�u Di�p To�i Phong �ao. T�y Th� bi�n/onhelp","Huy�n Nguy�t �ao T� Kinh b�o l�c /onhelp","Thi�n C� C�n �� ph� /onhelp","�m Kh� T�ng ph�. Quy�n 1/onhelp","Uy�n ��ng �ao. Khai Quang  bi�n/onhelp","Kh�ng mu�n bi�t g� h�t/no")
end;

function onhelp(nSel)
        if(nSel == 0) then
        	Talk(1,"","�� ta gi�i th�ch cho ng��i v� c�ch s� d�ng �� ph� v� kh�. �em v� kh� c�n th�ng c�p ��t v�o v� tr� kh�m n�m, �� ph� ��t v�o h�ng ��ng c�p. N�u ph� h�p �i�u ki�n th� ta c� th� gi�p ng��i th�ng ��ng c�p v� kh�.")
        elseif(nSel == 1) then
        	Talk(1,"","L�ng V��ng Th��ng �o�n T�o T�n Bi�n l� �� ph� d�ng �� n�ng c�p c�c lo�i th��ng. Nghe n�i hi�n �ang � trong tay c�a Th�n B� th��ng nh�n � L�m An")
        elseif(nSel == 2) then
        	Talk(1,"","Huy�n V� Ch�y Chi ��c T�o Thu�t l� �� ph�d�ng �� n�ng c�p c�c lo�i Ch�y. Nghe n�i hi�n �ang � trong tay c�a Th�n B� th��ng nh�n � L�m An")
        elseif(nSel == 3) then
        	Talk(1,"","Long Ng�m Ki�m �o�n T�o �� l� �� ph� d�ng �� n�ng c�p c�c lo�i Ki�m. Nghe n�i hi�n �ang � trong tay c�a Th�n B� th��ng nh�n � L�m An")
        elseif(nSel == 4) then
        	Talk(1,"","Gia C�t C� Qu�t M�t Y�u l� �� ph� d�ng �� n�ng c�p c�c lo�i N�. Nghe n�i hi�n �ang � trong tay c�a Th�n B� th��ng nh�n � L�m An")
        elseif(nSel == 5) then
        	Talk(1,"","Li�u Di�p To�i Phong �ao. T�y Th� bi�n l� �� ph� d�ng �� n�ng c�p c�c lo�i phi �ao. Nghe n�i hi�n �ang � trong tay c�a Th�n B� th��ng nh�n � L�m An")
        elseif(nSel == 6) then
        	Talk(1,"","Huy�n Nguy�t �ao t� Kinh b�o l�c l� �� ph� d�ng �� n�ng c�p c�c lo�i �ao. Nghe n�i hi�n �ang � trong tay c�a Th�n B� th��ng nh�n � L�m An")
        elseif(nSel == 7) then
        	Talk(1,"","Thi�n C� C�n �� ph� l� �� ph� d�ng �� n�ng c�p c�c lo�i c�n. Nghe n�i hi�n �ang � trong tay c�a Th�n B� th��ng nh�n � L�m An")
        elseif(nSel == 8) then
        	Talk(1,"","�m Kh� T�ng ph�. Quy�n 1 l� �� ph� v� d�ng �� n�ng c�p c�c lo�i �m kh�. Nghe n�i hi�n �ang � trong tay c�a Th�n B� th��ng nh�n � L�m An")
        elseif(nSel == 9) then
        	Talk(1,"","Uy�n ��ng �ao. Khai Quang bi�n l� �� ph� d�ng �� n�ng c�p c�c lo�i Song �ao. Nghe n�i hi�n �ang � trong tay c�a Th�n B� th��ng nh�n � L�m An")
        end;
end;
   	
       