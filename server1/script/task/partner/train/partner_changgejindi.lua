Include("\\script\\task\\partner\\train\\partner_addtrainnpc.lua")

function Goto_jindichangge()
	Describe(DescLink_ChangGeMen..": Trong Tr��ng ca m�n c�m ��a, ng��i ch�i v� ��ng h�nh s� nh�n ���c r�t nhi�u �i�m kinh nghi�m. C� th� l�y ���c M�t t�ch. C� mu�n v�o �� kh�ng?", 2,
	"�, ta mu�n �i/sure_gotojindi",
	"��i m�t l�t/OnCancel")
end

function OnCancel()
end

function sure_gotojindi()
	local filehigh = pt_GetTabFileHeight( jindienter_pos_file )
	local row = random(filehigh)
	local posx = pt_GetTabFileData(jindienter_pos_file, row + 1, 1)
	local posy = pt_GetTabFileData(jindienter_pos_file, row + 1, 2)
	
	if (posx > 0 and posy > 0) then
		NewWorld(539, posx, posy)
		SetFightState(1)
	else
		print("jindienter_pos_file error row = "..row)
	end
end