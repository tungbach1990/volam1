function main()
	Say("<#>T�ng qu�n khu v�c chi�n ��u: �� n�i b� bang h�i v� c�c bang h�i t� th� v� ngh� v�i nhau, ta c� th� gi�p m�i ng��i thay ��i phe ph�i, nh�ng khi ra kh�i khu chi�n ��u th� s� kh�i ph�c l�i nh� c�, ng��i mu�n t�m th�i ��i phe ph�i kh�ng." ,5, "Phe Ch�nh/camp1", "Phe T� ph�i/camp2", "Phe Trung l�p/camp3", "Kh�i ph�c l�i phe ph�i ban ��u/retorecamp", "Ta v�n ch�a mu�n ��i./cancel");
end

function camp1()
	SetCurCamp(1);
	Msg2Player("T�m th�i ��i sang ch�nh ph�i.");
end

function camp2()
	SetCurCamp(2);
	Msg2Player("T�m th�i ��i sang t� ph�i.");
end

function camp3()
	SetCurCamp(3);
	Msg2Player("T�m th�i ��i sang trung l�p.");
end

function retorecamp()
	SetCurCamp(GetCamp())
end

function cancel()
end

