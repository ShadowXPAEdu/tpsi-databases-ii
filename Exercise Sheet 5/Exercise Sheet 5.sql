-- Ficha 5

--
-- Pedro dos Santos Alves
-- 21270246
-- TPSI
-- 12 Dec. 2018
--

-- Ex 1
set serveroutput on;

create function f1(ano number) return varchar2
is

begin
    -- (ano%100 == 0 && ano%400 == 0) || (ano%100 != 0 && ano%4 == 0)
    if ((mod(ano, 100) = 0 and mod(ano, 400) = 0) or (mod(ano, 100) <> 0 and mod(ano, 4) = 0)) then
        return ('O ano ' || ano || ' é bissexto.');
    else
        return ('O ano ' || ano || ' não é bissexto.');
    end if;
exception
    when OTHERS then
        return 'Erro!';
end;
/


-- Ex 2
set serveroutput on;

create function f2(num1 number, num2 number, num3 number) return number
is

begin
    if (num1 = num2 or num1 = num3 or num2 = num3) then
        raise_application_error(-20001, 'Existem números iguais.');
    else
        return num2;
    end if;
end;
/


-- Ex 3
set serveroutput on;

create function f3(num1 number) return varchar2
is
    cont number;
begin
    cont := 0;
    if (num1 = 2) then
        return 'O número 2 é primo.';
    end if;

    for i in 1..num1
    loop
        if (mod(num1, i) = 0) then
            cont := cont + 1;
        end if;
    exit when cont > 2;
    end loop;

    if (cont = 2) then
        return ('O número ' || num1 || ' é primo.');
    else
        return ('O número ' || num1 || ' não é primo.');
    end if;
end;
/


-- Ex 4
set serveroutput on;

create function f4(str varchar2) return varchar2
is

begin
    return SUBSTR(TRIM(str), (INSTR(TRIM(str), ' ', -1) + 1));
end;
/


-- Ex 5
set serveroutput on;

create function f5(str varchar2) return varchar2
is
    livro livros.titulo%type;
begin
    select titulo into livro
    from livros
    where genero = str and rownum <=1
    order by preco_tabela desc, data_edicao desc;

    return livro;
exception
    when no_data_found then
        RAISE_APPLICATION_ERROR (-20300, 'Gênero inexistente');
end;
/


-- Ex 6
set serveroutput on;

create function f6(nomAut varchar2) return number
is
    conta number;
    nomAut2 autores.nome%type;
begin
    select nome into nomAut2
    from autores
    where nome = nomAut;

    select count(livros.codigo_livro) into conta
    from livros, autores
    where nomAut2 = autores.nome and autores.codigo_autor = livros.codigo_autor;
    
    if (conta = 0) then
        RAISE_APPLICATION_ERROR (-20800, 'Autor ' || nomAut || ' ainda não registou nenhum livro.');
    end if;
    
    return conta;
exception
    when no_data_found then
        RAISE_APPLICATION_ERROR (-20700, 'Autor ' || nomAut || ' não existe.');
end;
/


-- Ex 7
set serveroutput on;

create function f7(codCliente number) return varchar2
is
    nomeAut autores.nome%type;
    nom1 autores.nome%type;
begin
    select nom into nomeAut
    from(
        select autores.nome nom
        from autores, vendas, livros
        where vendas.codigo_cliente = codCliente and vendas.codigo_livro = livros.codigo_livro
        and autores.codigo_autor = livros.codigo_autor
        order by vendas.data_venda)
    where ROWNUM <= 1;
    
    return nomeAut;
exception
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
end;
/


-- Ex 8
set serveroutput on;

create function f8(codEditora number) return number
is
    soma number;
begin
    select NVL(nume, 0) into soma
    from (
        select sum(vendas.preco_unitario * vendas.quantidade) nume
        from vendas, livros
        where vendas.codigo_livro = livros.codigo_livro and livros.codigo_editora = codEditora);

    return soma;
exception
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
end;
/


-- Ex 9 // Foi parcialmente testado pois não foi possível conectar à base de dados, mesmo atravéz do OPEN-VPN
set serveroutput on;

create function FIRST_LIVROS(tituloLiv varchar2) return varchar2
is
    atr1 temp.col1%type := 0;
    atr2 temp.col2%type := 0;
    atr3 temp.message%type := 0;
begin
    select codigo_livro into atr1
    from livros
    where titulo = tituloLiv;
    
    select quant_em_stock into atr2
    from livros
    where codigo_livro = atr1;
    
    select count(conta) into atr3
    from (
        select count(codigo_venda) conta, codigo_cliente
        from vendas
        where codigo_livro = atr1
        group by codigo_cliente);

    if (atr3 = 0) then
        RAISE_APPLICATION_ERROR(-20401, 'Não foram vendidos livros com o id: ' || atr1);
    end if;

    insert into temp values(atr1, atr2, atr3);

    return 'Sucesso!';

exception
    when no_data_found then
        if (atr1 = 0) then
            RAISE_APPLICATION_ERROR(-20402, 'O livro não existe.');
        end if;
    when OTHERS then
        return ('Erro: ' || SQLERRM);
end;
/


-- Ex 10 // Não foi testado pois não foi possével conectar à base de dados, mesmo atravéz do OPEN-VPN
set serveroutput on;

create function f10(gen varchar2) return varchar2
is
    gene livros.genero%type := '';
    tit livros.titulo%type := '';
begin
    select genero into gene
    from livros
    where gen = genero;
    
    select titu into tit
    from (
        select titulo titu
        from livros, vendas
        where gene = genero and livros.codigo_livro = vendas.codigo_livro
        order by vendas.data_venda desc)
    where ROWNUM <= 1;
    
    return tit;
exception
    when no_data_found then
        if (gene = '') then
            RAISE_APPLICATION_ERROR(-20300, 'Gênero inexistente.');
        end if;
end;
/

-- Ex 11 // Não foi testado pois não foi possível conectar à base de dados, mesmo atravéz do OPEN-VPN
set serveroutput on;

create function f11(idCli number) return vendas.data_venda%type
is
    dat vendas.data_venda%type;
begin
    select dat1 into dat
    from (
        select vendas.data_venda dat1
        from vendas
        where idCli = vendas.codigo_cliente
        order by vendas.data_venda desc)
    where ROWNUM <= 1;
    
    return dat;
exception
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
end;
/
