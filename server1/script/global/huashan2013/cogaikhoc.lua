--Edit by Youtube  PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(69) == 50)  then
Talk(11,"nv15x","C� g�i kh�c: hu hu hu, s� qu�!","Ng��i ch�i: C� n��ng, c� chuy�n g� th�?","C� g�i kh�c: xem t��ng m�o c�a ��i hi�p, ��i hi�p c� ph�i l� ng��i trong giang h�?","��ng v�y.","C� g�i kh�c: ng��i giang h� th�t ��ng s�, huhu, t� m� s�ng h�m qua, n� gia ��t nhi�n th�y c� v�i b�ng �en t� c�a s� bay v�o, n� gia s� qu�, v�i gi� v� ng�, m�c d� kh�ng c� chuy�n g�, nh�ng s�ng nay ngh� l�i th�t l� ��ng s�.","Ng��i ch�i: c� n��ng ��ng s�, c� n��ng c�n nh�n th�y hay nghe th�y g� n�a kh�ng?","C� g�i kh�c: N� gia...n� gia ch� nghe lo�ng tho�ng h� n�i '7 ng�y sau, tr�n kh�u nam m�n' g� g� ��, c�n l�i kh�ng nghe r�.","Ng��i ch�i: �a t� ch� gi�o.","Ng��i ch�i: H�y mau n�i chuy�n n�y cho T� S� huynh bi�t.") 
else 
Talk(1,"","C� g�i kh�c: hu hu hu, s� qu�!")
end
end

function nv15x() 
SetTask(69,51)
AddNote("Tr� v� m�n ph�i t�m T� Ph�ng.") 
Msg2Player("Tr� v� m�n ph�i t�m T� Ph�ng.") 
end; 



