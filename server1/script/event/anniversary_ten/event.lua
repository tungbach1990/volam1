-- ��ɽ��ʮ���� �رջʱ��ֵΪnil
--50����������ҿ�������ٴ���ȡһ�ξ��飨50W��
--By FireFox 2005.06.16
ANNIVERSARY_TEN = nil -- �رմ˹���
TaskID_Anniversary = 1506

function ANNIVERSARY_AwardExp()
	Say( "��٣�ֵ����ɽ��10�����֮�ʣ��ؿ���50���������50������ͻ����2005��06��18����2005��06��20���ڼ䣬50��������ң�����50������������������ȡ���͵�50���顣ע�⣬ÿλ���ֻ����ȡ<color=red>һ��<color>���顣�������ھ���ȡô��", 2, "��Ҫ��ȡ��лл��/want_takeanniversary", "������һ������/OnCancel" )
end

function want_takeanniversary()
	if( GetTask( TaskID_Anniversary ) == 1 ) then
		Say( "��٣����Ѿ��μӹ���50������ͻ��ÿһλ���ֻ�ܲμ�һ�Σ��������ע�������������ϻ��", 0 )
		return
	end
	
	if( GetLevel() < 50 ) then
		Say( "��٣�����ɽ��ʮ���꾭�����ͻ����50��������Ҳμӣ���ļ��𲻹����������ע�������������ϻ��", 0 )
		return
	end
	Say( "��٣��������������һ��ֻ�в���50W����Ĳ��,�쵽��50����ֻ������һ��,Ȼ������㡣��ȷ��Ҫ������ȡô��" , 2, "û���⣬��׼������/sure_takeexp", "���������Ե�һ��/OnCancel")
end

function sure_takeexp()
	if( GetTask( TaskID_Anniversary ) == 1 ) then
		Say( "��٣����Ѿ��μӹ���50������ͻ��ÿһλ���ֻ�ܲμ�һ�Σ��������ע�������������ϻ��", 0 )
		return
	end
	
	if( GetLevel() < 50 ) then
		Say( "��٣�����ɽ��ʮ���꾭�����ͻ����50��������Ҳμӣ���ļ��𲻹����������ע�������������ϻ��", 0 )
		return
	end

	SetTask( TaskID_Anniversary, 1 )
	AddOwnExp(500000)
	Say( "��٣�лл���������ɽ��ʮ����50������ͻ��50�����Ѿ������ˣ��������ע�������������", 0 )
end

function OnCancel()
end