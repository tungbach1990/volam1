--����������
--��ɳ����
--ʹ�ú���300w����
--���ɻ��1��
--�� 80�������� �� ��ֵ���ʹ��

Include("\\script\\event\\jxanniversary3\\head.lua");

function main(nItemIndex)
	str=
	{	"<#>�n m�t tr�i ��o v�n th�, c� th� nh�n ���c <color=red>"..tostring(JXANNIVERSARY3_ONCEEXP).."<color> �i�m kinh nghi�m, �i�m kinh nghi�m t�i �a ��t ���c l� <color=red>"..tostring(JXANNIVERSARY3_MAXOWNEXP).."<color>.",
		"<#>S� d�ng ��o v�n th�/#_UseDoushaShoutao("..nItemIndex..")",
		"<#> �� ta suy ngh� l�i!/OnCancel",
	};
	Say(str[1], 2, str[2], str[3]);
	return 1;
end

function _UseDoushaShoutao(nItemIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 
	end;
	
	if (GetTask(TASKID_DOUSHASHOUTAO_EXP) >= JXANNIVERSARY3_MAXOWNEXP) then 
		Msg2Player("B�n �� �n qu� nhi�u ��o v�n th�, kh�ng th� ti�p t�c �n �� t�ng kinh nghi�m.");
		return
	end 
	
	if (RemoveItemByIndex(nItemIndex) == 1 ) then
		local nAddExp = 0;
		if ( (GetTask(TASKID_DOUSHASHOUTAO_EXP) + JXANNIVERSARY3_ONCEEXP) > JXANNIVERSARY3_MAXOWNEXP) then
			nAddExp = JXANNIVERSARY3_MAXOWNEXP - GetTask(TASKID_DOUSHASHOUTAO_EXP);
		else
			nAddExp = JXANNIVERSARY3_ONCEEXP;
		end
		
		--���Ӿ���
		SetTask(TASKID_DOUSHASHOUTAO_EXP, GetTask(TASKID_DOUSHASHOUTAO_EXP) + nAddExp);
		AddOwnExp(nAddExp);
		Msg2Player("�n m�t tr�i ��o v�n th�, nh�n ���c "..JXANNIVERSARY3_ONCEEXP.."kinh nghi�m ");
	else
		Msg2Player("Kh�ng c� ��o v�n th� n�o!");
	end
end

function OnCancel()
	return 0;
end

