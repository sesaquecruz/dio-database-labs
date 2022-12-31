use ecommerce;

insert into Produto(categoria, descricao, valor) values
            ('Roupas', 'Camisa Longa', 19.99),
            ('Eletrônicos', 'Notebook JTK 887', 2500.99);

insert into Vendedor(nome, cnpj) value
            ('Vendedor de Roupas', '123709737640138'),
            ('Vendedor de Notebooks', '1230987731874013');

insert into Fornecedor(nome, cnpj) values
            ('Fábrica de Roupas', '89123781230131'),
            ('Fábrica de Notebooks', '9733983187319');

insert into Estoque(local) values
            ('Estoque de Roupas'),
            ('Estoque de Notebooks');

insert into Cliente(nome, tipo, identificacao, endereco) values
            ('Maria Souza', 'pessoa_fisica', '87317662332', 'Rua Alameda 314, RJ'),
            ('Bebidas Geladas', 'pessoa_juridica', '08316738731273', 'Avenida Atlântica 981, SP');

insert into Produto_Vendedor(produto_id, vendedor_id, quantidade) values
            (1, 1, 10),
            (2, 2, 20);

insert into Produto_Fornecedor(produto_id, fornecedor_id) values
            (1, 1),
            (2, 2);

insert into Produto_Estoque(produto_id, estoque_id, quantidade) values
            (1, 1, 10),
            (2, 2, 20);

insert into Pedido(cliente_id, status, descricao, frete) values
            (1, 'CRIADO', 'Comprou roupa', 9.99),
            (2, 'CRIADO', 'Comprou Notebook', 19.99);

insert into Produto_Pedido(produto_id, pedido_id, quantidade) values
            (1, 1, 3),
            (2, 2, 6);
