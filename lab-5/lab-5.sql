use ecommerce;

-- Produtos com estoque abaixo de 10 unidades
delimiter
create procedure produtosAbaixoDoEstoque()
begin
    select * 
    from ecommerce.Produto_Estoque 
    where quantidade < 10;
end
delimiter;

-- Produtos com vendas acima de 1000 unidades
delimiter
create procedure produtosMaisVendidos()
begin
    select (id, categoria, descricao, valor) 
    from ecommerce.Produto produto, ecommerce.Produto_Pedido pedido 
    where (select count(produto_id) from ecommerce.Produto_Pedido where pedido.produto_id = produto_id) > 1000;
end
delimiter;
