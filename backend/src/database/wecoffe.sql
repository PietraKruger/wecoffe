select * from usuarios 
select * from cardapios
select * from favoritos

create table usuarios (
    id_usuario serial primary key,
    nome_usuario varchar(100) not null,
    email_usuario varchar(100) not null unique,
    senha_usuario varchar(100) not null,
    foto_url varchar(100),
    chefe_usuario tipo,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TYPE tipo AS ENUM ('Chefe','Usuario');

create table cardapios (
    id_cardapio serial primary key,
    id_usuario serial,
    id_chefe serial,
    cardapio_url varchar(100),
    bebida_cardapio varchar(100),
    comida_cardapio varchar(100),
    valor_cardapio numeric(10,2) not null,
        CONSTRAINT fk_cardapio_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
    
)

insert into cardapios ( bebida_cardapio, comida_cardapio, valor_cardapio) values
('Café cappuccino', 'Pão de queijo', 10)

create table favoritos (
    id_favorito serial primary key,
    id_usuario serial,
    id_cardapio serial,
        CONSTRAINT fk_favorito_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario),
        
        constraint fk_favorito_cardapio
        foreign key (id_cardapio)
        references cardapios(id_cardapio)
    
)

insert into usuarios (nome_usuario, email_usuario, chefe_usuario,senha_usuario) values
('Pablo', 'pablo@gmail.com', 'Chefe',123456 )
