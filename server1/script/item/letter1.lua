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
	if ( Uworld186 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj090.spr>Th� Long Ng�<link><enter>Long Ng�: "..name..", ng��i tuy m�i ra giang h� nh�n �� th� hi�n b�n l�nh h�n ng��i! Hi�n gi� c� m�t t� ch�c s�t th� l�n m�nh t�n l� L�m Uy�n Nhai �ang �nh h��ng r�t nguy h�i ��n V� l�m! Ng��i mang th� n�y ��n Bi�n Kinh ��a cho Ph� Nam B�ng, h�n s� t� bi�t s�p x�p! Long Ng�.",1,"Nh�n h�m th� /no")
		nt_setTask(186,30)
		if ( Uworld1002 < 10 ) then
			nt_setTask(1002,10) --��������ʼ
		end
	end
	return 0
end
	
