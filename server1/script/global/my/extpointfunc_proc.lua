QUESTKEY_TICKET = 488;					-- ��Ʊ����ƷID

function OnExtPointChange_Proc(nExtPointIndex, nChangeValue)
	if (ExtFunTab[nExtPointIndex + 1] == nil) then
		print("Error!!!!!!!!, No ExtPoint Fun On"..nExtPointIndex)
		WriteGoldLog("Importacne Error!!!!!!!!, No ExtPoint CallFun On"..nExtPointIndex..", "..GetAccount().." "..GetName().." nExtPointIndex"..nExtPointIndex.." nChangeValue"..nChangeValue, 0, 0, 0, 0)
		return
	end
	ExtFunTab[nExtPointIndex + 1](nChangeValue)
end

function OnPayYuanBao(nChangeValue)
	nValue = -nChangeValue
	if (nValue == 4) then
	--�ý�Ԫ��
		AddEventItem(343)
		SaveNow(); -- ��������
		WriteGoldLog( GetAccount().."("..GetName()..") MAKE a GOLD with a HIGH CARD", 1, 0, 0, 0 );
		Talk(1,"","Ǯׯ�ϰ壺�������Ľ�Ԫ�������ú�ඣ�")
		Msg2Player( "�����1����Ԫ��.��Ԫ�������ѳɹ���");
	elseif (nValue == 1) then
	--����Ԫ��
		AddEventItem(342)
		SaveNow(); -- ��������
		WriteGoldLog( GetAccount().."("..GetName()..") MAKE a SILVER with a LOW CARD", 0, 1, 0, 0 );
 		Talk(1,"","Ǯׯ�ϰ壺����������Ԫ�������ú�ඣ�")
		Msg2Player( "�����1����Ԫ��.��Ԫ�������ѳɹ���");
 	elseif( nValue > 1) then
			WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO , MUST PAY(4) BUT PAY("..nValue..")!!!!", 0,0,0,0)
			Msg2Player("Ԫ�����������ѱ������������Ա��ϵ��")
	else
			WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO PAYVALUE <= 0", 0,0,0,0)
			Say("Ǯׯ�ϰ壺�Բ��𣬿�������û����С�żĴ�Ԫ����", 0)
	end
end

function OnPayYinPiao(nChangeValue)
--����Ʊ
	nValue = -nChangeValue
	  if (nValue == 1) then
		AddEventItem(QUESTKEY_TICKET)
		SaveNow(); -- ��������
		WriteGoldLog( GetAccount() .. "(" .. GetName() .. ") MAKE a TICKET:"..szItemEnName, 0, 0, 0, 1 );
		Say("Ǯׯ�ϰ壺����������Ʊ�����ú�ඣ�",0)
		Msg2Player( "�����1����Ʊ.��Ʊ�����ѳɹ���");
		elseif (nValue > 1) then
				WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YINPIAO , MUST PAY(1) BUT PAY("..nValue..")!!!!")
				Msg2Player("��Ʊ���������ѱ������������Ա��ϵ��")
		else
				Say("Ǯׯ�ϰ壺�Բ��𣬿�������û����С�żĴ���Ʊ��", 0)
				WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO PAYVALUE <= 0", 0,0,0,0)
	  end
end

function LiguanLog(object)
	WriteLog(date("%H%M%S") .. "���˺ţ�" .. GetAccount() .. "����ɫ��" .. GetName() .. "��" .. object);
end
	
function OnYearGift(nChangeValue)
	nValue = -nChangeValue
			if (nValue == 1) then
				AddStackItem(5, 6, 1, 147, 6, 1, 1, 1)
				AddStackItem(5, 6, 1, 147, 7, 1, 1, 1)
				LiguanLog( "���ڳ�ֵ�꿨���5��6��������ʯ��5��7��������ʯ");
				Say("�����5��6��������ʯ��5��7��������ʯ", 0)
				Msg2Player( "�����5��6��������ʯ��5��7��������ʯ.��ȡ�꿨��������ɹ���");
			elseif (nValue > 1) then
				Msg2Player("�Բ����꿨�����ȡ���������ѱ���������GM��ϵ��")
				WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YEARGIFT , MUST PAY(3,1) BUT PAY(3"..nValue..")!!!!",0,0,0,0)				
			else
				Say("�Բ�����û���꿨���������ȡ���ˣ�������������GM��ϵ��", 0)
				WriteGoldLog(GetAccount().."("..GetName()..") PAY EXPOINT ERROR ON YUANBAO PAYVALUE <= 0", 0,0,0,0)
			end
end		


ExtFunTab=
{nil,
 nil, -- OnPayYuanBao,
 OnPayYinPiao,
 OnYearGift,
 nil,
 nil,
 nil,
 nil
};