function main()
	Say("Qu�n nhu quan th� th�nh: Ch� ta c� nhi�u lo�i d��c ph�m qu�, nh�ng v�t ph�m s� d�ng chi�n tr��ng. Ng��i c� th� s� d�ng <color=yellow>�i�m th��ng T�ng Kim<color> ��n ch� ta mua <color=yellow>v�t ph�m T�ng Kim<color>, nh�ng <color=red>Binh s� hi�u gi�c v� b� c�u<color> ch� ���c s� d�ng trong Chi�n tr��ng T�ng Kim, mu�n mua th� g�?", 3, "Mua d��c ph�m/salemedicine", "Mua V�t ph�m T�ng Kim/sj_shop_sell", "H�y b� /OnCancel")
end

function salemedicine()
	Sale(131, 1)
end

function sj_shop_sell()
	Sale(98, 4);			
end;

function OnCancel()
end
