PGDMP     &                    |            EGE    15.4    15.4 *    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    33195    EGE    DATABASE     y   CREATE DATABASE "EGE" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "EGE";
                postgres    false            �            1259    33292    achievement    TABLE        CREATE TABLE public.achievement (
    achievement_id bigint NOT NULL,
    name_achievement character(255),
    bonus bigint
);
    DROP TABLE public.achievement;
       public         heap    postgres    false            �            1259    33275    departament    TABLE     m   CREATE TABLE public.departament (
    departament_id bigint NOT NULL,
    name_departament character(255)
);
    DROP TABLE public.departament;
       public         heap    postgres    false            �            1259    33280    enrollee    TABLE     �   CREATE TABLE public.enrollee (
    enrollee_id bigint NOT NULL,
    lastname_enrollee character(255),
    firstname_enrollee character(255),
    middlename_enrollee character(255)
);
    DROP TABLE public.enrollee;
       public         heap    postgres    false            �            1259    33352    enrollee_achievement    TABLE     �   CREATE TABLE public.enrollee_achievement (
    enrollee_achievement_id bigint NOT NULL,
    achievement_id bigint,
    enrollee_id bigint
);
 (   DROP TABLE public.enrollee_achievement;
       public         heap    postgres    false            �            1259    33367    enrollee_eg_scores    TABLE     \   CREATE TABLE public.enrollee_eg_scores (
    enrollee_id bigint,
    total_score numeric
);
 &   DROP TABLE public.enrollee_eg_scores;
       public         heap    postgres    false            �            1259    33337    enrollee_subject    TABLE     �   CREATE TABLE public.enrollee_subject (
    enrollee_subject_id bigint NOT NULL,
    result bigint,
    subject_id bigint,
    enrollee_id bigint
);
 $   DROP TABLE public.enrollee_subject;
       public         heap    postgres    false            �            1259    33297    program    TABLE     �   CREATE TABLE public.program (
    program_id bigint NOT NULL,
    name_program character(255),
    plan bigint,
    departament_id bigint
);
    DROP TABLE public.program;
       public         heap    postgres    false            �            1259    33307    program_enrollee    TABLE     �   CREATE TABLE public.program_enrollee (
    program_enrollee_id bigint NOT NULL,
    enrollee_id bigint,
    program_id bigint
);
 $   DROP TABLE public.program_enrollee;
       public         heap    postgres    false            �            1259    33322    program_subject    TABLE     �   CREATE TABLE public.program_subject (
    program_subject_id bigint NOT NULL,
    min_result bigint,
    subject_id bigint,
    program_id bigint
);
 #   DROP TABLE public.program_subject;
       public         heap    postgres    false            �            1259    33287    subject    TABLE     a   CREATE TABLE public.subject (
    subject_id bigint NOT NULL,
    name_subject character(255)
);
    DROP TABLE public.subject;
       public         heap    postgres    false            4          0    33292    achievement 
   TABLE DATA           N   COPY public.achievement (achievement_id, name_achievement, bonus) FROM stdin;
    public          postgres    false    217   14       1          0    33275    departament 
   TABLE DATA           G   COPY public.departament (departament_id, name_departament) FROM stdin;
    public          postgres    false    214   �4       2          0    33280    enrollee 
   TABLE DATA           k   COPY public.enrollee (enrollee_id, lastname_enrollee, firstname_enrollee, middlename_enrollee) FROM stdin;
    public          postgres    false    215   �5       9          0    33352    enrollee_achievement 
   TABLE DATA           d   COPY public.enrollee_achievement (enrollee_achievement_id, achievement_id, enrollee_id) FROM stdin;
    public          postgres    false    222   W6       :          0    33367    enrollee_eg_scores 
   TABLE DATA           F   COPY public.enrollee_eg_scores (enrollee_id, total_score) FROM stdin;
    public          postgres    false    223   �6       8          0    33337    enrollee_subject 
   TABLE DATA           `   COPY public.enrollee_subject (enrollee_subject_id, result, subject_id, enrollee_id) FROM stdin;
    public          postgres    false    221   �6       5          0    33297    program 
   TABLE DATA           Q   COPY public.program (program_id, name_program, plan, departament_id) FROM stdin;
    public          postgres    false    218    7       6          0    33307    program_enrollee 
   TABLE DATA           X   COPY public.program_enrollee (program_enrollee_id, enrollee_id, program_id) FROM stdin;
    public          postgres    false    219   �7       7          0    33322    program_subject 
   TABLE DATA           a   COPY public.program_subject (program_subject_id, min_result, subject_id, program_id) FROM stdin;
    public          postgres    false    220   8       3          0    33287    subject 
   TABLE DATA           ;   COPY public.subject (subject_id, name_subject) FROM stdin;
    public          postgres    false    216   g8       �           2606    33296    achievement achievement_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.achievement
    ADD CONSTRAINT achievement_pkey PRIMARY KEY (achievement_id);
 F   ALTER TABLE ONLY public.achievement DROP CONSTRAINT achievement_pkey;
       public            postgres    false    217            �           2606    33279    departament departament_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.departament
    ADD CONSTRAINT departament_pkey PRIMARY KEY (departament_id);
 F   ALTER TABLE ONLY public.departament DROP CONSTRAINT departament_pkey;
       public            postgres    false    214            �           2606    33356 .   enrollee_achievement enrollee_achievement_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.enrollee_achievement
    ADD CONSTRAINT enrollee_achievement_pkey PRIMARY KEY (enrollee_achievement_id);
 X   ALTER TABLE ONLY public.enrollee_achievement DROP CONSTRAINT enrollee_achievement_pkey;
       public            postgres    false    222            �           2606    33286    enrollee enrollee_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.enrollee
    ADD CONSTRAINT enrollee_pkey PRIMARY KEY (enrollee_id);
 @   ALTER TABLE ONLY public.enrollee DROP CONSTRAINT enrollee_pkey;
       public            postgres    false    215            �           2606    33341 &   enrollee_subject enrollee_subject_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.enrollee_subject
    ADD CONSTRAINT enrollee_subject_pkey PRIMARY KEY (enrollee_subject_id);
 P   ALTER TABLE ONLY public.enrollee_subject DROP CONSTRAINT enrollee_subject_pkey;
       public            postgres    false    221            �           2606    33311 &   program_enrollee program_enrollee_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.program_enrollee
    ADD CONSTRAINT program_enrollee_pkey PRIMARY KEY (program_enrollee_id);
 P   ALTER TABLE ONLY public.program_enrollee DROP CONSTRAINT program_enrollee_pkey;
       public            postgres    false    219            �           2606    33301    program program_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (program_id);
 >   ALTER TABLE ONLY public.program DROP CONSTRAINT program_pkey;
       public            postgres    false    218            �           2606    33326 $   program_subject program_subject_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.program_subject
    ADD CONSTRAINT program_subject_pkey PRIMARY KEY (program_subject_id);
 N   ALTER TABLE ONLY public.program_subject DROP CONSTRAINT program_subject_pkey;
       public            postgres    false    220            �           2606    33291    subject subject_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (subject_id);
 >   ALTER TABLE ONLY public.subject DROP CONSTRAINT subject_pkey;
       public            postgres    false    216            �           2606    33357 =   enrollee_achievement enrollee_achievement_achievement_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enrollee_achievement
    ADD CONSTRAINT enrollee_achievement_achievement_id_fkey FOREIGN KEY (achievement_id) REFERENCES public.achievement(achievement_id);
 g   ALTER TABLE ONLY public.enrollee_achievement DROP CONSTRAINT enrollee_achievement_achievement_id_fkey;
       public          postgres    false    217    222    3215            �           2606    33362 :   enrollee_achievement enrollee_achievement_enrollee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enrollee_achievement
    ADD CONSTRAINT enrollee_achievement_enrollee_id_fkey FOREIGN KEY (enrollee_id) REFERENCES public.enrollee(enrollee_id);
 d   ALTER TABLE ONLY public.enrollee_achievement DROP CONSTRAINT enrollee_achievement_enrollee_id_fkey;
       public          postgres    false    222    215    3211            �           2606    33347 2   enrollee_subject enrollee_subject_enrollee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enrollee_subject
    ADD CONSTRAINT enrollee_subject_enrollee_id_fkey FOREIGN KEY (enrollee_id) REFERENCES public.enrollee(enrollee_id);
 \   ALTER TABLE ONLY public.enrollee_subject DROP CONSTRAINT enrollee_subject_enrollee_id_fkey;
       public          postgres    false    215    3211    221            �           2606    33342 1   enrollee_subject enrollee_subject_subject_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enrollee_subject
    ADD CONSTRAINT enrollee_subject_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(subject_id);
 [   ALTER TABLE ONLY public.enrollee_subject DROP CONSTRAINT enrollee_subject_subject_id_fkey;
       public          postgres    false    216    3213    221            �           2606    33302 #   program program_departament_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_departament_id_fkey FOREIGN KEY (departament_id) REFERENCES public.departament(departament_id);
 M   ALTER TABLE ONLY public.program DROP CONSTRAINT program_departament_id_fkey;
       public          postgres    false    214    218    3209            �           2606    33312 2   program_enrollee program_enrollee_enrollee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.program_enrollee
    ADD CONSTRAINT program_enrollee_enrollee_id_fkey FOREIGN KEY (enrollee_id) REFERENCES public.enrollee(enrollee_id);
 \   ALTER TABLE ONLY public.program_enrollee DROP CONSTRAINT program_enrollee_enrollee_id_fkey;
       public          postgres    false    219    215    3211            �           2606    33317 1   program_enrollee program_enrollee_program_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.program_enrollee
    ADD CONSTRAINT program_enrollee_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(program_id);
 [   ALTER TABLE ONLY public.program_enrollee DROP CONSTRAINT program_enrollee_program_id_fkey;
       public          postgres    false    218    219    3217            �           2606    33332 /   program_subject program_subject_program_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.program_subject
    ADD CONSTRAINT program_subject_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(program_id);
 Y   ALTER TABLE ONLY public.program_subject DROP CONSTRAINT program_subject_program_id_fkey;
       public          postgres    false    218    220    3217            �           2606    33327 /   program_subject program_subject_subject_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.program_subject
    ADD CONSTRAINT program_subject_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(subject_id);
 Y   ALTER TABLE ONLY public.program_subject DROP CONSTRAINT program_subject_subject_id_fkey;
       public          postgres    false    220    216    3213            4   �   x�哻�@D��*��m�b�$H$	$��d㣅w�vDn6�IvF3�p�ቧK��iKGH{��
R̵��x�i'�\�~l�R+���*��R�1����ך� �.�Gڙ�ȋ&m,������fF2��٬HJ]�T��v�      1   �   x��]
1���)z���x�*

^���B�=��FN�� �Yaw(����if\Q#���ͣ1��l�h�P�Q�.���� �
-o��2t�x�\�gЧM2/�J���yU��,�
!����H�(���p�7�'�y�'|&�M��<Pɲ�g��Eɪ�|�7��gl@���"�a�S�      2   �   x��1
�PD��S�����È�66v!�9@?��9��\%�/`��5�3��7txq�`���#;�/�04t%� �ζ�(Df�7�y`���k�	��#_���w��g��!�-�k�t���K�>��Qdm�|0�4���Nб�И,�/��z?&؁H�f��/�lB      9   %   x�3�4�4�2�B.cN �2�B.S��)W� K�.      :   &   x�3�4�2�421�2�445�2��8��b���� V��      8   N   x�%���0C���0U����t�9
����g`���x!؝�f��Da�rh��)t��,��e�SRf]�-�?S�#�nq      5   �   x�哱�@E��)2J.�m&	H B��Ht��X�{#|aR�wv���\�gF���N�ڲӚ�n�ex�_ٜ�2G!�X��a��hk\";����[�r8)����tm�4�FL�$Fϑ�h�o��śq����T��X�T�w�t�����Q�O�q�}��09rxY.D���W      6   &   x�3�4�4�2�4�ƜƜF\&�@�e�	�\1z\\\ K�0      7   C   x��� !���b6"ڋ�ױx{ɌQ�4��l88S�
V#��q%;�qg�Q�$���j�O��&      3      x�3�0��M�^��w\�ua��H\F�� ��}�ps^X
�=v\�h��2�0�.���#80�L9/̸�,�]l���e�ya60 ��%0 ����f=������� ,p��     