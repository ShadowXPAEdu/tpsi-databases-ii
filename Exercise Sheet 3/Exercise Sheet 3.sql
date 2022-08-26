-- Ficha 3

--
-- Pedro dos Santos Alves
-- 21270246
-- TPSI
-- 21 Nov. 2018
--

-- Ex 1
SET SERVEROUTPUT ON;

DECLARE
aux_v varchar2(30);
BEGIN
select nome  into aux_v from autores;

exception
    when NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('a) A query não devolve resultados.');
    when TOO_MANY_ROWS then
        DBMS_OUTPUT.PUT_LINE('b) A query devolve mais que um resultado.');
    when CURSOR_ALREADY_OPEN then
        DBMS_OUTPUT.PUT_LINE('c) Abrir um cursor que já está aberto.');
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('d) Erros não identificados.');
END;
/

-- Ex 2
set serveroutput on;

accept codLivro prompt 'Introduza o cod_livro:';

declare
    aux livros.codigo_livro%type;
    nomeAutor autores.nome%type;
begin
    select autores.codigo_autor into aux from livros, autores where autores.codigo_autor = livros.codigo_autor and livros.codigo_livro = &codLivro;

    if (aux = 17) then
        aux := 80;
    end if;
    
    select autores.nome into nomeAutor from autores where autores.codigo_autor = aux;
    
    DBMS_OUTPUT.PUT_LINE(nomeAutor);
    
exception
    when DUP_VAL_ON_INDEX then
        DBMS_OUTPUT.PUT_LINE('Duplicate values on index');
    when NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('No data found');
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Other errors');
end;
/

-- Ex 3drop table erros;

create table erros (
    cod_erro number(10),
    mensagem varchar2(250),
    data_erro date default SYSDATE
);

set serveroutput on;

accept codLivro prompt 'Introduza o cod_livro:';

declare
    aux livros.codigo_livro%type;
    nomeAutor autores.nome%type;
    err_code erros.cod_erro%type;
    err_msg erros.mensagem%type;
begin
    select autores.codigo_autor into aux from livros, autores where autores.codigo_autor = livros.codigo_autor and livros.codigo_livro = &codLivro;

    if (aux = 17) then
        aux := 80;
    end if;
    
    select autores.nome into nomeAutor from autores where autores.codigo_autor = aux;
    
    DBMS_OUTPUT.PUT_LINE(nomeAutor);
    
exception
/*
    when DUP_VAL_ON_INDEX then --???
        insert into erros values(SQLCODE, SQLERRM, SYSDATE);
    when NO_DATA_FOUND then --???
        insert into erros values(SQLCODE, SQLERRM, SYSDATE);
        */
    when OTHERS then
        err_code := SQLCODE;
        err_msg := SQLERRM;
        insert into erros values(err_code, err_msg, SYSDATE);
end;
/

-- Ex 4
set serveroutput on;

declare
    cursor c1 is select VENDAS.QUANTIDADE x, CLIENTES.NOME y, CLIENTES.N_CONTRIBUINTE z from CLIENTES, VENDAS where clientes.codigo_cliente = vendas.codigo_cliente;
begin
    for r in c1
    loop
        insert into temp values(r.x, r.z, r.y);
    end loop;
exception
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Error');
end;
/

-- Ex 5
set serveroutput on;

declare
    x editoras.n_contribuinte%type;
    y autores.n_contribuinte%type;
    z livros.titulo%type;
begin
    select N_contribuinte into x
    from editoras
    where codigo_editora = (
        select codigo_editora
        from livros
        group by codigo_editora
        having (
            select max(count(codigo_editora))
            from livros
            group by codigo_editora) = count(codigo_editora));
            
    select N_contribuinte into y
    from autores
    where codigo_autor = (
        select codigo_autor
        from livros
        group by codigo_autor
        having (
            select max(count(codigo_autor))
            from livros
            group by codigo_autor) = count(codigo_autor));
            
    select titulo into z
    from livros
    where codigo_livro = (
        select codigo_livro
        from vendas
        group by codigo_livro
        having (
            select max(sum(quantidade))
            from vendas
            group by codigo_livro) = sum(quantidade));

    insert into TEMP values (x, y, z);

exception
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Erro ' || SQLERRM);
end;
/
