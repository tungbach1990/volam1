--���ϱ��� ����� ˵������������

function main(sel)

Say("L�u l�c giang h� c� n�a ��i, cu�i c�ng ch� l� m�t k� b�n h�n m� th�i!", 2, "Nghe m�t �o�n s�ch /yes", "Kh�ng nghe /no");

end;


function yes()
	i=random(0,2);
	if(i == 0)then
		PlayMusic("\\Music\\Music901.mp3")
	elseif(i == 1)then
		PlayMusic("\\Music\\Music902.mp3")
	else
		PlayMusic("\\Music\\Music903.mp3")
	end;
end;


function no()
end;
