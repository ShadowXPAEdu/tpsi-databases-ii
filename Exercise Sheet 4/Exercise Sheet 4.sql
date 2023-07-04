-- Ficha 4

--
-- Pedro dos Santos Alves
-- 21270246
-- TPSI
-- 28 Nov. 2018
--

-- Ex 1
set serveroutput on;

create procedure p1 (num1 number, num2 number)
is

begin
    for i in 1..10
    loop
        DBMS_OUTPUT.PUT_LINE(num1 || ' * ' || i || ' = ' || num1 * i);
    end loop;
    DBMS_OUTPUT.PUT_LINE('');
    for i in 1..10
    loop
        DBMS_OUTPUT.PUT_LINE(num2 || ' * ' || i || ' = ' || num2 * i);
    end loop;
end;
/

-- Ex 2
set serveroutput on;

drop table notas;

create table notas(
    nome varchar2(50),
    nota1 number(4, 2),
    nota2 number(4, 2),
    nota3 number(4, 2),
    nota4 number(4, 2),
    media number(4, 2),
    resultado varchar2(9)
);

create procedure p2 (nome varchar2, nota1 number, nota2 number, nota3 number, nota4 number)
is
    media notas.media%type;
    resultado notas.resultado%type;
begin
    if ((nota1 >= 0 and nota1 <= 20) and (nota2 >= 0 and nota2 <= 20) and (nota3 >= 0 and nota3 <= 20) and (nota4 >= 0 and nota4 <= 20)) then
        media := (nota1 + nota2 + nota3 + nota4) / 4;
        
        if (media >= 9.5) then
            resultado := 'Aprovado';
        else
            resultado := 'Reprovado';
        end if;
        
        insert into notas values (nome, nota1, nota2, nota3, nota4, media, resultado);
    end if;
end;
/

-- Ex 3
set serveroutput on;

create procedure p3 (codCliente number)
is
    nome clientes.nome%type;
    ncont clientes.n_contribuinte%type;
    ntele clientes.telefone%type;
begin
    select clientes.nome into nome from clientes where clientes.codigo_cliente = codCliente;
    select clientes.n_contribuinte into ncont from clientes where clientes.codigo_cliente = codCliente;
    select clientes.telefone into ntele from clientes where clientes.codigo_cliente = codCliente;
    
    DBMS_OUTPUT.PUT_LINE('Nome: ' || nome);
    DBMS_OUTPUT.PUT_LINE('Nº Contribuinte: ' || ncont);
    DBMS_OUTPUT.PUT_LINE('Telefone: ' || ntele);
exception
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Erro!');
end;
/

-- Ex 4
set serveroutput on;

create procedure p4 (codLivro number)
is
    nomeAut autores.nome%type;
    precoTotal vendas.preco_unitario%type;
    gen livros.genero%type;
begin
    select autores.nome into nomeAut from autores, livros where livros.codigo_livro = codLivro and livros.codigo_autor = autores.codigo_autor;
    select livros.genero into gen from livros where livros.codigo_livro = codLivro;    
    select sum(vendas.preco_unitario) into precoTotal from vendas, livros where livros.codigo_livro = vendas.codigo_livro and livros.genero = gen;
    
    DBMS_OUTPUT.PUT_LINE('Nome do autor: ' || nomeAut);
    DBMS_OUTPUT.PUT_LINE('Soma: ' || precoTotal);
exception
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Erro!');
end;
/

-- Ex 5
set serveroutput on;

create procedure pesquisa_cliente (codCliente number)
is
    nomeCliente clientes.n_contribuinte%type;
    codLivro livros.codigo_livro%type;
    nomeLivro livros.titulo%type;
begin
    select clientes.n_contribuinte into nomeCliente from CLIENTES where CODIGO_CLIENTE = codCliente;
    select v.codigo_livro into codLivro from vendas v where codigo_cliente = codCliente and v.data_venda = (select max(data_venda) from vendas where vendas.codigo_cliente = v.codigo_cliente);
    select livros.titulo into nomeLivro from livros where livros.codigo_livro = codLivro;
    
    insert into temp values (nomeCliente, codLivro, nomeLivro);
exception
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Erro!');
end;
/

-- Ex 6
set serveroutput on;

drop table aula4;

create table aula4 (
    string2 varchar2(500),
    num1 number(10),
    num2 number(10),
    num3 number(10),
    string3 varchar2(1000)
);

create PROCEDURE p6
is
    cursor c1 is select autores.codigo_autor from autores;
    nome AULA4.STRING2%type;
    numLivrosV aula4.num1%type;
    qtStock aula4.num2%type;
    prcTotal aula4.num3%type;
    tit aula4.string3%type;
begin
    delete from aula4;
    
    for r in c1
    loop
        select autores.nome into nome from autores where autores.codigo_autor = r.codigo_autor;
        select count(vendas.codigo_livro) into numLivrosV from vendas, livros where r.codigo_autor = livros.codigo_autor and livros.codigo_livro = vendas.codigo_livro;
        select sum(quant_em_stock) into qtStock from livros where r.codigo_autor = livros.codigo_autor;
        select sum(preco_unitario) into prcTotal from vendas, livros where r.codigo_autor = livros.codigo_autor and livros.codigo_livro = vendas.codigo_livro;
        select livros.titulo into tit from livros, vendas v where r.codigo_autor = livros.codigo_autor and livros.codigo_livro = v.codigo_livro and v.quantidade = (select max(quantidade) from vendas where v.codigo_livro = vendas.codigo_livro);
        
        insert into aula4 values (nome, numLivrosV, qtStock, prcTotal, tit);
    end loop;
exception
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Erro!');
end;
/

-- Ex 7
set serveroutput on;

create procedure p7 (codLivro number)
is

begin
    update livros set preco_tabela = preco_tabela * 1.1 where codLivro = livros.codigo_livro;
exception
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Erro!');
end;
/

-- Ex 8
set serveroutput on;

create procedure p8 (nom varchar2, ncont number, mor varchar2, tele number)
is

begin
    insert into clientes values ((select max(codigo_cliente) + 1 from CLIENTES), nom, ncont, mor, tele);
exception
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Erro!');
end;
/
