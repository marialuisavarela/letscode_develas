
CREATE SEQUENCE public.produtos_id_prod_seq;

CREATE TABLE public.Produtos (
                id_prod INTEGER NOT NULL DEFAULT nextval('public.produtos_id_prod_seq'),
                nome_produto VARCHAR(60) NOT NULL,
                descricao VARCHAR(200) NOT NULL,
                marca VARCHAR(40) NOT NULL,
                preco REAL NOT NULL,
                qtd_estoque INTEGER NOT NULL,
                CONSTRAINT produtos_pk PRIMARY KEY (id_prod)
);


ALTER SEQUENCE public.produtos_id_prod_seq OWNED BY public.Produtos.id_prod;

CREATE SEQUENCE public.clientes_id_cliente_seq;

CREATE TABLE public.Clientes (
                ID_cliente INTEGER NOT NULL DEFAULT nextval('public.clientes_id_cliente_seq'),
                nome_cliente VARCHAR(100) NOT NULL,
                telefone VARCHAR(11),
                email VARCHAR(150) NOT NULL,
                CONSTRAINT clientes_pk PRIMARY KEY (ID_cliente)
);


ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.Clientes.ID_cliente;

CREATE SEQUENCE public.pedidos_num_pedido_seq;

CREATE TABLE public.Pedidos (
                num_pedido INTEGER NOT NULL DEFAULT nextval('public.pedidos_num_pedido_seq'),
                qtd_produto INTEGER NOT NULL,
                valor_total REAL NOT NULL,
                id_prod INTEGER NOT NULL,
                ID_cliente_pedidos INTEGER NOT NULL,
                CONSTRAINT pedidos_pk PRIMARY KEY (num_pedido)
);


ALTER SEQUENCE public.pedidos_num_pedido_seq OWNED BY public.Pedidos.num_pedido;

CREATE SEQUENCE public.vendas_num_venda_seq;

CREATE TABLE public.Vendas (
                num_venda INTEGER NOT NULL DEFAULT nextval('public.vendas_num_venda_seq'),
                desconto NUMERIC NOT NULL,
                valor_final REAL NOT NULL,
                forma_pgto VARCHAR(30) NOT NULL,
                ID_cliente_vendas INTEGER NOT NULL,
                num_pedido_vendas INTEGER NOT NULL,
                CONSTRAINT vendas_pk PRIMARY KEY (num_venda)
);


ALTER SEQUENCE public.vendas_num_venda_seq OWNED BY public.Vendas.num_venda;

ALTER TABLE public.Pedidos ADD CONSTRAINT produtos_pedidos_fk
FOREIGN KEY (id_prod)
REFERENCES public.Produtos (id_prod)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (ID_cliente_pedidos)
REFERENCES public.Clientes (ID_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Vendas ADD CONSTRAINT clientes_vendas_fk
FOREIGN KEY (ID_cliente_vendas)
REFERENCES public.Clientes (ID_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Vendas ADD CONSTRAINT pedidos_vendas_fk
FOREIGN KEY (num_pedido_vendas)
REFERENCES public.Pedidos (num_pedido)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
