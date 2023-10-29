Include("\\script\\global\\thinh\\hotro\\trangbihoangkim.lua")
Include("\\script\\global\\thinh\\hotro\\doxanh.lua")
Include("\\script\\global\\thinh\\hotro\\take_set_goldequipe.lua")
Include("\\script\\global\\thinh\\hotro\\functions_bachkim.lua")
Include("\\script\\global\\thinh\\hotro\\nhancankhon.lua")

------------------------------------------------------------------------------------------------------------
function main()
	--dofile("script/global/thinh/npc/npc_trangbi.lua")
	dialog_trangbi_main()
end

function dialog_trangbi_main()
	local szTitle = "Xin ch�o <color=red>"..GetName().."<color> ! ��i hi�p mu�n nh�n trang b� g�?"
	local tbOpt=
	{"�� xanh/dialog_xanhtim",
	"Nh�n Trang B� Ho�ng Kim/hoangkim",
	"Nh�n Trang B� B�ch Kim/bachkim_main",
	"M� r�ng r��ng/moruong",
	"Nh�n Ng�a/nhanngua",
	"Th�i./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
	
end


function dialog_xanhtim()
	local szTitle = "Xin ch�o <color=red>"..GetName().."<color> ! ��i hi�p mu�n nh�n trang b� g�?"
	local tbOpt=
	{"Nh�n �� Xanh/laydoxanh",
	"Th�ng c�p �� xanh, t�m/UpgradeDo",
	"H� c�p �� xanh, t�m/DowngradeDo",
	"Tr� l�i/main",
	"Th�i./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

--------------------Hoang Kim -------------------------------------------------
function hoangkim()
	local szTitle = "Xin ch�o <color=red>"..GetName().."<color> ! ��i hi�p mu�n nh�n trang b� g�?"
	local tbOpt=
	{
	"Nh�n An Bang ��nh Qu�c/TrangBiHoangKimThuong",
	"Nh�n B� Ho�ng Kim/SetTrangBiHoangKim",
	"Nh�n Tr�n Bang Chi B�o/TBCB",
	"Nh�n Trang B� Hi�m, Cao C�p/TrangBiHiem",
	"Nh�n Nh�n C�n Kh�n c�p 10/NhanCanKhon",
	"Tr� L�i/dialog_trangbi_main",
	"Th�i./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
	
end

----------------------Mo ruong--------------------------------------------------
function moruong()
	OpenStoreBox(1)
	OpenStoreBox(2)
	OpenStoreBox(3)
	SetPartnerBagLevel(10)
end
----------------------Lay ngua --------------------------------------------------

function nhanngua()
local szTitle = "Xin ch�o <color=red>"..GetName().."<color>. Xin ch�n ng�a:"
local tbOpt =
	{	
		"Ng�a 8x/nguathuong",
		"Ng�a v� l�m/nguavolam",
		"H� B�o S� T�/hobaosutu",
		"Ng�a Ho�ng Kim/nguahoangkim",
		"Heo r�ng/heorung",
		"C�u v� h�/holi",
		"Tr� L�i/dialog_trangbi_main",
		"Th�i./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

function nguathuong()
	AddItem(0,10,5,6,0,0,0,0)
	AddItem(0,10,5,7,0,0,0,0)
	AddItem(0,10,5,8,0,0,0,0)
	AddItem(0,10,5,9,0,0,0,0)
	AddItem(0,10,5,10,0,0,0,0)
	AddItem(0,10,8,10,0,0,0)
end

function nguavolam()
	AddItem(0,10,6,10,0,0,0)
	AddItem(0,10,7,10,0,0,0)
	AddItem(0,10,9,10,0,0,0)
	AddItem(0,10,11,10,0,0,0)
	AddItem(0,10,13,10,0,0,0)
	AddItem(0,10,18,10,0,0,0) 
end

function hobaosutu()
	AddItem(0,10,14,10,0,0,0)
	AddItem(0,10,15,10,0,0,0)
	AddItem(0,10,16,10,0,0,0)
	AddItem(0,10,17,10,0,0,0)
	AddItem(0,10,22,10,0,0,0)
end

function nguahoangkim()
	AddGoldItem(0, 4366)
	for i=5093,5096 do
		AddGoldItem(0, i)
	end
end

function heorung()
	AddItem(0,10,36,10,0,0,0)
	AddItem(0,10,37,10,0,0,0)
end

function holi()
	AddItem(0,10,38,10,0,0,0)
	AddItem(0,10,39,10,0,0,0)
	AddItem(0,10,40,10,0,0,0)
	AddItem(0,10,41,10,0,0,0)
end