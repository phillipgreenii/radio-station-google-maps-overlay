CREATE OR REPLACE VIEW radio_station_locations_view
 AS
SELECT fac.fac_callsign, fac.fac_frequency, fac.fac_service,
       fm.lat_deg, fm.lat_dir, fm.lat_min, fm.lat_sec, (CASE WHEN lat_dir = 'N' THEN 1
                                                             WHEN lat_dir = 'S' THEN -1
                                                             ELSE 0
                                                        END) * (lat_deg + lat_min/60.0 + lat_sec/3600.0) lat_dec,
       fm.lon_deg, fm.lon_dir, fm.lon_min, fm.lon_sec, (CASE WHEN lon_dir = 'E' THEN 1
                                                             WHEN lon_dir = 'W' THEN -1
                                                             ELSE 0
                                                        END) * (lon_deg + lon_min/60.0 + lon_sec/3600.0) lon_dec
FROM facility fac
JOIN fm_eng_data fm USING (facility_id);
