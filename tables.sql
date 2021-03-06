--mysql
CREATE TABLE facility (
comm_city                 tinytext,
comm_state                char(2),
eeo_rpt_ind               char(1),
fac_address1              tinytext,
fac_address2              tinytext,
fac_callsign              tinytext,
fac_channel               int,
fac_city                  tinytext,
fac_country               tinytext,
fac_frequency             float,
fac_service               tinytext,
fac_state                 char(2),
fac_status_date           datetime,
fac_type                  text,
facility_id               int  NOT NULL,
lic_expiration_date       datetime,
fac_status                text,
fac_zip1                  tinytext,
fac_zip2                  tinytext,
station_type              tinytext,
assoc_facility_id         int,
callsign_eff_date         datetime,
tsid_ntsc                 int,
tsid_dtv                  int,
digital_status            tinytext,
sat_tv                    tinytext,
last_change_date          datetime,
PRIMARY KEY (facility_id),
FULLTEXT INDEX (fac_callsign)
);

CREATE TABLE application (
app_arn                   tinytext,
app_service               tinytext NOT NULL,
application_id            int NOT NULL,
facility_id               int NOT NULL,
file_prefix               tinytext,
comm_city                 tinytext,
comm_state                char(2),
fac_frequency             float,
station_channel           int,
fac_callsign              tinytext,
general_app_service       text,
app_type                  text,
paper_filed_ind           char(1),
dtv_type                  text,
last_change_date          datetime,
PRIMARY KEY (application_id),
FOREIGN KEY (facility_id) REFERENCES facility (facility_id) on delete cascade,
FULLTEXT INDEX (fac_callsign)
);

CREATE TABLE fm_eng_data (
ant_input_pwr             float,
ant_max_pwr_gain          float,
ant_polarization          tinytext,
ant_rotation              float,
antenna_id                int,
antenna_type              tinytext,
application_id            int NOT NULL,
asd_service               tinytext,
asrn_na_ind               char(1),
asrn                      int,
avg_horiz_pwr_gain        float,
biased_lat                float,
biased_long               float,
border_code               tinytext,
border_dist               float,
docket_num                text,
effective_erp             float,
elev_amsl                 float,
elev_bldg_ag              float,
eng_record_type           tinytext,
facility_id               int NOT NULL,
fm_dom_status             text,
gain_area                 float,
haat_horiz_rc_mtr         float,
haat_vert_rc_mtr          float,
hag_horiz_rc_mtr          float,
hag_overall_mtr           float,
hag_vert_rc_mtr           float,
horiz_bt_erp              float,
horiz_erp                 float,
lat_deg                   int,
lat_dir                   char(1),
lat_min                   int,
lat_sec                   float,
lon_deg                   int,
lon_dir                   char(1),
lon_min                   int,
lon_sec                   float,
loss_area                 float,
max_ant_pwr_gain          float,
max_haat                  float,
max_horiz_erp             float,
max_vert_erp              float,
multiplexor_loss          float,
power_output_vis_kw       float,
predict_coverage_area     float,
predict_pop               int,
rcamsl_horiz_mtr          float,
rcamsl_vert_mtr           float,
station_class             text,
terrain_data_src          tinytext,
vert_bt_erp               float,
vert_erp                  float,
num_sections              int,
present_area              float,
percent_change            float,
spacing                   float,
terrain_data_src_other    text,
trans_power_output        float,
mainkey                   tinytext,
lat_whole_secs            int,
lon_whole_secs            int,
station_channel           int,
lic_ant_make              text,
lic_ant_model_num         text,
min_horiz_erp             float,
haat_horiz_calc_ind       char(1),
erp_w                     int,
trans_power_output_w      int,
market_group_num          text,
last_change_date          datetime,
FOREIGN KEY (facility_id) REFERENCES facility (facility_id) on delete cascade,
FOREIGN KEY (application_id) REFERENCES application (application_id) on delete cascade
);