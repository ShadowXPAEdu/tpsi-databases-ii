-- 1)

create function prendas_em_falta(Cod_Prenda number, nomeInstit varchar2) return number
is
    countInstit number := 0;
    countPrendas number := 0;
    Cod_Instit instituicao.codInstit%type;
    
    somaPrendasNecessita number := 0;
    somaPrendasDoacao number := 0;
begin
    select count(codInstit) into countInstit
    from instituicao
    where nome = nomeInstit;
    
    if (countInstit = 0) then
        raise_application_error(-20511, 'Instituição ' || nomeInstit || ' inexistente.');
    end if;
    
    select codInstit into Cod_Instit
    from instituicao
    where nome = nomeInstit;
    
    select count(codInstit) into countPrendas
    from necessita
    where codInstit = Cod_Instit;
    
    if (countPrendas = 0) then
        raise_application_error(-20512, 'A instituição ' || nomeInstit || ' não indicou as prendas que necessita.');
    end if;
    
    select sum(nvl(quantidade, 0)) into somaPrendasNecessita
    from necessita
    where codInstit = Cod_Instit and codPrenda = Cod_Prenda and to_char(ano, 'yyyy') = to_char(sysdate, 'yyyy');
    
    select sum(nvl(nPrendas, 0)) into somaPrendasDoacao
    from doacao
    where codInstit = Cod_Instit and codPrenda = Cod_Prenda and to_char(dataDoacao, 'yyyy') = to_char(sysdate, 'yyyy');
    
    return somaPrendasNecessita - somaPrendasDoacao;
end;

-- 2)

create procedure prendas_por_instituicao(tipo_prenda varchar2, nomeInstit varchar2)
is
    institInexistente exception;
    naoIndicouPrenda exception;
    PRAGMA EXCEPTION_INIT (institInexistente, -20511);
    PRAGMA EXCEPTION_INIT (naoIndicouPrenda, -20512);
    Cod_Prenda prenda.codPrenda%type;
    Nome_Prenda prenda.nome%type;
    quant number;
    
    cursor c1 is select * from prenda where tipoPrenda = tipo_prenda;
begin
    for p in c1
    loop
        Cod_Prenda := p.codPrenda;
        Nome_Prenda := p.nome;
        select prendas_em_falta(Cod_Prenda, nomeInstit) into quant from dual;
        insert into temp(col1, col2, message) values (Cod_Prenda, quant, Nome_Prenda);
    end loop;

exception
    when institInexistente then
        insert into temp(col1, col2, message) values (Cod_Prenda, SQLCODE, Nome_Prenda);
    when naoIndicouPrenda then
        insert into temp(col1, col2, message) values (Cod_Prenda, SQLCODE, Nome_Prenda);
    when OTHERS then
        return;
end;

-- 3)

create trigger alteracao_nprendas_doadas
before update
on doacao
for each row
declare
    tipo_prenda prenda.tipoPrenda%type;
    nomeInstit instituicao.nome%type;
begin
    if (:old.nPrendas <> :new.nPrendas and (:old.codPrenda <> :new.codPrenda or :old.dataDoacao <> :new.dataDoacao)) then
        if (:old.codPrenda <> :new.codPrenda) then
            raise_application_error(-20533, 'Não é possível alterar o código da prenda da doação.');
        end if;
        if (:old.dataDoacao <> :new.dataDoacao) then
            raise_application_error(-20534, 'Não é possível alterar a data da doação.');
        end if;
    end if;

    select i.nome into nomeInstit
    from instituicao i
    where i.codInstit = :new.codInstit;
    
    select p.tipoPrenda into tipo_prenda
    from prenda p
    where codPrenda = :new.codPrenda;
    
    prendas_por_instituicao(tipo_prenda, nomeInstit);
end;
