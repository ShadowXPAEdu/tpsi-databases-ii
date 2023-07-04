-- Ficha 2

--
-- Pedro dos Santos Alves
-- 21270246
-- TPSI
-- 31 Oct. 2018
--

-- Ex 1
set serveroutput on;

accept data_val prompt 'Introduza a data que quer procurar:';

declare
    quant number;
    aux number;
    cursor c1(data_valor vendas.data_venda%type) is select quantidade from vendas where to_char(data_venda, 'YYYY-MM-DD') = to_char(data_valor, 'YYYY-MM-DD');
begin
    open c1(&data_val);
    
    quant := 0;
    
    loop
        fetch c1 into aux;
        exit when c1%notfound;
        quant := quant + aux;
    end loop;
    
    DBMS_OUTPUT.PUT_LINE('Soma: ' || quant);
    close c1;
end;
/

-- Ex 2

declare
    v_codigo_livro livros.codigo_livro%type;
    v_preco livros.preco_tabela%type;
    cursor c1 is
        select codigo_livro,preco_tabela
        from livros
        where genero in ('Aventura','Romance') and preco_tabela<=50
        for update of preco_tabela;
begin
    open c1;
    loop
        fetch c1 into v_codigo_livro,v_preco;
        exit when c1%notfound;
        if v_preco<=25 then
            update livros set preco_tabela=preco_tabela*1.1 where current of c1;
        else
            update livros set preco_tabela=preco_tabela*1.06 where current of c1;
        end if;
    end loop;
    close c1;
end;
/

-- Ex 3
set serveroutput on;

declare
    v_codigo_livro livros.codigo_livro%type;
    v_preco livros.preco_tabela%type;
    cursor c1 is
        select codigo_livro,preco_tabela
        from livros
        where genero in ('Aventura','Romance') and preco_tabela<=50
        for update of preco_tabela;
begin
    for r in c1
    loop
        if r.preco_tabela<=25 then
            update livros set preco_tabela=preco_tabela*1.1 where current of c1;
        else
            update livros set preco_tabela=preco_tabela*1.06 where current of c1;
        end if;
    end loop;
end;
/

-- Ex 4 e 5
set serveroutput on;

accept gen prompt 'Introduza um gênero:';

declare
    cursor c1(gene autor.genero%type) is select preco_tabela from livros where genero = gene order by preco_tabela asc for update of preco_tabela;
begin
    for r in c1
    loop
        if ((select sum(preco_tabela) from livros where genero = &gen) < 150) then
            update livros set preco_tabela = preco_tabela * 1.1 where current of c1;
        end if;
    end loop;

end;
/

-- Ex 6 e 7
set serveroutput on;

declare
    cursor c1 is select codigo_livro, preco_tabela, titulo from livros order by preco_tabela asc;
begin
    for r in c1
    loop
        insert into temp values (r.codigo_livro, r.preco_tabela, r.titulo);
        exit when (c1%ROWCOUNT = 8);
    end loop;
end;
/

-- Ex 8
set serveroutput on;

declare
    cursor c1 is select * from livros where livros.genero = 'Informática';
    precoSup number := 0;
    numPag number := 0;
    sumPrecos number := 0;
begin
    for p in c1
    loop
        if (p.preco_tabela > 25) then
            precoSup := precoSup + 1;
        end if;
        
        if (p.paginas > 500) then
            numPag := numPag + 1;
        end if;
        
        sumPrecos := sumPrecos + p.preco_tabela;    
    end loop;
    
    DBMS_OUTPUT.PUT_LINE('Preço Superior 25 euros: ' || precoSup || ' Número de páginas 500: ' || numPag || ' Preço Total dos Livros de Informática: ' || sumPrecos);
    
    insert into TEMP values(precoSup, numPag, 'Preço Total dos Livros de Informática = ' || sumPrecos);

end;
/

-- Ex 9 e 10
set serveroutput on;

declare
    cursor c1 is select livros.quant_em_stock, vendas.quantidade from livros, vendas where livros.codigo_livro = vendas.codigo_livro and livros.genero = 'Informática';
    quantStock number := 0;
    quant number := 0;
begin
    for p in c1
    loop
        quantStock := quantStock + p.quant_em_stock;
        quant := quant + p.quantidade;
    end loop;
    
    insert into TEMP values (quantStock, quant, 'Informática');
end;
/

-- Ex 11
set serveroutput on;

declare
    cursor c1 is select * from livros;
begin
    for p in c1
    loop
        insert into temp values(p.paginas, p.quant_em_stock, p.titulo);
    end loop;
end;
/

-- Ex 12
set serveroutput on;

declare
    cursor c1 is select distinct
    autores.CODIGO_AUTOR CODIGO_AUTOR,
    autores.NOME NOME from autores, livros where autores.codigo_autor = livros.codigo_autor and livros.genero = 'Informática';
begin
    for p in c1
    loop
        insert into temp values(p.codigo_autor, (select count(codigo_autor) from LIVROS l where l.codigo_autor = p.codigo_autor), REVERSE(p.nome));
    end loop;
end;
/

-- Ex 13
set serveroutput on;

declare
    cursor c1 is select distinct SUBSTR(autores.nome, 0, INSTR(autores.nome, ' ') - 1) pn, codigo_autor, genero_preferido from autores;
begin
    for p in c1
    loop
        insert into temp values ((select count(*) from livros where p.codigo_autor = livros.codigo_autor),
        (select count(*) from livros where p.codigo_autor = livros.codigo_autor and p.genero_preferido = livros.genero), p.pn);
    end loop;
end;
/

-- Ex 14
set serveroutput on;

declare
    cursor c1 is select * from autores, vendas, livros where autores.codigo_livro = livros.codigo_livro and livros.codigo_livro = vendas.codigo_livro and livros.genero = 'Informática';    
begin
    for p in c1
    loop
        insert into temp values((select sum(vendas.quantidade) from vendas, livros where vendas.codigo_livro = livros.codigo_livro and livros.genero = 'Informática'),
        (select sum(vendas.quantidade) from vendas, autores, livros where vendas.codigo_livro = livros.codigo_livro and livros.codigo_autor = autores.codigo_autor
        and autores.codigo_autor = p.codigo_autor and vendas.quantidade > 3), p.nome);
    end loop;
end;
/
