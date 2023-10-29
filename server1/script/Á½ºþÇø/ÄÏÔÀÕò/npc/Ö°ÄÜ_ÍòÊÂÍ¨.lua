--����ͨ�����ű�(BlackBay.03.12.30)

Include([[\script\event\mid_autumn06\fairy_of_midautumn06.lua]]);

function main(sel)
	local tab_Content = {
		"T�n 20000 l��ng b�c �� bi�t tin t�c v� m�t ng��i /Query2", 
		"T�n 3000 l��ng b�c �� bi�t tin t�c v� m�t ng��i /Query3", 
		"Kh�ng h�i tr��c /Nothing"
	};
	
	if (au06_is_inperiod() == 1) then
		tinsert(tab_Content, "Ho�t ��ng Trung Thu/au06_entrance_fairy");
	end;
	Say("Ta ��ch th�t l� V�n S� Th�ng, kh�ng c� chuy�n g� m� kh�ng bi�t. Ng��i mu�n h�i vi�c g�?", getn(tab_Content), tab_Content);
end;

--�������������������� QueryWiseMan �ĺ������˺���֪ͨ�ͻ�������һ�����ֲ��ύһ�β�ѯ
--��ѯ�ɹ���ϵͳ�ص���һ������ָ���Ļص�����������ѯʧ�ܣ�ϵͳ�ص���һ������ָ���Ļص�������
--�ص�����ԭ����ο����涨���������������WisemanCallBack��AbsentCallBack
function Query1()
	if (GetCash() >= 100000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 100000)
	else
		Nothing()
	end
end;

function Query2()
	if (GetCash() >= 20000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 20000)
	else
		Nothing()
	end
end;

function Query3()
	if (GetCash() >= 3000) then
		QueryWiseMan("WisemanCallBack", "AbsentCallBack", 3000)
	else
		Nothing()
	end
end;

function Nothing()
	Talk(1, "", "Ng��i ch�ng ph�i �ang ch�c gh�o ta ��y ch�?")
end;

--�˺���Ϊ�ɹ���ѯ��Ϣ�Ļص����������������Ͳ���˳������ı�
function WisemanCallBack(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	if MapName == "" then
			Say("Xin l�i, "..TargetName.."Hi�n t�i � khu v�c ��c th� nh� <color=red>Khu v�c bang h�i ��c l�p<color>, nh�ng kh�ng th� bi�t ���c v� tr� c� th� c�a y, v� th� ta ch� t�nh m�t n�a gi� d� h�i m� th�i, ha ha.",0)
			Pay(MoneyToPay / 2)
			return
	elseif (MoneyToPay == 3000) then
		Say("C�i kia "..TargetName.."B�y gi� � t�i<color=red> "..MapName.."<color>ng��i �i nhanh �i, n�u h�n �i ��n n�i kh�c ta kh�ng qu�n ���c ��u. ",1,"�a t� /no")
	elseif (MoneyToPay == 20000) then
		Say("C�i kia "..TargetName.."B�y gi� � t�i<color=red> "..MapName.."<color>, V� tr� c� th� c� l� l�<color=red> ( "..nPosX..", "..nPosY..")<color>, n�u ng��i mu�n t�m h�n th� �i nhanh l�n. ",1,"�a t� /no")
	elseif (MoneyToPay == 100000) then
		SexString = "Nam"
		if (nSex ~= 0) then
			SexString = "N� "
		end
		Say("C�i kia "..TargetName.."Tu�n l�nh!"..PlayerLevel.."hi�p kh�ch "..SexString..", v� tr� hi�n t�i l�<color=red>"..MapName.."("..nPosX..", "..nPosY..")<color> h�nh d�ng c�a., th�. th� gi�i "..nWorldRank.."Danh., �i�m PK "..PKValue..". N�u ng��i mu�n t�m h�n th� �i nhanh l�n. ",1,"�a t� /no")
	end
	Pay(MoneyToPay)
end;

--�˺���Ϊʧ�ܲ�ѯ(Ҳ���ǲ�����)��Ϣ�Ļص����������������Ͳ���˳������ı�
function AbsentCallBack(TargetName, MoneyToPay)
	Say("Xin l�i, "..TargetName.."Hi�n gi� kh�ng c� � ��y, kh�ng th� bi�t ���c n�i � c�a h�n, ph� t� v�n ta ch� l�y n�a gi� th�i, hehe. ",0)
	Pay(MoneyToPay / 2)
end;

function no()
end
