--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE account_users (
    id integer NOT NULL,
    account_id integer,
    user_id integer,
    admin boolean DEFAULT false NOT NULL,
    "primary" boolean DEFAULT false NOT NULL,
    last_accessed_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: account_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_users_id_seq OWNED BY account_users.id;


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    legal_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_form_emails; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_form_emails (
    id integer NOT NULL,
    account_id integer,
    with_email boolean DEFAULT false,
    send_to character varying,
    subject_fr character varying,
    subject_en character varying,
    body_fr text,
    body_en text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_form_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_form_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_form_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_form_emails_id_seq OWNED BY cms_form_emails.id;


--
-- Name: cms_form_fields; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_form_fields (
    id integer NOT NULL,
    account_id integer,
    structure_id integer,
    "position" integer,
    type character varying,
    required boolean DEFAULT false,
    label_fr character varying,
    label_en character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_form_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_form_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_form_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_form_fields_id_seq OWNED BY cms_form_fields.id;


--
-- Name: cms_form_rows; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_form_rows (
    id integer NOT NULL,
    account_id integer,
    structure_id integer,
    locale character varying,
    column_0 text,
    column_1 text,
    column_2 text,
    column_3 text,
    column_4 text,
    column_5 text,
    column_6 text,
    column_7 text,
    column_8 text,
    column_9 text,
    column_10 text,
    column_11 text,
    column_12 text,
    column_13 text,
    column_14 text,
    column_15 text,
    column_16 text,
    column_17 text,
    column_18 text,
    column_19 text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_form_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_form_rows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_form_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_form_rows_id_seq OWNED BY cms_form_rows.id;


--
-- Name: cms_form_structures; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_form_structures (
    id integer NOT NULL,
    account_id integer,
    email_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_form_structures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_form_structures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_form_structures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_form_structures_id_seq OWNED BY cms_form_structures.id;


--
-- Name: cms_unique_keys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_unique_keys (
    id integer NOT NULL,
    account_id integer,
    viewable_type character varying,
    viewable_id integer,
    view_path text NOT NULL,
    name character varying NOT NULL,
    "position" integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_unique_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_unique_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_unique_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_unique_keys_id_seq OWNED BY cms_unique_keys.id;


--
-- Name: cms_viewable_blocks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_viewable_blocks (
    id integer NOT NULL,
    account_id integer,
    uuid character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_viewable_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_viewable_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_viewable_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_viewable_blocks_id_seq OWNED BY cms_viewable_blocks.id;


--
-- Name: cms_viewable_forms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_viewable_forms (
    id integer NOT NULL,
    account_id integer,
    structure_id integer,
    uuid character varying,
    url text,
    title character varying,
    meta_keywords text,
    meta_description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_viewable_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_viewable_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_viewable_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_viewable_forms_id_seq OWNED BY cms_viewable_forms.id;


--
-- Name: cms_viewable_images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_viewable_images (
    id integer NOT NULL,
    account_id integer,
    title character varying,
    image text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_viewable_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_viewable_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_viewable_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_viewable_images_id_seq OWNED BY cms_viewable_images.id;


--
-- Name: cms_viewable_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_viewable_links (
    id integer NOT NULL,
    account_id integer,
    title character varying,
    url text,
    page text,
    file text,
    target_blank boolean DEFAULT false,
    turbolink boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_viewable_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_viewable_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_viewable_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_viewable_links_id_seq OWNED BY cms_viewable_links.id;


--
-- Name: cms_viewable_pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_viewable_pages (
    id integer NOT NULL,
    account_id integer,
    uuid character varying,
    url text,
    title character varying,
    meta_keywords text,
    meta_description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_viewable_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_viewable_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_viewable_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_viewable_pages_id_seq OWNED BY cms_viewable_pages.id;


--
-- Name: cms_viewable_selects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_viewable_selects (
    id integer NOT NULL,
    account_id integer,
    value character varying,
    label character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_viewable_selects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_viewable_selects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_viewable_selects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_viewable_selects_id_seq OWNED BY cms_viewable_selects.id;


--
-- Name: cms_viewable_strings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_viewable_strings (
    id integer NOT NULL,
    account_id integer,
    string character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_viewable_strings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_viewable_strings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_viewable_strings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_viewable_strings_id_seq OWNED BY cms_viewable_strings.id;


--
-- Name: cms_viewable_texts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cms_viewable_texts (
    id integer NOT NULL,
    account_id integer,
    title character varying,
    text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cms_viewable_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cms_viewable_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cms_viewable_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cms_viewable_texts_id_seq OWNED BY cms_viewable_texts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    name character varying,
    value text,
    unit character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    password_salt character varying,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    admin boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: version_associations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE version_associations (
    id integer NOT NULL,
    version_id integer,
    foreign_key_name character varying NOT NULL,
    foreign_key_id integer
);


--
-- Name: version_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE version_associations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: version_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE version_associations_id_seq OWNED BY version_associations.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE versions (
    id integer NOT NULL,
    item_type character varying NOT NULL,
    item_id integer NOT NULL,
    event character varying NOT NULL,
    whodunnit character varying,
    object json DEFAULT '{}'::json NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    object_changes json DEFAULT '{}'::json NOT NULL,
    transaction_id integer
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_users ALTER COLUMN id SET DEFAULT nextval('account_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_form_emails ALTER COLUMN id SET DEFAULT nextval('cms_form_emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_form_fields ALTER COLUMN id SET DEFAULT nextval('cms_form_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_form_rows ALTER COLUMN id SET DEFAULT nextval('cms_form_rows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_form_structures ALTER COLUMN id SET DEFAULT nextval('cms_form_structures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_unique_keys ALTER COLUMN id SET DEFAULT nextval('cms_unique_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_blocks ALTER COLUMN id SET DEFAULT nextval('cms_viewable_blocks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_forms ALTER COLUMN id SET DEFAULT nextval('cms_viewable_forms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_images ALTER COLUMN id SET DEFAULT nextval('cms_viewable_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_links ALTER COLUMN id SET DEFAULT nextval('cms_viewable_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_pages ALTER COLUMN id SET DEFAULT nextval('cms_viewable_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_selects ALTER COLUMN id SET DEFAULT nextval('cms_viewable_selects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_strings ALTER COLUMN id SET DEFAULT nextval('cms_viewable_strings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_texts ALTER COLUMN id SET DEFAULT nextval('cms_viewable_texts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY version_associations ALTER COLUMN id SET DEFAULT nextval('version_associations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: account_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_users
    ADD CONSTRAINT account_users_pkey PRIMARY KEY (id);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cms_form_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_form_emails
    ADD CONSTRAINT cms_form_emails_pkey PRIMARY KEY (id);


--
-- Name: cms_form_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_form_fields
    ADD CONSTRAINT cms_form_fields_pkey PRIMARY KEY (id);


--
-- Name: cms_form_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_form_rows
    ADD CONSTRAINT cms_form_rows_pkey PRIMARY KEY (id);


--
-- Name: cms_form_structures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_form_structures
    ADD CONSTRAINT cms_form_structures_pkey PRIMARY KEY (id);


--
-- Name: cms_unique_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_unique_keys
    ADD CONSTRAINT cms_unique_keys_pkey PRIMARY KEY (id);


--
-- Name: cms_viewable_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_viewable_blocks
    ADD CONSTRAINT cms_viewable_blocks_pkey PRIMARY KEY (id);


--
-- Name: cms_viewable_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_viewable_forms
    ADD CONSTRAINT cms_viewable_forms_pkey PRIMARY KEY (id);


--
-- Name: cms_viewable_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_viewable_images
    ADD CONSTRAINT cms_viewable_images_pkey PRIMARY KEY (id);


--
-- Name: cms_viewable_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_viewable_links
    ADD CONSTRAINT cms_viewable_links_pkey PRIMARY KEY (id);


--
-- Name: cms_viewable_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_viewable_pages
    ADD CONSTRAINT cms_viewable_pages_pkey PRIMARY KEY (id);


--
-- Name: cms_viewable_selects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_viewable_selects
    ADD CONSTRAINT cms_viewable_selects_pkey PRIMARY KEY (id);


--
-- Name: cms_viewable_strings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_viewable_strings
    ADD CONSTRAINT cms_viewable_strings_pkey PRIMARY KEY (id);


--
-- Name: cms_viewable_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cms_viewable_texts
    ADD CONSTRAINT cms_viewable_texts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: version_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY version_associations
    ADD CONSTRAINT version_associations_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: index_account_users_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_account_users_on_account_id ON account_users USING btree (account_id);


--
-- Name: index_account_users_on_account_id_and_admin; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_account_users_on_account_id_and_admin ON account_users USING btree (account_id, admin);


--
-- Name: index_account_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_account_users_on_user_id ON account_users USING btree (user_id);


--
-- Name: index_account_users_on_user_id_and_admin; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_account_users_on_user_id_and_admin ON account_users USING btree (user_id, admin);


--
-- Name: index_account_users_on_user_id_and_last_accessed_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_account_users_on_user_id_and_last_accessed_at ON account_users USING btree (user_id, last_accessed_at);


--
-- Name: index_account_users_on_user_id_and_primary; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_account_users_on_user_id_and_primary ON account_users USING btree (user_id, "primary");


--
-- Name: index_accounts_on_legal_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_accounts_on_legal_name ON accounts USING btree (legal_name);


--
-- Name: index_cms_form_emails_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_form_emails_on_account_id ON cms_form_emails USING btree (account_id);


--
-- Name: index_cms_form_fields_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_form_fields_on_account_id ON cms_form_fields USING btree (account_id);


--
-- Name: index_cms_form_fields_on_structure_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_form_fields_on_structure_id ON cms_form_fields USING btree (structure_id);


--
-- Name: index_cms_form_rows_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_form_rows_on_account_id ON cms_form_rows USING btree (account_id);


--
-- Name: index_cms_form_rows_on_structure_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_form_rows_on_structure_id ON cms_form_rows USING btree (structure_id);


--
-- Name: index_cms_form_structures_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_form_structures_on_account_id ON cms_form_structures USING btree (account_id);


--
-- Name: index_cms_form_structures_on_email_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_form_structures_on_email_id ON cms_form_structures USING btree (email_id);


--
-- Name: index_cms_unique_keys_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_unique_keys_on_account_id ON cms_unique_keys USING btree (account_id);


--
-- Name: index_cms_unique_keys_on_unique_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_cms_unique_keys_on_unique_key ON cms_unique_keys USING btree (viewable_type, view_path, name, "position", locale);


--
-- Name: index_cms_unique_keys_on_viewable_type_and_viewable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_unique_keys_on_viewable_type_and_viewable_id ON cms_unique_keys USING btree (viewable_type, viewable_id);


--
-- Name: index_cms_viewable_blocks_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_blocks_on_account_id ON cms_viewable_blocks USING btree (account_id);


--
-- Name: index_cms_viewable_blocks_on_uuid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_blocks_on_uuid ON cms_viewable_blocks USING btree (uuid);


--
-- Name: index_cms_viewable_forms_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_forms_on_account_id ON cms_viewable_forms USING btree (account_id);


--
-- Name: index_cms_viewable_forms_on_structure_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_forms_on_structure_id ON cms_viewable_forms USING btree (structure_id);


--
-- Name: index_cms_viewable_forms_on_url; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_forms_on_url ON cms_viewable_forms USING btree (url);


--
-- Name: index_cms_viewable_forms_on_uuid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_forms_on_uuid ON cms_viewable_forms USING btree (uuid);


--
-- Name: index_cms_viewable_images_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_images_on_account_id ON cms_viewable_images USING btree (account_id);


--
-- Name: index_cms_viewable_links_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_links_on_account_id ON cms_viewable_links USING btree (account_id);


--
-- Name: index_cms_viewable_pages_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_pages_on_account_id ON cms_viewable_pages USING btree (account_id);


--
-- Name: index_cms_viewable_pages_on_url; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_pages_on_url ON cms_viewable_pages USING btree (url);


--
-- Name: index_cms_viewable_pages_on_uuid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_pages_on_uuid ON cms_viewable_pages USING btree (uuid);


--
-- Name: index_cms_viewable_selects_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_selects_on_account_id ON cms_viewable_selects USING btree (account_id);


--
-- Name: index_cms_viewable_strings_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_strings_on_account_id ON cms_viewable_strings USING btree (account_id);


--
-- Name: index_cms_viewable_texts_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_viewable_texts_on_account_id ON cms_viewable_texts USING btree (account_id);


--
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_settings_on_name ON settings USING btree (name);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_version_associations_on_foreign_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_version_associations_on_foreign_key ON version_associations USING btree (foreign_key_name, foreign_key_id);


--
-- Name: index_version_associations_on_version_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_version_associations_on_version_id ON version_associations USING btree (version_id);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: index_versions_on_transaction_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_transaction_id ON versions USING btree (transaction_id);


--
-- Name: fk_rails_10b2c2bb98; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_unique_keys
    ADD CONSTRAINT fk_rails_10b2c2bb98 FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_12e64f0f70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_strings
    ADD CONSTRAINT fk_rails_12e64f0f70 FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_2e19d8bc85; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_texts
    ADD CONSTRAINT fk_rails_2e19d8bc85 FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_48bdcb6580; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_links
    ADD CONSTRAINT fk_rails_48bdcb6580 FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_6f0c24c06b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_form_rows
    ADD CONSTRAINT fk_rails_6f0c24c06b FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_73b445ffff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_forms
    ADD CONSTRAINT fk_rails_73b445ffff FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_9bf37c8752; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_images
    ADD CONSTRAINT fk_rails_9bf37c8752 FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_9cdc83a02b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_pages
    ADD CONSTRAINT fk_rails_9cdc83a02b FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_9fcf2a65c0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_form_structures
    ADD CONSTRAINT fk_rails_9fcf2a65c0 FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_ac00226969; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_form_fields
    ADD CONSTRAINT fk_rails_ac00226969 FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_aca2812a81; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_selects
    ADD CONSTRAINT fk_rails_aca2812a81 FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_c2e484da4a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_form_emails
    ADD CONSTRAINT fk_rails_c2e484da4a FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- Name: fk_rails_ee682660f0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cms_viewable_blocks
    ADD CONSTRAINT fk_rails_ee682660f0 FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150110040652'), ('20150110040653'), ('20150110040654'), ('20150111082038'), ('20150111082039'), ('20150111082040'), ('20150111082041'), ('20151226023652'), ('20151226054335'), ('20151227064933'), ('20151228231201'), ('20151230050603'), ('20151230072904'), ('20151230085947'), ('20151231054310'), ('20151231102148'), ('20160101124428'), ('20160101140244'), ('20160101141844'), ('20160102010317'), ('20160103120544'), ('20160111072418'), ('20160201181310'), ('20160214200553'), ('20160216142231'), ('20160629061404');


