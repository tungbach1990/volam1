-- �����衢�ڶ��衢�ڱ��衢�ڻ��衢�ڵ��蹲�к���
-- ����������ظ��ԣ�֮ǰ�Թ�����Ĺ�Ч����ʧ��ֻ�������Ե���Ĺ�Ч
-- Fanghao_Wu 2004.9.13

aryWan = {	{"<#> N�i Ph� ho�n", 453},
			{"<#> N�i ��c ho�n", 454},
			{"<#> N�i B�ng ho�n", 455},
			{"<#> N�i H�a ho�n", 456},
			{"<#> N�i �i�n ho�n", 457} };
			
function EatNei_Wan( eatIndex, level, statetype, time )
	local nCount = getn( aryWan );
	for i = 1, nCount do
		if( i ~= eatIndex ) then
			local nLeftTime = AddSkillState( aryWan[i][2], 1, 1, 0 );
			if( nLeftTime > 0 ) then
				Msg2Player( aryWan[i][1].."<#> H�t c�ng hi�u" );
			end
		end
	end
	AddSkillState( aryWan[eatIndex][2], level, statetype, time );
	Msg2Player( "<#> B�n �� s� d�ng"..aryWan[eatIndex][1] );
end