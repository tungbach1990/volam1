--��ԭ���� ����to�ν�ս��
--Trap ID����ԭ���� 49
Include("\\script\\battles\\battlehead.lua")
function main(sel)
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "Chi�n tr��ng T�ng Kim gian kh� kh�c li�t, ng��i ch�a ��t ��n c�p 40 h�y v� luy�n th�m r�i h�y t�nh." );
	elseif ( GetLevel() >= 40 and GetLevel() < 80 ) then
		NewWorld( 323, 1541, 3178);
		SetFightState(0);
		Msg2Player( "��n n�i b�o danh Chi�n Tr��ng T�ng Kim S� C�p" );
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		NewWorld( 324, 1541, 3178);
		SetFightState(0);
		Msg2Player( "��n n�i b�o danh Chi�n Tr��ng T�ng Kim Trung C�p" );
	else
		NewWorld( 325, 1541, 3178);
		SetFightState(0);
		Msg2Player( "��n n�i b�o danh Chi�n Tr��ng T�ng Kim Cao C�p" );
	end
end;