PGDMP                         {            postgres    15.4    15.4      %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            )           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3368                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            *           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16398    city    TABLE     m   CREATE TABLE public.city (
    id bigint NOT NULL,
    name character(30) NOT NULL,
    country_id bigint
);
    DROP TABLE public.city;
       public         heap    postgres    false            �            1259    16401    country    TABLE     Y   CREATE TABLE public.country (
    id bigint NOT NULL,
    name character(30) NOT NULL
);
    DROP TABLE public.country;
       public         heap    postgres    false            �            1259    16404    intermediate_stations    TABLE     �   CREATE TABLE public.intermediate_stations (
    id bigint NOT NULL,
    departure_datetime timestamp without time zone,
    arrival_datetime timestamp without time zone,
    root_id bigint,
    city_id bigint
);
 )   DROP TABLE public.intermediate_stations;
       public         heap    postgres    false            �            1259    16407    race    TABLE     �   CREATE TABLE public.race (
    id bigint NOT NULL,
    departure_datetime timestamp without time zone,
    arrival_datetime timestamp without time zone,
    root_id bigint
);
    DROP TABLE public.race;
       public         heap    postgres    false            �            1259    16410    root    TABLE     �   CREATE TABLE public.root (
    id bigint NOT NULL,
    number character(12) NOT NULL,
    departure_point bigint,
    arrival_point bigint
);
    DROP TABLE public.root;
       public         heap    postgres    false            �            1259    16468    ticket    TABLE     d  CREATE TABLE public.ticket (
    id bigint NOT NULL,
    type_of_van bigint,
    site bigint,
    cost bigint,
    van_number bigint,
    status bigint DEFAULT 1,
    race_id bigint,
    CONSTRAINT ticket_status_check CHECK (((status >= 1) AND (status <= 2))),
    CONSTRAINT ticket_type_of_van_check CHECK (((type_of_van >= 1) AND (type_of_van <= 2)))
);
    DROP TABLE public.ticket;
       public         heap    postgres    false                      0    16398    city 
   TABLE DATA           4   COPY public.city (id, name, country_id) FROM stdin;
    public          postgres    false    215   �$                 0    16401    country 
   TABLE DATA           +   COPY public.country (id, name) FROM stdin;
    public          postgres    false    216   |%                 0    16404    intermediate_stations 
   TABLE DATA           k   COPY public.intermediate_stations (id, departure_datetime, arrival_datetime, root_id, city_id) FROM stdin;
    public          postgres    false    217   �%                  0    16407    race 
   TABLE DATA           Q   COPY public.race (id, departure_datetime, arrival_datetime, root_id) FROM stdin;
    public          postgres    false    218   �&       !          0    16410    root 
   TABLE DATA           J   COPY public.root (id, number, departure_point, arrival_point) FROM stdin;
    public          postgres    false    219   �'       "          0    16468    ticket 
   TABLE DATA           Z   COPY public.ticket (id, type_of_van, site, cost, van_number, status, race_id) FROM stdin;
    public          postgres    false    220   (       }           2606    16420    city city_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    215                       2606    16422    country country_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_pkey;
       public            postgres    false    216            �           2606    16424 0   intermediate_stations intermediate_stations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.intermediate_stations
    ADD CONSTRAINT intermediate_stations_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.intermediate_stations DROP CONSTRAINT intermediate_stations_pkey;
       public            postgres    false    217            �           2606    16426    race race_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.race DROP CONSTRAINT race_pkey;
       public            postgres    false    218            �           2606    16428    root root_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.root
    ADD CONSTRAINT root_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.root DROP CONSTRAINT root_pkey;
       public            postgres    false    219            �           2606    16475    ticket ticket_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_pkey;
       public            postgres    false    220            �           2606    16431    city city_country_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);
 C   ALTER TABLE ONLY public.city DROP CONSTRAINT city_country_id_fkey;
       public          postgres    false    3199    215    216            �           2606    16436 8   intermediate_stations intermediate_stations_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.intermediate_stations
    ADD CONSTRAINT intermediate_stations_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(id);
 b   ALTER TABLE ONLY public.intermediate_stations DROP CONSTRAINT intermediate_stations_city_id_fkey;
       public          postgres    false    217    215    3197            �           2606    16441 8   intermediate_stations intermediate_stations_root_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.intermediate_stations
    ADD CONSTRAINT intermediate_stations_root_id_fkey FOREIGN KEY (root_id) REFERENCES public.root(id);
 b   ALTER TABLE ONLY public.intermediate_stations DROP CONSTRAINT intermediate_stations_root_id_fkey;
       public          postgres    false    219    217    3205            �           2606    16446    race race_root_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_root_id_fkey FOREIGN KEY (root_id) REFERENCES public.root(id);
 @   ALTER TABLE ONLY public.race DROP CONSTRAINT race_root_id_fkey;
       public          postgres    false    218    3205    219            �           2606    16451    root root_arrival_point_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.root
    ADD CONSTRAINT root_arrival_point_fkey FOREIGN KEY (arrival_point) REFERENCES public.city(id);
 F   ALTER TABLE ONLY public.root DROP CONSTRAINT root_arrival_point_fkey;
       public          postgres    false    3197    219    215            �           2606    16456    root root_departure_point_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.root
    ADD CONSTRAINT root_departure_point_fkey FOREIGN KEY (departure_point) REFERENCES public.city(id);
 H   ALTER TABLE ONLY public.root DROP CONSTRAINT root_departure_point_fkey;
       public          postgres    false    219    215    3197            �           2606    16476    ticket ticket_race_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_race_id_fkey FOREIGN KEY (race_id) REFERENCES public.race(id);
 D   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_race_id_fkey;
       public          postgres    false    218    3203    220               �   x�}�M�@�םSp���w�0�[�K��`!��^o�7d��M'�^�W+8��5*�p��IhB�QBR�rc�%
��π
�qF���L78��\�k̈p�s�LW�~{� e�L�����D�~r.�׫���{[t${�2*\�Џ]
��p�s>�mkG��n���]�1��         -   x�3�0�bӅv_�q�_�2⼰�¾���*����� �4j         �   x�EP˱� ;�*� ;�/�k���x&/Kf8IB�$M��]����`WWg�4�XM�"}�Xf�eă�����=��F���e�E��	�S��͛����r�!�kc�]'#R���F��gh��F���퀕6˺)]�2�N^r<�v5�"Q�R��\��=�r��S���Z�A�1y�Tv�eb{�=H��w]c��+�]
��^����[U/^N���h��"��SP          �   x�M�ˑ1C��(H�[H�O����^�{�|R	�qQ�
TR�K��^ф���
�W+����mo�[����嫷�C�#��o)��\��V|�"3��޾RK.����F03��ӅL���K߼��Ff���u�ka�el}<�x��<T��-3�|������AT�f���>��կ�{��y����z�D0���k���3>?��_ -P      !   {   x�%��Aߦ�� 0������#۠<�ZL��ő���Գlp�@��a�E��ϩ�M.�}LL�i��]\
U�$/�uqQv�fպa��c��!���Y��^��:�&2�?���#"?���      "   �   x�MP��0{�aN�@�t�9ΐ>*E�8(�� �XU*/�7�]-�Q�D�4W�q|!F����RN�֥z��r�Hn�7i�t-¶��T�#;����J��&^�Nb��]C
�=�Ƶ+}����5����}���?�:J��EU��T�i�-���h�o�����r_�_s�b��S~����hj� �?�
;�     