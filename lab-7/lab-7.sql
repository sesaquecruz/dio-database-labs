use ecommerce;

-- Consultas
select status, descricao, frete
    from Pedido
    where id = 2;

-- Alterações
delimiter $$
create procedure atualizarStatusPedido(IN pedido_id INT, IN status VARCHAR(45))
begin
    update Pedido p
    set p.status = status
    where p.id = pedido_id;
end $$
delimiter;

atualizarStatus(2, 'FINALIZADO');
