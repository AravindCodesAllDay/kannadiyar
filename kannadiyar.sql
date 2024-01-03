PGDMP                      {         
   kannadiyar    16.0    16.0 P    P           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            R           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            S           1262    24685 
   kannadiyar    DATABASE     }   CREATE DATABASE kannadiyar WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE kannadiyar;
                postgres    false            �            1259    24686    admin    TABLE     v   CREATE TABLE public.admin (
    username character varying(20),
    password character varying(20),
    id integer
);
    DROP TABLE public.admin;
       public         heap    postgres    false            �            1259    24689 	   carousels    TABLE     \   CREATE TABLE public.carousels (
    id integer NOT NULL,
    photo text,
    pid integer
);
    DROP TABLE public.carousels;
       public         heap    postgres    false            �            1259    24694    carousels_id_seq    SEQUENCE     �   CREATE SEQUENCE public.carousels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.carousels_id_seq;
       public          postgres    false    216            T           0    0    carousels_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.carousels_id_seq OWNED BY public.carousels.id;
          public          postgres    false    217            �            1259    24695    category    TABLE     v   CREATE TABLE public.category (
    id integer NOT NULL,
    category text,
    sub_category text[],
    image text
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    24700    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    218            U           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    219            �            1259    24701    checkout_sessions    TABLE     ?   CREATE TABLE public.checkout_sessions (
    session_id text
);
 %   DROP TABLE public.checkout_sessions;
       public         heap    postgres    false            �            1259    24706    customer_address    TABLE       CREATE TABLE public.customer_address (
    id integer NOT NULL,
    cust_id integer,
    name text,
    phone text,
    pincode text,
    locality text,
    address text,
    state text,
    district text,
    town text,
    zip text,
    email text,
    others text
);
 $   DROP TABLE public.customer_address;
       public         heap    postgres    false            �            1259    24711    customer_address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.customer_address_id_seq;
       public          postgres    false    221            V           0    0    customer_address_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.customer_address_id_seq OWNED BY public.customer_address.id;
          public          postgres    false    222            �            1259    24712    customer_cart    TABLE     �   CREATE TABLE public.customer_cart (
    id integer NOT NULL,
    customer_id integer,
    product_id integer,
    quantity integer
);
 !   DROP TABLE public.customer_cart;
       public         heap    postgres    false            �            1259    24715    customer_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.customer_cart_id_seq;
       public          postgres    false    223            W           0    0    customer_cart_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.customer_cart_id_seq OWNED BY public.customer_cart.id;
          public          postgres    false    224            �            1259    24716    customer_details    TABLE     �   CREATE TABLE public.customer_details (
    first_name text,
    last_name text,
    email text,
    password text,
    cust_id integer NOT NULL,
    phone_number text,
    secret_ques text,
    secret_ques_ans text
);
 $   DROP TABLE public.customer_details;
       public         heap    postgres    false            �            1259    24721    customer_details_cust_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_details_cust_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.customer_details_cust_id_seq;
       public          postgres    false    225            X           0    0    customer_details_cust_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.customer_details_cust_id_seq OWNED BY public.customer_details.cust_id;
          public          postgres    false    226            �            1259    24722    order_details    TABLE     
  CREATE TABLE public.order_details (
    id integer NOT NULL,
    address text,
    status text,
    unit_price text,
    product_name text,
    phone_number text,
    order_id text,
    quantity text,
    customer_name text,
    cust_id text,
    prod_id integer
);
 !   DROP TABLE public.order_details;
       public         heap    postgres    false            �            1259    24727    order_details_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.order_details_id_seq;
       public          postgres    false    227            Y           0    0    order_details_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;
          public          postgres    false    228            �            1259    24728    poster    TABLE     Y   CREATE TABLE public.poster (
    id integer NOT NULL,
    photo text,
    pid integer
);
    DROP TABLE public.poster;
       public         heap    postgres    false            �            1259    24733    poster_id_seq    SEQUENCE     �   CREATE SEQUENCE public.poster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.poster_id_seq;
       public          postgres    false    229            Z           0    0    poster_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.poster_id_seq OWNED BY public.poster.id;
          public          postgres    false    230            �            1259    24734    product_details    TABLE     �  CREATE TABLE public.product_details (
    id integer NOT NULL,
    product_category text,
    mrp double precision,
    weight text,
    product_name text,
    created_at text,
    modified_at text,
    image text,
    description text,
    stock text,
    tax text,
    images text[],
    sub_category text,
    botanical_name text,
    tamil_name text,
    discount_price double precision
);
 #   DROP TABLE public.product_details;
       public         heap    postgres    false            �            1259    24739    product_details_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_details_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.product_details_product_id_seq;
       public          postgres    false    231            [           0    0    product_details_product_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.product_details_product_id_seq OWNED BY public.product_details.id;
          public          postgres    false    232            �            1259    24740    product_ratings    TABLE     �   CREATE TABLE public.product_ratings (
    product_id text,
    product_review text,
    customer_name text,
    title text,
    submitted_date date DEFAULT CURRENT_DATE,
    star_rating double precision
);
 #   DROP TABLE public.product_ratings;
       public         heap    postgres    false            �            1259    24746    reviews    TABLE     �   CREATE TABLE public.reviews (
    id integer NOT NULL,
    user_name text,
    content text,
    replies text,
    replied_by text
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    24751    reviews_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public          postgres    false    234            \           0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public          postgres    false    235            �            1259    24752    wishlist    TABLE     d   CREATE TABLE public.wishlist (
    id integer NOT NULL,
    prod_id integer,
    cust_id integer
);
    DROP TABLE public.wishlist;
       public         heap    postgres    false            �            1259    24755    wishlist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wishlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.wishlist_id_seq;
       public          postgres    false    236            ]           0    0    wishlist_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.wishlist_id_seq OWNED BY public.wishlist.id;
          public          postgres    false    237            �           2604    24756    carousels id    DEFAULT     l   ALTER TABLE ONLY public.carousels ALTER COLUMN id SET DEFAULT nextval('public.carousels_id_seq'::regclass);
 ;   ALTER TABLE public.carousels ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            �           2604    24757    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            �           2604    24758    customer_address id    DEFAULT     z   ALTER TABLE ONLY public.customer_address ALTER COLUMN id SET DEFAULT nextval('public.customer_address_id_seq'::regclass);
 B   ALTER TABLE public.customer_address ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            �           2604    24759    customer_cart id    DEFAULT     t   ALTER TABLE ONLY public.customer_cart ALTER COLUMN id SET DEFAULT nextval('public.customer_cart_id_seq'::regclass);
 ?   ALTER TABLE public.customer_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            �           2604    24760    customer_details cust_id    DEFAULT     �   ALTER TABLE ONLY public.customer_details ALTER COLUMN cust_id SET DEFAULT nextval('public.customer_details_cust_id_seq'::regclass);
 G   ALTER TABLE public.customer_details ALTER COLUMN cust_id DROP DEFAULT;
       public          postgres    false    226    225            �           2604    24761    order_details id    DEFAULT     t   ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);
 ?   ALTER TABLE public.order_details ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227            �           2604    24762 	   poster id    DEFAULT     f   ALTER TABLE ONLY public.poster ALTER COLUMN id SET DEFAULT nextval('public.poster_id_seq'::regclass);
 8   ALTER TABLE public.poster ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            �           2604    24763    product_details id    DEFAULT     �   ALTER TABLE ONLY public.product_details ALTER COLUMN id SET DEFAULT nextval('public.product_details_product_id_seq'::regclass);
 A   ALTER TABLE public.product_details ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231            �           2604    24764 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234            �           2604    24765    wishlist id    DEFAULT     j   ALTER TABLE ONLY public.wishlist ALTER COLUMN id SET DEFAULT nextval('public.wishlist_id_seq'::regclass);
 :   ALTER TABLE public.wishlist ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236            7          0    24686    admin 
   TABLE DATA           7   COPY public.admin (username, password, id) FROM stdin;
    public          postgres    false    215   �X       8          0    24689 	   carousels 
   TABLE DATA           3   COPY public.carousels (id, photo, pid) FROM stdin;
    public          postgres    false    216   �X       :          0    24695    category 
   TABLE DATA           E   COPY public.category (id, category, sub_category, image) FROM stdin;
    public          postgres    false    218   Y       <          0    24701    checkout_sessions 
   TABLE DATA           7   COPY public.checkout_sessions (session_id) FROM stdin;
    public          postgres    false    220   xZ       =          0    24706    customer_address 
   TABLE DATA           �   COPY public.customer_address (id, cust_id, name, phone, pincode, locality, address, state, district, town, zip, email, others) FROM stdin;
    public          postgres    false    221   ?[       ?          0    24712    customer_cart 
   TABLE DATA           N   COPY public.customer_cart (id, customer_id, product_id, quantity) FROM stdin;
    public          postgres    false    223   F\       A          0    24716    customer_details 
   TABLE DATA           �   COPY public.customer_details (first_name, last_name, email, password, cust_id, phone_number, secret_ques, secret_ques_ans) FROM stdin;
    public          postgres    false    225   \       C          0    24722    order_details 
   TABLE DATA           �   COPY public.order_details (id, address, status, unit_price, product_name, phone_number, order_id, quantity, customer_name, cust_id, prod_id) FROM stdin;
    public          postgres    false    227   �]       E          0    24728    poster 
   TABLE DATA           0   COPY public.poster (id, photo, pid) FROM stdin;
    public          postgres    false    229   �^       G          0    24734    product_details 
   TABLE DATA           �   COPY public.product_details (id, product_category, mrp, weight, product_name, created_at, modified_at, image, description, stock, tax, images, sub_category, botanical_name, tamil_name, discount_price) FROM stdin;
    public          postgres    false    231   1_       I          0    24740    product_ratings 
   TABLE DATA           x   COPY public.product_ratings (product_id, product_review, customer_name, title, submitted_date, star_rating) FROM stdin;
    public          postgres    false    233   �o       J          0    24746    reviews 
   TABLE DATA           N   COPY public.reviews (id, user_name, content, replies, replied_by) FROM stdin;
    public          postgres    false    234   ]p       L          0    24752    wishlist 
   TABLE DATA           8   COPY public.wishlist (id, prod_id, cust_id) FROM stdin;
    public          postgres    false    236   �p       ^           0    0    carousels_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.carousels_id_seq', 15, true);
          public          postgres    false    217            _           0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 17, true);
          public          postgres    false    219            `           0    0    customer_address_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.customer_address_id_seq', 5, true);
          public          postgres    false    222            a           0    0    customer_cart_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.customer_cart_id_seq', 12, true);
          public          postgres    false    224            b           0    0    customer_details_cust_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.customer_details_cust_id_seq', 5, true);
          public          postgres    false    226            c           0    0    order_details_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.order_details_id_seq', 2, true);
          public          postgres    false    228            d           0    0    poster_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.poster_id_seq', 7, true);
          public          postgres    false    230            e           0    0    product_details_product_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.product_details_product_id_seq', 51, true);
          public          postgres    false    232            f           0    0    reviews_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.reviews_id_seq', 1, true);
          public          postgres    false    235            g           0    0    wishlist_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.wishlist_id_seq', 14, true);
          public          postgres    false    237            �           2606    24767    carousels carousels_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.carousels
    ADD CONSTRAINT carousels_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.carousels DROP CONSTRAINT carousels_pkey;
       public            postgres    false    216            �           2606    24769    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    218            �           2606    24771 &   customer_address customer_address_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT customer_address_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.customer_address DROP CONSTRAINT customer_address_pkey;
       public            postgres    false    221            �           2606    24773     customer_cart customer_cart_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.customer_cart
    ADD CONSTRAINT customer_cart_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.customer_cart DROP CONSTRAINT customer_cart_pkey;
       public            postgres    false    223            �           2606    24775 &   customer_details customer_details_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.customer_details
    ADD CONSTRAINT customer_details_pkey PRIMARY KEY (cust_id);
 P   ALTER TABLE ONLY public.customer_details DROP CONSTRAINT customer_details_pkey;
       public            postgres    false    225            �           2606    24777     order_details order_details_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_details_pkey;
       public            postgres    false    227            �           2606    24779    poster poster_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.poster
    ADD CONSTRAINT poster_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.poster DROP CONSTRAINT poster_pkey;
       public            postgres    false    229            �           2606    24781 $   product_details product_details_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.product_details DROP CONSTRAINT product_details_pkey;
       public            postgres    false    231            �           2606    24783    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    234            �           2606    24785    wishlist wishlist_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_pkey;
       public            postgres    false    236            7      x�KL����L��FƜ�\1z\\\ W4�      8   <   x�34�t�KL��T(����*H�4�24�t�I��N�T ��q�r:%�d$�B�b���� 	2      :   [  x�m��n�0���),�V��W��4BiQ��c/؆MF�Q���{i�r������"^a�J�r�_��X�����P�WNx��`��w�|Ξ/z����6��jǼ�_��-�昣�V"�P��O�l,!�1Ftb�(����ʥmȻ~"6��&3<:�Otב��ed́�I���{#h^��T�L[��|`�v��We��^v�[��A$�SFJ~� آ�L��ɛ̇�j�T��6�ЖS_����݁�(���a��.�)A����|�T ObG�pM�@3c���
�IC�k��rcL~
�u��1?O!�Y�5f�0�J���dI뮹~�{����-      <   �   x�M�W�0  ����:�O#���
��t0��
���g|xLݦRM7
�hMZ�����\��QX(ܚ��w�:�ԉi�	���G���pU� �d�C(��^����q�����ѽ�����ē(4/�b��ǲ�?I�m��1�<KZf/���y�Bcc�YͲj�G��RJp]  �B�E�      =   �   x����R�0��S�2���lw��ʙL�P�9��ϱe�,�	O�fR@C�w��� 	���pd;��Bq�ԠE���Z:�� �JX�����4�� u�t�������O���iX�N#�g�F��&��^���!��TJi�k͚s����'(����3�`�`�E�����_xE�h#��o	�.	
ԯ�?5d�aE�)-Ҭ�l�'m0�2_�ɲ������e��a�$�'eo�}      ?   )   x�34�4�4�4��F��\@ڐӔ�Ј� ,���� b��      A   c  x�}�Ks�0��u�.\sIB�"Z�ЊcGE�� �D!��������t�l�w�̉*���`���g�wm�dg���a5���Ҥ�-1$
�|�v�/SȻ�i�"���O�<=��x���a�q=� �a�	/�ϳ�O����T�S�)h�i�� ��4�#f�{V'ϴ�����ƪ�(=M�t7kjG���^��DB���a���Un�Ca�>��Ns�f�~]^�,ׅ�묅"����yXF'G;B����?tv�<�Vq-��G5�zP�7�G�v:Y^q^��t���1_P��Y�ev��R��Y��f'';�m�ܐ�y0@xzu�3?��9�����b[�����      C   �   x����j�0 �s|���ĘvG;6�ҭ�T�hbM�I�|������>�6�Y����2�K C���W 9���<�@>�dF\K�`�R�vr��\;�����A�4Mw�*c����ބI�q�ƫ�Y��R�	e9�\�`��O�g8���釮������S��\5Ƌ�>^cQ��ٵ����4��.��(^Y�V!���̃D9�	�[���ƨ�V������Y�&I��=�      E   8   x�3�t�-��N,JT(�/OI-R��*H�4�2�t�)MUHJ-*�T0q��qqq �C�      G      x��[moǵ�����`�߾Ů_Rǎod�_�e,�����Ē��,�u���Qݠ�*U��d��^��O�眙]����� �F���<��s^fbh��w��|�{���n�F;��뚣k7��h�nZ���j:��C�-K�����}�_v�f�jx���X��|���v'�6ؓ,g[O�[��h���>�������?S\�aN?�Q�g�l�T���"v#���V��j�m����M�i��P�߮����H��w�M�GZ� ����y�=�2����̄�:�oz
|��}ϕ&��7��i�n��v�j.�s��޵�&H�'ї:�&sF��Z7^�z�8 �Z�|}+F���Z�ݢ�iz�O��VE��5��BCxz 4��{<��a�m��v���F����U�v�ۃ�gO7������ZY��ʮ������PhKKh+~wNK��ҒP�JxX.�f��:j}��Lמ�÷׉�#���X4�$��،��Q�}+��}�ǜ���"�:Z1��btV���k|�.���}V<u���b`��(�F�j^�f�V"a�o8Ѿ��U���j��r��Ԭ\�A���~�����}�2��W|����=���ܽ`���^h*X��m�w(R��q������8z��������>�`�����Aq>)�/��i1}Q����GQ2�����t�8���<�h�T��J��x�eݸ�~9H�'I�s�?)ƻ�hZ�_P@�djm�±���1����𤆟��"���Ȗ�*������pX�� '+��b/�/�gm�~$� �=�0#��J���?w+�L�ޖ��u�l�G����:B\×T5�7�����y���x]����Ѱ�!�#�����=,F$���f�x ��� a��"�� }�rAw��$	�����Z� �8�4%�Ëbx\!}Yߒ �ϔx�(@?�o����8���rNp��_����,\	Z6��(�gi܏�MPJ�H�Ő�#��TY�ޒ�-���Ձf��Q���;�^%����o����t�%`���E�Y���8�;&ħ䃉y�p��8}VLΊ�e1��b2-N����i:?r~\L�!� �crȴ�JC\��!h'�bt\��S\b�@اU�S��j�ʰ�:��f�meI�N��c���*��_�<���)�OKV8�'#�x� �ӗ"`�<y����<�}q
����A��8}YL�I�,l��&��pT��@��N(����%-BS�w%�[�)��[��*��=p�s�LID�]F,�JP+)���絔��-���
 ��-q:FK�7���W��v�m��	�����t��	�}�K"=)��7�qB����wD;���?h��ʻ�-9vk*��F�`O��Ky�������5ж5��$�Y���`�\/Tck@��*���h/��%q���c��a��%���� HJg�3�����	^��9f3��_h�GU/�v �(
n��F;P�:+vާJ��B����/e��u>{9ޅ_�Ni�o��D�Z��mu��!��j��.÷M�鑻�㸷>�5ѝ��Z�HI`,^����S������o����ge.�;����w����K�O-nA��f�)���i�FdtA[tABzF}��5!��7��]�(�6�k@N�W��C�3�1��mwI�!���ƫ���i���	�OS�R�[��&�z�D�.4$}�˿l�T���I�	��Rl�p�D���ֆ�?цOOQzc.�Ӱ,ş��U3pG� ?R�N��"�F~��L�����\��#�Y������~� �ڛ�G��������PE�XM�|��G�����J����Ģ�s�`]��-Z�,���>�y��Z74=���a�c9��$\��^��f-���'���-��jN��Q_��!ZiCiHC��T���py#�]ƛ(��2
>(�$	�{j��o(��n<v�>g�|N�V?zb� ��	�kPo����1��"�e�E�A�Xkp�P�]���4<[B��7��WX���R`���\��/��+&�7��E���T�+���~�\K_�=.Q�O�&{
����7�e0[Z1pE���Q��;8t]�Js�д��@?i/(�FňX�CR��b�)T�Sp���8C%�3��s�1���x*���'���x2��^����"֏��=	๫v՜��)��J
|�\y�
)�K�HȌ}Yf��B��8��uR�E�9ӂ��ҥ��ʯ����gZ�kzb���b��x(�Q<�����g��@����A���N��J ��V3����L�� В�E
�'P
�|�O�}QW����&(�[�u�I�/x�E��嬷�;ݹi�-f��a�e�պM$o�eRP�o��O����dF7PM�8ɧYO���s,�
�d�0Mhk顚,iTh/�e�/��)p�+��BRN�N�.�@{+\1$�3[�aޜac�98�U�w�v�'q��nl��7�@�Yd}�N���zB��b����aB`^i�	��,�M�����N��zwF=���I����t2��,�'p�U�Ҧm���/��D�r��Ge:+�4�(��s1��4��,�S��Y������Lϯ�zBzSW��l�����3,�mo�b�K.�~��f�0#]�����r+h�ʊk�`Ԃ�s'�Loex�m��Zs�w�$�V[�g�2�gs�	����|-AS�"�ƹY9>fe����_�����-L�$�U�tͳh�-����"1v�!�_E�'�N�.� 'B��|��Ea ��
L��iY@�	R:�p�7;�����w��<���T��ݒ��-ʋ%��E�;Z��^���_��`�%����(��̓xi�߲��H��V���ՌJ,�bZ���rѐ qD�_����q,�0�YO��a���H[rX5�?�[W��+&+�b�B�Vܵ�6�K�`c\5_i;�x)���LE�%^�S?� ���Y@ޓ�MvO���~�!���f�|xiYFKT��4��g��)OB]�
���6�� �n��p���`-��}�S�Hҭ�{2zR=����b(wX� ��Zέ������!���W��`� �ţG<��x��[�ŏ����FfZut�\��yޅ��Ѽ5Nb~��Ok��	��
�s�f囬�_㔧�֩P�}���%�"U
A[��i����Ef���!�����QOv��y���C`���X�i.���Q�M���J�?����B�}V�lU�$lw[��:�v#����� ���5Ja?��4��mࢥ#7�D1�Z.�u��ե�Z;�o�)�?.���j�qfgT~�	t�n�d����B.]�Y:&�%���(|-_��.���Gy�$Kb��^U}�� 4��j�N�<�.�`�����VP��y�wضy��F9^P�\r{y2��3�@Ѱ��o���P^�����u���I�����-�n7N�m��	74ԝ��y��/���0����V9x��lm{���}�'��Ty8�m5�z�n���l�n���5{�Qy���.�	V�P�|�Kǔ/��)�O�"1�6���>�^������I8_�,���H��CըtP��.}��\-l;+�SEռZ�tBu%�Y�,��hI�֔���/(�F�l� �A�$��v���t�a)^0}Kծ��-��;T��J�r0?"G�	Gߏ�0���@��3-�Z�����8��TL�ӹ�?��c�1��F3��x*J2���=�ft�h�vN/�����*@�:�1�>&�ŘQ���
�֞w�YƛS:�a��h/�m3C[��<�B��qGK|M[���u�;)�bDqJ6��~�^��"�_�f8!�f@]��,�)`qC[]���n�N���_<��v3�v��}�'������#��̐�KoĔHD�ܹ��� N�)�G�ɖ<�o�����Ox�F�<,/������v�����p�	�S<`�l-���G8�J���Z�kfj��@tu��cq�� � �   ��q����<���t�o1W��!�n�&z�*_�-��݅��U�����vk��-�^��1�X��|$P�V��������x��آs�=k��Ӻ1v[�۾i�Ky���N�I�*xG��ߥG�ֹ���o?_YY���      I   |   x�M�A
�0F����ZL$(���͘Dlg0I��]�}��U5�9��3X"�/��(RB��YZḟ�sո�N��΃u���%Q]�$�ѽ�����Y�g\H?��?n��1c~!�)g      J   G   x�3�.JMUp,J�KO�K,�H�Sp�t��OQ(N-*�LN��e+T�*gqz'��%�dV&q��qqq ��|      L      x�3�4�4�2�4��&@ʄ+F��� %��     