PGDMP     3    8                {            student    15.4    15.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25003    student    DATABASE     {   CREATE DATABASE student WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE student;
                postgres    false            �            1259    25014    students    TABLE     �  CREATE TABLE public.students (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    discipline character varying(100) NOT NULL,
    student_group character varying(20) NOT NULL,
    point numeric(3,2) NOT NULL,
    CONSTRAINT students_point_check CHECK (((point >= 2.0) AND (point <= 5.0))),
    CONSTRAINT students_student_group_check CHECK (((student_group)::text = ANY ((ARRAY['ЭФМО-01-23'::character varying, 'ЭФМО-02-23'::character varying])::text[])))
);
    DROP TABLE public.students;
       public         heap    postgres    false            �            1259    25013    students_id_seq    SEQUENCE     �   CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.students_id_seq;
       public          postgres    false    215                        0    0    students_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;
          public          postgres    false    214            e           2604    25017    students id    DEFAULT     j   ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);
 :   ALTER TABLE public.students ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �          0    25014    students 
   TABLE DATA           S   COPY public.students (id, full_name, discipline, student_group, point) FROM stdin;
    public          postgres    false    215                     0    0    students_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.students_id_seq', 40, true);
          public          postgres    false    214            i           2606    25021    students students_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public            postgres    false    215            �     x�͘�n�@���S�@޵9�K�CI")�ڋ(M��m%jb� v^a�����RW���`E����|s�=�Z����ڌha&�R��=m̵�q�6am�׈B��e��ae�.=�����̥ؕO�i��Li��+9d�������H_ڞnk�t���K ݚ���߉,M̔��	�<���F���Cp-�%�;�%�K[��R�M,���R�cs�7��x�_�Qn�`��c�������"BGQ�B9=��m��= .[{NP��xgbt#�9���~���آ��᎔Vy�ż����sz%�>rg`�3%m��.��g\dp��yO)��f���9u�\)hʩ��:+@,�Qa\��̆y� ���k�A��aYq�&��K�Z�n�
57�0C�^�p�;�\QN,t9���e�ǚ�Bh�r1�t��̋,��+�;8Xb&�힏eokUD�e��9ʳ�9��,h
�ʊ��:��Z��z�������*T�<\CpV\U_nҫ�V��yj?쨞�/���A��Y��m�ec�� ��X�����N�����ن?5��<�޽�}ڳB?�ȧ��X�L{Z[qU;����x��u�Ӂ�/u�w��O���&��q\�&��;.��7�خ���Lz�W��(O�/I�5�dgP҉�b&��
�VH�}�$a�Z	��UI��&���%��E?��>I$)fB��|W�,g�yc�>3� 
���37r�t�Y��Y5���O2?�ϱ�JЪ�!�g�lj#�h�\U�߮=kj�C<v�u��2��     