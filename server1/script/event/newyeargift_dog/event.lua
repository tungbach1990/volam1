NEWDOGGIFT_BANK = 1

function newdoggift_card()
	if (GetExtPoint(6) >= 1) then
		Say("<#>��٣�Ϊ�ر��������һֱ�����ԡ���������֧�ֺͺ񰮣����˼ѽ�����֮�ʣ��������ϡ����п���ֵ���͹��꼪�����������������2006��1��24�ա�2006��2��14���ڼ䣬ÿ����1��15Ԫ�ĵ㿨�����ؼ�14Ԫ�������ɵ���������ȡ1�����꼪����������", 2, "��Ҫ��ȡ/sure2getNewDog_Card", "���Ժ�����/OnCancel")
	else
		Say("<#>��٣��ܱ�Ǹ������û����ȡ����������ʸ�ร�����<color=yellow>2006��1��24�ա�2006��2��14��<color>�ڼ䣬ÿ����1��15Ԫ�ĵ㿨�����ؼ�14Ԫ�������ɵ���������ȡ1��<color=yellow>���꼪��������<color>����������ٷ���վjx.kingsoft.com��", 0)
	end
end

function sure2getNewDog_Card()
	if (GetExtPoint(6) >= 1) then
		if(GetExtPoint(6) > 32767) then
			Say( "��٣����ݳ��ִ�����������ȡ������Ʒ������GM��ӳ��������ǻ����ƽ���������⡣��л֧�֣�", 0 );
		else
			PayExtPoint(6, 1);
			AddItem(6,1,1057,1,0,0,0)
			LiguanLog("<#>���һ�����꼪��������")
			Msg2Player("<#>�����һ�����꼪��������")
			curextpoint = GetExtPoint(6)
			if (curextpoint >= 1) then
				Say("<#>��٣�����һ��<color=yellow>���꼪��������<color>����ĵ���δ���꣬������<color=red>"..curextpoint.."<color>��Ŷ��", 0 );
			else
				Say("<#>��٣�����һ��<color=yellow>���꼪��������<color>��ף���ڽ�������������Ϸ����Ҫ�˷���Ŷ��", 0)
			end
		end
	else
	end
end