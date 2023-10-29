--zero 20070712 ��������

Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\pay.lua");

function main()
	if(tonumber(GetLocalDate("%Y%m%d"))>=20070728 and tonumber(GetLocalDate("%Y%m%d"))<=20070813) then
		CreateTaskSay({"<dec><npc>Hoan ngh�nh ��n v�i ho�t ��ng 'Tri�u H�i M�nh T��ng' di�n ra t� 28-07-2007 ��n 24:00 13-08-2007. Trong th�i gian ho�t ��ng, ng��i ch�i c�p 90 tr� l�n (bao g�m c�p 90) �� n�p th� c� th� tham gia ch� t�o l�nh b�i. Xem n�i dung chi ti�t tr�n trang ch�.",
			"Ta mu�n ch� t�o M�c B�i/#lingpaizhizao_do(1)",
			"Ta mu�n ch� t�o ��ng B�i/#lingpaizhizao_do(2)",
			"Ta mu�n ch� t�o Ng�n B�i/#lingpaizhizao_do(3)",
			"Ta mu�n ch� t�o Kim B�i/#lingpaizhizao_do(4)",
			"Ta mu�n ch� t�o Ng�c B�i/#lingpaizhizao_do(5)",
			"C�ch ch� t�o l�nh b�i/lingbaizhizao_content",
			"H�y b� /OnCancel"});	
	else
		Say("Ho�t ��ng 'Tri�u H�i M�nh T��ng' di�n ra t� 28-07-2007 ��n 24:00 13-08-2007. Trong th�i gian ho�t ��ng, ng��i ch�i c�p 90 tr� l�n (bao g�m c�p 90) �� n�p th� c� th� tham gia ch� t�o l�nh b�i.",0)
	end
	
end


lingpai_id={1477,1478,1479,1480,1481}
lingpai_success_rate={30,25,50,90,100};
lingpai_pay={5000,10000,20000,30000,1000000};
lingpai_name={"M�c B�i","��ng B�i","Ng�n B�i","Kim B�i","Ng�c B�i"};
function lingpaizhizao_do(lingpai_level)
	if( IsCharged() == 0) then --��ֵ
		Say("Ch� c� ng��i ch�i c�p 90 tr� l�n (bao g�m c�p 90) �� n�p th� m�i c� th� tham gia ch� t�o l�nh b�i.",0);
		return 
	end
	if( GetLevel() <90) then --�ȼ�
		Say("Ng��i h�y c�n nh� l�m, ch�a �� s�c �� tham gia nhi�m v� nguy hi�m n�y. ��t ��n c�p 90 r�i h�y ��n t�m ta!",0);
		return 
	end
	
	if( CalcFreeItemCellCount() < 1) then -- �ռ�
		Say("H�nh trang �� ��y, h�y s�p x�p l�i cho ng�n n�p.",0);
		return 
	end
	
	if( CalcEquiproomItemCount(6,1,lingpai_id[lingpai_level],-1) < 5) then --����
		Say("Nguy�n li�u mang theo kh�ng ��!",0);
		return 
	end
		
	if( Pay(lingpai_pay[lingpai_level]) == 0) then  -- ȥ��Ǯ
			Say("Th�t ��ng ti�c, ng�n l��ng mang theo kh�ng ��!",0);
		return 
	end
	
	for i=1,4 do ConsumeEquiproomItem(1,6,1,lingpai_id[lingpai_level],-1);	end --ȥ��4������
	if(random(1,100)<=lingpai_success_rate[lingpai_level]) then --�ɹ��Ļ�
		ConsumeEquiproomItem(1,6,1,lingpai_id[lingpai_level],-1); --ȥ��һ������
		AddItem(6,1,lingpai_id[lingpai_level]+1,1,0,0);
		Say(format("Ch�c m�ng b�n �� nh�n ���c 1 %s.",lingpai_name[lingpai_level]),0);
		WriteLog(format("[Tri�u h�i m�nh t��ng]\t%s\tAccount:%s\tName:%s\t Ch� t�o %s th�nh c�ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			lingpai_name[lingpai_level]));
	else
		Say("Th�t ��ng ti�c, ch� t�o th�t b�i, hao t�n nguy�n li�u v� ng�n l��ng!",0);
	end
end

function lingbaizhizao_content()
	CreateTaskSay({"<dec><npc><enter>�� ch� t�o M�c B�i c�n c� 5 V� L�m M�t Th� v� 5000 l��ng, n�u ch� t�o th�t b�i s� t�n th�t 4 V� L�m M�t Th� v� 5000 l��ng.<enter><enter>�� ch� t�o ��ng B�i c�n c� 5 M�c B�i v� 1 v�n l��ng, n�u ch� t�o th�t b�i s� m�t 4 M�c B�i v� 1 v�n l��ng.<enter><enter>�� ch� t�o Ng�n B�i c�n c� 5 ��ng B�i v� 2 v�n l��ng, n�u ch� t�o th�t b�i s� m�t 4 ��ng B�i v� 2 v�n l��ng.<enter><enter>�� ch� t�o Kim B�i c�n c� 5 Ng�n B�i v� 3 v�n l��ng, n�u ch� t�o th�t b�i s� m�t 4 Ng�n B�i v� 3 v�n l��ng.<enter><enter>�� ch� t�o Ng�c B�i c�n c� 5 Kim B�i v� 100 v�n l��ng. Ch� t�o Ng�c B�i c� x�c su�t th�nh c�ng l� 100%.",
		"Tr� l�i/main",
		"Bi�t r�i/OnCancel"
		});
end
function OnCancel()
end