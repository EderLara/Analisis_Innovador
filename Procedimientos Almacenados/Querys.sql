
alter table articulos add column porcentaje_utilidad float not null default 0.0;
alter table articulos add column precio_venta float not null default 0.0;

call cost_item()