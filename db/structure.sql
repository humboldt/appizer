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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- Name: form_emails; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE form_emails (
    id integer NOT NULL,
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
-- Name: form_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE form_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: form_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE form_emails_id_seq OWNED BY form_emails.id;


--
-- Name: form_fields; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE form_fields (
    id integer NOT NULL,
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
-- Name: form_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE form_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: form_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE form_fields_id_seq OWNED BY form_fields.id;


--
-- Name: form_rows; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE form_rows (
    id integer NOT NULL,
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
-- Name: form_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE form_rows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: form_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE form_rows_id_seq OWNED BY form_rows.id;


--
-- Name: form_structures; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE form_structures (
    id integer NOT NULL,
    email_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: form_structures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE form_structures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: form_structures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE form_structures_id_seq OWNED BY form_structures.id;


--
-- Name: rich_rich_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rich_rich_files (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    rich_file_file_name character varying,
    rich_file_content_type character varying,
    rich_file_file_size integer,
    rich_file_updated_at timestamp without time zone,
    owner_type character varying,
    owner_id integer,
    uri_cache text,
    simplified_type character varying DEFAULT 'file'::character varying
);


--
-- Name: rich_rich_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rich_rich_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rich_rich_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rich_rich_files_id_seq OWNED BY rich_rich_files.id;


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
-- Name: unique_keys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE unique_keys (
    id integer NOT NULL,
    viewable_type character varying,
    viewable_id integer,
    view_path text NOT NULL,
    name text NOT NULL,
    "position" integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: unique_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unique_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unique_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unique_keys_id_seq OWNED BY unique_keys.id;


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
    admin boolean DEFAULT false,
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
    object text,
    created_at timestamp without time zone,
    object_changes text,
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
-- Name: viewable_blocks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viewable_blocks (
    id integer NOT NULL,
    uuid character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: viewable_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE viewable_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: viewable_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE viewable_blocks_id_seq OWNED BY viewable_blocks.id;


--
-- Name: viewable_forms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viewable_forms (
    id integer NOT NULL,
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
-- Name: viewable_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE viewable_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: viewable_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE viewable_forms_id_seq OWNED BY viewable_forms.id;


--
-- Name: viewable_images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viewable_images (
    id integer NOT NULL,
    title character varying,
    image text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: viewable_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE viewable_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: viewable_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE viewable_images_id_seq OWNED BY viewable_images.id;


--
-- Name: viewable_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viewable_links (
    id integer NOT NULL,
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
-- Name: viewable_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE viewable_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: viewable_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE viewable_links_id_seq OWNED BY viewable_links.id;


--
-- Name: viewable_pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viewable_pages (
    id integer NOT NULL,
    uuid character varying,
    url text,
    title character varying,
    meta_keywords text,
    meta_description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: viewable_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE viewable_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: viewable_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE viewable_pages_id_seq OWNED BY viewable_pages.id;


--
-- Name: viewable_selects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viewable_selects (
    id integer NOT NULL,
    value character varying,
    label character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: viewable_selects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE viewable_selects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: viewable_selects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE viewable_selects_id_seq OWNED BY viewable_selects.id;


--
-- Name: viewable_strings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viewable_strings (
    id integer NOT NULL,
    string character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: viewable_strings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE viewable_strings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: viewable_strings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE viewable_strings_id_seq OWNED BY viewable_strings.id;


--
-- Name: viewable_texts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viewable_texts (
    id integer NOT NULL,
    title character varying,
    text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: viewable_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE viewable_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: viewable_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE viewable_texts_id_seq OWNED BY viewable_texts.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY form_emails ALTER COLUMN id SET DEFAULT nextval('form_emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY form_fields ALTER COLUMN id SET DEFAULT nextval('form_fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY form_rows ALTER COLUMN id SET DEFAULT nextval('form_rows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY form_structures ALTER COLUMN id SET DEFAULT nextval('form_structures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rich_rich_files ALTER COLUMN id SET DEFAULT nextval('rich_rich_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unique_keys ALTER COLUMN id SET DEFAULT nextval('unique_keys_id_seq'::regclass);


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
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY viewable_blocks ALTER COLUMN id SET DEFAULT nextval('viewable_blocks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY viewable_forms ALTER COLUMN id SET DEFAULT nextval('viewable_forms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY viewable_images ALTER COLUMN id SET DEFAULT nextval('viewable_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY viewable_links ALTER COLUMN id SET DEFAULT nextval('viewable_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY viewable_pages ALTER COLUMN id SET DEFAULT nextval('viewable_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY viewable_selects ALTER COLUMN id SET DEFAULT nextval('viewable_selects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY viewable_strings ALTER COLUMN id SET DEFAULT nextval('viewable_strings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY viewable_texts ALTER COLUMN id SET DEFAULT nextval('viewable_texts_id_seq'::regclass);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: form_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY form_emails
    ADD CONSTRAINT form_emails_pkey PRIMARY KEY (id);


--
-- Name: form_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY form_fields
    ADD CONSTRAINT form_fields_pkey PRIMARY KEY (id);


--
-- Name: form_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY form_rows
    ADD CONSTRAINT form_rows_pkey PRIMARY KEY (id);


--
-- Name: form_structures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY form_structures
    ADD CONSTRAINT form_structures_pkey PRIMARY KEY (id);


--
-- Name: rich_rich_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rich_rich_files
    ADD CONSTRAINT rich_rich_files_pkey PRIMARY KEY (id);


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
-- Name: unique_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY unique_keys
    ADD CONSTRAINT unique_keys_pkey PRIMARY KEY (id);


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
-- Name: viewable_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viewable_blocks
    ADD CONSTRAINT viewable_blocks_pkey PRIMARY KEY (id);


--
-- Name: viewable_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viewable_forms
    ADD CONSTRAINT viewable_forms_pkey PRIMARY KEY (id);


--
-- Name: viewable_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viewable_images
    ADD CONSTRAINT viewable_images_pkey PRIMARY KEY (id);


--
-- Name: viewable_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viewable_links
    ADD CONSTRAINT viewable_links_pkey PRIMARY KEY (id);


--
-- Name: viewable_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viewable_pages
    ADD CONSTRAINT viewable_pages_pkey PRIMARY KEY (id);


--
-- Name: viewable_selects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viewable_selects
    ADD CONSTRAINT viewable_selects_pkey PRIMARY KEY (id);


--
-- Name: viewable_strings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viewable_strings
    ADD CONSTRAINT viewable_strings_pkey PRIMARY KEY (id);


--
-- Name: viewable_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viewable_texts
    ADD CONSTRAINT viewable_texts_pkey PRIMARY KEY (id);


--
-- Name: index_form_fields_on_structure_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_form_fields_on_structure_id ON form_fields USING btree (structure_id);


--
-- Name: index_form_rows_on_structure_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_form_rows_on_structure_id ON form_rows USING btree (structure_id);


--
-- Name: index_form_structures_on_email_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_form_structures_on_email_id ON form_structures USING btree (email_id);


--
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_settings_on_name ON settings USING btree (name);


--
-- Name: index_unique_keys_on_unique_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_unique_keys_on_unique_key ON unique_keys USING btree (viewable_type, view_path, name, "position", locale);


--
-- Name: index_unique_keys_on_viewable_type_and_viewable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_unique_keys_on_viewable_type_and_viewable_id ON unique_keys USING btree (viewable_type, viewable_id);


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
-- Name: index_viewable_blocks_on_uuid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_viewable_blocks_on_uuid ON viewable_blocks USING btree (uuid);


--
-- Name: index_viewable_forms_on_structure_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_viewable_forms_on_structure_id ON viewable_forms USING btree (structure_id);


--
-- Name: index_viewable_forms_on_url; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_viewable_forms_on_url ON viewable_forms USING btree (url);


--
-- Name: index_viewable_forms_on_uuid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_viewable_forms_on_uuid ON viewable_forms USING btree (uuid);


--
-- Name: index_viewable_pages_on_url; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_viewable_pages_on_url ON viewable_pages USING btree (url);


--
-- Name: index_viewable_pages_on_uuid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_viewable_pages_on_uuid ON viewable_pages USING btree (uuid);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20111002142937'), ('20111117202133'), ('20111201095829'), ('20150111082038'), ('20150111082039'), ('20150111082040'), ('20150111082041'), ('20151226023652'), ('20151226054335'), ('20151227064933'), ('20151228231201'), ('20151230050603'), ('20151230072904'), ('20151230085947'), ('20151231054310'), ('20151231102148'), ('20160101124428'), ('20160101140244'), ('20160101141844'), ('20160102010317'), ('20160103120544'), ('20160111072418'), ('20160201181310'), ('20160214200553'), ('20160216142231');


