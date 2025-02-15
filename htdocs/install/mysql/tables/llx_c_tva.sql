-- ========================================================================
-- Copyright (C) 2005           Laurent Destailleur  <eldy@users.sourceforge.net>
-- Copyright (C) 2010-2015      Juanjo Menent        <jmenent@2byte.es>
-- Copyright (C) 2011-2023      Alexandre Spangaro   <aspangaro@open-dsi.fr>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <https://www.gnu.org/licenses/>.
--
-- ========================================================================

create table llx_c_tva
(
  rowid                 integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
  entity                integer DEFAULT 1 NOT NULL,
  fk_pays               integer NOT NULL,
  fk_department_buyer   integer DEFAULT NULL,                       -- Id of department for VAT rule or NULL to keep rule on country
  code                  varchar(10) DEFAULT '',                     -- a key to describe vat entry, for example FR20
  type_vat              smallint NOT NULL DEFAULT 0,                -- 0: all, 1: sell, 2: purchase
  taux                  double  NOT NULL,
  localtax1             varchar(20)  NOT NULL DEFAULT '0',
  localtax1_type        varchar(10)	 NOT NULL DEFAULT '0',
  localtax2             varchar(20)  NOT NULL DEFAULT '0',
  localtax2_type        varchar(10)  NOT NULL DEFAULT '0',
  use_default           tinyint DEFAULT 0,                          -- set to 1 to be the default vat when no vat defined on product
  recuperableonly       integer NOT NULL DEFAULT 0,					-- VAT NPR for France
  note                  varchar(128),
  active                tinyint DEFAULT 1 NOT NULL,
  accountancy_code_sell varchar(32) DEFAULT NULL,
  accountancy_code_buy	varchar(32) DEFAULT NULL
)ENGINE=innodb;
