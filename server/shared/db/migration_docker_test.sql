-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: Deskx
-- object: nvendas | type: ROLE --
-- DROP ROLE IF EXISTS nvendas;
-- ----------------------------------------------------------------------
-- CREATE ROLE nvendas WITH 
-- 	SUPERUSER
-- 	ENCRYPTED PASSWORD '1010aa';
    -- ----------------------------------------------------------------
-- ddl-end --


-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: nvendas | type: DATABASE --
-- DROP DATABASE IF EXISTS nvendas;
-- ----------------------------------------------------------------------
-- CREATE DATABASE nvendas
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'pt_BR'
-- 	LC_CTYPE = 'pt_BR';
    -- --------------------------------------------------------------
-- ddl-end --


-- object: public.cliente | type: TABLE --
-- DROP TABLE IF EXISTS public.cliente CASCADE;
CREATE TABLE public.cliente (
	id serial NOT NULL,
	cpf character(11) NOT NULL,
	nome character varying(250) NOT NULL,
	limite decimal(7,2) NOT NULL DEFAULT 0,
	cc decimal(7,2) NOT NULL DEFAULT 0,
	CONSTRAINT cliente_pk PRIMARY KEY (id),
	CONSTRAINT cpf_ix UNIQUE (cpf)
);
-- ddl-end --
ALTER TABLE public.cliente OWNER TO root;
-- ddl-end --

-- object: nome_ix | type: INDEX --
-- DROP INDEX IF EXISTS public.nome_ix CASCADE;
CREATE INDEX nome_ix ON public.cliente
USING btree
(
	nome
);
-- ddl-end --

-- object: public.produto | type: TABLE --
-- DROP TABLE IF EXISTS public.produto CASCADE;
CREATE TABLE public.produto (
	id serial NOT NULL,
	nome character varying(250) NOT NULL,
	preco decimal(7,2) NOT NULL DEFAULT 0,
	unidade character(3) NOT NULL,
	CONSTRAINT produto_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.produto OWNER TO root;
-- ddl-end --

-- object: public.venda | type: TABLE --
-- DROP TABLE IF EXISTS public.venda CASCADE;
CREATE TABLE public.venda (
	id serial NOT NULL,
	cliente_id integer NOT NULL,
	dataehora timestamptz NOT NULL,
	total decimal(7,2) NOT NULL DEFAULT 0,
	desconto_total decimal(7,2) NOT NULL DEFAULT 0,
	CONSTRAINT venda_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.venda OWNER TO root;
-- ddl-end --

-- object: public.vendaitem | type: TABLE --
-- DROP TABLE IF EXISTS public.vendaitem CASCADE;
CREATE TABLE public.vendaitem (
	venda_id integer NOT NULL,
	produto_id integer NOT NULL,
	qtd smallint NOT NULL DEFAULT 0,
	desconto decimal(7,2) NOT NULL DEFAULT 0,
	CONSTRAINT vendaitem_pk PRIMARY KEY (venda_id,produto_id)
);
-- ddl-end --
ALTER TABLE public.vendaitem OWNER TO root;
-- ddl-end --

-- object: public.usuario | type: TABLE --
-- DROP TABLE IF EXISTS public.usuario CASCADE;
CREATE TABLE public.usuario (
	id smallserial NOT NULL,
	nome character varying NOT NULL,
	email character varying(250) NOT NULL,
	senha character(6) NOT NULL,
	perfil_id integer NOT NULL,
	CONSTRAINT usuario_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.usuario OWNER TO root;
-- ddl-end --

-- object: public.permissao | type: TABLE --
-- DROP TABLE IF EXISTS public.permissao CASCADE;
CREATE TABLE public.permissao (
	id serial NOT NULL,
	descricao character varying(250) NOT NULL,
	CONSTRAINT permissao_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.permissao OWNER TO root;
-- ddl-end --

-- object: public.perfil | type: TABLE --
-- DROP TABLE IF EXISTS public.perfil CASCADE;
CREATE TABLE public.perfil (
	id smallserial NOT NULL,
	nome character varying(250) NOT NULL,
	CONSTRAINT perfil_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.perfil OWNER TO root;
-- ddl-end --

-- object: public.perfil_item | type: TABLE --
-- DROP TABLE IF EXISTS public.perfil_item CASCADE;
CREATE TABLE public.perfil_item (
	perfil_id integer NOT NULL,
	permissao_id integer NOT NULL,
	CONSTRAINT perfil_item_pk PRIMARY KEY (perfil_id,permissao_id)
);
-- ddl-end --
ALTER TABLE public.perfil_item OWNER TO root;
-- ddl-end --

-- object: public.acesso | type: TABLE --
-- DROP TABLE IF EXISTS public.acesso CASCADE;
CREATE TABLE public.acesso (
	usuario_id integer NOT NULL,
	permissao_id integer NOT NULL,
	nivel smallint NOT NULL DEFAULT 0,
	CONSTRAINT acesso_pk PRIMARY KEY (usuario_id,permissao_id)
);
-- ddl-end --
COMMENT ON COLUMN public.acesso.nivel IS E'1 acesso particular\n2 - acesso geral\n3 - acesso gerencial';
-- ddl-end --
ALTER TABLE public.acesso OWNER TO root;
-- ddl-end --

-- object: public.auditoria | type: TABLE --
-- DROP TABLE IF EXISTS public.auditoria CASCADE;
CREATE TABLE public.auditoria (
	id serial NOT NULL,
	usuario_id integer NOT NULL,
	tabela character varying(100) NOT NULL,
	operacao character varying(100) NOT NULL,
	dado_sobrescrito character varying(254) NOT NULL,
	dataehora timestamptz NOT NULL DEFAULT now(),
	CONSTRAINT auditoria_pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.auditoria OWNER TO root;
-- ddl-end --

-- object: cliente_fk | type: CONSTRAINT --
-- ALTER TABLE public.venda DROP CONSTRAINT IF EXISTS cliente_fk CASCADE;
ALTER TABLE public.venda ADD CONSTRAINT cliente_fk FOREIGN KEY (cliente_id)
REFERENCES public.cliente (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: venda_fk | type: CONSTRAINT --
-- ALTER TABLE public.vendaitem DROP CONSTRAINT IF EXISTS venda_fk CASCADE;
ALTER TABLE public.vendaitem ADD CONSTRAINT venda_fk FOREIGN KEY (venda_id)
REFERENCES public.venda (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: produto_fk | type: CONSTRAINT --
-- ALTER TABLE public.vendaitem DROP CONSTRAINT IF EXISTS produto_fk CASCADE;
ALTER TABLE public.vendaitem ADD CONSTRAINT produto_fk FOREIGN KEY (produto_id)
REFERENCES public.produto (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: perfil_fk | type: CONSTRAINT --
-- ALTER TABLE public.usuario DROP CONSTRAINT IF EXISTS perfil_fk CASCADE;
ALTER TABLE public.usuario ADD CONSTRAINT perfil_fk FOREIGN KEY (perfil_id)
REFERENCES public.perfil (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: perfil_fk | type: CONSTRAINT --
-- ALTER TABLE public.perfil_item DROP CONSTRAINT IF EXISTS perfil_fk CASCADE;
ALTER TABLE public.perfil_item ADD CONSTRAINT perfil_fk FOREIGN KEY (perfil_id)
REFERENCES public.perfil (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: permissao_fk | type: CONSTRAINT --
-- ALTER TABLE public.perfil_item DROP CONSTRAINT IF EXISTS permissao_fk CASCADE;
ALTER TABLE public.perfil_item ADD CONSTRAINT permissao_fk FOREIGN KEY (permissao_id)
REFERENCES public.permissao (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: usuario_fk | type: CONSTRAINT --
-- ALTER TABLE public.acesso DROP CONSTRAINT IF EXISTS usuario_fk CASCADE;
ALTER TABLE public.acesso ADD CONSTRAINT usuario_fk FOREIGN KEY (usuario_id)
REFERENCES public.usuario (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: permissao_fk | type: CONSTRAINT --
-- ALTER TABLE public.acesso DROP CONSTRAINT IF EXISTS permissao_fk CASCADE;
ALTER TABLE public.acesso ADD CONSTRAINT permissao_fk FOREIGN KEY (permissao_id)
REFERENCES public.permissao (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: usuario_fk | type: CONSTRAINT --
-- ALTER TABLE public.auditoria DROP CONSTRAINT IF EXISTS usuario_fk CASCADE;
ALTER TABLE public.auditoria ADD CONSTRAINT usuario_fk FOREIGN KEY (usuario_id)
REFERENCES public.usuario (id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

