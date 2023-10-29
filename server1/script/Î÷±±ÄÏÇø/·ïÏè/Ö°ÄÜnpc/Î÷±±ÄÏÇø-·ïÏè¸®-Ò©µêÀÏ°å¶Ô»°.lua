Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main(sel)
if (GetTask(169) == 31)  then
Say("Thu�c c�a b�n ti�m to�n l� th� th��ng h�ng, c� b�nh tr� b�nh, kh�ng b�nh c��ng th�n, c� mu�n mua m�t �t kh�ng? ", 3, "Ta c� vi�c kh�c mu�n t�m �ng./nv30HS", "Giao d�ch/yes", "Kh�ng giao d�ch/no");
elseif (GetTask(169) == 33) and (HaveCommonItem(6,1,3948)>0) then
Say("Thu�c c�a b�n ti�m to�n l� th� th��ng h�ng, c� b�nh tr� b�nh, kh�ng b�nh c��ng th�n, c� mu�n mua m�t �t kh�ng? ", 3, "Ta c� vi�c kh�c mu�n t�m �ng./nv30HS2", "Giao d�ch/yes", "Kh�ng giao d�ch/no");
elseif (GetTask(169) == 34) then
Say("Thu�c c�a b�n ti�m to�n l� th� th��ng h�ng, c� b�nh tr� b�nh, kh�ng b�nh c��ng th�n, c� mu�n mua m�t �t kh�ng? ", 3, "Ta c� vi�c kh�c mu�n t�m �ng./nv30HS3", "Giao d�ch/yes", "Kh�ng giao d�ch/no");
else 
Say("Thu�c c�a b�n ti�m to�n l� th� th��ng h�ng, c� b�nh tr� b�nh, kh�ng b�nh c��ng th�n, c� mu�n mua m�t �t kh�ng? ", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no");
end
end;

function nv30HS3()
Talk(2,"","�ng ch� d��c �i�m: B�ng T�m Ng�c L� Cao ��i hi�p c�n ��y, thu�c n�y tr� ngo�i th��ng r�t t�t. N�u kh�ng �� d�ng, h�y quay l�i t�m ta.")	 			
AddNote("��i hi�p nh�n ���c B�ng T�m Ng�c L� Cao.") 
Msg2Player("��i hi�p nh�n ���c B�ng T�m Ng�c L� Cao.") 
SetTask(169,35)		
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3949,0,0,0}, nBindState=-2}, "test", 1);
end;

function nv30HS2()
Talk(2,"","�ng ch� d��c �i�m: Th�t t�t qu�! ta s� ch� v� thu�c n�y ngay, ��i hi�p ��i m�t t� l� c� th� l�y ���c.")	 			
AddNote("��a d��c li�u cho �ng ch� d��c �i�m, l�t sau quay l�i nh�n B�ng T�m Ng�c L� Cao.") 
Msg2Player("��a d��c li�u cho �ng ch� d��c �i�m, l�t sau quay l�i nh�n B�ng T�m Ng�c L� Cao.") 
SetTask(169,34)	
DelCommonItem(6,1,3948)
end;

function nv30HS()
Say("�ng ch� d��c �i�m: Ng��i c� vi�c g�, mau n�i �i.", 1, "Ta mu�n mua m�t �t B�ng T�m Ng�c L� Cao/ngoclocao1"); 			
end;

function ngoclocao1()
Talk(4,"","�ng ch� d��c �i�m: V� ��i hi�p n�y Thi�u hi�p ��n kh�ng ��ng l�c, B�ng T�m Ng�c L� Cao ch� t�o kh�ng kh�, nh�ng gi� c�n thi�u 1 nguy�n li�u quan tr�ng B�ng T�m Tu�. C�ch ��y m�y h�m �� b� ��o t�c c��p h�t.","Ng��i ch�i: Vi�c n�y kh�ng kh�, ��i ta �i �o�t v�.","�ng ch� d��c �i�m: Th�t v�y sao? v�y th� ph� th�c cho Thi�u hi�p!")	 			
AddNote("D��c li�u b� c��p, ��i hi�p nh�t ��nh ph�i ��n Ki�m C�c T�y B�c (119/243) ��nh b�i ��o t�c �o�t l�i B�ng T�m Thu�.") 
Msg2Player("D��c li�u b� c��p, ��i hi�p nh�t ��nh ph�i ��n Ki�m C�c T�y B�c (119/243) ��nh b�i ��o t�c �o�t l�i B�ng T�m Thu�.") 
SetTask(169,32)
end

function yes()
Sale(12);  			
end;


function no()
end;