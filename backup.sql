PGDMP         1                 |         
   groceryapp %   14.10 (Ubuntu 14.10-0ubuntu0.22.04.1) %   14.10 (Ubuntu 14.10-0ubuntu0.22.04.1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24782 
   groceryapp    DATABASE     [   CREATE DATABASE groceryapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';
    DROP DATABASE groceryapp;
                postgres    false            �            1259    24793    GroceryApp_product    TABLE     w   CREATE TABLE public."GroceryApp_product" (
    id bigint NOT NULL,
    product_name character varying(200) NOT NULL
);
 (   DROP TABLE public."GroceryApp_product";
       public         heap    lpas    false            �            1259    24792    GroceryApp_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public."GroceryApp_product_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."GroceryApp_product_id_seq";
       public          lpas    false    212            �           0    0    GroceryApp_product_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."GroceryApp_product_id_seq" OWNED BY public."GroceryApp_product".id;
          public          lpas    false    211            �            1259    32771    GroceryApp_sales    TABLE     �   CREATE TABLE public."GroceryApp_sales" (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    product_id bigint NOT NULL
);
 &   DROP TABLE public."GroceryApp_sales";
       public         heap    lpas    false            �            1259    32770    GroceryApp_sales_id_seq    SEQUENCE     �   CREATE SEQUENCE public."GroceryApp_sales_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."GroceryApp_sales_id_seq";
       public          lpas    false    237            �           0    0    GroceryApp_sales_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."GroceryApp_sales_id_seq" OWNED BY public."GroceryApp_sales".id;
          public          lpas    false    236            �            1259    24800    GroceryApp_takeproduct    TABLE     �   CREATE TABLE public."GroceryApp_takeproduct" (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    product_id bigint NOT NULL
);
 ,   DROP TABLE public."GroceryApp_takeproduct";
       public         heap    lpas    false            �            1259    24799    GroceryApp_takeproduct_id_seq    SEQUENCE     �   CREATE SEQUENCE public."GroceryApp_takeproduct_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."GroceryApp_takeproduct_id_seq";
       public          lpas    false    214            �           0    0    GroceryApp_takeproduct_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."GroceryApp_takeproduct_id_seq" OWNED BY public."GroceryApp_takeproduct".id;
          public          lpas    false    213            �            1259    32797    api_delivery    TABLE     l  CREATE TABLE public.api_delivery (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    ordered_at timestamp with time zone NOT NULL,
    date_of_delivery timestamp with time zone NOT NULL,
    price_netto double precision NOT NULL,
    price_brutto double precision NOT NULL,
    warehouse character varying(100) NOT NULL,
    product_id bigint NOT NULL
);
     DROP TABLE public.api_delivery;
       public         heap    lpas    false            �            1259    32796    api_delivery_id_seq    SEQUENCE     |   CREATE SEQUENCE public.api_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.api_delivery_id_seq;
       public          lpas    false    241            �           0    0    api_delivery_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.api_delivery_id_seq OWNED BY public.api_delivery.id;
          public          lpas    false    240            �            1259    24942    api_product    TABLE     9  CREATE TABLE public.api_product (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    unit character varying(100) NOT NULL,
    price_netto double precision NOT NULL,
    price_brutto double precision NOT NULL,
    barcode character varying(100) NOT NULL,
    category character varying(100)
);
    DROP TABLE public.api_product;
       public         heap    lpas    false            �            1259    24941    api_product_id_seq    SEQUENCE     {   CREATE SEQUENCE public.api_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.api_product_id_seq;
       public          lpas    false    232            �           0    0    api_product_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.api_product_id_seq OWNED BY public.api_product.id;
          public          lpas    false    231            �            1259    32784 	   api_sales    TABLE     �   CREATE TABLE public.api_sales (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    sold_at timestamp with time zone NOT NULL,
    product_id bigint NOT NULL
);
    DROP TABLE public.api_sales;
       public         heap    lpas    false            �            1259    32783    api_sales_id_seq    SEQUENCE     y   CREATE SEQUENCE public.api_sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.api_sales_id_seq;
       public          lpas    false    239            �           0    0    api_sales_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.api_sales_id_seq OWNED BY public.api_sales.id;
          public          lpas    false    238            �            1259    24949    api_takeproduct    TABLE     �   CREATE TABLE public.api_takeproduct (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    added_at timestamp with time zone NOT NULL,
    product_id bigint NOT NULL
);
 #   DROP TABLE public.api_takeproduct;
       public         heap    lpas    false            �            1259    24948    api_takeproduct_id_seq    SEQUENCE        CREATE SEQUENCE public.api_takeproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.api_takeproduct_id_seq;
       public          lpas    false    234            �           0    0    api_takeproduct_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.api_takeproduct_id_seq OWNED BY public.api_takeproduct.id;
          public          lpas    false    233            �            1259    24829 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    lpas    false            �            1259    24828    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          lpas    false    220            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          lpas    false    219            �            1259    24838    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    lpas    false            �            1259    24837    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          lpas    false    222            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          lpas    false    221            �            1259    24822    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    lpas    false            �            1259    24821    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          lpas    false    218            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          lpas    false    217            �            1259    24845 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    lpas    false            �            1259    24854    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    lpas    false            �            1259    24853    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          lpas    false    226            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          lpas    false    225            �            1259    24844    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          lpas    false    224            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          lpas    false    223            �            1259    24861    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    lpas    false            �            1259    24860 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          lpas    false    228            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          lpas    false    227            �            1259    24920    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    lpas    false            �            1259    24919    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          lpas    false    230            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          lpas    false    229            �            1259    24813    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    lpas    false            �            1259    24812    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          lpas    false    216            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          lpas    false    215            �            1259    24784    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    lpas    false            �            1259    24783    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          lpas    false    210            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          lpas    false    209            �            1259    24969    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    lpas    false            �           2604    24796    GroceryApp_product id    DEFAULT     �   ALTER TABLE ONLY public."GroceryApp_product" ALTER COLUMN id SET DEFAULT nextval('public."GroceryApp_product_id_seq"'::regclass);
 F   ALTER TABLE public."GroceryApp_product" ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    212    211    212            �           2604    32774    GroceryApp_sales id    DEFAULT     ~   ALTER TABLE ONLY public."GroceryApp_sales" ALTER COLUMN id SET DEFAULT nextval('public."GroceryApp_sales_id_seq"'::regclass);
 D   ALTER TABLE public."GroceryApp_sales" ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    236    237    237            �           2604    24803    GroceryApp_takeproduct id    DEFAULT     �   ALTER TABLE ONLY public."GroceryApp_takeproduct" ALTER COLUMN id SET DEFAULT nextval('public."GroceryApp_takeproduct_id_seq"'::regclass);
 J   ALTER TABLE public."GroceryApp_takeproduct" ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    214    213    214            �           2604    32800    api_delivery id    DEFAULT     r   ALTER TABLE ONLY public.api_delivery ALTER COLUMN id SET DEFAULT nextval('public.api_delivery_id_seq'::regclass);
 >   ALTER TABLE public.api_delivery ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    241    240    241            �           2604    24945    api_product id    DEFAULT     p   ALTER TABLE ONLY public.api_product ALTER COLUMN id SET DEFAULT nextval('public.api_product_id_seq'::regclass);
 =   ALTER TABLE public.api_product ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    232    231    232            �           2604    32787    api_sales id    DEFAULT     l   ALTER TABLE ONLY public.api_sales ALTER COLUMN id SET DEFAULT nextval('public.api_sales_id_seq'::regclass);
 ;   ALTER TABLE public.api_sales ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    238    239    239            �           2604    24952    api_takeproduct id    DEFAULT     x   ALTER TABLE ONLY public.api_takeproduct ALTER COLUMN id SET DEFAULT nextval('public.api_takeproduct_id_seq'::regclass);
 A   ALTER TABLE public.api_takeproduct ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    233    234    234            �           2604    24832    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    220    219    220            �           2604    24841    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    221    222    222            �           2604    24825    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    217    218    218            �           2604    24848    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    224    223    224            �           2604    24857    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    226    225    226            �           2604    24864    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    228    227    228            �           2604    24923    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    230    229    230            �           2604    24816    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    216    215    216            �           2604    24787    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          lpas    false    210    209    210            �          0    24793    GroceryApp_product 
   TABLE DATA           @   COPY public."GroceryApp_product" (id, product_name) FROM stdin;
    public          lpas    false    212   ��       �          0    32771    GroceryApp_sales 
   TABLE DATA           P   COPY public."GroceryApp_sales" (id, quantity, pub_date, product_id) FROM stdin;
    public          lpas    false    237   ��       �          0    24800    GroceryApp_takeproduct 
   TABLE DATA           V   COPY public."GroceryApp_takeproduct" (id, quantity, pub_date, product_id) FROM stdin;
    public          lpas    false    214   ��       �          0    32797    api_delivery 
   TABLE DATA           �   COPY public.api_delivery (id, quantity, ordered_at, date_of_delivery, price_netto, price_brutto, warehouse, product_id) FROM stdin;
    public          lpas    false    241   ��       �          0    24942    api_product 
   TABLE DATA           c   COPY public.api_product (id, name, unit, price_netto, price_brutto, barcode, category) FROM stdin;
    public          lpas    false    232   ��       �          0    32784 	   api_sales 
   TABLE DATA           F   COPY public.api_sales (id, quantity, sold_at, product_id) FROM stdin;
    public          lpas    false    239   ��       �          0    24949    api_takeproduct 
   TABLE DATA           M   COPY public.api_takeproduct (id, quantity, added_at, product_id) FROM stdin;
    public          lpas    false    234   ��       �          0    24829 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          lpas    false    220   �       �          0    24838    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          lpas    false    222   )�       �          0    24822    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          lpas    false    218   F�       �          0    24845 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          lpas    false    224   A�       �          0    24854    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          lpas    false    226   ��       �          0    24861    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          lpas    false    228   
�       �          0    24920    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          lpas    false    230   '�       �          0    24813    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          lpas    false    216   ��       �          0    24784    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          lpas    false    210   j�       �          0    24969    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          lpas    false    235   o�       �           0    0    GroceryApp_product_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."GroceryApp_product_id_seq"', 1, false);
          public          lpas    false    211            �           0    0    GroceryApp_sales_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."GroceryApp_sales_id_seq"', 1, false);
          public          lpas    false    236            �           0    0    GroceryApp_takeproduct_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."GroceryApp_takeproduct_id_seq"', 1, false);
          public          lpas    false    213            �           0    0    api_delivery_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.api_delivery_id_seq', 16, true);
          public          lpas    false    240            �           0    0    api_product_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.api_product_id_seq', 1, true);
          public          lpas    false    231            �           0    0    api_sales_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.api_sales_id_seq', 24, true);
          public          lpas    false    238            �           0    0    api_takeproduct_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.api_takeproduct_id_seq', 1, false);
          public          lpas    false    233            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          lpas    false    219            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          lpas    false    221            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);
          public          lpas    false    217            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          lpas    false    225            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
          public          lpas    false    223            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          lpas    false    227            �           0    0    django_admin_log_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);
          public          lpas    false    229            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);
          public          lpas    false    215            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);
          public          lpas    false    209            �           2606    24798 *   GroceryApp_product GroceryApp_product_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."GroceryApp_product"
    ADD CONSTRAINT "GroceryApp_product_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."GroceryApp_product" DROP CONSTRAINT "GroceryApp_product_pkey";
       public            lpas    false    212            �           2606    32776 &   GroceryApp_sales GroceryApp_sales_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."GroceryApp_sales"
    ADD CONSTRAINT "GroceryApp_sales_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."GroceryApp_sales" DROP CONSTRAINT "GroceryApp_sales_pkey";
       public            lpas    false    237            �           2606    24805 2   GroceryApp_takeproduct GroceryApp_takeproduct_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."GroceryApp_takeproduct"
    ADD CONSTRAINT "GroceryApp_takeproduct_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY public."GroceryApp_takeproduct" DROP CONSTRAINT "GroceryApp_takeproduct_pkey";
       public            lpas    false    214                       2606    32802    api_delivery api_delivery_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.api_delivery
    ADD CONSTRAINT api_delivery_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.api_delivery DROP CONSTRAINT api_delivery_pkey;
       public            lpas    false    241            �           2606    24947    api_product api_product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.api_product
    ADD CONSTRAINT api_product_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.api_product DROP CONSTRAINT api_product_pkey;
       public            lpas    false    232            �           2606    32789    api_sales api_sales_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.api_sales
    ADD CONSTRAINT api_sales_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.api_sales DROP CONSTRAINT api_sales_pkey;
       public            lpas    false    239            �           2606    24954 $   api_takeproduct api_takeproduct_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.api_takeproduct
    ADD CONSTRAINT api_takeproduct_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.api_takeproduct DROP CONSTRAINT api_takeproduct_pkey;
       public            lpas    false    234            �           2606    24967    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            lpas    false    220            �           2606    24877 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            lpas    false    222    222            �           2606    24843 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            lpas    false    222            �           2606    24834    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            lpas    false    220            �           2606    24868 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            lpas    false    218    218            �           2606    24827 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            lpas    false    218            �           2606    24859 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            lpas    false    226            �           2606    24892 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            lpas    false    226    226            �           2606    24850    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            lpas    false    224            �           2606    24866 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            lpas    false    228            �           2606    24906 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            lpas    false    228    228            �           2606    24962     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            lpas    false    224            �           2606    24928 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            lpas    false    230            �           2606    24820 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            lpas    false    216    216            �           2606    24818 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            lpas    false    216            �           2606    24791 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            lpas    false    210            �           2606    24975 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            lpas    false    235            �           1259    32782 $   GroceryApp_sales_product_id_c9cfeace    INDEX     k   CREATE INDEX "GroceryApp_sales_product_id_c9cfeace" ON public."GroceryApp_sales" USING btree (product_id);
 :   DROP INDEX public."GroceryApp_sales_product_id_c9cfeace";
       public            lpas    false    237            �           1259    24811 *   GroceryApp_takeproduct_product_id_ad443650    INDEX     w   CREATE INDEX "GroceryApp_takeproduct_product_id_ad443650" ON public."GroceryApp_takeproduct" USING btree (product_id);
 @   DROP INDEX public."GroceryApp_takeproduct_product_id_ad443650";
       public            lpas    false    214                       1259    32808     api_delivery_product_id_9ab7e992    INDEX     _   CREATE INDEX api_delivery_product_id_9ab7e992 ON public.api_delivery USING btree (product_id);
 4   DROP INDEX public.api_delivery_product_id_9ab7e992;
       public            lpas    false    241            �           1259    32795    api_sales_product_id_20d7ec80    INDEX     Y   CREATE INDEX api_sales_product_id_20d7ec80 ON public.api_sales USING btree (product_id);
 1   DROP INDEX public.api_sales_product_id_20d7ec80;
       public            lpas    false    239            �           1259    24960 #   api_takeproduct_product_id_324bb8ed    INDEX     e   CREATE INDEX api_takeproduct_product_id_324bb8ed ON public.api_takeproduct USING btree (product_id);
 7   DROP INDEX public.api_takeproduct_product_id_324bb8ed;
       public            lpas    false    234            �           1259    24968    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            lpas    false    220            �           1259    24888 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            lpas    false    222            �           1259    24889 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            lpas    false    222            �           1259    24874 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            lpas    false    218            �           1259    24904 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            lpas    false    226            �           1259    24903 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            lpas    false    226            �           1259    24918 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            lpas    false    228            �           1259    24917 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            lpas    false    228            �           1259    24963     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            lpas    false    224            �           1259    24939 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            lpas    false    230            �           1259    24940 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            lpas    false    230            �           1259    24977 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            lpas    false    235            �           1259    24976 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            lpas    false    235                       2606    32777 N   GroceryApp_sales GroceryApp_sales_product_id_c9cfeace_fk_GroceryApp_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."GroceryApp_sales"
    ADD CONSTRAINT "GroceryApp_sales_product_id_c9cfeace_fk_GroceryApp_product_id" FOREIGN KEY (product_id) REFERENCES public."GroceryApp_product"(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public."GroceryApp_sales" DROP CONSTRAINT "GroceryApp_sales_product_id_c9cfeace_fk_GroceryApp_product_id";
       public          lpas    false    3268    237    212                       2606    24806 L   GroceryApp_takeproduct GroceryApp_takeprodu_product_id_ad443650_fk_GroceryAp    FK CONSTRAINT     �   ALTER TABLE ONLY public."GroceryApp_takeproduct"
    ADD CONSTRAINT "GroceryApp_takeprodu_product_id_ad443650_fk_GroceryAp" FOREIGN KEY (product_id) REFERENCES public."GroceryApp_product"(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public."GroceryApp_takeproduct" DROP CONSTRAINT "GroceryApp_takeprodu_product_id_ad443650_fk_GroceryAp";
       public          lpas    false    212    3268    214                       2606    32803 ?   api_delivery api_delivery_product_id_9ab7e992_fk_api_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.api_delivery
    ADD CONSTRAINT api_delivery_product_id_9ab7e992_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.api_delivery DROP CONSTRAINT api_delivery_product_id_9ab7e992_fk_api_product_id;
       public          lpas    false    3314    241    232                       2606    32790 9   api_sales api_sales_product_id_20d7ec80_fk_api_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.api_sales
    ADD CONSTRAINT api_sales_product_id_20d7ec80_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.api_sales DROP CONSTRAINT api_sales_product_id_20d7ec80_fk_api_product_id;
       public          lpas    false    232    3314    239                       2606    24955 E   api_takeproduct api_takeproduct_product_id_324bb8ed_fk_api_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.api_takeproduct
    ADD CONSTRAINT api_takeproduct_product_id_324bb8ed_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.api_takeproduct DROP CONSTRAINT api_takeproduct_product_id_324bb8ed_fk_api_product_id;
       public          lpas    false    232    234    3314                       2606    24883 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          lpas    false    218    222    3280                       2606    24878 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          lpas    false    222    220    3285                       2606    24869 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          lpas    false    3275    216    218                       2606    24898 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          lpas    false    3285    220    226                       2606    24893 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          lpas    false    3293    226    224            
           2606    24912 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          lpas    false    228    218    3280            	           2606    24907 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          lpas    false    224    3293    228                       2606    24929 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          lpas    false    3275    216    230                       2606    24934 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          lpas    false    230    3293    224            �      x������ � �      �      x������ � �      �      x������ � �      �   �  x�}�MN�0���)�G�f�?�{X������j��`ɕ8�^̘�q��������E���lV �3�,#�hWf��6��u�2�m�������l�
�rGj���ܑe��.ˊ��E��������1*L�\q�n���%p��հ�?�7�'S� ��ˡ�<�v����Q���L��J,���������}�F��mE*��A�%�ot����&���əb��0VQ��xH�`�֝By�����R��v�˲St�l�bG�g8�3�F[�+�=D�?p�,Iv�e��U���*c
�����/O����cH�i5�ሰe��a4�?�	Əc�Ϧ7m&<9�5�)�rns��3���帄�/���vTe�s!Gc'���;�[��z�Q�Pe��x,4 �1���aqMP�jW�w�i�_9��      �     x��UIn�F]�N���SM˴�h$�a$^����M�(P���@.��$��^ye�n��@�B||���؍�zd���7�H�9.}������pW����]���}�:��7ɜŔq�U&�Q9.z���T0�|��%�u�m���q��U/��%G�䴊�sJI�2^�3w3��nTw�6�&�r�S�9�&ǔ+�$l|�@}���]׫�s3�?Y�[&U��e�Ī�q�L�ԝ �8Aew�/��E_W�a�q\�Z��RPP�,1�\�"�s��D9����j���W�����Xi���J�Sb��
,&���a1��yrz%zӬ��7�)C�,��V�@�A!�x�[��>G�#Ǐ�����&��2	�P�����̡QXY���!h��i�܁��y���zX��q�.��W���Ѐ����0(�d��/�Bh���3�#��ݸl_�5
)3�eJ��ɠ��t:�����?n�q~]���^,w�b��6C�)�iϲNL͑,q"Rw������3�	�^��~;A�ʘ6�kd��W~��H?��&m���1�@�$�y�S�e������]-���~߶����]��P���I�1Ò�&T�Y��1&�M���������v�f����˄A[d.(�&�}��id�F�* ��}��P�"YC���Wj��� �7�_���va�v���/�Z�~�ET�h�5!.���˄D�y<	�=Bݿb�0��XD�h
�ǈ� ��%�>��¾�$�}�.�����4BU�T�VB��Z���0��)����l�fX�={4d�ErՀZ����(S;���>r�Gs�^tf7�R���z4�GKt���)\%�N�d�zD&�TC�)�!8j��`}��Wz�������k縼[�;\���#2�P��Թy�C� ���L'N�j�a~�׋f,^��_,J�2U*�1C*�8�ģ�q�� �i��}?��nsx��P����������S�\���h��E�\>bY|XF2
������f��      �   �   x���Kn1D���GӢ
��Y������ErK�=���L�Dey)^ڲ���/E�R�Sp�I]J�/�3�,�z؅���&5�^0�N^�]ZXس��7�Q�h��3�EF����zH�{;���'��]�T��6˵��Zv�챮b�1<(���Ұ��m�{�7n���-v�����,�@w�3Ƅ%y�_���w���>D���~5      �   e   x�����@�o:��FCܩ���������.�+��)���<k����DP��a�ئ�6;�`�Ȏ8,�a�U۰�~u�ok�����	���E�      �      x������ � �      �      x������ � �      �   �  x�u�ݎ�0F����	F$�����H�
"-Ӣ������8����:>�G��a��0���p����*�B�+m��;�ϐx�)����ʩx��
����g̫�D�m������Q�U�����8Jr�#�[����6]~\��@7�Pjs�CS"��$JiI�s�G�������,�iTUp>ЦC�d�3�k1k�q3�a#�h�:�lz���]� 	��t�/�Q��[%�"b�� ������Ϫ�ף��`?����#�V���ؤ�?M�FwX�^�`�G�m��0
	^�}������4�
�6�q�c��X{b�3cb�	C����'�2�6Y֋,s�^���0��Ҭ/��5�8�e��v?�B"��溷��Hs��L/�Zu|�j��ZE�an~Q&�-@�+q!2�&q'2��v-2g�uia�E�ca�v�����
������CҚ��ֵXv���b�9�RD����e��Ck�b���      �   �   x�]�A�0����+:x��ܔ	]R��XAE�Z`��L~;��ח�6����gJ�cP4cL���r�$	������O�;���\|�����.��"p^ɰy���N��D(3��`�(�(�Y�e�!s H�W��HS������B��ja�W�,      �      x������ � �      �      x������ � �      �   �   x�u̽
�0@���)BWiȽ�m�@��M"-"�Fڔ"��uqP�3��$�Rb)'
Z��Y[��H��y�q.b]7u��,g� }n��e���#4�M
�M�9���S��AzA�2N��^�7�a��c����6Nm����`�=`c4|      �   �   x�M�K
�0D��aJ���쪗��$"5ul!�߾�i�wz�x�G��`�8�1a׆ɾi�`���q����	lN/`�ũ��%���x� +	^a�!��T����R]�~�,���9VlU�i%�zR4]����0�w������WPj      �   �  x���M��0F���u�*����\b$�"�%����s��&!h�(l���sգl(��P�x��u!�o��m] A�N���7�����#�P�"p��
���a�v�ߑdL1������#��P<%XaO�owD��R�?"h�p�
�W].�L�cO�M� @K�`�c�[>�棶gS}_M�Y\�̒����0�4��x/����/����F!�ҋp4�\4������Cʛ�~�ڵ�i�6j���YX���iq���k�V:��akLZrA���T�<F����������X?�L%���c���k�q�͛��	D)1[aD�J��ڟ�b����i\���Ya�l�/8�i�g�Aυ���8څ��(yG���1��N��8W����9���}]��?�KYp�Շ�{�\0��1R��v���)�|;�{6���^�Y��DVru�����l�gX2v$�j�_���Ԝ\�/Ӂ���Ӓb����{<� 91�U      �     x���r�0  г|E��$���TJ��������_߾?xM
�b��2~�ʀ4�1�qy���:�sXY�J��h�
���F:�Թ�ɹ=���N���Єc��<Y:|�UG����5贤y,��e���2*�}��tbkd��<v"/�~�<L$l��ОV�z	�(87�t *���g�F�����յ+�5
o#���Z�:�ޣ�����h���T����8v��/�G���� �PyAHGXx�)2�h� 
�kA� �^�     