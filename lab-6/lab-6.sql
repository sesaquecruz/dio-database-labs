use oficina;

-- Contas do Atendimento e Financeiro
create user `atendimento`@localhost identified by '123456789';
create user `financeiro`@localhost identified by '987654321';

-- Views
create view detalhesParaAtendimento as 
    select * from Cliente;

create view detalhesParaFinanceiro as
    select * from Ordem;

-- Permissões
grant all privileges on oficina.detalhesParaAtendimento to `atendimento`@localhost;

grant all privileges on oficina.detalhesParaFinanceiro to `financeiro`@localhost;
