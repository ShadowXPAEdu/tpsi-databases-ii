-- Ficha 1

--
-- Pedro dos Santos Alves
-- 21270246
-- TPSI
-- 10 Oct. 2018
--

-- Ex 1
drop table temp;

create table temp (
    col1 number(10),
    col2 number(20),
    message varchar2(100)
);


-- Ex 2
SET SERVEROUTPUT ON

ACCEPT altura PROMPT 'Introduza a altura:';

accept sexo prompt 'Introduza o sexo (M) ou (H):';

declare
    valor number(9,2);
    sexo_aux VARCHAR2(20) :='&sexo';
begin
    if (sexo_aux ='m') or (sexo_aux='M') then
        valor:=(62.1 * &altura);
        valor := valor - 44.7;
        DBMS_OUTPUT.PUT_LINE('O seu peso ideal para mulher é: ' || valor);
    elsif (sexo_aux = 'h') or (sexo_aux = 'H') then
        valor :=(72.7*&altura);
        valor := valor -58;
        DBMS_OUTPUT.PUT_LINE('O seu peso ideal para homem é: ' || valor);
    else
        DBMS_OUTPUT.PUT_LINE('Erro na escolha do sexo (M) Mulher ou (H) Homem:');
    end if;
end;


-- Ex 3
SET SERVEROUTPUT ON

ACCEPT nota PROMPT 'Qual é a nota que teve: ';

declare
begin
    if (&nota>= 0) and (&nota < 7) then
        DBMS_OUTPUT.PUT_LINE('Reprovou. Nota: ' || &nota);
    elsif (&nota >= 7 ) and (&nota < 10) then
        DBMS_OUTPUT.PUT_LINE('Vai a oral para passagem. Nota: ' || &nota);
    elsif (&nota >= 10) and (&nota < 16) then
        DBMS_OUTPUT.PUT_LINE('Aprovado. Nota: ' || &nota);
    elsif (&nota >= 16) and (&nota <= 20) then
        DBMS_OUTPUT.PUT_LINE('Aprovado, oral para manter nota. Nota: ' || &nota);
    else
        DBMS_OUTPUT.PUT_LINE('Valor impossível. Valor: ' || &nota);
    end if;
end;


-- Ex 4
declare
begin
    for i in 1..100
    loop
        if (mod(i, 2) = 0) then
            insert into temp values(i, i*100, 'Col1 é par');
        else
            insert into temp values(i, i*100, 'Col2 é impar');
        end if;
    end loop;
end;


-- Ex 5
insert into autores values(80, 'Luis Moreno Campos', 23432432, 'Lisboa', 30, 'M', 'Portuguesa', 'Informática');

set serveroutput on

ACCEPT num PROMPT 'Número do livro:';

declare
    val number(9);
begin
    SELECT codigo_autor
    into val
    from livros
    where &num = codigo_livro;

    if (val = 17) then
        update livros set codigo_autor = 80 where codigo_livro = &num;
    end if;
end;

-- Ex 8
-- Não existe informação sobre o livro 1000

-- Ex 9
set serveroutput on

ACCEPT num PROMPT 'Número do livro:';

declare
    val number(9);
begin
    SELECT codigo_autor
    into val
    from livros
    where &num = codigo_livro;

    if (val = 17) then
        update livros set codigo_autor = 80 where codigo_livro = &num;
    end if;

exception
    when NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('Valor impossível. Valor: ' || &num);
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('Erro!');
end;

-- Ex 10
set serveroutput on

ACCEPT num PROMPT 'Número do livro:';

declare
    val number;
    gen varchar2(100);
    prec number;
    x number;
    
    cursor c1 is
    (select genero, preco_tabela from livros);
begin
    open c1;

    select ROWNUM into x from livros where codigo_livro = &num;

    loop
        fetch c1 into gen, prec;
        exit WHEN (c1%ROWCOUNT = x);
    end loop;

    if (gen <> 'Aventura') then
        if (prec < 25) then
            UPDATE livros set preco_tabela = preco_tabela + (preco_tabela * 0.1) WHERE codigo_livro = &num;
        else
            update livros set preco_tabela = preco_tabela + (preco_tabela * 0.06) WHERE codigo_livro = &num;
        end if;
    end if;
    close c1;
end;

-- Ex 11

-- Testes
update livros set quant_em_stock = 23 where codigo_livro = 1;
update livros set quant_em_stock = 2 where codigo_livro = 1;
update livros set quant_em_stock = 1 where codigo_luvro = 1;

set serveroutput on

ACCEPT num PROMPT 'Número do livro:';

declare
    val number;
    qes number;
    x number;
    
    cursor c1 is (select quant_em_stock, unidades_vendidas from livros);
begin
    open c1;
    select ROWNUM into x from livros where codigo_livro = &num;

    loop
        fetch c1 into qes, val;
        exit when (c1%ROWCOUNT = x);
    end loop;
    
    if (qes < 2) then
        if (qes < (val*0.01)) then
            DBMS_OUTPUT.PUT_LINE('ENCOMENDAR PARA A SEMANA');
        else
            DBMS_OUTPUT.PUT_LINE('ENCOMENDAR COM URGENCIA');
        end if;
    else
        DBMS_OUTPUT.PUT_LINE('Quantidade em Stock: ' || qes);
    end if;
    close c1;
end;

-- Ex 12
set serveroutput on

ACCEPT prec PROMPT 'Preço?:';

declare
    qes number;
    gen varchar2(100);

begin
    if (&prec > 20 AND &prec < 30) then
        update livros set quant_em_stock = quant_em_stock + 5 where preco_tabela = &prec;
    elsif (&prec >= 30 and &prec < 40) then
        update livros set quant_em_stock = quant_em_stock * 1.1 where preco_tabela = &prec and paginas > 30;
    else
        update livros set quant_em_stock = quant_em_stock - 2 where preco_tabela = &prec and genero = 'Informática';
    end if;
end;
