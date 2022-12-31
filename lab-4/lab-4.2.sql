use oficina;

insert into Servico(nome, descricao, valor) values
            ('Servico 1', 'Descrição 1', 10.00),
            ('Servico 2', 'Descrição 2', 20.00);

insert into Peca(nome, descricao, valor) values
            ('Peça 1', 'Descrição 1', 10.00),
            ('Peça 2', 'Descrição 2', 20.00);

insert into Especialidade(nome, descricao) values
            ('Especialidade 1', 'Descrição 1', 10.00),
            ('Especialidade 2', 'Descrição 2', 20.00);

insert into Equipe(nome) values
            ('Equipe 1'),
            ('Equipe 2');

insert into Mecanico(equipe_id, especialidade_id, codigo, nome, endereco, telefone) values
            (1, 1, 'A1', 'Mecânico 1', 'Rua Primeira 01, SP', '1198588564'),
            (2, 2, 'A2', 'Mecânico 2', 'Rua Segunda 02, SP', '1198542467');

insert into Cliente(nome, tipo, identificacao, telefone, email, endereco) values
            ('Cliente 1', 'pessoa_fisica', '97367278393', '1198548756', 'cliente1@mail.com', 'Rua Primeiro 01, SP'),
            ('Cliente 2', 'pessoa_juridica', '564878965214870', '1192548864', 'cliente2@mail.com', 'Rua Segundo 02, SP');

insert into Veiculo(cliente_id, renavam, placa) values
            (1, '578954259', 'JPO389'),
            (2, '654887954', 'HMD034');

insert into Ordem(equipe_id, numero, valor, status, emissao, conclusao) values
            (1, 1, 100.00, 'CRIADA', '2022-12-31', '2022-12-31'),
            (2, 2, 200.00, 'CRIADA', '2022-13-31', '2022-12-31');

insert into Ordem_Veiculo(ordem_id, veiculo_id, servico_id, peca_id) values
            (1, 1, 1, 1),
            (2, 2, 2, 2);
