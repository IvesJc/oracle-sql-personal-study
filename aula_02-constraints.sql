----- UF -----

ADICIONANDO CONSTRAINTS NA MÃO

alter table uf add constraint cod_uf_pk primary key (codigo);
alter table uf add constraint sigla_uf_un unique (sigla_uf);
alter table uf add constraint cod_uf_ibge_un unique (cod_uf_ibge);

alter table uf modify (sigla_uf not null, cod_uf_ibge not null);

alter table uf drop constraint sigla_uf_un;

select constraint_name, constraint_type, table_name from user_constraints
    where table_name in ('UF');


ADICIONANDO CONSTRAINTS NA CRIAÇÃO DA TABELA
drop table uf;

create table uf (codigo number constraints cod_uf_pk primary key,
                dt_criacao date,
                dt_alteracao date,
                cod_uf_ibge number(2)not null constraint cod_uf_ibge_un unique,
                sigla_uf VARCHAR2(2)not null constraint sigla_uf_un unique,
                desc_uf VARCHAR2(255));
                
select * from uf;
desc uf;

--------------------------------
----- MUNICIPIO -----
alter table municipio add constraint cod_mun_pk primary key (codigo);
alter table municipio add constraint cod_municipio_ibge_un unique (cod_municipio_ibge);
alter table municipio modify (cod_municipio_ibge not null);

desc municipio;
drop table municipio;

----- PESSOA FISICA -----
alter table pessoa_fisica add constraint cod_pessoa_fis_pk primary key (codigo);
alter table pessoa_fisica add constraint cpf_pessoa_fis_un unique (cpf);

desc pessoa_fisica;


----- PESSOA FISICA ENDERECO -----

alter table pessoa_fisica_endereco add constraint cod_pess_fis_end_pk primary key (codigo);
alter table pessoa_fisica_endereco add constraint cod_pess_fis_end_fk foreign key (cod_pessoa_fisica) references pessoa_fisica(codigo);
alter table pessoa_fisica_endereco add constraint cod_uf_fk foreign key (cod_uf) references uf(codigo);
alter table pessoa_fisica_endereco add constraint cod_muni_fk foreign key (cod_municipio) references municipio(codigo);
alter table pessoa_fisica_endereco modify (cod_pessoa_fisica not null);

desc pessoa_fisica_endereco;

select constraint_name, constraint_type, table_name from user_constraints
    where table_name in ('PESSOA_FISICA_ENDERECO');
    
    
-- EXERCICIO --
alter table pessoa_fisica_endereco add sexo_pessoa_fis varchar2(1) constraint sexo_pessoa_fis_ck check (sexo_pessoa_fis in ('F', 'M', 'I'));

desc pessoa_fisica_endereco;
