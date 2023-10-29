Include("\\script\\event\\teacher_day_200711\\head.lua");
Include("\\script\\lib\\compose.lua");
function composeCard_TeacherDay200711 ()
	--{Material, Award, Result_su, Result_er, Result_fa}
	--Material = {nAmount, tbProp, [strName]}
	--Award = {type, detail, amount}
	if ( GetLevel() < 50 ) then
		Say("Xin l�i!  Ph�i <color=yellow>tr�n c�p 50<color> m�i c� th� h�p th�nh S�ch gia truy�n!",0)
		return 0;
	end
	local tbMaterial = 
	{
		{1, {6,1,1599,nil,nil,nil}, "T�n"},
		{1, {6,1,1600,nil,nil,nil}, "�S��"},
		{1, {6,1,1601,nil,nil,nil}, "Tr�ng"},
		{1, {6,1,1602,nil,nil,nil}, "��o"},
		{15, {6,0,20,nil,nil,nil}, "Mai Kh�i Hoa V� "},
	}
	local tbAward = {1,{6,1,1603,1,0,0},1}
	local tb_compose ={tbMaterial, tbAward, "Gh�p ch� th�nh c�ng","Nguy�n li�u kh�ng ��ng","Gh�p ch� th�t b�i"}
	material_compose(tb_compose, "Ho�t ��ng gh�p ch�")
end