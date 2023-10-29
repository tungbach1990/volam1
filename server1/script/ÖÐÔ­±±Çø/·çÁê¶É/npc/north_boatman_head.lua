-- ����ɱ�������
Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
Include("\\script\\lib\\common.lua");

local tbNorth_Boatman_Info	=
{
	[1]	= {szNpcname = "Thuy�n phu Gi�p", tbMap = {336, 1165, 3043}},
	[2]	= {szNpcname = "Thuy�n phu �t", tbMap = {336, 1299, 2933}},
	[3]	= {szNpcname = "Thuy�n phu B�nh", tbMap = {336, 1555, 2829}},
};

function north_boatman_main(nId)
	local szNpcname = %tbNorth_Boatman_Info[nId].szNpcname;
	tbBoatmanDialog	= {format("���c th�i! �i n�o!/#tosouth(%d)", nId), "T�m th�i ch�a �i!/no"};
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= jf0904_act_dateS) then
		tinsert(tbBoatmanDialog, 2, "Ta ��n giao nhi�m v� ti�u di�t th�y t�c/fullfill_shuizei_act");
	end
	Say(format("%s: Ng��i mu�n ng�i thuy�n ��n b� nam Phong L�ng ��? ��a ta 200 l�ng b�c l� ���c.", szNpcname), getn(tbBoatmanDialog), unpack(tbBoatmanDialog));
end

function tosouth(nId)
	local tbMap 	= %tbNorth_Boatman_Info[nId].tbMap;
	local szNpcname	= %tbNorth_Boatman_Info[nId].szNpcname;
	
	if( GetCash() >= 200 ) then
		NewWorld(unpack(tbMap));
		Pay( 200 );
		DisabledUseTownP(0);
	else
		Talk(1,"",format("%s: Kh�ng c� ti�n sao ng�i thuy�n ���c nh�?", szNpcname));
	end
end

function no()
end