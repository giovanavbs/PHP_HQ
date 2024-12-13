CREATE DATABASE db_spcomic;
USE db_spcomic;

create table tb_edicao(	
    cod_ed int primary key auto_increment,
    desc_ed varchar(50) not null    
);

-- troquei a categoria por edição para especificar as sagas dos quadrinhos(amazing, superior, etc), já que a maioria das HQs tem as mesmas categorias --
create table tb_autor(	
    cod_autor int primary key auto_increment,
    nome_autor varchar(45) not null    
);

create table tb_hq(	
    cod_hq int primary key auto_increment,
    num_isbn varchar(17) not null,
    cod_ed int not null,
    nome_hq varchar(70) not null,
    cod_autor int not null,
    num_pag varchar(4) not null,
    preco decimal(6,2) not null,
    qtd int not null,
    desc_hq text not null,
    desc_capa varchar(255) not null,
    sg_lancamento enum('S','N') not null,
    constraint fk_ed foreign key(cod_ed) references tb_edicao(cod_ed),
    constraint fk_autor foreign key(cod_autor) references tb_autor(cod_autor)
);

insert into tb_edicao
values(default,'Amazing Spider-Man'),
(default, 'The Spectacular Spider-Man'),
(default, 'Web of Spider-Man'),
(default, 'Sensational Spider-Man'),
(default, 'Peter Parker: Spider-Man'),
(default, 'Friendly Neighborhood Spider-Man'),
(default,'Ultimate Spider-Man'),
(default,'Best of Spider-Man'),
(default,'Symbiote Spider-Man');

insert into tb_edicao
values(default,'Ben Reilly: Spider-Man');

insert into tb_edicao
values(default,'Essential Spider-Man');

insert into tb_edicao
values(default,'Miles Morales: Spider-Man');

insert into tb_edicao
values(default,'Spider-Man: Spider-Verse');

insert into tb_edicao
values(default,'Superior Spider-Man');

insert into tb_edicao
values(default,'Avenging Spider-Man');

insert into tb_autor
values(default,'Stan Lee'),		-- codigo 1
(default, 'Gerry Conway'),					-- codigo 2	
(default, 'Peter David'),					-- codigo 3
(default, 'Roger Stern'),				-- codigo 4
(default, 'Tom DeFalco'),				-- codigo 5
(default, 'David Michelinie'),				-- codigo 6
(default, 'J.M. DeMatteis'),					-- codigo 7
(default, 'Brian Michael Bendis'),			-- codigo 8
(default, 'Jim Shooter'),					-- codigo 9
(default, 'Jeph Loeb');

insert into tb_autor
values(default,'Marvel Comics');

insert into tb_autor
values(default,'Jason Reynolds');

insert into tb_autor
values(default,'Christos Gage');

insert into tb_autor
values(default,'Dan Slott');

SELECT cod_autor, nome_autor
FROM tb_autor;

SELECT cod_ed, desc_ed
FROM tb_edicao;

SELECT *
FROM tb_hq;

insert into tb_hq
values
(Default,'978-3836582339','1','SpiderMan meets the Fantastic Four as the Chameleon Strikes!','11','697','500.32','5',

'<p>Este sonho de colecionador em tamanho XXL, próximo ao tamanho das obras de arte originais, apresenta as primeiras 21 histórias do lançador de teias 
favorito do mundo de 1962 a 1964. Em vez de recolorir a arte original (como foi feito nas reimpressões de quadrinhos clássicos das décadas anteriores), 
a TASCHEN tentou criar uma representação ideal desses livros como foram produzidos no momento da publicação. Os quadrinhos de pedigree mais primitivos 
foram abertos e fotografados para reprodução em estreita colaboração com a Marvel e a Certified Guaranty Company. </p>
 <p>Cada página foi fotografada como impressa há mais de meio século, depois remasterizada digitalmente usando técnicas modernas de retoque para corrigir 
 problemas com a impressão barata e imperfeita da época - como se tivesse saído de uma impressora de classe mundial dos anos 1960. Três estoques de papel diferentes,
Com um ensaio histórico aprofundado do editor da Marvel, Ralph Macchio, uma introdução do supercolecionador David Mandel e arte original, fotografias raras e outras 
joias, essas 698 páginas de maravilhas que rastejam pelas paredes farão o senso de aranha de qualquer um formigar com antecipação.</p>', 'tasm4fantastic','N'),
 
 

 (Default,'978-8583683520','2','Aquele menino Thompson!','7','130','42.61','40',
'<p>Interrompendo o enredo atual do Homem-Aranha, Stan Lee rasga a página para relembrar os bons velhos tempos nos anos sessenta. Embora esses dias tenham passado há 
muito tempo, ele diz ao leitor que hoje será como ontem novamente, pois ele quer contar uma história sobre Peter Parker antes de se tornar o Homem-Aranha.</p>', 'ssmthompson','N'),
 

(Default,'978-1302923068','3','Spider-Man e Tony Stark','12','199','59.39','100',
'<p>Coletando WEB OF SPIDER-MAN (2021) #1-5.</p>
<p>Peter Parker. Homem Aranha. Cientista. Encrenqueiro? Graças a ninguém menos que Tony Stark, uma nova estação de pesquisa científica para os heróis adolescentes do Universo Marvel 
acaba de ser concluída - e o Homem-Aranha acaba de receber um convite para participar! </p>
 <p>Trabalhando ao lado de alguns de seus rostos favoritos do MU, inventando e estudando um monte de novos gadgets incríveis e com o Homem de Ferro de olho na Brigada Mundial de 
 Engenharia, com certeza tudo vai dar certo, certo? De qualquer forma, graças a seus novos amigos, o Homem-Aranha está prestes a assumir seu grande poder e grande responsabilidade 
 em todo o mundo. Infelizmente, onde o wallcrawler vai, o caos geralmente segue! E o Spidey e a WEB estão prestes a se deparar com um grande, verde e raivoso exemplo de caos 
 personificado!</p>', 'websm','N'),
 
 
 (Default,'978-85-66250-33-6','4','Entre Névoas e Espelhos','13','23','28.00','80',
'<p>É Homem-Aranha vs. Mysterio, Round 2 - no meio de uma nevasca extremamente fria em Nova York!</p>
 <p>Sem seu sentido aranha que está sendo bloqueado desde que entrou em um predio, nosso rastejador de paredes favorito tem dificuldades e precisa criar soluções cirativas 
 para não ser derrotado e garantir a segurança de Nova York.</p>','ssmnevasca','N');
 
 -------------------------------
 
 SELECT cod_autor, nome_autor
FROM tb_autor;

SELECT cod_ed, desc_ed
FROM tb_edicao;



SELECT *
FROM tb_hq;

delete from tb_hq where cod_hq = 21;


 insert into tb_hq
values
(Default,'978-0785107774','5','Um Dia Na Vida','14','160','46.90','150',
'<p>Reexaminando sua vida e papel como um combatente do crime fantasiado, Peter Parker enfrenta uma grande perda pessoal, explora sua 
amizade com o Tocha Humana e enfrenta um Sandman em deterioração.</p>', 'ppsm','N'),
 
 

 (Default,'978-1302916909','6','Segredos e Rumores','1','144','85.85','80',
'<p>O Homem-Aranha é o pior vizinho de TODOS! Sempre há vilões malucos, danos materiais e drama e... e ele PEGA os vilões. E ele tenta consertar o dano e ajuda a 
carregar suas compras e, na verdade, esse dano à propriedade mantém os aluguéis baixos. Você sabe o que? O Homem-Aranha é o melhor vizinho de todos os tempos e este 
livro lhe dará uma visão mais detalhada da vizinhança do Homem-Aranha (e de Peter Parker) do que qualquer outro livro. </p>
<p>Além disso, não seria uma aventura do Homem-Aranha sem uma ameaça que poderia destruir não só o Homem-Aranha, mas todos os seus vizinhos. O escritor superstar TOM TAYLOR 
(X-MEN RED, ALL-NEW WOLVERINE, Injustice ) e a estrela da arte em ascensão JUANN CABAL (TOTALMENTE NOVO WOLVERINE, X-23) oferecem a você o Homem-Aranha mais local de todos os 
tempos!</p>', 'fnsm','N'),
 

(Default,'978-1302931872','7','Omnibus Origem Homem-Aranha: Primeiros vilões','11','1000','432.02','3',
'<p>Coleta ULTIMATE SPIDER-MAN (2000) #1-39</p>
<p>No ano 2000, a Marvel lançou o Ultimate Universe, reinventando o Homem-Aranha e seus mitos para um novo milênio! Agora, os primeiros três anos da versão premiada e favorita dos 
fãs de Brian Michael Bendis e Mark Bagley sobre o lançador de teias são reunidos em um volume enorme! Reviva os primeiros dias de Peter Parker como Homem-Aranha, aprendendo a lutar 
contra o crime por tentativa e erro enquanto luta para equilibrar sua nova vida com as exigências do ensino médio: puberdade, lição de casa e namoro!</p>
 <p>Mesmo com a ajuda de sua melhor amiga Mary Jane Watson, Peter tem uma carga pesada para carregar. Mas o neófito Homem-Aranha está fazendo inimigos a torto e a direito - incluindo 
 o Duende Verde, o Rei do Crime, Doutor Octopus, Kraven, o Caçador e o maníaco Venom - e, a menos que ele esteja à altura da ocasião, Spidey pode não sobreviver até o baile!</p>', 
 'usm','N'),
 
 (Default,'978-0785109006','8','Derretimento','11','336','650.00','80',
'<p>Peter Parker, também conhecido como Homem-Aranha, luta para lidar com os danos causados ​​à sua amada cidade em 11 de setembro de 2001; escapa da captura; lida com Rhino; e se encontra no 
meio de um confronto entre o Demolidor e o Justiceiro.</p>
<p>Essa é a questão. Esta é a pergunta de cinco milhões de dólares. Estou prestes a puxar sua corrente como ninguém jamais fez antes, e ninguém nunca fará novamente. Então ouça com 
atenção. A radiação permitiu que a aranha lhe desse esses poderes? Ou a aranha estava tentando lhe dar esses poderes antes que a radiação a matasse? Qual veio primeiro? A radiação? Ou 
o poder? A galinha ou o ovo ou o poder?</p>
<p> Você não pode correr. Você não pode esconder. Você só pode lutar. E eventualmente morrer. É isso. Sinto muito.</p>','bosm','N');

--------------------------------------------

 SELECT cod_autor, nome_autor
FROM tb_autor;

SELECT cod_ed, desc_ed
FROM tb_edicao;

SELECT *
FROM tb_hq;

 insert into tb_hq
values
(Default,'978-1302919047','9','Primeiro Ato: Origem Symbiote','3','120','149.72','120',
'<p>De volta ao preto! Todo mundo sabe que o infame traje vivo do Homem-Aranha acidentalmente trazido de volta das Guerras Secretas acabou se tornando o perverso lançador de teias
 conhecido como Venom - mas o que aconteceu antes de Peter Parker descobrir o sinistro segredo simbiótico do traje? Descubra neste conto dinâmico das lendas dos quadrinhos Peter David
 e Greg Land!</p>
 <p>Ambientada durante a "Saga de Trajes Alienígenas" original, esta nova história coloca o escalador de paredes de terno preto contra a mais misteriosa das ameaças: Mysterio! Ao 
 descobrir um segredo vergonhoso do passado do Gato Preto, Mysterio pode ter encontrado a chantagem necessária para se aproximar do notável novo traje do Homem-Aranha - e ao fazer isso,
 Felicia seguirá um caminho onde qualquer passo em falso pode resultar na perda de Peter para sempre!</p>', 'symbiotesm','N'),
 
 

 (Default,'978-1302932183','10','A Agenda da Humanidade - Ato Um: Luto','7','112','143.00','50',
'<p>Viaje no tempo para outra era sensacional da narrativa do Aranha! Na orgulhosa tradição de SYMBIOTE SPIDER-MAN, vem um novo conto estrelado pelo clone de Peter Parker, Ben Reilly, 
ambientado durante sua primeira passagem como Homem-Aranha! Quando uma figura misteriosa do passado rasteja de volta à vida de Ben, o sinistro Instituto Ravencroft detém a chave para 
sua identidade? E depois de cinco anos vividos na estrada, seguidos pela loucura da Saga dos Clones, será que Ben consegue realmente lidar com o que significa ser o Homem-Aranha?</p>
<p>Ele terá que aprender rapidamente quando enfrentar um desafio de seus inimigos mais temíveis! O lendário roteirista JM DeMatteis e o artista cinético David Baldeón levam os leitores
 de volta a uma época tumultuada dos quadrinhos - quando Ben Reilly, e não Peter Parker, era o verdadeiro Homem-Aranha! Estou feliz porque, como Homem-Aranha , posso encontrar o 
 significado e o propósito que me faltam. Porque sei que posso fazer uma diferença positiva no mundo . Houve momentos no passado, naquela vida de sonho que vivi antes, em que pensei 
 que ser o Homem-Aranha era uma maldição. Mas agora vejo, tão claramente... que é uma bênção!</p>', 'brsm','N'),
 
(Default,'978-0785121923','11','TPB(Trade paperbacks)','1','552','1178.40','2',
'<p>Coleção de Colecionador das séries Amazing Fantasy #15 e Amazing Spider-Man #1-20</p>','esm','N'),
 
 
 (Default,'978-0785152743','7','A Morte do Homem-Aranha','8','128','2710.40','3',
'<p>A espera acabou! Prepare-se para a história mais chocante do Homem-Aranha que você já leu! O jovem Peter Parker levou uma vida heróica e tentou viver de acordo com a filosofia 
simples e poderosa de que com grandes poderes vêm grandes responsabilidades - mas será que essa filosofia será suficiente para salvá-lo do horror que o espera aqui? </p>
<p>Esta é facilmente a história mais importante da história do ULTIMATE SPIDER-MAN - e talvez a história mais importante do Universo Ultimate. Quem melhor para ilustrá-lo do que 
a lenda do Ultimate Spider-Man, Mark Bagley, fazendo seu poderoso retorno à Marvel! É Bendis e Bagley, juntos novamente - e bem na hora!</p>','usmdeath','N');
 
 ---------------------------------------------------
 
  SELECT cod_autor, nome_autor
FROM tb_autor;

SELECT cod_ed, desc_ed
FROM tb_edicao;

SELECT *
FROM tb_hq;


 insert into tb_hq
values
(Default,'978-1484787489','12','É hora de Miles se vestir!','2','272','74.14','520',
'<h1>"Todo mundo fica bravo com os trapaceiros, especialmente se você está do lado da vítima do trapaceiro. E Miles sabia que o trapaceiro estava em suas veias."</h1>
 <p>Miles Morales é apenas um adolescente comum. Janta todos os domingos com seus pais, relaxa jogando videogames antigos com seu melhor amigo, Ganke, e tem uma queda pela bela
 e inteligente poetisa Alicia. Ele ainda conseguiu uma bolsa de estudos na prestigiosa Brooklyn Visions Academy. Ah, sim, e ele é o Homem-Aranha.</p>
 <p>Mas ultimamente, o sentido de aranha de Miles tem estado em frangalhos. Quando um mal-entendido leva à sua suspensão da escola, Miles começa a questionar suas habilidades. Afinal,
 seu pai e seu tio eram garotos de programa do Brooklyn com antecedentes criminais. Talvez crianças como Miles não sejam super-heróis. Talvez Miles devesse seguir o conselho de seu pai
 e se concentrar em se salvar.</p>
 <p>Enquanto Miles tenta colocar sua vida escolar de volta nos trilhos, ele não consegue se livrar dos pesadelos vívidos que continuam a assombrá-lo. Ele também não pode evitar o 
 zumbido implacável de seu senso de aranha todos os dias na aula de história, em meio às palestras de seu professor sobre os "benefícios" históricos da escravidão e do sistema 
 prisional moderno. Mas depois que sua bolsa é ameaçada, Miles descobre uma trama assustadora, que coloca seus amigos, sua vizinhança e a si mesmo em risco.</p>', 'mmsm','N'),
 
 

 (Default,'978-0785107163','1','A Morte de Gwen Stacy','2','115','392.62','23',
'<p>A história apresenta um confronto entre o Homem-Aranha e o Duende Verde . Tendo descoberto a identidade do Homem-Aranha, o Duende Verde sequestra a namorada do Homem-Aranha, 
Gwen Stacy . Gwen é morta durante a batalha, e uma luta subsequente resulta na morte do Goblin.</p>
<p>Antes do lançamento do arco da história, não era considerado comum que os principais membros do elenco de apoio de um super-herói fossem mortos. Como resultado, "The Night Gwen Stacy
 Died" é amplamente considerada a história do Homem-Aranha mais importante fora de sua origem e um dos quadrinhos mais importantes de todos os tempos; é amplamente dito que seu 
 lançamento encerrou a Era de Prata dos Quadrinhos e deu início à Idade do Bronze</p>', 'asmdeath','N'),
 

(Default,'978-0785190363','13','Multiverso Aranha','14','648','205.95','340',
'<p>Quando os malvados Herdeiros começam a exterminar personagens-aranha em todo o Multiverso, cada Homem-Aranha é necessário para salvar o dia! Um Exército-Aranha interdimensional 
se reúne para lutar contra Morlun e sua família mortal, mas nenhum deles está seguro quando a Profecia se concretiza! O que essa guerra brutal pela sobrevivência significará para 
Peter Parker e o resto das aranhas?</p>
<p>Estrelando o Homem-Aranha Superior, Miles Morales e Jessica Drew do Universo Ultimate, Homem-Aranha 2099, Mulher-Aranha, Seda, Kaine, Aranha Escarlate, Garota-Aranha do MC2, 
Homem-Aranha Noir, Homem-Aranha 1602, Presunto-Aranha , Spider-Monkey, Lady Spider, Spider-Punk, Spider-UK, uma Gwen Stacy movida a aranha... e centenas mais, do amado ao obscuro!</p>',
'smsv','N'),
 
 
 (Default,'978-0785152743','14','Omnibus - Troca de Corpo: O Fim de Peter Parker','5','960','743.91','12',
'<p>Coleciona AMAZING SPIDER-MAN (1999) # 698-700, e SUPERIOR SPIDER-MAN (2013) # 1-31</p>
<p>Quando um moribundo Doutor Octopus troca sua mente pelo corpo de Peter Parker, ele sentencia seu maldito inimigo para o esquecimento - e se propõe a provar que ele é o mais 
inteligente, mais forte...Superior Homem-Aranha! Atualizando o traje e o arsenal de Spidey, Otto Octavius ​​faz maravilhas para a carreira científica de "Peter" - mas sua abordagem 
muito mais violenta para combater o crime não se coaduna com os Vingadores!</p>
<p>O implacável novo Homem-Aranha batalha - e brutaliza - seu caminho através da galeria de bandidos de Peter. Mas será que a luta mais feroz de Otto será contra o ressurgente Duende 
Verde - ou o que quer que tenha restado em sua mente daquele, o verdadeiro Peter Parker? A clássica saga moderna do Homem-Aranha que chocou o mundo é reunida em um Omnibus 
verdadeiramente Superior!</p>','ssmomnibus','N');
 
------------------------------------------------

  SELECT cod_autor, nome_autor
FROM tb_autor;

SELECT cod_ed, desc_ed
FROM tb_edicao;

SELECT *
FROM tb_hq;

SELECT count(*) FROM tb_hq;

 insert into tb_hq
values
(Default,'978-1302916183','2','Volume Completo: Homem-Aranha Vingador!','11','504','1379.20','12',
 '<p>COLLECTING: AVENGING SPIDER-MAN 1-15, ANNUAL 1; PUNISHER (2011) 10; DAREDEVIL (2011) 11; AMAZING SPIDER-MAN ANNUAL 39; SPIDER-MAN VS. VAMPIRES 1; 
 MATERIAL FROM AMAZING SPIDER-MAN (1999) 692</p>
 <p>O Homem-Aranha balança com uma série de heróis enquanto os maiores nomes dos quadrinhos entregam uma operação de equipe da Marvel para o século 21! Spidey e Red Hulk enfrentam
 um exército Moloid, e Capitão América e Hawkeye aparecem - mas o que poderia se comparar a uma noite na cidade com She-Hulk? </p>
 <p>Spidey entra em ação com o Capitão Marvel e desvia de balas com Deadpool! Além disso, uma batalha para manter o Omega Drive longe das mãos erradas com o Demolidor e o Justiceiro! 
 Uma viagem à Terra Selvagem com Devil Dinosaur e Moon Boy! Spider-Man e Blade derrotam vampiros! Peter Parker em um mundo onde o Homem-Aranha nunca existiu! E vencendo o tempo, 
 cortesia do Coisa!</p>', 'avsm','N'),
 
 (Default,'978-0785184416','1','Negócios de Família','5','112','180.00','80',
'<p>Alguém tem o Homem-Aranha na mira, e a única pessoa no Universo Marvel que pode salvá-lo é a irmã de Peter Parker?! À medida que o lançador de teias conhece uma família que 
ele nunca conheceu, ela acabará se tornando sua maior aliada ou aquela que o amaldiçoa?</p>
<p>E o que o Rei do Crime tem a ver com isso? Esta história em quadrinhos independente - escrita pelo vencedor do Eisner Award Mark Waid (DAREDEVIL) e pelo aclamado autor James 
Robinson (Superman), e pintada pelo lendário Gabriele Dell Otto (SECRET WAR) - traz para você a hora mais sombria do lançador de teias. e maior triunfo!</p>', 'asmfamily','N'),
 

(Default,'978-1302907563','2','No Crepusculo','11','144','150.34','70',
'<p>COLLECTING: PETER PARKER: THE SPECTACULAR SPIDERMAN 1-6</p>
<p>A maravilha que lança teias e escala paredes retorna à cidade de Nova York no novíssimo PETER PARKER: O ESPETACULAR HOMEM-ARANHA. Uma série companheira da série best-seller 
Amazing Spider-Man, Peter Parker está voltando ao básico para grandes heroísmos na Big Apple. Apresentando adversários antigos e novos, esteja lá quando o Homem-Aranha retornar ao 
seu bairro amigável para sua batalha sem fim contra o crime e a temida "Parker Luck".</p>',
'usmcollection','N');

-- para ter lançamentos, todos estavam não anteriormente --
UPDATE tb_hq
SET sg_lancamento = 'S'
WHERE cod_hq = 19;

-- para ter produtos indisponiveis futuramente --
UPDATE tb_hq
SET qtd = '0'
WHERE cod_hq = 14;

UPDATE tb_hq
SET qtd = '0'
WHERE cod_hq = 3;

UPDATE tb_hq
SET sg_lancamento = 'S'
WHERE cod_hq = 3;


SELECT *
FROM tb_hq;

update tb_hq
set desc_capa = 'usmcollection.jpg'
where cod_hq =19;

SELECT *
FROM tb_edicao;

SELECT *
FROM tb_autor;

CREATE VIEW vw_hq
AS SELECT 
	tb_hq.cod_hq,
    tb_hq.num_isbn,
    tb_edicao.desc_ed,
    tb_hq.nome_hq,
    tb_autor.nome_autor,
    tb_hq.desc_hq,
    tb_hq.num_pag,
    tb_hq.preco,
    tb_hq.qtd,
    tb_hq.desc_capa,
    tb_hq.sg_lancamento
FROM tb_hq inner join tb_autor
	on tb_hq.cod_autor = tb_autor.cod_autor
		inner join tb_edicao
			on tb_hq.cod_ed = tb_edicao.cod_ed;

SELECT * FROM vw_hq;
select nome_hq, preco, desc_capa, qtd from tb_hq;
SELECT nome_hq, preco, desc_capa from tb_hq;

 CREATE USER 'smphp'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234566';
 GRANT ALL PRIVILEGES ON db_spcomic.* TO 'smphp'@'localhost' WITH GRANT OPTION;
 
select nome_hq, preco, desc_capa from tb_hq where sg_lancamento = 'S';

select nome_hq, preco, desc_capa from tb_hq where desc_ed = 'amazing';

CREATE TABLE tbUsuario(
	cod_usu int primary key auto_increment,
    nome_usu varchar(80) not null,
    desc_email varchar(80) not null,
    desc_senha varchar(6) not null,
    desc_status boolean not null,
    endereco varchar(80) not null,
    cidade varchar(30) not null,
    CEP char(9) not null
);

select * from tbUsuario;


insert into tbUsuario
values(default, 'Elizabeth Webber', 'ElizabethWB@gmail.com', 'cience', 1, 'Rua Casparzinho, 82', 'rio branco', 123456-078);

insert into tbUsuario
values(default, 'Joui Jouki', 'JouiJK@gmail.com', 'memory', 0, 'Av. Miosotis, 3', 'vida longa', 191214-145);

insert into tbUsuario
values(default, 'Arthur Cervero', 'ArthurCVR@gmail.com', 'musica', 0, 'Rua Suvaco Seco, 1', 'cidade da paz', 229221-000);

-- teste do select do php --
select cod_usu,nome_usu, desc_email, desc_senha, desc_status from tbUsuario where desc_email = 'ElizabethWB@gmail.com' and desc_senha = 'cience';
select nome_usu from tbUsuario where cod_usu = '$_SESSION[ID]';
select nome_usu from tbUsuario where cod_usu = '1';
select * from vw_hq where cod_hq = 4;

SELECT cod_ed, desc_ed FROM tb_edicao where cod_ed ='Amazing Spider-Man' union select cod_ed, desc_ed FROM tb_edicao where cod_ed !='Amazing Spider-Man';
SELECT cod_autor, nome_autor FROM tb_autor where cod_autor='Stan Lee' union select cod_autor, nome_autor FROM tb_autor where cod_autor !='Stan Lee';

select * from vw_hq where nome_hq like '%%';

delete from tb_hq where cod_hq = 22;

SELECT *
FROM tb_hq;




