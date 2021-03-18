create table if not exists species
(
	id serial not null
		constraint species_pk
			primary key,
	species_names varchar,
	classification varchar,
	designation varchar,
	languages varchar,
	average_lifespan integer,
	eye_colors integer
);

alter table species owner to postgres;

create table if not exists planet
(
	id serial not null
		constraint planet_pk
			primary key,
	planet_names varchar,
	rotation_period integer,
	orbital_period integer,
	diameter integer,
	surface_water double precision,
	population bigint,
	climate integer,
	gravity integer,
	terrain integer
);

alter table planet owner to postgres;

create table if not exists characters
(
	id serial not null
		constraint characters_pk
			primary key,
	lastname varchar,
	birthdate date,
	gender varchar,
	height integer,
	mass integer,
	eye_colors integer,
	species integer,
	homeworld_idx integer
		constraint homeworld_fk
			references planet,
	species_idx integer
		constraint species_fk
			references species
);

alter table characters owner to postgres;

create table if not exists climate
(
	id serial not null
		constraint climate_pk
			primary key,
	climate_types varchar,
	"planet idx" integer
		constraint planet_fk
			references planet
);

alter table climate owner to postgres;

create table if not exists manufacturer
(
	id serial not null
		constraint manufacturer_pk_2
			primary key,
	manufacturers varchar
);

alter table manufacturer owner to postgres;

create table if not exists transports
(
	id serial not null
		constraint transports_pk
			primary key,
	transport_names varchar,
	transport_class varchar,
	cost_in_credits integer,
	crew integer,
	passengers integer,
	cargo_capacity integer,
	length integer,
	max_atmospheric_speed integer,
	megalight bigint,
	"transport_type idx" integer
);

alter table transports owner to postgres;

create table if not exists transport_type
(
	id serial not null
		constraint transport_type_pk
			primary key,
	transport_types integer,
	manufacturer_idx integer
		constraint manufacturer__fk
			references manufacturer,
	"transport idx" integer
		constraint transport_fk
			references transports
);

alter table transport_type owner to postgres;

