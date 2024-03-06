create table pessoa_fisica (codigo number(2),
                            dt_criacao date,
                            dt_alteracao date,
                            nome varchar2(255),
                            dt_nasc date,
                            cpf VARCHAR2(11),
                            altura number(3, 2));
                            
create table uf (codigo number,
                dt_criacao date,
                dt_alteracao date,
                cod_uf_ibge number(2),
                sigla_uf VARCHAR2(2),
                desc_uf VARCHAR2(255));
                
create table municipio (codigo number,
                        dt_criacao date,
                        dt_alteracao date,
                        cod_municipio_ibge number(7),
                        desc_municipio varchar2 (255));
                        
create table pessoa_fisica_endereco (codigo number,
                                    dt_criacao date,
                                    dt_alteracao date,
                                    cod_pessoa_fisica number,
                                    cod_uf number,
                                    cod_municipio number,
                                    desc_logradouro varchar2(255),
                                    num_end number,
                                    bairro_end varchar2(255),
                                    cep_end number(8));
                            
desc pessoa_fisica;

insert into pessoa_fisica (codigo, nome, altura)values(11, 'Pedro', 1.83);

alter table pessoa_fisica add teste number;
alter table pessoa_fisica modify (teste number(2));
alter table pessoa_fisica rename column teste to teste_novo;
alter table pessoa_fisica_alterado rename to pessoa_fisica;
alter table pessoa_fisica drop column teste_novo;

insert into pessoa_fisica (teste_novo) values (10.5);

select * from pessoa_fisica;
