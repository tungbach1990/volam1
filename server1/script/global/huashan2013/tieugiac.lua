--Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if GetLastFactionNumber() == 10 then
Describe("Ti�u Gi�c: H�a ra l� s� ��, c�n gi�p �� g�?",5,"T�m hi�u m�n ph�i/timhieuquyphai","T�m hi�u ��ng m�n/timhieucaothu","T�m hi�u nhi�m v�/timhieunhiemvu","T�m hi�u s� tr��ng luy�n c�ng/timhieusotruongluyencong","T�m hi�u v� ngh� b�n m�n/timhieuvonghebonmon")
else
Describe("Ti�u Gi�c: ��i hi�p ��n t� ph�i, ch�ng hay c� chuy�n g�?",2,"T�m hi�u qu� ph�i/timhieuquyphai","T�m hi�u c�c v� cao th� c�a qu� ph�i./timhieucaothu")
end
end

------------------------------

function timhieuvonghebonmon() 
Talk(3,"","Gi�ng ng��i <color=red>ph�i Hoa S�n<color>, v� ngh� ph�t tri�n theo 2 ���ng kh�c nhau:","���ng th� nh�t l� 'Hoa S�n Ki�m T�ng', c� nh�ng k� n�ng ch�nh nh� sau: b�ch h�ng qu�n nh�t, ki�m t�ng t�ng quy�t, d��ng ng� ki�m ph�p, kim nh�n ho�nh kh�ng, hy di ki�m ph�p, thi�n th�n ��o huy�n, th��ng t�ng ngh�nh kh�ch, huy�n nh�n v�n y�n, �o�t m�nh li�n.","���ng th� hai l� 'Hoa S�n Kh� T�ng', c� nh�ng k� n�ng ch�nh nh� sau: thanh phong t�ng sang, long nhi�u quy�n, h�i n�p b�ch xuy�n, long tuy�n ki�m kh�, kh� ch�n s�n h�, kh� qu�n tr��ng h�ng, ma v�n ki�m kh�, huy�n nh�n v�n y�n, ph�ch th�ch ph� ng�c.")	
end

----------------------------
function timhieunhiemvu()
--if (GetTask(169) == 10) and (GetTask(169) < 20) then
if (GetTask(169) < 20) then
Describe("Ti�u Gi�c: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 2560. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� l�y n��c pha tr�./phatra")  			
elseif (GetTask(169) >= 20) and  (GetTask(169) < 30) then
Describe("Ti�u Gi�c: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 5120. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� Ng� ki�m./ngokiem") 
elseif (GetTask(169) >= 30) and  (GetTask(169) < 40) then
Describe("Ti�u Gi�c: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 7680. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� B�ng T�m Ng�c L� Cao./ngoclocao") 
elseif (GetTask(169) >= 40) and  (GetTask(169) < 50) then
Describe("Ti�u Gi�c: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 10240. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� V�n T� Tr�c Thu B�nh./tracthubinh") 
elseif (GetTask(169) >= 50) and  (GetTask(169) < 61) then
Describe("Ti�u Gi�c: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 12800. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� V�nh L�c Phong V�n./vinhlacphongvan") 
elseif (GetTask(169) >= 61) and  (GetTask(169) < 71) then
Describe("Ti�u Gi�c: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 15360. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Nhi�m v� xu�t s�./xuatsu") 
elseif (GetTask(169) == 71) and GetCurCamp() == 4 and GetCamp() == 4 or (GetTask(169) == 74) and GetCurCamp() == 4 and GetCamp() == 4 then
Describe("Ti�u Gi�c: Mu�n gia nh�p m�n ph�i h�c v� c�ng, c� th� th�ng qua vi�c ho�n th�nh nhi�m v� nh�p m�n �� th�c hi�n. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� 5 m�n ph�i l� c� th� h�c ���c v� c�ng, nh�n ���c c�p h�m, sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s� d� d�ng. ��nh d�u nhi�m v� c�a ng��i l�: 17920. Ti�p theo nh�ng vi�c ng��i c� th� l�m l�: ",1,"Tr�ng ph�n s� m�n./trungphan") 
end;
end

function phatra() 
Talk(4,"","Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i s� t�ng c�p th�nh �� t� ph�ng tr�, h�c ���c v� c�ng Ki�m T�ng T�ng Quy�t, Long Nhi�u Th�n <enter> Ti�p nh�n nhi�m v� n�y ph�i l� �� t� b�n m�n c�p 10 tr� l�n.","B��c 1: t�i ch� V�n T� Vi�n (182,185) nh�n nhi�m v�. Nh�n ���c G�o n��c.","B��c 2: t�i ch� khe su�i ngo�i c�ng Nam ph�i Hoa S�n s� d�ng G�o n��c thu th�p. Nh�n ���c Thanh Li�t Kho�ng Th�y.","B��c 3: Giao n��c Thanh Li�t Kho�ng Th�y cho V�n T� Vi�n.")	
end 

function ngokiem() 
Talk(6,"","Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i s� t�ng c�p th�nh T� M�c �� t�, h�c ���c v� c�ng D��ng Ng� Ki�m Ph�p, H�i N�p B�ch Xuy�n <enter> Ti�p nh�n nhi�m v� n�y ph�i l� �� t� b�n m�n c�p 20 tr� l�n, ��ng th�i �� ho�n th�nh nhi�m v� l�y n��c pha tr�.","B��c 1: t�i ch� T� M�(188,180) nh�n nhi�m v�. Nh�n ���c Th�ng n��c.","B��c 2: t�i ch� th�c n��c ph�a T�y B�c ph�i Hoa S�n s� d�ng Th�ng N��c nh�n ���c Dung Tuy�t Chi Th�y, ��n T� Qu� Nhai ph�a ��ng ph�i Hoa S�n thu th�p Nhai B�ch Chi Th�ch, Th��ng T�ng Ch�m Di�p.","B��c 3: t�i ch� qu�ng tr��ng trung t�m ph�i Hoa S�n t�m ���c �� t� luy�n ki�m Hoa S�n(173,192).","B��c 4: ��n luy�n V� ���ng ph�i Hoa S�n t� th� v�i �� T� luy�n ki�m Hoa S�n(184,186) v� gi�nh chi�n th�ng.","B��c 5: Giao Dung Tuy�t Chi Th�y, Nhai B�ch Chi Th�ch, Th��ng T�ng Ch�m Di�p cho T� M�.")	
end 

function ngoclocao() 
Talk(7,"","Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i s� t�ng c�p th�nh �� T� Ch�p Ki�m, h�c ���c v� c�ng Kim Nh�n Ho�nh Kh�ng, Long Huy�n Ki�m Kh� <enter> Ti�p nh�n nhi�m v� n�y ph�i l� �� t� b�n m�n c�p 30 tr� l�n, ��ng th�i �� ho�n th�nh nhi�m v� Ng� Ki�m.","B��c 1: ��n ch� L�n V�n Mi(163,189) nh�n nhi�m v�.","B��c 2: ��n Ph��ng T��ng t�m �ng ch� d��c �i�m mua B�ng T�m Ng�c L� Cao.","B��c 3: ��n Ki�m C�c T�y B�c ti�u di�t c��ng ��o. Nh�n ���c B�ng T�m Tu�.","B��c 4: Tr� v� Ph��ng T��ng, giao B�ng T�m Tu� cho �ng ch� d��c �i�m.","B��c 5: ��i tho�i v�i �ng ch� d��c �i�m. Nh�n ���c B�ng T�m Ng�c L� Cao.","B��c 6: Giao B�ng T�m Ng�c L� Cao cho L�n V�n Mi.")	
end 

function tracthubinh() 
Talk(5,"","Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i s� t�ng c�p th�nh �an Thanh S�, h�c ���c v� c�ng Hi Di Ki�m Ph�p, Kh� Ch�n S�n H� <enter> Ti�p nh�n nhi�m v� n�y ph�i l� �� t� b�n m�n c�p 40 tr� l�n, ��ng th�i �� ho�n th�nh B�ng T�m Ng�c L� Cao.","B��c 1: ��n ch� Th�m M�c(179,185) nh�n nhi�m v�.","B��c 2: ��n Ph��ng T��ng t�m �ng ch� t�p h�a t�m hi�u th�ng tin v� d�ng c� ��nh c�.","B��c 3: t�m ���c L�u Vi�n Ngo�i � Ph��ng T��ng, h�i han v� d�ng c� ��nh c�, tr� l�i ��ng 3 c�u h�i s� nh�n ���c V�n T� Tr�c Thu B�nh.","B��c 4: giao V�n T� Tr�c Thu B�nh cho Th�m M�c.")	
end 

function vinhlacphongvan() 
Talk(6,"","Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i s� t�ng c�p th�nh D�ch Thu S�, h�c ���c v� c�ng Thi�n Kh�n ��o Huy�n, Kh� Qu�n Tr��ng H�ng <enter> Ti�p nh�n nhi�m v� n�y ph�i l� �� t� b�n m�n c�p 50 tr� l�n, ��ng th�i �� ho�n th�nh V�n T� Tr�c Thu B�nh nhi�m v�.","B��c 1: ��n ch� L�n H�o Thi�n(170,191) nh�n nhi�m v�.","B��c 2: ��n V�nh L�c Tr�n ��i tho�i v�i Ho�ng Th�c, ��ng ��i Th�c, Th� N�i N�i, t�m hi�u s� t�nh.","B��c 3: ��n Kim Quang ��ng ti�u di�t S�n Ph�. Nh�n ���c 3 s�n v�t c�a th�n d�n.","B��c 4: Quay l�i V�nh L�c Tr�n, giao s�n v�t th�n d�n cho Ho�ng Th�c, ��ng ��i Th�c, Th� N�i N�i.","B��c 5: tr� v� Hoa S�n ph�c m�nh L�n H�o Thi�n.")	
end 

function xuatsu() 
Talk(11,"","Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i s� t�ng c�p th�nh L�c Ngh� Truy�n Nh�n, xu�t s� thu�n l�i<enter> Ti�p nh�n nhi�m v� n�y ph�i l� �� t� b�n m�n c�p 50 tr� l�n, ��ng th�i �� ho�n th�nh nhi�m v� V�nh L�c Phong V�n.","B��c 1: t�i ch� Ch��ng m�n Nam Cung Tuy�t(177,191) nh�n nhi�m v�. Nh�n ���c c�m nang.","B��c 2: ki�m tra c�m nang. Nh�n ���c l�i nh�n #th� 1.","B��c 3: ��n ch� �n Ki�m Thu(171,182), nh�n nhi�m v� l�y B�ch H� Huy�t.","B��c 4: ��n Tuy�t Lang ��ng ti�u di�t �i�u T�nh B�ch H�. Nh�n ���c B�ch H� Huy�t.","B��c 5: giao B�ch H� Huy�t cho �n Ki�m Thu.","B��c 6: ki�m tra c�m nang. Nh�n ���c l�i nh�n #th� 2.","B��c 7: ��n thung l�ng ph�i Hoa S�n t�nh t�m.","B��c 8: ki�m tra c�m nang. Nh�n ���c l�i nh�n #th� 3.","B��c 9: ��n Ki�m C�c T�y Nam ti�u di�t ph�n �� Kh�c V� H�nh ph�i Hoa S�n.","B��c 10: Tr� v� ph�i Hoa S�n ph�c m�nh ch��ng m�n Nam Cung Tuy�t.")	
end 

function trungphan() 
Talk(4,"","Tr� l�i Hoa S�n. ��i hi�p t�ng c�p th�nh Th�i H�c C�t Ch�, h�c ���c v� c�ng Huy�n Nh�n V�n Y�n, Th��ng T�ng Ngh�n Kh�ch, Ma V�n Ki�m Kh�.","B��c 1: Sau khi ��i hi�p t�ng ��n c�p 60. ��n ch� Ch��ng M�n Nam Cung Tuy�t(177,191), xin tr� v� ph�i Hoa S�n.","B��c 2: N�p 50 l��ng c� th� tr� v� ph�i Hoa S�n.")	
end 

-----------------------------------
function timhieusotruongluyencong()
if (GetLevel() >=10) and (GetLevel() < 20) then
Describe("Ti�u Gi�c: ��i v�i h� <color=red>Th�y H�n 10 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: G�n b�n b�n m�n, c�c th�nh th� n�i danh.",1,"K�t th�c ��i tho�i!/khonghoinua")  			
elseif (GetLevel() >=20) and (GetLevel() < 30) then
Describe("Ti�u Gi�c: ��i v�i h� <color=red>Th�y H�n 20 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Ki�m C�c Trung Nguy�n, Ki�m C�c T�y Nam, Ki�m C�c T�y B�c, La Ti�u S�n, V� L�ng S�n, T�n L�ng.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=30) and (GetLevel() < 40) then
Describe("Ti�u Gi�c: ��i v�i h� <color=red>Th�y H�n 30 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: B�ch V�n ��ng, Th�c C��ng s�n, th� ph� ��ng, v� Ph�c Ng�u S�n ��ng, Kim Quang ��ng.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=40) and (GetLevel() < 50) then
Describe("Ti�u Gi�c: ��i v�i h� <color=red>Th�y H�n 40 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Phong Nh�n ��ng, �i�m th��ng ��ng t�ng 1, Th�n Ti�n ��ng, v� Ph�c Ng�u S�n T�y, Kinh Ho�ng ��ng.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=50) and (GetLevel() < 60) then
Describe("Ti�u Gi�c: ��i v�i h� <color=red>Th�y H�n 50 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: H��ng Th�y ��ng, Thi�n T�m Th�p t�ng 1,2, v� t�n t��ng T� ��a ��o, �c B� ��a ��o.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=60) and (GetLevel() < 70) then
Describe("Ti�u Gi�c: ��i v�i h� <color=red>Th�y H�n 60 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Thi�n T�m Th�p t�ng 3, 108 La H�n Tr�n, v� c�m ��a m� cung, Ho�nh S�n Ph�i.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=70) and (GetLevel() < 80) then
Describe("Ti�u Gi�c: ��i v�i h� <color=red>Th�y H�n 70 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Tr��ng Giang Nguy�n ��u, S�n B�o ��ng, v� ��o Hoa Nguy�n, D��c V��ng ��ng t�ng 2, L�m Du Quan.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=80) and (GetLevel() < 90) then
Describe("Ti�u Gi�c: ��i v�i h� <color=red>Th�y H�n 80 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Sa m�c ��a Bi�u, Phi Thi�n ��ng, Ph� Dung ��ng, D��ng Trung ��ng, C� D��ng ��ng, D��c V��ng ��ng t�ng 3, Tr��ng B�ch S�n C��c.",1,"K�t th�c ��i tho�i!/khonghoinua")
elseif (GetLevel() >=90) then
Describe("Ti�u Gi�c: ��i v�i h� <color=red>Th�y H�n 90 c�p <color> nh� ng��i th� ��a �i�m luy�n c�ng t�t nh�t l�: Sa m�c s�n ��ng t�ng 1,2,3, v� Kh�a Lang ��ng, Ti�n C�c ��ng, Tr��ng B�ch S�n Nam L�c, Tr��ng B�ch S�n B�c L�c.",1,"K�t th�c ��i tho�i!/khonghoinua")
end;
end


---------------------------------------------
function timhieuquyphai()
Describe("Ti�u Gi�c: Mu�n t�m hi�u c�i g�?",5,"Kh�i nguy�n m�n ph�i/khoinguyenmonphai","V� tr� ��a l�/vitridialy","��a v� giang h�/diavigiangho","��c s�c m�n ph�i/dacsacmonphai","Kh�ng h�i n�a!/khonghoinua")  			
end;



function khoinguyenmonphai()
Describe("Ti�u Gi�c: L�ch s� ph�i Hoa S�n �� r�t l�u ��i, t��ng truy�n b�t ��u t� D��ng B� Ki�u th�i Xu�n Thu �� c� ng��i l�n ��nh Hoa S�n d�ng l�u kh� h�c. Gi�a th�i ti�n tri�u n�m H�m Th�ng, c� m�t th� sinh t�n l� Ti�u T� L�ng, l� k� nghi�p c�a ��i t��ng qu�n B�i M�n, khi ��n ngao du Hoa S�n �� nh�n ���c s� tr� gi�p c�a �� t� D��ng Th�, v� sau c�c cao nh�n trong thi�n h� �n c� t�i Hoa S�n, khi�n cho v� c�ng c� d�p t� h�i, t�o n�n ph�i Hoa S�n vang danh thi�n h� ng�y nay v�i v� c�ng Ki�m Kh� k� di�u.",4,"V� tr� ��a l�/vitridialy","��a v� giang h�/diavigiangho","��c s�c m�n ph�i/dacsacmonphai","Kh�ng h�i n�a!/khonghoinua") 			
end;

function vitridialy()
Describe("Ti�u Gi�c: Hoa S�n n�i ti�ng l� 'T� nh�c' trong 'ng� nh�c', ph�a B�c gi�p v�i b�nh nguy�n V� H� b�ng ph�ng v� s�ng Ho�ng H�, ph�a Nam gi�p T�n L�nh, tr�n gi� c�a T�y B�c ti�n v�o trung nguy�n. Hoa S�n kh�ng ch� h�ng v� hi�m tr�, m� ��a th� n�i non nguy nga �� s�, t� l�u �� ���c m�nh danh l� 'Hoa S�n thi�n h� hi�m', 'K� hi�m thi�n h� �� nh�t s�n'.",4,"Kh�i nguy�n m�n ph�i/khoinguyenmonphai","��a v� giang h�/diavigiangho","��c s�c m�n ph�i/dacsacmonphai","Kh�ng h�i n�a!/khonghoinua")  			
end;

function diavigiangho()
Describe("Ti�u Gi�c: Ph�i Hoa S�n l� ��i ph�i v� l�m n�i ti�ng trung nguy�n, �� t� th��ng � Hoa S�n ��c s�ch h�c ch� ch�i c� luy�n ki�m, r�t hi�m lo toan chuy�n v� l�m th� t�. Do nhi�u n�m tr��c ch��ng m�n Ph�ng H�p Nh� t�o ph�n r�i ��n Thi�n Nh�n Gi�o, ph�i Hoa S�n b� �� k�ch m�nh b�n mai danh �n t�ch, kh�ng mu�n m�ng ��n vi�c trong v� l�m. Th� nh�ng g�n ��y c� tin ��n m�nh b�n �� S�n H� X� T�c xu�t hi�n t�i Hoa S�n, c�c ph�i giang h� r�c r�ch manh ��ng, mu�n ��n Hoa S�n ki�m t�m, khi �y giang h� d�y s�ng, n�i l�n m�t tr�n phong ba quy�t li�t. C�c ch��ng m�n ��i tr��c c�a Hoa S�n b�t ��c d� ph�i ph� t� quan �� tho�t th�n, l�nh ��o �� t� Hoa S�n ��i ph� v�i cu�c phong v�n thi�n h� n�y.",4,"Kh�i nguy�n m�n ph�i/khoinguyenmonphai","V� tr� ��a l�/vitridialy","��c s�c m�n ph�i/dacsacmonphai","Kh�ng h�i n�a!/khonghoinua")   			
end;

function dacsacmonphai()
Describe("Ti�u Gi�c: �� t� Hoa S�n chia th�nh tu th�n h�u vi v� tu t�m v� vi, ki�m t�ng nghi�n c�u chi�u th�c tinh x�o k� di�u, v�n ph�p tinh th�ng; kh� t�ng nghi�n c�u c�u ch�n t�i t�m, nh�t ph�p th�ng v�n ph�p. �� t� Hoa S�n r�t hi�m khi xu�ng n�i, ch� khi v�o tu vi v� c�ng ��t ��n c�nh gi�i nh�t ��nh m�i xu�ng n�i �� r�n luy�n tr�i nghi�m, ��t ph� ch��ng ng�i, mong c� th� khi�n tu vi c�a b�n th�n ��t ��n t�m cao m�i, l� m�t ph��ng ph�p �� t�m th�y ch�nh m�nh.",4,"Kh�i nguy�n m�n ph�i/khoinguyenmonphai","V� tr� ��a l�/vitridialy","��a v� giang h�/diavigiangho","Kh�ng h�i n�a!/khonghoinua") 			
end;

function khonghoinua()
end;


------------------------------------------
function timhieucaothu()
Describe("Ti�u Gi�c: Ng��i mu�n t�m ai?",13,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Kh� T�ng S� Ph� T� M�/tumo","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","V�n T� Vi�n/vantuvien","T� Ph�ng/tophong","L�n V�n Mi/lanvanmi","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","Ti�u Ng�c/tieungoc","M�c Phong Nh�/macphongnhu","Ph� Dung/phudung","Ti�u Vi�n T�/tieuvientu")
end;



function namcungtuyet()
Describe("V� tr� Ch�nh Kh� ���ng T�a ��: 177,191 C�ng d�ng: nhi�m v� <enter> s� th�c c�a Ph�ng H�p Nh�, nguy�n ch��ng m�n ph�i Hoa S�n, c�ng l� ch��ng m�n ��i tr��c c�a ph�i Hoa S�n, trong cu�c ��i h�a m�n ph�i do Ph�ng H�p Nh� l�m ph�n, do b� quan n�n kh�ng b� �nh h��ng nhi�u. V�i n�m tr��c, Nam Cung Tuy�t ��t nhi�n xu�t quan, g�nh v�c ��i cu�c, l�nh ��o m�n �� c�n l�i c�a Hoa S�n c�ng nhau v�c d�y danh ti�ng c�a Hoa S�n ph�i. Sau khi xu�t quan, nghe n�i v� c�ng c�a Nam Cung Tuy�t �� ��t ��n m�c kh�ng th� ng� t�i.",12,"Bi�t r�i!/bietroi","Kh� T�ng S� Ph� T� M�/tumo","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","V�n T� Vi�n/vantuvien","T� Ph�ng/tophong","L�n V�n Mi/lanvanmi","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","Ti�u Ng�c/tieungoc","M�c Phong Nh�/macphongnhu","Ph� Dung/phudung","Ti�u Vi�n T�/tieuvientu") 			
end;

function tumo()
Describe("V� tr� Ng�c N� �i�n T�a ��: 188,180 C�ng d�ng: nhi�m v� <enter> S� Ph� Kh� T�ng ph�i Hoa S�n, Ki�m ph�p th�m h�u, tinh th�ng l�c ngh�, c� phong th�i nho s�, �n h�a l� ��, th��ng d�y cho d�� t� trong ph�i tu luy�n ki�m thu�t, nghi�n c�u h�c thu�t tri�t l�, ���c ch�ng �� t� v� c�ng t�n k�nh.",12,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","V�n T� Vi�n/vantuvien","T� Ph�ng/tophong","L�n V�n Mi/lanvanmi","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","Ti�u Ng�c/tieungoc","M�c Phong Nh�/macphongnhu","Ph� Dung/phudung","Ti�u Vi�n T�/tieuvientu")			
end;

function lanhaothien()
Describe("V� tr� Li�n Hoa �i�n T�a ��: 170,191 C�ng d�ng: nhi�m v� <enter> S� Ph� Ki�m T�ng ph�i Hoa S�n, t�nh t�nh nghi�m ngh� c��ng tr�c, �t khi c��i n�i, �m h�n k� ph�n gi�o Ph�ng H�p Nh�, ng�y ��m t�m c�ch b�o th� Thi�n Nh�n Gi�o.",12,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Kh� T�ng S� Ph� T� M�/tumo","V�n T� Vi�n/vantuvien","T� Ph�ng/tophong","L�n V�n Mi/lanvanmi","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","Ti�u Ng�c/tieungoc","M�c Phong Nh�/macphongnhu","Ph� Dung/phudung","Ti�u Vi�n T�/tieuvientu")
end;

function vantuvien()
Describe("V� tr� D�t M�nh Hi�n T�a ��: 182,185 C�ng d�ng: nhi�m v� <enter> �� �� c�a T� M�, l�n l�n � Hoa S�n, c��ng tr�ng linh ho�t, t�nh t�nh c�ng �n h�a, l� �� gi�ng s� ph�, r�t qu� m�n S� �� T� Ph�ng.",12,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Kh� T�ng S� Ph� T� M�/tumo","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","T� Ph�ng/tophong","L�n V�n Mi/lanvanmi","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","Ti�u Ng�c/tieungoc","M�c Phong Nh�/macphongnhu","Ph� Dung/phudung","Ti�u Vi�n T�/tieuvientu")
end;

function tophong()
Describe("V� tr� T� Qu� Nhai T�a ��: 195,197 C�ng d�ng: nhi�m v� <enter> S� �� c�a Van T� Vi�n, t�nh t�nh ngang ng��c ng�o m�n, b�n th�n c�a h�n �� ch�t trong cu�c ph�n gi�o c�a Ph�ng H�p Nh�, n�n r�t o�n h�n Ph�ng H�p Nh� v� Thi�n Nh�n Gi�o, n�n th��ng xuy�n theo d�i t�nh t�nh bi�n ��ng c�a Thi�n Nh�n Gi�o, hy v�ng s�m ng�y b�o th� Thi�n Nh�n Gi�o.",12,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Kh� T�ng S� Ph� T� M�/tumo","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","V�n T� Vi�n/vantuvien","L�n V�n Mi/lanvanmi","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","Ti�u Ng�c/tieungoc","M�c Phong Nh�/macphongnhu","Ph� Dung/phudung","Ti�u Vi�n T�/tieuvientu")
end;

function lanvanmi()
Describe("V� tr� L�c Nh�n C�c T�a ��: 163,189 C�ng d�ng: nhi�m v� <enter> con g�i c�a L�n H�o Thi�n, th�ng minh l��ng thi�n, c�ng l�n l�n v�i V�n T� Vi�n v� T� Ph�ng, n�n quan h� v�i 2 ng��i n�y r�t th�n thi�t.",12,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Kh� T�ng S� Ph� T� M�/tumo","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","V�n T� Vi�n/vantuvien","T� Ph�ng/tophong","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","Ti�u Ng�c/tieungoc","M�c Phong Nh�/macphongnhu","Ph� Dung/phudung","Ti�u Vi�n T�/tieuvientu")
end;

function thammac()
Describe("V� tr� �i�m M�c Hi�n T�a ��: 179,185 C�ng d�ng: nhi�m v� <enter> �� �� c�a L�n H�o Thi�n, t� nh� �� r�t th�ng minh, hi�u bi�t s�u r�ng. V�o n�m Ph�ng H�p Nh� ph�n gi�o khi �y tu�i c�n nh�, �� b� k�ch ��ng l�n n�n t�nh t�nh nh�t nh�t, r�t s� xu�ng n�i.",12,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Kh� T�ng S� Ph� T� M�/tumo","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","V�n T� Vi�n/vantuvien","T� Ph�ng/tophong","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","Ti�u Ng�c/tieungoc","M�c Phong Nh�/macphongnhu","Ph� Dung/phudung","Ti�u Vi�n T�/tieuvientu")
end;

function ankiemthu()
Describe("V� tr� �i�m M�c Hi�n T�a ��: 179,185 C�ng d�ng: nhi�m v� <enter> s� ph� ��c ki�m ph�i Hoa S�n, k� n�ng ��c ki�m c�c k� gi�i.",12,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Kh� T�ng S� Ph� T� M�/tumo","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","V�n T� Vi�n/vantuvien","T� Ph�ng/tophong","L�n V�n Mi/lanvanmi","Th�m M�c/thammac","Ti�u Ng�c/tieungoc","M�c Phong Nh�/macphongnhu","Ph� Dung/phudung","Ti�u Vi�n T�/tieuvientu")
end;

function tieungoc()
Describe("T�a �� 186,191 C�ng d�ng: nhi�m v� <enter> t�nh t�nh tho�i m�i, th�ch u�ng r��u",12,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Kh� T�ng S� Ph� T� M�/tumo","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","V�n T� Vi�n/vantuvien","T� Ph�ng/tophong","L�n V�n Mi/lanvanmi","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","M�c Phong Nh�/macphongnhu","Ph� Dung/phudung","Ti�u Vi�n T�/tieuvientu")
end;

function macphongnhu()
Describe("T�a �� 160,190 C�ng d�ng: giao d�ch trang b�.",12,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Kh� T�ng S� Ph� T� M�/tumo","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","V�n T� Vi�n/vantuvien","T� Ph�ng/tophong","L�n V�n Mi/lanvanmi","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","Ti�u Ng�c/tieungoc","Ph� Dung/phudung","Ti�u Vi�n T�/tieuvientu")
end;

function phudung()
Describe("T�a ��: 179,198 C�ng d�ng: giao d�ch d��c ph�m.",12,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Kh� T�ng S� Ph� T� M�/tumo","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","V�n T� Vi�n/vantuvien","T� Ph�ng/tophong","L�n V�n Mi/lanvanmi","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","Ti�u Ng�c/tieungoc","M�c Phong Nh�/macphongnhu","Ti�u Vi�n T�/tieuvientu")
end;

function tieuvientu()
Describe("T�a ��: 166,184 C�ng d�ng: giao d�ch binh kh�.",12,"Bi�t r�i!/bietroi","Ch��ng m�n Nam Cung Tuy�t/namcungtuyet","Kh� T�ng S� Ph� T� M�/tumo","Ki�m T�ng S� Ph� L�n H�o Thi�n/lanhaothien","V�n T� Vi�n/vantuvien","T� Ph�ng/tophong","L�n V�n Mi/lanvanmi","Th�m M�c/thammac","�n Ki�m Thu/ankiemthu","Ti�u Ng�c/tieungoc","M�c Phong Nh�/macphongnhu","Ph� Dung/phudung")
end;

function bietroi()
end;
