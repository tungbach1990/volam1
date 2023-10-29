
function main() 
	dialog_main()	
end


function dialog_main()
	local szTitle = "L�n n�y ph�i <color=blue>Hoa S�n<color> ta t�i su�t,  giang h� l�i th�m nhi�u bi�n ��ng"
	local tbOpt =
	{
		"V� ph�i Hoa S�n/vep",
		"Gia nh�p ph�i Hoa S�n/noi",
		"Tho�t/no",
	}
	
	Say(szTitle, getn(tbOpt), tbOpt)
end




function noi()
	if (GetCamp() == 0) and (GetSeries() == 2) and (GetLevel() >= 10) and  (GetTask(169) ~= 10)	  then		
		Say("Ph�i <color=cyan>Hoa S�n<color> ta �� kh�ng tham gia giang h� h�n 10 n�m nay, l�n n�y t�i xu�t �t s� khi�n b�n giang h� t� ph�i ph�i khi�p s�!",2, "Gia nh�p Hoa S�n/go", "�� ta suy ngh� k� l�i xem/no")
	elseif (GetCamp() == 0) and (GetSeries() ~= 2) and (GetLevel() >= 10) and  (GetTask(169) ~= 10) then
		Say("Ng��i kh�ng ph�i ng��i h� <color=blue>th�y<color> nh�ng ta ph� l� l�n n�y, c� mu�n gia nh�p ph�i <color=cyan>Hoa S�n<color> kh�ng?",2, "Gia nh�p Hoa S�n/go2", "�� ta suy ngh� k� l�i xem/no")
	else
		Talk(1,"","Ch� c� ng��i ch�a v�o ph�i m�i c� th� gia nh�p <color=blue>Hoa S�n<color>.")	
	end
end


function go() 
Talk(1,"","Ch�c m�ng c�c h� �� gia nh�p <color=blue>Hoa S�n<color>")
NewWorld(987,1389,3086)
AddMagic(1347)
AddMagic(1372)
SetTask(169,10)
SetRank(82)	
SetFaction("huashan")  
SetLastFactionNumber(10)
SetCurCamp(3)
SetCamp(3)
Msg2Player("Ch�nh th�c gia nh�p Hoa S�n ph�i, h�c ���c ki�m ph�p c� b�n")
AddGoldItem(0, 4639)
AddGoldItem(0, 4649)
Msg2Player("Nh�n ���c <color=yellow>trang b� ho�ng kim c�p Thanh C�u.")
end 

function go2() 
Talk(1,"","Ch�c m�ng c�c h� �� gia nh�p <color=blue>Hoa S�n<color>")
NewWorld(987,1389,3086)
SetSeries(2)
SetFaction("huashan")  
SetLastFactionNumber(10)
AddMagic(1347)
AddMagic(1372)
SetTask(169,10)
SetRank(82)
SetCurCamp(3)
SetCamp(3)	
Msg2Player("Ch�nh th�c gia nh�p Hoa S�n ph�i, h�c ���c ki�m ph�p c� b�n")
AddGoldItem(0, 4639)
AddGoldItem(0, 4649)
Msg2Player("Nh�n ���c <color=yellow>trang b� ho�ng kim c�p Thanh C�u.")
end 

function vep() 
Msg2Player("Ng�i y�n, ch�ng ta �i Hoa S�n ph�i")
NewWorld(987,1389,3086)
end 

function no() 
end 

