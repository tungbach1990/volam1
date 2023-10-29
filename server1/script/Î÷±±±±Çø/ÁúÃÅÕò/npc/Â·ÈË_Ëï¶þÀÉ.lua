-- ������·�ˡ������(��С������)
-- by��Dan_Deng(2003-09-16)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(199) == 1 then
		allbrother_0801_FindNpcTaskDialog(199)
		return 0;
	end
	Uworld41 = GetByte(GetTask(41),1)
	if (GetLevel() >= 40) and (GetReputeLevel(GetRepute()) >= 5) then		-- ������������
		if (Uworld41 == 0) then					-- ������ֱ�Ӵ�����ɴ�����
			if (random(0,1) == 0) then
				Talk(1,"","�i!...")
			else
				Talk(1,"","T�n Nh� Lang:............ ")
			end
		elseif (Uworld41 == 5) then			-- ������ʽ����
			Talk(1,"U41_get","Chuy�n g� khi�n huynh phi�n n�o v�y? V� ��i t�u b�n c�nh huynh sao kh�c th��ng t�m v�y?")
		elseif (Uworld41 == 100) then			-- �������
			Talk(2,"U41_prise","Th�t c�m t� �n nh�n! ��i �n ��i ��c n�y ta s� kh�ng nbao gi�cqu�n! Trong n�y l� linh d��c c�a m�t v� s� Thi�u L�m �� t�ng ta. C� th� h� tr� ti�m n�ng.Xin ��ng t� ch�i!","�� nh� v�y, ta t� ch�i c�ng kh�ng ���c!")
		elseif (Uworld41 == 255) then			-- ������ɺ�
			Talk(1,"","L�c n�y ta kh�ng d�m cho Ti�u Quy�n ra kh�i nh�, nh�ng c� nh� v�y th� kh�ng l� c�ch l�u d�i. C� l� ph�i g� n� th�i.")
		else											-- ���������
			Talk(1,"","H�m qua, Ti�u Quy�n �� b� ��i v��ng c�a C� �m ��ng c��p �i, �p l�m �p tr�i phu nh�n. B�y gi� n�i kh�ng ch�ng th� m�i s� �� qu� mu�n.! ")
		end
	else							-- ����תȱʡ�Ի�
		Talk(1,"","C� ng��i n�i Long M�n Tr�n ch�ng ta ch� t�an tr�m c��p, ��ng l� kh�ng bi�t g�! Ta d�m cu�c l� kh�ng qu� hai ba n�m n�a, Long M�n Tr�n s� xu�t hi�n m�t nh�n v�t ��nh thi�n l�p ��a")
	end
end;

function U41_get()
	Say("�i! Ti�u Quy�n nh� ta m�y ng�y tr��c b� ��i v��ng C� �m Tr�i �� �, n�i l� mu�n con b� l�m �p tr�i phu nh�n g� ��. H�m qua �� ��n c��p �i",2,"H�ng h�i �i c�u ng��i /U41_get_yes","An �i v�i c�u cho xong /U41_get_no")
end

function U41_get_yes()
	Talk(2,"","��i V��ng g�? Gi�a thanh thi�n b�ch nh�t l�i c��p d�n n�? Ta s� �i c�u c� �y v�!","Xin hi�p kh�ch gi�p cho! C� �m Tr�i n�m trong C� D��ng ��ng!")
	Uworld41 = random(1,15)*256*256 + 10			-- �����ֽ�Ϊ�������Ƶ�0001 - 1111������һ�ֽ�Ϊ10
	SetTask(41,Uworld41)
	Msg2Player("Ti�p nh�n nhi�m v�, mang Ti�u Quy�n tr� v� t� C� �m Tr�i. ")
	AddNote("Ti�p nh�n nhi�m v�, mang Ti�u Quy�n tr� v� t� C� �m Tr�i. ")
end

function U41_prise()
	AddProp(1)											-- ����1��Ǳ��
	add_repute = ReturnRepute(30,50,3)			-- �������������30�㣬��50����ÿ���ݼ�3%
	AddRepute(add_repute)
	Uworld41 = SetByte(GetTask(41),1,255)
	SetTask(41,Uworld41)
	Ubonus86 = GetTask(86) + 1					-- ��¼��������1��Ǳ��(��һ�ֽ�+1)
	if (GetByte(Ubonus86,1) >= 250) then		-- �ݴ�����Ϊ250��
		Ubonus86 = 250
	end
	SetTask(86,Ubonus86)
	AddNote("C�u Ti�u Quy�n mang v�, nhi�m v� ho�n th�nh. ")
	Msg2Player("<#> Nhi�m v� ho�n th�nh, danh v�ng c�a b�n t�ng th�m "..add_repute.."<#> �i�m.")
	Talk(1,"KickOutSelf","U�ng xong linh d��c, v�n c�ng n�a bu�i. B�n c�m th�y ti�m n�ng t�ng th�m m�t �i�m.")
end

function U41_get_no()
	Talk(2,"","Th�t qu� ��ng! B�n gi�c c��p n�y th�t ch�ng xem v��ng ph�p ra g� m�!","Th�i bu�i n�y c�n c� ai n�i v��ng ph�p sao?")
end

function no()
end
