-- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com - 
-- script viet hoa By http://tranhba.com  FileName : newaccount.lua 
-- script viet hoa By http://tranhba.com  Author : lailigao 
-- script viet hoa By http://tranhba.com  CreateTime : 2005-06-06 22:15:37 
-- script viet hoa By http://tranhba.com  Desc : tay m�i ph� bi�n r�ng r�i s� tr��ng m�c 
-- script viet hoa By http://tranhba.com  Include("\\script\\misc\\spreader\\neaccount.lua")
-- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com -- script viet hoa By http://tranhba.com - 

Include("\\script\\misc\\spreader\\head.lua")

-- script viet hoa By http://tranhba.com  c� hay kh�ng c� tay m�i ph� bi�n r�ng r�i 
function gsp_haveprize_newaccount() 
local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT); 
-- script viet hoa By http://tranhba.com if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then 
if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then 
return 1; 
end; 

return 0; 
end 

function gsp_newaccount_gift() 
local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT); 
-- script viet hoa By http://tranhba.com if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then 
if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then 
Say("Tay m�i m� tr��ng m�c t�p #<color=red> t�y s�n c� m��i chu ni�n kh�nh �i�n th�ng d�ng gi� l�c <color>, ng�i m�u ch�t l�y tay m�i m� tr��ng m�c t�p ��ch t�ng ph�m sao ? ", 3,"��ng v�y , ta m�u ch�t l�y /gsp_newaccount_gift_core","Ch� m�t l�t n�a d�n /gs_newaccount_cancel", " li�n quan t�i tay m�i m� tr��ng m�c t�p .../gs_newaccount_about"); 
elseif (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER_PAY) then 
Talk(1, "","Tay m�i m� tr��ng m�c t�p # ng�i ��ch t�ng ph�m �� nh�n l�y . m�t s� tr��ng m�c ch� c� th� d�n m�t l�n . "); 
else 
Talk(1, "","Tay m�i m� tr��ng m�c t�p # ng�i ��ch s� tr��ng m�c kh�ng ph�i l� tay m�i m� tr��ng m�c t�p s� tr��ng m�c , kh�ng th� nh�n l�y t�ng ph�m . "); 
end 
end 

-- script viet hoa By http://tranhba.com  t�ng m�t 
function gsp_newaccount_gift_core() 
local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT); 
-- script viet hoa By http://tranhba.com if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then 
if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then 
AddExtPoint(GSP_ACCOUNT_EXTPOINT, 1); -- script viet hoa By http://tranhba.com  s�a ��i ph�t tri�n �i�m �� nh�n l�y d�u hi�u 

AddItem(0,10,2,1,random(0,4),0,0); -- script viet hoa By http://tranhba.com  b�ch m� 
Earn(10000); -- script viet hoa By http://tranhba.com  1w hai 
Msg2Player("Ng�i thu ���c li�t b�ch m� m�t th�t c�ng b�c 1 v�n l��ng "); 
--Talk(1, "","Tay m�i m� tr��ng m�c t�p # ng�i ��t ���c li�t b�ch m� m�t th�t c�ng b�c 1 v�n l��ng , ch�c ng�i � ki�m hi�p t�nh duy�n in t� n�t b�n trung vui v� ��a tr� ch�i "); 
Talk(1, "","Ch�o m�ng ng��i ch�i m�i ! Ta t�ng ng��i <color= Green>1 Li�t b�ch m� <color>v� <color= Yellow> 1 v�n l��ng <color> , ch�c ng��i h�nh t�u giang h� vui v� "); 

return 1; 
end 
end 

function gs_newaccount_cancel() 
end 

function gs_newaccount_about() 
Talk(1, "","Tay m�i m� tr��ng m�c t�p # n�u ng�i s� d�ng <color=red> t�y s�n c� m��i chu ni�n kh�nh �i�n th�ng d�ng gi� l�c <color> ph�t ra tay m�i m� tr��ng m�c t�p s� tr��ng m�c ( m�t lo�i l�y KS m� ��u ) , nh�ng � l� quan ch� nh�n l�y m�t ph�n l� v�t , gi�p ng�i b��c ra x�ng x�o giang h� ��ch b��c ��u ti�n . "); 
end 
