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
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    account_id uuid,
    user_id uuid,
    last_accessed_at timestamp without time zone,
    admin boolean DEFAULT false NOT NULL,
    "primary" boolean DEFAULT false NOT NULL
);


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE accounts (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    legal_name character varying NOT NULL
);


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
-- Name: nice_form_emails; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_form_emails (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    with_email boolean DEFAULT false,
    send_to character varying,
    subject_fr character varying,
    subject_en character varying,
    body_fr text,
    body_en text
);


--
-- Name: nice_form_fields; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_form_fields (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    structure_id uuid,
    "position" integer,
    type character varying,
    required boolean DEFAULT false,
    label_fr character varying,
    label_en character varying
);


--
-- Name: nice_form_rows; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_form_rows (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    structure_id uuid,
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
    column_19 text
);


--
-- Name: nice_form_structures; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_form_structures (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    email_id uuid
);


--
-- Name: nice_unique_keys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_unique_keys (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    viewable_type character varying,
    viewable_id uuid,
    view_path text NOT NULL,
    name text NOT NULL,
    "position" integer NOT NULL,
    locale character varying NOT NULL
);


--
-- Name: nice_viewable_blocks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_viewable_blocks (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    uuid character varying
);


--
-- Name: nice_viewable_forms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_viewable_forms (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    structure_id uuid,
    uuid character varying,
    url text,
    title character varying,
    meta_keywords text,
    meta_description text
);


--
-- Name: nice_viewable_images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_viewable_images (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    title character varying,
    image text
);


--
-- Name: nice_viewable_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_viewable_links (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    title character varying,
    url text,
    page text,
    file text,
    target_blank boolean DEFAULT false,
    turbolink boolean DEFAULT true
);


--
-- Name: nice_viewable_pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_viewable_pages (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    uuid character varying,
    url text,
    title character varying,
    meta_keywords text,
    meta_description text
);


--
-- Name: nice_viewable_selects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_viewable_selects (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    value character varying,
    label character varying
);


--
-- Name: nice_viewable_strings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_viewable_strings (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    string character varying
);


--
-- Name: nice_viewable_texts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nice_viewable_texts (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    title character varying,
    text text
);


--
-- Name: rich_rich_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rich_rich_files (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
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
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE settings (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    name character varying,
    value text,
    unit character varying
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
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
    admin boolean DEFAULT false NOT NULL
);


--
-- Name: version_associations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE version_associations (
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    version_id integer,
    foreign_key_name character varying NOT NULL,
    foreign_key_id integer
);


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE versions (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid DEFAULT uuid_generate_v1mc() NOT NULL,
    item_type character varying NOT NULL,
    item_id integer NOT NULL,
    event character varying NOT NULL,
    whodunnit character varying,
    object text,
    object_changes text,
    transaction_id integer
);


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
-- Name: nice_form_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_form_emails
    ADD CONSTRAINT nice_form_emails_pkey PRIMARY KEY (id);


--
-- Name: nice_form_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_form_fields
    ADD CONSTRAINT nice_form_fields_pkey PRIMARY KEY (id);


--
-- Name: nice_form_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_form_rows
    ADD CONSTRAINT nice_form_rows_pkey PRIMARY KEY (id);


--
-- Name: nice_form_structures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_form_structures
    ADD CONSTRAINT nice_form_structures_pkey PRIMARY KEY (id);


--
-- Name: nice_unique_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_unique_keys
    ADD CONSTRAINT nice_unique_keys_pkey PRIMARY KEY (id);


--
-- Name: nice_viewable_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_viewable_blocks
    ADD CONSTRAINT nice_viewable_blocks_pkey PRIMARY KEY (id);


--
-- Name: nice_viewable_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_viewable_forms
    ADD CONSTRAINT nice_viewable_forms_pkey PRIMARY KEY (id);


--
-- Name: nice_viewable_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_viewable_images
    ADD CONSTRAINT nice_viewable_images_pkey PRIMARY KEY (id);


--
-- Name: nice_viewable_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_viewable_links
    ADD CONSTRAINT nice_viewable_links_pkey PRIMARY KEY (id);


--
-- Name: nice_viewable_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_viewable_pages
    ADD CONSTRAINT nice_viewable_pages_pkey PRIMARY KEY (id);


--
-- Name: nice_viewable_selects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_viewable_selects
    ADD CONSTRAINT nice_viewable_selects_pkey PRIMARY KEY (id);


--
-- Name: nice_viewable_strings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_viewable_strings
    ADD CONSTRAINT nice_viewable_strings_pkey PRIMARY KEY (id);


--
-- Name: nice_viewable_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nice_viewable_texts
    ADD CONSTRAINT nice_viewable_texts_pkey PRIMARY KEY (id);


--
-- Name: rich_rich_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rich_rich_files
    ADD CONSTRAINT rich_rich_images_pkey PRIMARY KEY (id);


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
-- Name: index_account_users_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_account_users_on_created_at ON account_users USING btree (created_at);


--
-- Name: index_account_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_account_users_on_user_id ON account_users USING btree (user_id);


--
-- Name: index_accounts_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_accounts_on_created_at ON accounts USING btree (created_at);


--
-- Name: index_accounts_on_legal_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_accounts_on_legal_name ON accounts USING btree (legal_name);


--
-- Name: index_nice_form_emails_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_form_emails_on_created_at ON nice_form_emails USING btree (created_at);


--
-- Name: index_nice_form_fields_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_form_fields_on_created_at ON nice_form_fields USING btree (created_at);


--
-- Name: index_nice_form_fields_on_structure_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_form_fields_on_structure_id ON nice_form_fields USING btree (structure_id);


--
-- Name: index_nice_form_rows_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_form_rows_on_created_at ON nice_form_rows USING btree (created_at);


--
-- Name: index_nice_form_rows_on_structure_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_form_rows_on_structure_id ON nice_form_rows USING btree (structure_id);


--
-- Name: index_nice_form_structures_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_form_structures_on_created_at ON nice_form_structures USING btree (created_at);


--
-- Name: index_nice_form_structures_on_email_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_form_structures_on_email_id ON nice_form_structures USING btree (email_id);


--
-- Name: index_nice_unique_keys_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_unique_keys_on_created_at ON nice_unique_keys USING btree (created_at);


--
-- Name: index_nice_unique_keys_on_unique_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_nice_unique_keys_on_unique_key ON nice_unique_keys USING btree (viewable_type, view_path, name, "position", locale);


--
-- Name: index_nice_unique_keys_on_viewable_type_and_viewable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_unique_keys_on_viewable_type_and_viewable_id ON nice_unique_keys USING btree (viewable_type, viewable_id);


--
-- Name: index_nice_viewable_blocks_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_viewable_blocks_on_created_at ON nice_viewable_blocks USING btree (created_at);


--
-- Name: index_nice_viewable_forms_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_viewable_forms_on_created_at ON nice_viewable_forms USING btree (created_at);


--
-- Name: index_nice_viewable_forms_on_structure_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_viewable_forms_on_structure_id ON nice_viewable_forms USING btree (structure_id);


--
-- Name: index_nice_viewable_images_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_viewable_images_on_created_at ON nice_viewable_images USING btree (created_at);


--
-- Name: index_nice_viewable_links_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_viewable_links_on_created_at ON nice_viewable_links USING btree (created_at);


--
-- Name: index_nice_viewable_pages_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_viewable_pages_on_created_at ON nice_viewable_pages USING btree (created_at);


--
-- Name: index_nice_viewable_selects_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_viewable_selects_on_created_at ON nice_viewable_selects USING btree (created_at);


--
-- Name: index_nice_viewable_strings_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_viewable_strings_on_created_at ON nice_viewable_strings USING btree (created_at);


--
-- Name: index_nice_viewable_texts_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_nice_viewable_texts_on_created_at ON nice_viewable_texts USING btree (created_at);


--
-- Name: index_rich_rich_files_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rich_rich_files_on_created_at ON rich_rich_files USING btree (created_at);


--
-- Name: index_settings_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_settings_on_created_at ON settings USING btree (created_at);


--
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_settings_on_name ON settings USING btree (name);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_created_at ON users USING btree (created_at);


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
-- Name: index_versions_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_created_at ON versions USING btree (created_at);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: index_versions_on_transaction_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_transaction_id ON versions USING btree (transaction_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150110040652'), ('20150111082038'), ('20150111082039'), ('20150111082040'), ('20150111082041'), ('20151222142937'), ('20151222202133'), ('20151222225829'), ('20151226023652'), ('20151226054335'), ('20151227064933'), ('20151228231201'), ('20151230050603'), ('20151230072904'), ('20151230085947'), ('20151231054310'), ('20151231102148'), ('20160101124428'), ('20160101140244'), ('20160101141844'), ('20160102010317'), ('20160103120544'), ('20160111072418'), ('20160201181310'), ('20160214200553'), ('20160216142231'), ('20160629052658'), ('20160629061404');


