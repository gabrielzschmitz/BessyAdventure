:- dynamic duda_possui/1.
:- dynamic local_duda/1.

duda_possui(nada).
local_duda(patio).

acessivel(patio, lagoa) :- write("Vendo capivaras e �gua fresca, tudo fica de boa."), nl, write("Voc� caminhou para a lagoa."), nl.
acessivel(patio, floresta) :- write("Andando com pressa quase se bate a testa."), nl, write("Voc� adentrou a floresta."), nl.
acessivel(patio, casa) :- write("No ar, o odor da torta, mas n�o h� tempo para isso, v� atr�s do que importa."), nl, write("Voc� andou para a casa que conforta."), nl.
acessivel(patio, galpao) :- write("Sinistras portas chamaram sua aten��o."), nl, write("Ap�s for�a-las abriu o galp�o."), nl.
acessivel(patio, galinheiro) :- write("J� chega botando medo nas aves como um arruaceiro!"), nl, write("Voc� entrou o galinheiro."), nl.
acessivel(lagoa, patio) :- write("Da lagoa voc� emergiu, e com frio tossiu."), nl, write("Para o p�tio voc� saiu."), nl.
acessivel(floresta, patio) :- write("Com folhas na cabe�a voc� saiu da floresta."), nl, write("Caminhou para o p�tio sem fazer festa."), nl.
acessivel(casa, patio) :- write("Para o p�tio voc� vaza."), nl, write("Triste que saiu da casa."), nl.
acessivel(galpao, patio) :- write("As teias tampavam sua vis�o."), nl, write("Voc� saiu do galp�o."), nl.
acessivel(galinheiro, patio) :- write("Com as galinhas voc� se divertiu."), nl, write("E do galinheiro voc� partiu."), nl.

acessivel_sem_escrita(patio, lagoa) :- write("").
acessivel_sem_escrita(patio, floresta) :- write("").
acessivel_sem_escrita(patio, casa) :- write("").
acessivel_sem_escrita(patio, galpao) :- write("").
acessivel_sem_escrita(patio, galinheiro) :- write("").
acessivel_sem_escrita(lagoa, patio) :- write("").
acessivel_sem_escrita(floresta, patio) :- write("").
acessivel_sem_escrita(casa, patio) :- write("").
acessivel_sem_escrita(galpao, patio) :- write("").
acessivel_sem_escrita(galinheiro, patio) :- write("").

ir_para(X) :-
    local_duda(Y),
    X==galinheiro,
    duda_possui(W), W==bessy,
    acessivel_sem_escrita(Y, X),
    retract(local_duda(Y)), assert(local_duda(X)).

ir_para(X) :-
    local_duda(Y),
    duda_possui(W), W\==bessy,
    acessivel(Y, X),
    retract(local_duda(Y)), assert(local_duda(X)).

ir_para(X) :-
    local_duda(Y),
    Y==X,
    write("Tu ja est�o neste local, tente usar mais de seu c�rtex pr�-frontal."), nl.

ir_para(X) :-
    local_duda(Y),
    not(acessivel_sem_escrita(Y,X)),
    (Y==lagoa; Y==casa; Y==floresta; Y==galinheiro),
    (X==lagoa; X==casa; X==floresta; X==galinheiro),
    write("O local n�o coincidiu. Puta que pariu!"), nl, write("E assim se aferiu: primeiramente v� ao p�-tiu."), nl.

ir_para(X) :-
    local_duda(Y),
    not(acessivel_sem_escrita(Y, X)),
    write("A situa��o mental se atenua... ela quer ir para a lua."), nl.

pegar(X) :-
    local_duda(Y), Y==galpao,
    X==escopeta,
    assert(duda_possui(X)),
    write("Duda mal consegue conter o peso do cano, menosprezar sua bravura seria, por�m, leviano."), nl.

pegar(X) :-
    local_duda(Y), Y\==galpao,
    X==escopeta,
    write("A escopeta n�o est� aqui, n�o te iludas, a achar�s junto a aranhas cabeludas"), nl.

pegar(X) :-
    local_duda(Y), Y==lagoa,
    X==banho,
    assert(duda_possui(X)),
    write("Expulsou a poeira no rio, saiu das �guas a mover os p�s com frio."), nl.

pegar(X) :-
    local_duda(Y), Y\==lagoa,
    X==banho,
    write("Querendo tomar banho no meio do nada? Esta parecendo uma alienada."), nl.

pegar(X) :-
    local_duda(Y), Y==casa,
    duda_possui(banho),
    X==rede,
    assert(duda_possui(X)),
    write("Agora que pegou a rede v� atr�s a Bessy! Ela est� perto da �rvore que floresce."), nl,
    write("Mas cuidado, no adentrar dessa mata o perigo cresce!"), nl.

pegar(X) :-
    local_duda(Y), Y\==casa,
    X==rede,
    write("A rede a� n�o est�, talvez na casa de Lurdes a encontrar�."), nl.

pegar(X) :-
    local_duda(Y), Y==casa,
    duda_possui(W), W\==banho,
    X\==rede,
    write(X), write(" nem existe, desiste."), nl.

pegar(X) :-
    local_duda(Y), Y==casa,
    duda_possui(W), W\==banho,
    X==rede,
    write("Dona Lurdes do jeito que �, n�o lhe deixa entrar sem lavar o p�."), nl,
    write("Ent�o v� tomar banho na lagoa para tirar o chul�!"), nl.

pegar(X) :-
    local_duda(Y), Y==floresta,
    duda_possui(W), W==rede,
    duda_possui(Z), Z==escopeta,
    X==bessy,
    assert(duda_possui(X)),
    write("Bessy corre perigo, um lobo a espreita sem mostras de amigo. Rapidamente voc� saca a escopeta, e o lobo sai triste e perneta."), nl,
    write("O estrondo agita a penosa apavorada, a ave corre em c�rculos avoada. E duda a custo pula e enfim agarra a danada."), nl.

pegar(X) :-
    local_duda(Y), Y==floresta,
    duda_possui(W), W==rede,
    duda_possui(Z), Z\==escopeta,
    X==bessy,
    assert(duda_possui(morte)),
    write("Bessy corre perigo, um lobo a espreita sem mostras de amigo. Voc�, indefesa e sem arma eficaz, n�o pode deter o lobo voraz."), nl,
    write("Duda em choque v� sumir seus cacarejos, aflita deu a volta frustados o seus ensejos."), nl, nl.

pegar(X) :-
    local_duda(Y), (Y==floresta, Y\==floresta),
    duda_possui(rede),
    X==bessy,
    write("Bessy nem est� aqui. Tente onde na sua cabe�a possa cair caqu�."), nl.

pegar(X) :-
    local_duda(Y), Y==floresta,
    X==bessy,
    write("Bessy est� aqui, voc� n�o est� caduca. Mas como ir� captura-la sem uma arapuca?"), nl.

pegar(X) :-
    local_duda(Y), Y\==floresta,
    X==bessy,
    write("Bessy n�o est� nessa �rea. Talvez num lugar cheio de arauc�ria."), nl.

pegar(X) :-
    write(X), write(" nem existe, desiste."), nl.

finalizado :-
    local_duda(X), X==galinheiro,
    duda_possui(bessy),
    write("Parab�ns! Bessy voc� resgatou, a fera voc� domou. E o respeito de dona Lurdes recuperou!"), nl.

finalizado :-
    local_duda(X), X==floresta,
    duda_possui(morte),
    write("Oh n�o, voc� falhou! Bessy n�o resgatou, dona Lurdes decepcionou e muito triste ficou."), nl.

rodar :- finalizado.

rodar :- read(X), call(X), rodar.
