--�����ڵ��ż���������ϵͳ����İ�����а��
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
	if ( Uworld189 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj091.spr>Th� c�a Long Ng�<link><enter>"..name..", h�y ��n Chu Ti�n Tr�n t�m V�n Nhi! S� c� nhi�m v� cho ng��i! H�nh s� n�n th�n tr�ng! Long ng�!",1,"Nh�n h�m th� /no")
		nt_setTask(189,30)
		if ( Uworld1003 < 10 ) then 
			nt_setTask(1003,10) --а������ʼ
		end
	end
	return 0
end
	
