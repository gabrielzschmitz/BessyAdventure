:- dynamic duda_possui/1.
:- dynamic local_duda/1.

duda_possui(nada).
local_duda(patio).

acessivel(patio, lagoa) :- write("Vendo capivaras e água fresca, tudo fica de boa."), nl, write("Você caminhou para a lagoa."), nl.
acessivel(patio, floresta) :- write("Andando com pressa quase se bate a testa."), nl, write("Você adentrou a floresta."), nl.
acessivel(patio, casa) :- write("No ar, o odor da torta, mas não há tempo para isso, vá atrás do que importa."), nl, write("Você andou para a casa que conforta."), nl.
acessivel(patio, galpao) :- write("Sinistras portas chamaram sua atenção."), nl, write("Após força-las abriu o galpão."), nl.
acessivel(patio, galinheiro) :- write("Já chega botando medo nas aves como um arruaceiro!"), nl, write("Você entrou o galinheiro."), nl.
acessivel(lagoa, patio) :- write("Da lagoa você emergiu, e com frio tossiu."), nl, write("Para o pátio você saiu."), nl.
acessivel(floresta, patio) :- write("Com folhas na cabeça você saiu da floresta."), nl, write("Caminhou para o pátio sem fazer festa."), nl.
acessivel(casa, patio) :- write("Para o pátio você vaza."), nl, write("Triste que saiu da casa."), nl.
acessivel(galpao, patio) :- write("As teias tampavam sua visão."), nl, write("Você saiu do galpão."), nl.
acessivel(galinheiro, patio) :- write("Com as galinhas você se divertiu."), nl, write("E do galinheiro você partiu."), nl.

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
    write("Tu ja estão neste local, tente usar mais de seu córtex pré-frontal."), nl.

ir_para(X) :-
    local_duda(Y),
    not(acessivel_sem_escrita(Y,X)),
    (Y==lagoa; Y==casa; Y==floresta; Y==galinheiro),
    (X==lagoa; X==casa; X==floresta; X==galinheiro),
    write("O local não coincidiu. Puta que pariu!"), nl, write("E assim se aferiu: primeiramente vá ao pá-tiu."), nl.

ir_para(X) :-
    local_duda(Y),
    not(acessivel_sem_escrita(Y, X)),
    write("A situação mental se atenua... ela quer ir para a lua."), nl.

pegar(X) :-
    local_duda(Y), Y==galpao,
    X==escopeta,
    assert(duda_possui(X)),
    write("Duda mal consegue conter o peso do cano, menosprezar sua bravura seria, porém, leviano."), nl.

pegar(X) :-
    local_duda(Y), Y\==galpao,
    X==escopeta,
    write("A escopeta não está aqui, não te iludas, a acharás junto a aranhas cabeludas"), nl.

pegar(X) :-
    local_duda(Y), Y==lagoa,
    X==banho,
    assert(duda_possui(X)),
    write("Expulsou a poeira no rio, saiu das águas a mover os pés com frio."), nl.

pegar(X) :-
    local_duda(Y), Y\==lagoa,
    X==banho,
    write("Querendo tomar banho no meio do nada? Esta parecendo uma alienada."), nl.

pegar(X) :-
    local_duda(Y), Y==casa,
    duda_possui(banho),
    X==rede,
    assert(duda_possui(X)),
    write("Agora que pegou a rede vá atrás a Bessy! Ela está perto da árvore que floresce."), nl,
    write("Mas cuidado, no adentrar dessa mata o perigo cresce!"), nl.

pegar(X) :-
    local_duda(Y), Y\==casa,
    X==rede,
    write("A rede aí não está, talvez na casa de Lurdes a encontrará."), nl.

pegar(X) :-
    local_duda(Y), Y==casa,
    duda_possui(W), W\==banho,
    X\==rede,
    write(X), write(" nem existe, desiste."), nl.

pegar(X) :-
    local_duda(Y), Y==casa,
    duda_possui(W), W\==banho,
    X==rede,
    write("Dona Lurdes do jeito que é, não lhe deixa entrar sem lavar o pé."), nl,
    write("Então vá tomar banho na lagoa para tirar o chulé!"), nl.

pegar(X) :-
    local_duda(Y), Y==floresta,
    duda_possui(W), W==rede,
    duda_possui(Z), Z==escopeta,
    X==bessy,
    assert(duda_possui(X)),
    write("Bessy corre perigo, um lobo a espreita sem mostras de amigo. Rapidamente você saca a escopeta, e o lobo sai triste e perneta."), nl,
    write("O estrondo agita a penosa apavorada, a ave corre em círculos avoada. E duda a custo pula e enfim agarra a danada."), nl.

pegar(X) :-
    local_duda(Y), Y==floresta,
    duda_possui(W), W==rede,
    duda_possui(Z), Z\==escopeta,
    X==bessy,
    assert(duda_possui(morte)),
    write("Bessy corre perigo, um lobo a espreita sem mostras de amigo. Você, indefesa e sem arma eficaz, não pode deter o lobo voraz."), nl,
    write("Duda em choque vê sumir seus cacarejos, aflita deu a volta frustados o seus ensejos."), nl, nl.

pegar(X) :-
    local_duda(Y), (Y==floresta, Y\==floresta),
    duda_possui(rede),
    X==bessy,
    write("Bessy nem está aqui. Tente onde na sua cabeça possa cair caquí."), nl.

pegar(X) :-
    local_duda(Y), Y==floresta,
    X==bessy,
    write("Bessy está aqui, você não está caduca. Mas como irá captura-la sem uma arapuca?"), nl.

pegar(X) :-
    local_duda(Y), Y\==floresta,
    X==bessy,
    write("Bessy não está nessa área. Talvez num lugar cheio de araucária."), nl.

pegar(X) :-
    write(X), write(" nem existe, desiste."), nl.

finalizado :-
    local_duda(X), X==galinheiro,
    duda_possui(bessy),
    write("Parabéns! Bessy você resgatou, a fera você domou. E o respeito de dona Lurdes recuperou!"), nl.

finalizado :-
    local_duda(X), X==floresta,
    duda_possui(morte),
    write("Oh não, você falhou! Bessy não resgatou, dona Lurdes decepcionou e muito triste ficou."), nl.

rodar :- finalizado.

rodar :- read(X), call(X), rodar.
