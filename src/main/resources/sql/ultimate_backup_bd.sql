PGDMP                      |            mtfuji    16.2 (Debian 16.2-1.pgdg120+2)    16.2 M    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    33734    mtfuji    DATABASE     q   CREATE DATABASE mtfuji WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE mtfuji;
                postgresMaster    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    33735    account    TABLE     Z  CREATE TABLE public.account (
    id bigint NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    age bigint NOT NULL,
    email character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    fidelity_card boolean DEFAULT false NOT NULL,
    password character varying(255) NOT NULL,
    CONSTRAINT email_check CHECK ((((email)::text ~~ '%@gmail.com'::text) OR ((email)::text ~~ '%@yahoo.it'::text) OR ((email)::text ~~ '%@outlook.it'::text) OR ((email)::text ~~ '%@email.com'::text) OR ((email)::text ~~ '%@alice.it'::text)))
);
    DROP TABLE public.account;
       public         heap    postgresMaster    false    4            �            1259    33741    beverage    TABLE     6  CREATE TABLE public.beverage (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    cost numeric NOT NULL,
    complimentary boolean DEFAULT false NOT NULL,
    description character varying(255) NOT NULL,
    alcoholic boolean DEFAULT false NOT NULL,
    image_name character varying(255)
);
    DROP TABLE public.beverage;
       public         heap    postgresMaster    false    4            �            1259    33748    beverage_id_seq    SEQUENCE     x   CREATE SEQUENCE public.beverage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.beverage_id_seq;
       public          postgresMaster    false    216    4            �           0    0    beverage_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.beverage_id_seq OWNED BY public.beverage.id;
          public          postgresMaster    false    217            �            1259    33749    booking    TABLE     �  CREATE TABLE public.booking (
    id bigint NOT NULL,
    id_user bigint NOT NULL,
    quantity bigint DEFAULT 1 NOT NULL,
    check_in timestamp(5) without time zone NOT NULL,
    check_out timestamp(5) without time zone NOT NULL,
    reservation_date timestamp(5) without time zone NOT NULL,
    id_room bigint NOT NULL,
    paid boolean DEFAULT false,
    cost numeric NOT NULL,
    is_promotion boolean DEFAULT false NOT NULL
);
    DROP TABLE public.booking;
       public         heap    postgresMaster    false    4            �            1259    33757    booking_id_seq    SEQUENCE     w   CREATE SEQUENCE public.booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.booking_id_seq;
       public          postgresMaster    false    218    4            �           0    0    booking_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.booking_id_seq OWNED BY public.booking.id;
          public          postgresMaster    false    219            �            1259    33758    film    TABLE     �   CREATE TABLE public.film (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    genre character varying(255) NOT NULL,
    duration bigint NOT NULL,
    marathon boolean DEFAULT false,
    image_name character varying(255)
);
    DROP TABLE public.film;
       public         heap    postgresMaster    false    4            �            1259    33764    film_id_seq    SEQUENCE     t   CREATE SEQUENCE public.film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.film_id_seq;
       public          postgresMaster    false    220    4            �           0    0    film_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.film_id_seq OWNED BY public.film.id;
          public          postgresMaster    false    221            �            1259    33765    food    TABLE     �  CREATE TABLE public.food (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    cost numeric NOT NULL,
    type character varying(255) NOT NULL,
    complimentary boolean DEFAULT false NOT NULL,
    vegan boolean DEFAULT false NOT NULL,
    gluten_free boolean DEFAULT false NOT NULL,
    description character varying(255) NOT NULL,
    image_name character varying(255)
);
    DROP TABLE public.food;
       public         heap    postgresMaster    false    4            �            1259    33773    food_id_seq    SEQUENCE     t   CREATE SEQUENCE public.food_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.food_id_seq;
       public          postgresMaster    false    222    4            �           0    0    food_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.food_id_seq OWNED BY public.food.id;
          public          postgresMaster    false    223            �            1259    33774    karaoke    TABLE     �   CREATE TABLE public.karaoke (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    genre character varying(255) NOT NULL,
    singer character varying(255) NOT NULL
);
    DROP TABLE public.karaoke;
       public         heap    postgresMaster    false    4            �            1259    33779    karaoke_id_seq    SEQUENCE     w   CREATE SEQUENCE public.karaoke_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.karaoke_id_seq;
       public          postgresMaster    false    224    4            �           0    0    karaoke_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.karaoke_id_seq OWNED BY public.karaoke.id;
          public          postgresMaster    false    225            �            1259    33780    orders    TABLE     �   CREATE TABLE public.orders (
    id bigint NOT NULL,
    id_booking bigint NOT NULL,
    id_food bigint,
    id_beverage bigint,
    quantity bigint DEFAULT 1 NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgresMaster    false    4            �            1259    33784    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgresMaster    false    226    4            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgresMaster    false    227            �            1259    33785    prices    TABLE     �   CREATE TABLE public.prices (
    id bigint NOT NULL,
    id_room bigint NOT NULL,
    cost numeric NOT NULL,
    num_people integer NOT NULL
);
    DROP TABLE public.prices;
       public         heap    postgresMaster    false    4            �            1259    33790    prices_id_seq    SEQUENCE     v   CREATE SEQUENCE public.prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.prices_id_seq;
       public          postgresMaster    false    228    4            �           0    0    prices_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.prices_id_seq OWNED BY public.prices.id;
          public          postgresMaster    false    229            �            1259    33791    room    TABLE     �   CREATE TABLE public.room (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    max_occupancy integer NOT NULL,
    luxury boolean DEFAULT false,
    cost numeric DEFAULT 10 NOT NULL,
    image_name character varying(256)
);
    DROP TABLE public.room;
       public         heap    postgresMaster    false    4            �            1259    33795    room_id_seq    SEQUENCE     t   CREATE SEQUENCE public.room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.room_id_seq;
       public          postgresMaster    false    4    230            �           0    0    room_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.room_id_seq OWNED BY public.room.id;
          public          postgresMaster    false    231            �            1259    33796    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgresMaster    false    215    4            �           0    0    user_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.user_id_seq OWNED BY public.account.id;
          public          postgresMaster    false    232            �           2604    33797 
   account id    DEFAULT     e   ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 9   ALTER TABLE public.account ALTER COLUMN id DROP DEFAULT;
       public          postgresMaster    false    232    215            �           2604    33798    beverage id    DEFAULT     j   ALTER TABLE ONLY public.beverage ALTER COLUMN id SET DEFAULT nextval('public.beverage_id_seq'::regclass);
 :   ALTER TABLE public.beverage ALTER COLUMN id DROP DEFAULT;
       public          postgresMaster    false    217    216            �           2604    33799 
   booking id    DEFAULT     h   ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public.booking_id_seq'::regclass);
 9   ALTER TABLE public.booking ALTER COLUMN id DROP DEFAULT;
       public          postgresMaster    false    219    218            �           2604    33800    film id    DEFAULT     b   ALTER TABLE ONLY public.film ALTER COLUMN id SET DEFAULT nextval('public.film_id_seq'::regclass);
 6   ALTER TABLE public.film ALTER COLUMN id DROP DEFAULT;
       public          postgresMaster    false    221    220            �           2604    33801    food id    DEFAULT     b   ALTER TABLE ONLY public.food ALTER COLUMN id SET DEFAULT nextval('public.food_id_seq'::regclass);
 6   ALTER TABLE public.food ALTER COLUMN id DROP DEFAULT;
       public          postgresMaster    false    223    222            �           2604    33802 
   karaoke id    DEFAULT     h   ALTER TABLE ONLY public.karaoke ALTER COLUMN id SET DEFAULT nextval('public.karaoke_id_seq'::regclass);
 9   ALTER TABLE public.karaoke ALTER COLUMN id DROP DEFAULT;
       public          postgresMaster    false    225    224            �           2604    33803 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgresMaster    false    227    226            �           2604    33804 	   prices id    DEFAULT     f   ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval('public.prices_id_seq'::regclass);
 8   ALTER TABLE public.prices ALTER COLUMN id DROP DEFAULT;
       public          postgresMaster    false    229    228            �           2604    33805    room id    DEFAULT     b   ALTER TABLE ONLY public.room ALTER COLUMN id SET DEFAULT nextval('public.room_id_seq'::regclass);
 6   ALTER TABLE public.room ALTER COLUMN id DROP DEFAULT;
       public          postgresMaster    false    231    230            l          0    33735    account 
   TABLE DATA                 public          postgresMaster    false    215   �U       m          0    33741    beverage 
   TABLE DATA                 public          postgresMaster    false    216   X       o          0    33749    booking 
   TABLE DATA                 public          postgresMaster    false    218   bZ       q          0    33758    film 
   TABLE DATA                 public          postgresMaster    false    220   |Z       s          0    33765    food 
   TABLE DATA                 public          postgresMaster    false    222   �\       u          0    33774    karaoke 
   TABLE DATA                 public          postgresMaster    false    224   a       w          0    33780    orders 
   TABLE DATA                 public          postgresMaster    false    226   �i       y          0    33785    prices 
   TABLE DATA                 public          postgresMaster    false    228   �i       {          0    33791    room 
   TABLE DATA                 public          postgresMaster    false    230   �i       �           0    0    beverage_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.beverage_id_seq', 21, true);
          public          postgresMaster    false    217            �           0    0    booking_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.booking_id_seq', 1, false);
          public          postgresMaster    false    219            �           0    0    film_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.film_id_seq', 20, true);
          public          postgresMaster    false    221            �           0    0    food_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.food_id_seq', 28, true);
          public          postgresMaster    false    223            �           0    0    karaoke_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.karaoke_id_seq', 113, true);
          public          postgresMaster    false    225            �           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
          public          postgresMaster    false    227            �           0    0    prices_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.prices_id_seq', 1, false);
          public          postgresMaster    false    229            �           0    0    room_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.room_id_seq', 12, true);
          public          postgresMaster    false    231            �           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 9, true);
          public          postgresMaster    false    232            �           2606    33807    beverage beverage_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.beverage
    ADD CONSTRAINT beverage_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.beverage DROP CONSTRAINT beverage_pkey;
       public            postgresMaster    false    216            �           2606    33809    booking booking_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_pkey;
       public            postgresMaster    false    218            �           2606    33810    food check_type    CHECK CONSTRAINT     V  ALTER TABLE public.food
    ADD CONSTRAINT check_type CHECK (((type)::text = ANY (ARRAY[('SNACKS'::character varying)::text, ('SANDWICHES'::character varying)::text, ('DESSERTS'::character varying)::text, ('FRIED_FOODS'::character varying)::text, ('SALADS'::character varying)::text, ('SPECIAL_FOODS'::character varying)::text]))) NOT VALID;
 4   ALTER TABLE public.food DROP CONSTRAINT check_type;
       public          postgresMaster    false    222    222            �           2606    33812    film film_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.film DROP CONSTRAINT film_pkey;
       public            postgresMaster    false    220            �           2606    33814    food food_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.food DROP CONSTRAINT food_pkey;
       public            postgresMaster    false    222            �           2606    33816    karaoke karaoke_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.karaoke
    ADD CONSTRAINT karaoke_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.karaoke DROP CONSTRAINT karaoke_pkey;
       public            postgresMaster    false    224            �           2606    33818    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgresMaster    false    226            �           2606    33820    prices prices_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.prices DROP CONSTRAINT prices_pkey;
       public            postgresMaster    false    228            �           2606    33822    room room_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.room DROP CONSTRAINT room_pkey;
       public            postgresMaster    false    230            �           2606    33876    account unique_email 
   CONSTRAINT     P   ALTER TABLE ONLY public.account
    ADD CONSTRAINT unique_email UNIQUE (email);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT unique_email;
       public            postgresMaster    false    215            �           2606    33824    account user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.account
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.account DROP CONSTRAINT user_pkey;
       public            postgresMaster    false    215            �           2606    33825    orders FK_id_beverage    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_id_beverage" FOREIGN KEY (id_beverage) REFERENCES public.beverage(id) NOT VALID;
 A   ALTER TABLE ONLY public.orders DROP CONSTRAINT "FK_id_beverage";
       public          postgresMaster    false    226    216    3272            �           2606    33830    orders FK_id_booking    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_id_booking" FOREIGN KEY (id_booking) REFERENCES public.booking(id) NOT VALID;
 @   ALTER TABLE ONLY public.orders DROP CONSTRAINT "FK_id_booking";
       public          postgresMaster    false    3274    218    226            �           2606    33835    booking FK_id_room    FK CONSTRAINT     |   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT "FK_id_room" FOREIGN KEY (id_room) REFERENCES public.room(id) NOT VALID;
 >   ALTER TABLE ONLY public.booking DROP CONSTRAINT "FK_id_room";
       public          postgresMaster    false    230    3286    218            �           2606    33840    prices FK_id_room    FK CONSTRAINT     {   ALTER TABLE ONLY public.prices
    ADD CONSTRAINT "FK_id_room" FOREIGN KEY (id_room) REFERENCES public.room(id) NOT VALID;
 =   ALTER TABLE ONLY public.prices DROP CONSTRAINT "FK_id_room";
       public          postgresMaster    false    228    3286    230            �           2606    33845    booking FK_id_user    FK CONSTRAINT        ALTER TABLE ONLY public.booking
    ADD CONSTRAINT "FK_id_user" FOREIGN KEY (id_user) REFERENCES public.account(id) NOT VALID;
 >   ALTER TABLE ONLY public.booking DROP CONSTRAINT "FK_id_user";
       public          postgresMaster    false    215    3270    218            �           2606    33850    orders Fk_id_food    FK CONSTRAINT     {   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "Fk_id_food" FOREIGN KEY (id_food) REFERENCES public.food(id) NOT VALID;
 =   ALTER TABLE ONLY public.orders DROP CONSTRAINT "Fk_id_food";
       public          postgresMaster    false    226    222    3278            l   C  x���Ko�0 �{�JٕV$A{iBKJ�6!�ր	�b��ׯ݇�nWڜ�G���z�� �\/����%Jd�$�⓴/~=l�o��g#�$��Dx�'�E�Z|Y!@�
�RNH%
:�#� �OG
y�V��z����c����.|^5Yf6���ђ}�����z��uH��U��=-P�����H�����z+О�"G<���~Du�cD�ie4^��>(���:�ѓ�6v���𜙣6=��s��m!�=�+�����.g��c���	�8D1+0�e��@�D!�I�+�_��l?�3��}�J�ǉ�Q(��$V�M�E64�z0ogu4����J���mʞ�ࡐ��P��!�CLs�3��/�&E�G�/s>���������i��
�K8����CC�ڛ�W�� ˇ�!_���q߿����o���rR�n��_�<�ì�����m^?Uz��)���Q���&���	ǆ`�[��"�?�V��
�X�g薿�q�yqYi����.Θh��i���qW,����\&hyp��2^y��o��.�G�웛?��@�      m   M  x��UM��0��W̍V�F�M��zJ�n7R���t�ȀV��*����	=�ul��@?bqA�7�3��j���`�9l��ÌE��~��$��O�{x���ED�D"#���|:�J�������#�Jj���N
�8�?�VW�x�����J��L�������b���5�k���VQ��r@���Bd�y	���>��CzU�e�h�����H�߶TC�e�}�Y;/�,S����#2j������y]�e]�1�.�́��I�ണ|fb<h�M�a)E�`Uf��H|�r�a��R7�$2$8�(��	�:a:�F֝��3z.�7��/E�o��2]#��A�bVj���h.�?���J�u���r�'�S>������B�Y��9�Xx��o�j�3���m��Rl5\Wyǆ&6��x�2u����a�'yA$k�M��謹������m��lR�禥~c�F�F���
X;���fQ���́Sj��2�=A)��mPV��h)��3�}ƞŰF�l5�X+�$O�\5�� �����������z�z3VaU�s:��pϻ�C�붿�=�F����6      o   
   x���          q   p  x��U�n�0��+xS��d�I���$.��ۤ�k�q�H�z���?�cݥ䚎��24;��,�����b���*�v�1?{@]�����;�.;�B�5�M�ߵ�R�Cvqq*@��Cd�C�*�M�<Y��xDUs뜪�-+��qPSOF{�$��%sK&WU��0�]�����WA�;H,/�8���?L:��l<ޓ��c/�b	�����(����,py	����Ez`�ȕ?k�\�p�;t�*٣b٧ܙ������G�Z+��F�A�V��X�,��>�)�.���%>��:��X�2���R8V��L֭��w_u?��82H>��X�	�	��׶�`kDA'��Џ�l���?Mz���:%��(�+Pj���K2W�"��!�%6�J	ش5v}�mY�y����	�r@G�q�W�i�(@he�����)�-r�'�l��s&��S�i�Mbԣ��'�]�lg��#%�
8:�����B�
2�*�Ey���4���n�@�%�c� e�_"}I�,o�q�z�i�}�`�e4o��V�S���p�1�V�SM�k�����Q�����6c�/�ԯ/%��P�>�9X��F��wӷ������Cɐ���_�$Z�      s   �  x��WMs�6��W��v���r���I��FG�Dj:=qVDmD�Tl������Ǻ A���	��Ŕ@�ۧ�o�t�X��l���z�#?�(�f�����]̢� +`�U�Q̮iq1'��}:yx-hm�ݣ�5�����(�`k�Ѭ@�0ZԴY?/e�����;�.:�r F[�<W�wk9�'��G4�[cF�U�À�J���9�!T�W�RX���N���Z�ڼ�bU�Lh�Qd�� U��p6�k���x6jy���Cp�
��|)X��T�J8�ƫP��Ҵ��U��}�'G}�� ���=7��A���و���`�V�c}�>O(����X@Qk�p���Ǒ��FA��}���&fK���(���;���oe���ӹ�l��D��^�i%$V���QiT9�{���]��-M-��.��J���'�(�.f���[�\1#z�_�$	fxE��(`ς�qֵ��__��M/x��L�R{��V7>�RHe�Ʒ��}�j�u��f)���q�Ԉh���>/l�����Ke��8ppZv��Dn,��
0�2d]��݄�o/�+�U"7{���^H��,�k���ȷlR�*�ٖ$Z�������#	ȷb�W�9H�~�!�P^����/�Ғ ��l���l�#�$%��v�ϩ�����KS9۽Lvrl��t*�.�EMjM:�U&0g��
��5�D���0쁎�f��g�'�պ���h�jC��hP���|K�D�\�jr�홑���L8�H�v��d�G8���8j-z0%{�%Z�_�����Lue��fֹ�4��]\D���ߚbD��	v:�^%@R��W�Z��k{��dkS�t5A�r؉@eޠ�ʝX~�`�G%U��j�DG��t��-�n�t��A�rqh�ɇ�x�rҞ��"�-5�e�����:��%U���wD��PF��V>�DT��9߬�>!P���D��8<3�I���D���-Q�����C�:&��2o��k��.�����k�����G_&      u   ~  x��Y�r�F}���DI�$%�c�]y���H�W�흼�$,����j6�П�_�[�)Oș�Z8��hJv�� }y������z}�������-xp[T����i�~}T��˱�`�*��rY3�/W.���?kD;�����~������Go]�W.�j��:)�!��p����O�[]�Nac��}�M_�Z9c�ݨ$���W��{T�ƀ��#:�C �g3�O���y����.\�+5�E��!��N&��F�.v�����oX�H����=��������9�)B���ݥɏ��l'�K��@1��t[�c}��-ИJ�(�)�TRj�C��k�w`A:ґ�X�4�~�3$yFj�k����@-u?�k[�k���Ur�h�'g��GL�V%��q��N<�ԙ���ˈYs�\���������uc���k��e�$u��
�鬶уI��T�&)�8I!��Q�Z��~�(	ݷz����.Yz%D�z��͜�� ����wf�ʥp'�/�x�e�.4��y���jcM	�2���E�&��}���N�곫����[G�Q
�LY6\
}PDu�(�[g\Q͵�0L��mb��Rr;d�;���
煫� �����|Ii�-�7�u�������?o3��:�^�H#,�m��0�Is�)�v�񻸓�t"Eb�W~�L��*-N$f�Ē��0c��6�/�z틘0��X�H��p�(��>�Vy˝~U����N�Z���R'��Cfˤ@�S�t�}�ɾe�@��9�b�ê�;�Qe}��;dN\PN���y,������35#!*��U�UN�� �6�%������̂�2�g�^���'�m)�,5d�~��V[G���<���6*��U�9�T�#zyP�c(Z&�%c�Xv0'��Ob��q��0ƶ,�Z�6�	4�X�X�3'&t�����Ć����0s�m��p��wcq��I)�afH�u[��9h[�˾�	B�^a#�en�(������=C�i���&D�^k.��۪�hO݊\�@���b&Wq3TN��#��6b�´���&�8��Q��ɵ�J�#c�:�I$"�.)��67�B��ǘ�Bl&М�2�:Ĭ_�fZŷ���خ��sȲF}&�b�0�f��d�u�nb-�DnΣ��膵ﺁ}��B��?�`S(����P�n=��X̮SJ��ei��^SI	Ĭ�'k|g�
��n�tY��b�������V���9��@̙K�f��"[[�b_��4	J�ңq����o����d]uu���2A&41�j$�ɎRB�G���p/�K�5��ԽK��$�Ѳ�po�rd�
���J�!�X<���X������Ґ��,��T���{�\󂨪��s�_cU�V͝q=�����j#bh�����2��ǟb^�6M��u���'��(���m4_h��?z�,�A��`J�W�9n��$s���]hjh�ݶ2!�"M�3���cfǏ��P�<e����ǲcΕ؂����Ω�P��뼚<�T�����K~|������K���G�B�8ʐ�T�^�۷r(7�y� �BИ@9Ϳ$gz����0S���4A/�kh�{*y�OA��ir�w�H7��[	f�d��p;��PȈ�O���N��6�;�[���Lݕ�WMj�q.m�y_�6}�;�(oѕb�~2���o�ȣ�,�}g��!@A�����r��td��o�f��dJ1�!&��Iun�>R�v;��6�vuPWg��N�s���ܚ��S��9��%�Z{�N�f��u�e$���~y���N��B��N�F=����
���k5=/���!`��b���{Z���n��49'$*�ۦ�[��SP�	�y�WgƓ��@U��ScC�뼛����t��öjG�����N�����Qs��(��L����U�o�'��q�%ѬC����Y]y�~�/��̍5u��߈�����c;�0��=��s,���F5���H�Ʊ�?�Um��7��ҥ��-1-nL�ּ(Z9���Q�@鷂�gڨk�Կ�me3��Q���r��6�� o8�Ͼj��ĭx%2�e�q_>������/F�-!F�����t�w��l������h��=��WQ3Q�b��(45 �����oCo�Z|^��>|�/�t�      w   
   x���          y   
   x���          {   �   x�����0��ŻY ����<a���B+�����A�������9]��ɮ�4+�Ѝ��z�����a��'9,��7-�j!��RO�����\����b�(H�:��p���pUĥ�Mm�RA\�r�MNOL�W���!����Ñ�%�Q� ��U
��u�O�",��?䔄�'�B��1�楈�o��l�����c     