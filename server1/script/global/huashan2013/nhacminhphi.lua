Include("\\script\\lib\\awardtemplet.lua")
--Edit by Youtube PGaming  --

Include("\\script\\dailogsys\\dailogsay.lua")

function main() 
if ((GetLevel() >=90) and (GetTask(69) == 13) and  GetRepute() > 239 and (HaveMagic(1347) >= 0)) then 
Talk(8,"L90_hs","Ng��i ch�i: Th�p ni�n giang h� v� phi�u linh. Ch�p �ao tr��ng ki�m ���ng b�t b�nh. H�i th� m�ng trung th�n nh� kh�ch, b�t nh��c quy kh� v�n tr�ng thanh. V� c�ng t� n�y qu� th�t kh�ng t�m th��ng, kh�ng bi�t t�i h� c� th� ��i t� v�i c�ng t�.","Nh�c Minh Phi: Huynh ��i, qu� khen r�i, t�i h� ch� l� ng��i t�m th��ng trong v�n v�n ch�ng sinh th�i.","Ng��i ch�i: c�ng t� kh�ng c�n qu� khi�m nh��ng? Hi�n nay thi�n h� ��i lo�n, kh�ng �t ng��i b� t�c l�u c� ��i, nh�ng c�ng t� l�i c� th� ng�m ra th� s� th�c t�nh, kh�ng kh�i khi�n ng��i kh�c ng��ng m�.","Nh�c Minh Phi: Ha ha, Huynh ��i. hi�u ta! Kh�ng bi�t Huynh ��i cao danh qu� t�nh l� g�? qu� danh, c� th� ch�ng ta s� tr� th�nh m�t tri giao!","Ng��i ch�i: t�i h� "..GetName()..".","Nh�c Minh Phi: t�i h� Nh�c Minh Phi, h�m nay ���c u�ng r��u ng�m th� c�ng Huynh ��i, kh�ng say kh�ng v�","T�u qua 3 gi�...")
elseif (GetTask(69) > 19) and (GetTask(69) < 21)then
Talk(1,"","Nh�c Minh Phi: th� Huynh ��i, c�n mu�n u�ng v�i ta v�i ly kh�ng, haha.")
elseif (GetTask(69) == 22) and (HaveCommonItem(6,1,3958)>0) then 
Talk(8,"L902_hs","Nh�c Minh Phi: �i...","Ng��i ch�i: Minh Phi Huynh sao th�","Nh�c Minh Phi: ...khi n�y c� m�y t�n h�c y nh�n ��n h�nh th�ch ta, ta �� c�c l�c ch�ng l�i nh�ng v�n b� th��ng, may thay khi �y quan binh �i ngang, n�n ch�ng t�m r�t lui...n�i th� ch�ng l� c�c h� c�ng �� ��ng �� ch�ng??","Ng��i ch�i: ��ng, t�i h� ph�t hi�n ra 1 s� m�u t�ch t�i th�nh ngo�i, �ang t�nh truy l�ng th� b� m�t t�n ng��i Th�n B� ��t k�ch, tr�n ng��i h�n c� 1 th� m�t l�nh nghe n�i s� g�y b�t l�i v�i huynh, nh�ng kh�ng ng� ��n tr� 1 b��c...","Nh�c Minh Phi: kh�ng sao, ��y kh�ng ph�i l� v�t th��ng n�ng g�","Nh�c Minh Phi: nh�ng t�n l�c n�y c� th� th�y r�ng ch�ng ��n t� Thi�n Nh�n Gi�o, vi�c n�y nh�t ��nh li�n quan ��n Thi�n Nh�n M�n, "..GetName()..", t�i h� mu�n nh� m�t vi�c","Ng��i ch�i: Huynh c� n�i.")
elseif (GetTask(69) > 22) and (GetTask(69) < 24)then
Talk(1,"","Nh�c Minh Phi: th� n�o? �� g�i th� ch�a?")
elseif (GetTask(69) > 25) and (GetTask(69) < 31)then 
Talk(1,"","Nh�c Minh Phi: Huynh ��i, tr�n ���ng c�n th�n.") 
elseif (GetTask(69) == 25) then 
Talk(7,"L903_hs","Ng��i ch�i: Minh Phi Huynh, L�n ti�n b�i nh� ta ��n h� tr� huynh.","Nh�c Minh Phi: cu�i c�ng c�ng ph�i nh� ��n c�c h�.","Ng��i ch�i: hai ta �� l� tri giao th� kh�ng c�n ph�i n�i nh� th�, huynh c� s�p x�p.","Nh�c Minh Phi: th� th� Minh Phi kh�ng kh�ch kh� n�a, ta �� th�m th�nh ���c ng�y mai s�t th� c�a Thi�n Nh�n Gi�o s� ��n Ph�c Ng�u S�n mai ph�c, ta h�nh ��ng b�t ti�n, ��nh nh� c�c h� �i ng�n c�n ch�ng","Ng��i ch�i: nh�t ��nh kh�ng ph� s� th�c.","Nh�c Minh Phi: c�c h� h�y c�n tr�ng.")
elseif (GetTask(69) == 31) then 
Talk(7,"L904_hs","Ng��i ch�i: t�i h� �� gi�i quy�t to�n b� s�t th�.","Nh�c Minh Phi: T�t qu�, l�n n�y Thi�n Nh�n Gi�o s� kh�ng c�n th�c hi�n ���c �m m�u n�a. "..GetName()..", qu� th�t �a t�.","Ng��i ch�i: ch� l� chuy�n nh� nh�t, huynh kh�ng c�n kh�ch s�o.","Nh�c Minh Phi: haha, t�i h� c� m�t qu�n M�t T�ch Hoa S�n, do ch�nh tay ta sao ch�p, xem nh� l� v�t h�i ��p.","Ng��i ch�i: c�i n�y, t�i h� sao d�m nh�n...","Nh�c Minh Phi: kh�ng sao, v�i v� c�ng v� ph�m ch�t nh� Huynh ��i. ��y, quy�n m�t t�ch n�y kh�ng c�n ai th�ch h�p h�n.","Ng��i ch�i: th� n�y t�i h� ��nh th�t l�.")
else
Talk(1,"","Nh�c Minh Phi: Th�p ni�n giang h� v� phi�u linh. Ch�p �ao tr��ng ki�m ���ng b�t b�nh. H�i th� m�ng trung th�n nh� kh�ch, b�t nh��c quy kh� v�n tr�ng thanh.")


end
end;

function L904_hs() 
AddNote("H�c ���c v� c�ng �o�t M�nh Li�n Ho�n Tam Ti�n Ki�m, B�ch Th�ch Ph� Ng�c, T� H� Ki�m Kh�.") 
Msg2Player("H�c ���c v� c�ng �o�t M�nh Li�n Ho�n Tam Ti�n Ki�m, B�ch Th�ch Ph� Ng�c, T� H� Ki�m Kh�.")
AddNote("Ho�n th�nh nhi�m v�. Nh�n ���c 1 �i�m danh v�ng.") 
Msg2Player("Ho�n th�nh nhi�m v�. Nh�n ���c 1 �i�m danh v�ng.")
AddRepute(1)
AddMagic(1364,1)
AddMagic(1382,1)
AddMagic(1365,1)
AddItem(6,1,2424,0,0,0)
AddItem(6,1,2425,0,0,0)
Msg2Player("Ng��i nh�n ���c <color=yellow>��i th�nh b� k�p c�p 90 v� 120.")
SetTask(69,32)
AddGoldItem(0, 4659)
AddGoldItem(0, 4669)
Msg2Player("Ng��i nh�n ���c <color=yellow>trang b� ho�ng kim Hoa S�n c�p V�n L�c.")
end  

function L903_hs() 
SetTask(69,26)
AddNote("��n Ph�c Ng�u S�n ph�a ��ng, ti�u di�t s�t th� Thi�n Nh�n Gi�o") 
Msg2Player("��n Ph�c Ng�u S�n ph�a ��ng, ti�u di�t s�t th� Thi�n Nh�n Gi�o")
end 


function L90_hs() 
SetTask(69,20)
AddNote("K�t giao v�i Nh�c Minh Phi, nh�n nhi�m v� T��ng D��ng K�t Tri Giao. ��n ngo�i � T��ng D��ng ki�m tra") 
Msg2Player("K�t giao v�i Nh�c Minh Phi, nh�n nhi�m v� T��ng D��ng K�t Tri Giao. ��n ngo�i � T��ng D��ng ki�m tra")
end 


function L902_hs() 
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3959,0,0,0}, nBindState=-2}, "test", 1);
DelCommonItem(6,1,3958)
SetTask(69,23)
AddNote("��n ch� ph�i Hoa S�n mang th� c�a Nh�c Minh Phi giao cho T� Ph�ng")
Msg2Player("��n ch� ph�i Hoa S�n mang th� c�a Nh�c Minh Phi giao cho T� Ph�ng")
end 