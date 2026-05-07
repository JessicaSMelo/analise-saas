USE connect_view;

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(150) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE),
    uf VARCHAR(2),
    origem VARCHAR(50)
    
);

CREATE TABLE planos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    duracao_meses INT NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE assinaturas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
	plano_id INT NOT NULL,
    data_inicio DATE NOT NULL,
	status ENUM('ativa', 'cancelada') NOT NULL DEFAULT 'ativa',
	valor DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (plano_id) REFERENCES planos(id)
);

CREATE TABLE acessos (
    id INT PRIMARY KEY AUTO_INCREMENT,
	cliente_id INT NOT NULL,
	dispositivo ENUM('mobile', 'desktop', 'tablet', 'tv') NOT NULL,
	data_acesso DATETIME NOT NULL,

    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE pagamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    assinatura_id INT NOT NULL,
	data_pagamento DATE NOT NULL,
	valor_pago DECIMAL(10,2) NOT NULL,
    metodo_pagamento VARCHAR(20),

    FOREIGN KEY (assinatura_id) REFERENCES assinaturas(id)
);

CREATE TABLE recomendacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
	nota INT NOT NULL,  -- 0 a 10 (NPS)
	data_avaliacao DATE NOT NULL,
    comentario TEXT,

    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE renovacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    assinatura_id INT NOT NULL,
	data_renovacao DATE NOT NULL,
	valor DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (assinatura_id) REFERENCES assinaturas(id)
);

CREATE TABLE cancelamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    assinatura_id INT NOT NULL,
	data_cancelamento DATE NOT NULL,
    motivo VARCHAR(255),

    FOREIGN KEY (assinatura_id) REFERENCES assinaturas(id)
);