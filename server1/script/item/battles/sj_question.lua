IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add462()
		level = random(2,10);
		AddSkillState(462, level, 0, 12 )	--�������Ѫ��
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> h�i ph�c sinh l�c trong n�a gi�y"..(level*500).."<#> �i�m")	
end


function add463()
		level = random(2,10);
		AddSkillState(463, level, 0, 12 )	--�����������
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> h�i ph�c n�i l�c trong n�a gi�y"..(level*500).."<#> �i�m")	
end

function add464()
		level = random(1,10);
		AddSkillState(464, level, 0, 540 )	--�������Ѫ�������ָ�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 30 gi�y h�i ph�c sinh l�c, h�i ph�c m�i n�a gi�y"..(level*100).."<#> �i�m")	
end

function add465()
		level = random(1,10);
		AddSkillState(465, level, 0, 540 )	--����������������ظ�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 30 gi�y h�i ph�c n�i l�c, h�i ph�c m�i n�a gi�y"..(level*100).."<#> �i�m")	
end

function add466()
		level = random(1,4);
		AddSkillState(466, level, 0, 1080 )
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 1 ph�t gi�m th� th��ng"..(level*10).."<#> %")	
end

function add467()
		level = random(1,4);
		AddSkillState(467, level, 0, 1080 )	--��һ���ж�ʱ�����
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 1 ph�t gi�m th�i gian tr�ng ��c:"..(level*10).."<#> %")	
end

function add468()
		level = random(1,4);
		AddSkillState(468, level, 0, 1080 )
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 1 ph�t gi�m th�i gian l�m ch�m:"..(level*10).."<#> %")	
end

function add469()
		level = random(1,4);
		AddSkillState(469, level, 0, 1080 )	--��һ��ѣ��ʱ�����
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 1 ph�t gi�m th�i gian b� cho�ng:"..(level*10).."<#> %")	
end

function add471()
		level = random(2,10);
		AddSkillState(471, level, 0, 12 )	--�������Ѫ��������
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> h�i ph�c sinh l�c trong n�a gi�y"..(level*500).."<#> �i�m v� h�i ph�c n�i l�c trong n�a gi�y"..(level*500).."<#> �i�m")	
end

function add472()
		level = random(1,10);
		AddSkillState(472, level, 0, 540 )	--�������Ѫ�������������ָ�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 30 gi�y h�i ph�c sinh l�c, h�i ph�c m�i n�a gi�y"..(level*100).."<#> �i�m v� 30 gi�y h�i ph�c n�i l�c, h�i ph�c m�i n�a gi�y"..(level*100).."<#> �i�m")	
end

function add473()
		level = random(1,7);
		AddSkillState(473, level, 0, 1080 )	--��������շ�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> t�ng ph�ng ph� trong 1 ph�t"..(level*10).."<#> %")	
end

function add474()
		level = random(1,7);
		AddSkillState(474, level, 0, 1080 )	--������Ҷ���
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> t�ng ph�ng ��c trong 1 ph�t"..(level*10).."<#> %")	
end

function add475()
		level = random(1,7);
		AddSkillState(475, level, 0, 1080 )	--������ұ���
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> t�ng ph�ng b�ng trong 1 ph�t"..(level*10).."<#> %")	
end

function add476()
		level = random(1,7);
		AddSkillState(476, level, 0, 1080 )	--������һ��
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> t�ng ph�ng h�a trong 1 ph�t"..(level*10).."<#> %")	
end

function add477()
		level = random(1,7);
		AddSkillState(477, level, 0, 1080 )	--��������׷�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> t�ng ph�ng l�i trong 1 ph�t"..(level*10).."<#> %")	
end

function add478()
		level = random(1,4);
		AddSkillState(478, level, 0, 1080 )	--�������ȫ��
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> t�ng kh�ng t�nh trong 1 ph�t"..(level*10).."<#> %")	
end

function add479()
		level = random(10,20);
		AddSkillState(479, level, 0, 1080 )	--������������˺�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> s�t th��ng v�t l� n�i c�ng trong 1 ph�t t�ng:"..(level*10).."<#> �i�m")	
end

function add480()
		level = random(1,5);
		AddSkillState(480, level, 0, 1080 )	--��������ڶ��˺�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> ��c s�t n�i c�ng trong 1 ph�t t�ng:"..(level*10).."<#> �i�m")	
end

function add481()
		level = random(10,20);
		AddSkillState(481, level, 0, 1080 )	--��������ڱ��˺�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> B�ng s�t n�i c�ng trong 1 ph�t t�ng:"..(level*10).."<#> �i�m")	
end

function add482()
		level = random(10,20);
		AddSkillState(482, level, 0, 1080 )	--��������ڻ��˺�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> Ho� s�t n�i c�ng trong 1 ph�t t�ng:"..(level*10).."<#> �i�m")	
end

function add483()
		level = random(10,20);
		AddSkillState(483, level, 0, 1080 )	--������������˺�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> L�i s�t n�i c�ng trong 1 ph�t t�ng:"..(level*10).."<#> �i�m")	
end

function add485()
		level = random(1,5);
		AddSkillState(485, level, 0, 1080 )	--��������ⶾ�˺�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> ��c s�t ngo�i c�ng trong 1 ph�t t�ng:"..(level*10).."<#> �i�m")	
end

function add486()
		level = random(1,4);
		AddSkillState(486, level, 0, 1080 )	--�����������˺�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> B�ng s�t ngo�i c�ng trong 1 ph�t t�ng:"..(level*10).."<#> �i�m")	
end

function add487()
		level = random(5,10);
		AddSkillState(487, level, 0, 1080 )	--������������˺��ٷֱ�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> s�t th��ng v�t l� ngo�i c�ng trong 1 ph�t t�ng "..(level*10).."<#> %")	
end

function add488()
		level = random(10,20);
		AddSkillState(488, level, 0, 1080 )	--�������Ѫ������
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7>m�c sinh l�c trong 1 ph�t t�ng:"..(level*100).."<#> �i�m")	
end

function add489()
		level = random(10,20);
		AddSkillState(489, level, 0, 1080 )	--���������������
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7>m�c n�i l�c trong 1 ph�t t�ng:"..(level*100).."<#> �i�m")	
end

function add490()
		level = random(10,20);
		AddSkillState(490, level, 0, 540 )	--�������Ѫ������������
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 30 gi�y m�c n�i l�c t�ng::"..(level*100).."<#> �i�m v� trong 30 gi�y m�c n�i l�c t�ng:"..(level*100).."<#> �i�m")	
end

function add493()
		level = random(1,3);
		AddSkillState(493, level, 0, 1080 )	--��һ����������
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> t�ng t�c �� di chuy�n trong 1 ph�t"..(level*10).."<#> %")	
end

function add495()
		level = random(10,20);
		AddSkillState(495, level, 0, 1080 )	--��һ����������
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> t�ng s�c m�nh t�n c�ng trong 1 ph�t"..(level*10).."<#> %")	
end

function add496()
		level = random(1,2);
		AddSkillState(496, level, 0, 1080 )	--��һ����������
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> t�ng ��ng t�c xu�t chi�u trong 1 ph�t"..(level*10).."<#> %")	
end

Tab={add462,add463,add464,add465,add466,add467,add468,add469,add471,add472,add473,add474,add475,add476,add477,add478,add479,add480,add481,add482,add483,add485,add486,add487,add488,add489,add490,add493,add495,add496}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		BT_SetData(PL_GETITEM, BT_GetData(PL_GETITEM) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		checkbattlerule(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		BT_SortLadder();
		BT_BroadSelf();
		return 0;	-- ɾ����Ʒ
	end
end

