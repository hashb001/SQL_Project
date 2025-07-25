PGDMP  .    5                }            AcademiaExchange    17.5    17.5     9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            <           1262    24576    AcademiaExchange    DATABASE     �   CREATE DATABASE "AcademiaExchange" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 "   DROP DATABASE "AcademiaExchange";
                     postgres    false            �            1259    24588 	   materials    TABLE     \  CREATE TABLE public.materials (
    material_id character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    is_available boolean DEFAULT true NOT NULL,
    seller_id character varying(30),
    attributes jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT materials_type_check CHECK (((type)::text = ANY ((ARRAY['textbook'::character varying, 'classnotes'::character varying, 'hardware'::character varying])::text[])))
);
    DROP TABLE public.materials;
       public         heap r       postgres    false            =           0    0    TABLE materials    ACL     �   GRANT SELECT,INSERT,UPDATE ON TABLE public.materials TO academia_seller;
GRANT SELECT ON TABLE public.materials TO academia_buyer;
GRANT ALL ON TABLE public.materials TO academia_admin;
          public               postgres    false    217            �            1259    24605    transactions    TABLE     L  CREATE TABLE public.transactions (
    transaction_id character varying(50) NOT NULL,
    buyer_id character varying(30),
    seller_id character varying(30),
    material_id character varying(50),
    transaction_date date NOT NULL,
    amount numeric(10,2) NOT NULL,
    status character varying(20) DEFAULT 'pending'::character varying,
    contact_shared boolean DEFAULT false,
    details jsonb,
    CONSTRAINT transactions_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'completed'::character varying, 'cancelled'::character varying])::text[])))
);
     DROP TABLE public.transactions;
       public         heap r       postgres    false            >           0    0    TABLE transactions    ACL     �   GRANT SELECT,INSERT ON TABLE public.transactions TO academia_seller;
GRANT INSERT ON TABLE public.transactions TO academia_buyer;
GRANT ALL ON TABLE public.transactions TO academia_admin;
          public               postgres    false    218            �            1259    24630    users    TABLE     9  CREATE TABLE public.users (
    user_id character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    password_hash character varying(255) NOT NULL,
    role character varying(10) NOT NULL,
    department character varying(50),
    phone character varying(20),
    contact_preferences jsonb DEFAULT '{"allow_email": true, "allow_phone": true}'::jsonb,
    metadata jsonb,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['student'::character varying, 'admin'::character varying])::text[])))
);
    DROP TABLE public.users;
       public         heap r       postgres    false            ?           0    0    TABLE users    ACL     �   GRANT ALL ON TABLE public.users TO academia_admin;
GRANT SELECT ON TABLE public.users TO academia_buyer;
GRANT SELECT ON TABLE public.users TO academia_seller;
          public               postgres    false    219            @           0    0    COLUMN users.name    ACL     y   GRANT UPDATE(name) ON TABLE public.users TO academia_buyer;
GRANT UPDATE(name) ON TABLE public.users TO academia_seller;
          public               postgres    false    219    4927            A           0    0    COLUMN users.role    ACL     <   GRANT UPDATE(role) ON TABLE public.users TO academia_admin;
          public               postgres    false    219    4927            B           0    0     COLUMN users.contact_preferences    ACL     �   GRANT UPDATE(contact_preferences) ON TABLE public.users TO academia_buyer;
GRANT UPDATE(contact_preferences) ON TABLE public.users TO academia_seller;
          public               postgres    false    219    4927            4          0    24588 	   materials 
   TABLE DATA           �   COPY public.materials (material_id, type, description, price, is_available, seller_id, attributes, created_at, updated_at) FROM stdin;
    public               postgres    false    217   Z        5          0    24605    transactions 
   TABLE DATA           �   COPY public.transactions (transaction_id, buyer_id, seller_id, material_id, transaction_date, amount, status, contact_shared, details) FROM stdin;
    public               postgres    false    218   	"       6          0    24630    users 
   TABLE DATA           |   COPY public.users (user_id, name, email, password_hash, role, department, phone, contact_preferences, metadata) FROM stdin;
    public               postgres    false    219   �"       �           2606    24599    materials materials_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (material_id);
 B   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_pkey;
       public                 postgres    false    217            �           2606    24614    transactions transactions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);
 H   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkey;
       public                 postgres    false    218            �           2606    24640    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    219            �           2606    24638    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    219            �           2606    24625 *   transactions transactions_material_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(material_id);
 T   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_material_id_fkey;
       public               postgres    false    218    217    4760            1           0    24605    transactions    ROW SECURITY     :   ALTER TABLE public.transactions ENABLE ROW LEVEL SECURITY;          public               postgres    false    218            3           3256    24649 %   transactions user_transactions_policy    POLICY     �   CREATE POLICY user_transactions_policy ON public.transactions FOR SELECT USING ((((buyer_id)::text = CURRENT_USER) OR ((seller_id)::text = CURRENT_USER)));
 =   DROP POLICY user_transactions_policy ON public.transactions;
       public               postgres    false    218    218    218            2           0    24630    users    ROW SECURITY     3   ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;          public               postgres    false    219            4   �  x���QO�0ǟ�Oa����8u���*0Mk�)�M��Ej#�C�!´�>D���~?�y���$��P[{GNe���H�GpOW�4x<���@��5@J����a��E	?�S1g�(C���C-�>i�9d���_�3����$-)�.i1-E��	���&��<#M+�76��i\ׄΡ�k�b�f�V�G�G�.�6Yd��[��:p�<����s�K�Z���ϮNϏ?#;�ԃtH�Nu��H/]@G��@��@\;iTO�����
�>������4m��﬑u�1�JU�ؐ�O��!���	Ϊ8�؂K���:v{OR����߫�sYV�J�f()�����E�����#xLV7���f����T�e|	�^Y��ok���
I1~c �ә�"F���4I����M      5   �   x�m�=�0��9�%�-�h����

B	�i��i���MȠ����ϕ�=@N��s�a�٭�|��"��s��Ⱦ5:Tđ����ƖI1I��F?ю~dF���0�5bl�sU���U�I�J�J
�؛�������џ}�9�E�vʓ���_p��1���jo]2J��2Cw      6   �   x������0���)�ו�V��i�E/�ŃP(����$-i��kkYX��:�����Or<�~ �P��=
���|�7�F��
���f���I[�:��#��`��	JY_3RX�ɒY�є��FԚ��ҝ��xk��B�O�v^9��O��7�/P�/�����7hJ��s�I��>rt�3w�����?����,�,�Cp�sw����O��y[���     