--�����ڵ��ż���������ϵͳ����İ���������
--by xiaoyang(2004\12\25)

Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
local curCamp = nt_getCamp()
	Uworld1001 = nt_getTask(1001)  --����
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld183 = nt_getTask(183)
	Uworld186 = nt_getTask(186)
	Uworld189 = nt_getTask(189)
	local name = GetName()
	if ( Uworld183 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj075.spr>Th� Long Ng�<link><enter>Long Ng�: "..name..", hi�n c� m�t t� ch�c t�n l� T�m Long h�i th�c l�c to l�n �ang t� h�p trong c�c th�nh th�. Ng��i h�y t�m c�ch gia nh�p t� ch�c n�y, r�t t�t cho t��ng lai c�a ng��i! H�y �i ��i L� t�m M�c S�u, c� ta s� giao c� th� cho ng��i. Nh�ng kh�ng ���c nh�c t�i ta! Nguy�n nh�n sau n�y ng��i s� bi�t! Long Ng�.",1,"Nh�n h�m th� /no")
		nt_setTask(183,30)
		if ( Uworld1001 < 10 ) then
	  		nt_setTask(1001,10) --��������ʼ
	  	end
	end
	return 0
end
	
