--����������
--��������
--ʹ�ú���8Сʱ��־���˫�����������ɲ�¶����
--�� 80�������� �� ��ֵ���ʹ��

Include("\\script\\event\\jxanniversary3\\head.lua");

function main(nItemIndex)
	str=
	{	"<#>S� d�ng ��o v�n th�, nh�n ���c <color=red>8<color> gi� nh�n ��i kinh nghi�m, nh�ng kh�ng th� c�ng s� d�ng v�i Ti�n Th�o L�.",
		"<#>S� d�ng ��o v�n th�/#_UseZaoNiShoutao("..nItemIndex..")",
		"<#> �� ta suy ngh� l�i!/OnCancel",
	};
	Say(str[1], 2, str[2], str[3]);
	return 1;
end

function _UseZaoNiShoutao(nItemIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 
	end;
	
	if RemoveItemByIndex(nItemIndex) == 1 then
		AddSkillState(440, 1, 1, 64800 * 8);
		Msg2Player("S� d�ng ��o v�n th�, c� th� nh�n ��i kinh nghi�m trong 8 gi�.")
	end;
end;

function OnCancel()
end;