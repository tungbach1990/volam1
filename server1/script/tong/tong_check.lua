IncludeLib("SETTING")
Include("\\script\\tong\\tong_header.lua")
IncludeLib("TONG")
function tong_check_add()
	print("goi ham add thanh vien bang hoi")
	if(GetLevel() < 60)then
		Talk(1,"","C�p 60 tr� l�n m�i ���c gia nh�p bang h�i")
		return
	end
	-- local nTransLifeCount = ST_GetTransLifeCount()	
	-- if nTransLifeCount < 3 then
	-- 	Msg2Player("C�n tr�ng sinh 3 c�p 190 tr� l�n m�i ���c gia nh�p bang h�i")
	-- 	return 
	-- end
	-- if nTransLifeCount == 3 and GetLevel() < 190 then
	-- 	Msg2Player("C�n tr�ng sinh 3 c�p 190 tr� l�n m�i ���c gia nh�p bang h�i")
	-- 	return 
	-- end
	return 1
end

function tong_check_create()
	if(GetLevel() < 80)then
		Talk(1,"","L�p bang y�u c�u ��ng c�p 80 tr� l�n")
		return
	end
	-- local nTransLifeCount = ST_GetTransLifeCount()	
	-- if nTransLifeCount < 3 then
	-- 	Msg2Player("C�n tr�ng sinh 3 c�p 190 tr� l�n m�i ���c th�nh l�p bang h�i")
	-- 	return 
	-- end
	-- if nTransLifeCount == 3 and GetLevel() < 190 then
	-- 	Msg2Player("C�n tr�ng sinh 3 c�p 190 tr� l�n m�i ���c th�nh l�p bang h�i")
	-- 	return 
	-- end
	return 1
end