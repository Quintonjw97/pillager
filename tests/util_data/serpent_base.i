set title "Microreactor Serpent Input.i"

% ------- Geometry ----------------------------------

set acelib "./s2_xsdir_hpc_endfb8"
set declib "/hpc-common/data/serpent/xsdata/sss_endfb7.dec"
set nfylib "/hpc-common/data/serpent/xsdata/sss_endfb7.nfy"

set xenon 1
set power 5000000.0


% ------- Inclusions ---------

include "materials.i"
include "crewmen.i"

% ------- Nominal Pins -------

particle 101
nominal_fuel 0.025
nominal_buffer 0.035
nominal_ipyc 0.039
nominal_sic 0.0425
nominal_opyc 0.0465
monolith
particle 102
nominal_fuel 0.025
nominal_buffer 0.035
nominal_ipyc 0.039
nominal_sic 0.0425
nominal_opyc 0.0465
monolith
particle 103
nominal_fuel 0.025
nominal_buffer 0.035
nominal_ipyc 0.039
nominal_sic 0.0425
nominal_opyc 0.0465
monolith
particle 104
nominal_fuel 0.025
nominal_buffer 0.035
nominal_ipyc 0.039
nominal_sic 0.0425
nominal_opyc 0.0465
monolith
pbed pebble_bed_compact_1 2 "compact_1_triso.txt"
pbed pebble_bed_compact_2 2 "compact_2_triso.txt"
pbed pebble_bed_compact_3 2 "compact_3_triso.txt"
pbed pebble_bed_compact_4 2 "compact_4_triso.txt"
cell 2 2 monolith  -infinity_s

% ------- Dummy Pins ---------

particle 1101
dummy_fuel_11 0.025
dummy_buffer_11 0.039
dummy_sic_11 0.0425
dummy_opyc_11 0.0465
dummy_monolith
particle 1102
dummy_fuel_12 0.025
dummy_buffer_12 0.039
dummy_sic_12 0.0425
dummy_opyc_12 0.0465
dummy_monolith
particle 1103
dummy_fuel_13 0.025
dummy_buffer_13 0.039
dummy_sic_13 0.0425
dummy_opyc_13 0.0465
dummy_monolith
particle 1104
dummy_fuel_14 0.025
dummy_buffer_14 0.039
dummy_sic_14 0.0425
dummy_opyc_14 0.0465
dummy_monolith
pbed dummy_pin1compact1 2 "1dummy_compact_1_triso.txt"
pbed dummy_pin1compact2 2 "1dummy_compact_2_triso.txt"
pbed dummy_pin1compact3 2 "1dummy_compact_3_triso.txt"
pbed dummy_pin1compact4 2 "1dummy_compact_4_triso.txt"
particle 2101
dummy_fuel_21 0.025
dummy_buffer_21 0.039
dummy_sic_21 0.0425
dummy_opyc_21 0.0465
dummy_monolith
particle 2102
dummy_fuel_22 0.025
dummy_buffer_22 0.039
dummy_sic_22 0.0425
dummy_opyc_22 0.0465
dummy_monolith
particle 2103
dummy_fuel_23 0.025
dummy_buffer_23 0.039
dummy_sic_23 0.0425
dummy_opyc_23 0.0465
dummy_monolith
particle 2104
dummy_fuel_24 0.025
dummy_buffer_24 0.039
dummy_sic_24 0.0425
dummy_opyc_24 0.0465
dummy_monolith
pbed dummy_pin2compact1 2 "2dummy_compact_1_triso.txt"
pbed dummy_pin2compact2 2 "2dummy_compact_2_triso.txt"
pbed dummy_pin2compact3 2 "2dummy_compact_3_triso.txt"
pbed dummy_pin2compact4 2 "2dummy_compact_4_triso.txt"

% ------- surfaces ----------------------------------

surf graphite_pin_u_void cylz 0.0 0.0 1.05 20.0 180.0
surf graphite_pin_u_mono cylz 0.0 0.0 1.05 20.0 180.0
surf graphite_pin_u_pz_low pz 20.0
surf graphite_pin_u_pz_up pz 180.0
surf graphite_pin_u_0 cylz 0.0 0.0 1.0 20.0 180.0
surf infinity_s inf
surf infinity_s2 inf
surf infinity_s3 inf
surf fuel_inner_cyl_s cylz 0.0 0.0 1.0 20.0 180.0
surf fuel_outer_cyl_s cylz 0.0 0.0 1.05 20.0 180.0
surf compact1_pz_s pz 60.0
surf compact2_pz_s pz 100.0
surf compact3_pz_s pz 140.0
surf compact4_pz_s pz 180.0
surf fuel_pin_lower_s pz 20.0
surf fuel_pin_upper_s pz 180.0
surf outside_fuel_s cylz 0.0 0.0 1.05 20.0 180.0
surf hp_inner_cyl_s cylz 0.0 0.0 1.1 0.0 200.0
surf hp_outer_cyl_s cylz 0.0 0.0 1.15 0.0 200.0
surf hp_lower_s pz 20.0
surf hp_upper_s pz 180.0
surf outside_hp_cyl_s cylz 0.0 0.0 1.05 20.0 180.0
surf FA_monolith_hex_s hexyprism 0.0 0.0 16.0765 0.0 200.0
surf FA_refl_hex_active_s hexyprism 0.0 0.0 16.0765 20.0 180.0
surf FA_outer_active_s hexyprism 0.0 0.0 16.0765 20.0 180.0
surf FA_outer_s hexyprism 0.0 0.0 16.2765 0.0 200.0
surf FA_lower_axial_refl_s pz 20.0
surf FA_upper_axial_refl_s pz 180.0
surf BeAssm_outer_hex_s hexyprism 0.0 0.0 16.2765 0.0 200.0
surf BeAssm_lower_be_s pz 20.0
surf BeAssm_upper_be_s pz 180.0
surf dummy_FA_monolith_hex_s hexyprism 0.0 0.0 16.0765 0.0 200.0
surf dummy_FA_outer_s hexyprism 0.0 0.0 16.2765 0.0 200.0
surf cd_be_s cylz 0.0 0.0 14.0  
surf cd_pad_s cylz 0.0 0.0 15.0  
surf cd_void_s cylz 0.0 0.0 15.05  
surf berr_cd_inf_s inf
surf pois_cd_inf_s inf
surf h2_cd_inf_s inf
surf void_assembly_lower_s pz 20.0
surf void_assembly_upper1_s pz 180.0
surf void_assembly_upper2_s pz 180.0
surf monolith_det_0_s cylz 8.660254037844386 5.000000000000001 0.5 20.0 180.0
surf monolith_det_1_s cylz 8.660254037844387 -4.999999999999998 0.5 20.0 180.0
surf monolith_det_2_s cylz 1.2246467991473533e-15 -10.0 0.5 20.0 180.0
surf monolith_det_3_s cylz -8.660254037844384 -5.000000000000004 0.5 20.0 180.0
surf monolith_det_4_s cylz -8.660254037844386 5.000000000000001 0.5 20.0 180.0
surf monolith_det_5_s cylz -2.4492935982947065e-15 10.0 0.5 20.0 180.0
surf inner_radial_det_0_s cylz 42.49999999999999 73.6121593216773 0.5 20.0 180.0
surf inner_radial_det_1_s cylz 73.61215932167728 42.50000000000001 0.5 20.0 180.0
surf inner_radial_det_2_s cylz 85.0 5.204748896376251e-15 0.5 20.0 180.0
surf inner_radial_det_3_s cylz 73.6121593216773 -42.49999999999998 0.5 20.0 180.0
surf inner_radial_det_4_s cylz 42.49999999999999 -73.6121593216773 0.5 20.0 180.0
surf inner_radial_det_5_s cylz 1.0409497792752502e-14 -85.0 0.5 20.0 180.0
surf inner_radial_det_6_s cylz -42.50000000000001 -73.61215932167728 0.5 20.0 180.0
surf inner_radial_det_7_s cylz -73.61215932167727 -42.500000000000036 0.5 20.0 180.0
surf inner_radial_det_8_s cylz -85.0 -1.5614246689128753e-14 0.5 20.0 180.0
surf inner_radial_det_9_s cylz -73.61215932167728 42.50000000000001 0.5 20.0 180.0
surf inner_radial_det_10_s cylz -42.500000000000036 73.61215932167727 0.5 20.0 180.0
surf inner_radial_det_11_s cylz -2.0818995585505004e-14 85.0 0.5 20.0 180.0
surf ex_core_det_0_s cylz 54.99999999999999 95.26279441628826 0.75 20.0 180.0
surf ex_core_det_1_s cylz 95.26279441628824 55.000000000000014 0.75 20.0 180.0
surf ex_core_det_2_s cylz 110.0 6.735557395310443e-15 0.75 20.0 180.0
surf ex_core_det_3_s cylz 95.26279441628826 -54.99999999999998 0.75 20.0 180.0
surf ex_core_det_4_s cylz 54.99999999999999 -95.26279441628826 0.75 20.0 180.0
surf ex_core_det_5_s cylz 1.3471114790620885e-14 -110.0 0.75 20.0 180.0
surf ex_core_det_6_s cylz -55.000000000000014 -95.26279441628824 0.75 20.0 180.0
surf ex_core_det_7_s cylz -95.26279441628822 -55.00000000000005 0.75 20.0 180.0
surf ex_core_det_8_s cylz -110.0 -2.0206672185931328e-14 0.75 20.0 180.0
surf ex_core_det_9_s cylz -95.26279441628824 55.000000000000014 0.75 20.0 180.0
surf ex_core_det_10_s cylz -55.00000000000005 95.26279441628822 0.75 20.0 180.0
surf ex_core_det_11_s cylz -2.694222958124177e-14 110.0 0.75 20.0 180.0
surf outside_hex1_s hexxprism 0.0 0.0 75.0 0.0 200.0
surf outside_hex2_s hexxprism 0.0 0.0 75.05 0.0 200.0
surf rpv_cyl_inner_s cylz 0.0 0.0 112.0 0.0 200.0
surf rpv_cyl_outer_s cylz 0.0 0.0 113.0 0.0 200.0
surf b4c_outer_s cylz 0.0 0.0 114.0 0.0 200.0
surf shield_inner_s cylz 0.0 0.0 114.5 0.0 200.0
surf shield_outer_s cylz 0.0 0.0 115.5 0.0 200.0

% ------- cells -------------------------------------

cell graphite_pin_u_void graphite_pin_u void -graphite_pin_u_void graphite_pin_u_0 
cell graphite_pin_u_mono graphite_pin_u monolith -graphite_pin_u_pz_up graphite_pin_u_void graphite_pin_u_pz_low 
cell graphite_pin_u_pz_low graphite_pin_u reflector_be -graphite_pin_u_pz_low graphite_pin_u_void 
cell graphite_pin_u_pz_up graphite_pin_u reflector_be  graphite_pin_u_void graphite_pin_u_pz_up 
cell graphite_pin_u_0 graphite_pin_u graphite_pin -graphite_pin_u_0  
cell N N_universe fill N_lat -FA_monolith_hex_s  
cell S S_universe fill S_lat -FA_monolith_hex_s  
cell E E_universe fill E_lat -FA_monolith_hex_s  
cell W W_universe fill W_lat -FA_monolith_hex_s  
cell NW NW_universe fill NW_lat -FA_monolith_hex_s  
cell NNW NNW_universe fill NNW_lat -FA_monolith_hex_s  
cell NE NE_universe fill NE_lat -FA_monolith_hex_s  
cell NNE NNE_universe fill NNE_lat -FA_monolith_hex_s  
cell SW SW_universe fill SW_lat -FA_monolith_hex_s  
cell SSW SSW_universe fill SSW_lat -FA_monolith_hex_s  
cell SE SE_universe fill SE_lat -FA_monolith_hex_s  
cell SSE SSE_universe fill SSE_lat -FA_monolith_hex_s  
cell IS IS_universe fill IS_lat -FA_monolith_hex_s  
cell IN IN_universe fill IN_lat -FA_monolith_hex_s  
cell INE INE_universe fill INE_lat -FA_monolith_hex_s  
cell INW INW_universe fill INW_lat -FA_monolith_hex_s  
cell ISW ISW_universe fill ISW_lat -FA_monolith_hex_s  
cell ISE ISE_universe fill ISE_lat -FA_monolith_hex_s  
cell inf_monolith_c inf_monolith_u monolith -void_assembly_upper1_s void_assembly_lower_s 
cell inf_monolith_c2 inf_monolith_u reflector_be -void_assembly_lower_s  
cell inf_monolith_c3 inf_monolith_u reflector_be  void_assembly_upper1_s 
cell fuel_outer_gap_c fuel_pin_u void -fuel_outer_cyl_s fuel_inner_cyl_s 
cell dummy_pin_void1_c dummy_pin1_u void -fuel_outer_cyl_s fuel_inner_cyl_s 
cell dummy_pin_void2_c dummy_pin2_u void -fuel_outer_cyl_s fuel_inner_cyl_s 
cell compact1_pz_c fuel_pin_u fill pebble_bed_compact_1 -fuel_inner_cyl_s -compact1_pz_s fuel_pin_lower_s 
cell pin1compact1_pz_c dummy_pin1_u fill pebble_bed_compact_1 -fuel_inner_cyl_s -compact1_pz_s fuel_pin_lower_s 
cell pin2compact1_pz_c dummy_pin2_u fill pebble_bed_compact_1 -fuel_inner_cyl_s -compact1_pz_s fuel_pin_lower_s 
cell compact2_pz_c fuel_pin_u fill pebble_bed_compact_2 -fuel_inner_cyl_s -compact2_pz_s compact1_pz_s 
cell pin1compact2_pz_c dummy_pin1_u fill pebble_bed_compact_2 -fuel_inner_cyl_s -compact2_pz_s compact1_pz_s 
cell pin2compact2_pz_c dummy_pin2_u fill pebble_bed_compact_2 -fuel_inner_cyl_s -compact2_pz_s compact1_pz_s 
cell compact3_pz_c fuel_pin_u fill pebble_bed_compact_3 -fuel_inner_cyl_s -compact3_pz_s compact2_pz_s 
cell pin1compact3_pz_c dummy_pin1_u fill pebble_bed_compact_3 -fuel_inner_cyl_s -compact3_pz_s compact2_pz_s 
cell pin2compact3_pz_c dummy_pin2_u fill pebble_bed_compact_3 -fuel_inner_cyl_s -compact3_pz_s compact2_pz_s 
cell compact4_pz_c fuel_pin_u fill pebble_bed_compact_4 -fuel_inner_cyl_s -compact4_pz_s compact3_pz_s 
cell pin1compact4_pz_c dummy_pin1_u fill pebble_bed_compact_4 -fuel_inner_cyl_s -compact4_pz_s compact3_pz_s 
cell pin2compact4_pz_c dummy_pin2_u fill pebble_bed_compact_4 -fuel_inner_cyl_s -compact4_pz_s compact3_pz_s 
cell fuel_pin_lower_axial_refl_c fuel_pin_u reflector_be -fuel_pin_lower_s fuel_outer_cyl_s 
cell dummy_pin_lower_axial_refl1_c dummy_pin1_u reflector_be -fuel_pin_lower_s fuel_outer_cyl_s 
cell dummy_pin_lower_axial_refl2_c dummy_pin2_u reflector_be -fuel_pin_lower_s fuel_outer_cyl_s 
cell fuel_pin_monolith_c fuel_pin_u monolith -fuel_pin_upper_s fuel_outer_cyl_s fuel_pin_lower_s 
cell dummy_pin_monolith1_c dummy_pin1_u monolith -fuel_pin_upper_s fuel_outer_cyl_s fuel_pin_lower_s 
cell dummy_pin_monolith2_c dummy_pin2_u monolith -fuel_pin_upper_s fuel_outer_cyl_s fuel_pin_lower_s 
cell fuel_pin_upper_axial_refl_c fuel_pin_u reflector_be  fuel_outer_cyl_s fuel_pin_upper_s 
cell dummy_pin_upper_axial_refl1_c dummy_pin1_u reflector_be  fuel_outer_cyl_s fuel_pin_upper_s 
cell dummy_pin_upper_axial_refl2_c dummy_pin2_u reflector_be  fuel_outer_cyl_s fuel_pin_upper_s 
cell hp_lower_axial_refl_c hp reflector_be -hp_lower_s  
cell hp_struct_c hp heat_pipe -hp_inner_cyl_s hp_lower_s 
cell hp_gap_c hp void -hp_outer_cyl_s hp_inner_cyl_s hp_lower_s 
cell hp_monolith_c hp monolith -hp_upper_s hp_outer_cyl_s hp_lower_s 
cell hp_upper_axial_refl_c hp reflector_be  hp_outer_cyl_s hp_upper_s 
cell FA_lat_c FA_lat_u fill FA_lattice_u -FA_monolith_hex_s  
cell FA_monolith_c FA_lat_u monolith -FA_outer_s -FA_upper_axial_refl_s FA_monolith_hex_s FA_lower_axial_refl_s 
cell FA_lower_axial_refl_c FA_lat_u reflector_be -FA_outer_s -FA_lower_axial_refl_s FA_monolith_hex_s 
cell FA_upper_axial_refl_c FA_lat_u reflector_be -FA_outer_s FA_monolith_hex_s FA_upper_axial_refl_s 
cell BeAssm_monolith_c Be_assmebly_u monolith -BeAssm_outer_hex_s -BeAssm_upper_be_s BeAssm_lower_be_s 
cell BeAssm_lower_refl_c Be_assmebly_u reflector_be -BeAssm_outer_hex_s -BeAssm_lower_be_s  
cell BeAssm_upper_refl_c Be_assmebly_u reflector_be -BeAssm_outer_hex_s BeAssm_upper_be_s 
cell dummy_FA_lat_c dummy_FA_lat_u fill dummy_lattice_u -FA_monolith_hex_s  
cell berr_cd_inf_c berr_cd_inf_u reflector_be -berr_cd_inf_s  
cell pois_cd_inf_c pois_cd_inf_u control_drum_b4c -pois_cd_inf_s  
cell h2_cd_inf_s h2_cd_inf_u void -h2_cd_inf_s  
cell void_assembly_upper_be_c void_assembly_u reflector_be -void_assembly_lower_s  
cell void_assembly_lower_be_c void_assembly_u reflector_be  void_assembly_upper1_s 
cell void_assembly_monolith_c void_assembly_u monolith -void_assembly_upper1_s void_assembly_lower_s 
cell 122 cd1 fill berr_cd_inf_u -cd_be_s  
cell 123 cd1 fill pois_cd_inf_u -cd_pad_s -94 cd_be_s 
cell 124 cd1 fill berr_cd_inf_u -cd_pad_s cd_be_s 94 
cell 125 cd1 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 126 cd1 fill berr_cd_inf_u  cd_void_s 
cell 128 cd2 fill berr_cd_inf_u -cd_be_s  
cell 129 cd2 fill pois_cd_inf_u -cd_pad_s -95 cd_be_s 
cell 130 cd2 fill berr_cd_inf_u -cd_pad_s cd_be_s 95 
cell 131 cd2 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 132 cd2 fill berr_cd_inf_u  cd_void_s 
cell 134 cd3 fill berr_cd_inf_u -cd_be_s  
cell 135 cd3 fill pois_cd_inf_u -cd_pad_s -96 cd_be_s 
cell 136 cd3 fill berr_cd_inf_u -cd_pad_s cd_be_s 96 
cell 137 cd3 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 138 cd3 fill berr_cd_inf_u  cd_void_s 
cell 140 cd4 fill berr_cd_inf_u -cd_be_s  
cell 141 cd4 fill pois_cd_inf_u -cd_pad_s -97 cd_be_s 
cell 142 cd4 fill berr_cd_inf_u -cd_pad_s cd_be_s 97 
cell 143 cd4 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 144 cd4 fill berr_cd_inf_u  cd_void_s 
cell 146 cd5 fill berr_cd_inf_u -cd_be_s  
cell 147 cd5 fill pois_cd_inf_u -cd_pad_s -98 cd_be_s 
cell 148 cd5 fill berr_cd_inf_u -cd_pad_s cd_be_s 98 
cell 149 cd5 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 150 cd5 fill berr_cd_inf_u  cd_void_s 
cell 152 cd6 fill berr_cd_inf_u -cd_be_s  
cell 153 cd6 fill pois_cd_inf_u -cd_pad_s -99 cd_be_s 
cell 154 cd6 fill berr_cd_inf_u -cd_pad_s cd_be_s 99 
cell 155 cd6 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 156 cd6 fill berr_cd_inf_u  cd_void_s 
cell 158 cd7 fill berr_cd_inf_u -cd_be_s  
cell 159 cd7 fill pois_cd_inf_u -cd_pad_s -100 cd_be_s 
cell 160 cd7 fill berr_cd_inf_u -cd_pad_s cd_be_s 100 
cell 161 cd7 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 162 cd7 fill berr_cd_inf_u  cd_void_s 
cell 164 cd8 fill berr_cd_inf_u -cd_be_s  
cell 165 cd8 fill pois_cd_inf_u -cd_pad_s -101 cd_be_s 
cell 166 cd8 fill berr_cd_inf_u -cd_pad_s cd_be_s 101 
cell 167 cd8 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 168 cd8 fill berr_cd_inf_u  cd_void_s 
cell 170 cd9 fill berr_cd_inf_u -cd_be_s  
cell 171 cd9 fill pois_cd_inf_u -cd_pad_s -102 cd_be_s 
cell 172 cd9 fill berr_cd_inf_u -cd_pad_s cd_be_s 102 
cell 173 cd9 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 174 cd9 fill berr_cd_inf_u  cd_void_s 
cell 176 cd10 fill berr_cd_inf_u -cd_be_s  
cell 177 cd10 fill pois_cd_inf_u -cd_pad_s -103 cd_be_s 
cell 178 cd10 fill berr_cd_inf_u -cd_pad_s cd_be_s 103 
cell 179 cd10 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 180 cd10 fill berr_cd_inf_u  cd_void_s 
cell 182 cd11 fill berr_cd_inf_u -cd_be_s  
cell 183 cd11 fill pois_cd_inf_u -cd_pad_s -104 cd_be_s 
cell 184 cd11 fill berr_cd_inf_u -cd_pad_s cd_be_s 104 
cell 185 cd11 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 186 cd11 fill berr_cd_inf_u  cd_void_s 
cell 188 cd12 fill berr_cd_inf_u -cd_be_s  
cell 189 cd12 fill pois_cd_inf_u -cd_pad_s -105 cd_be_s 
cell 190 cd12 fill berr_cd_inf_u -cd_pad_s cd_be_s 105 
cell 191 cd12 fill h2_cd_inf_u -cd_void_s cd_pad_s 
cell 192 cd12 fill berr_cd_inf_u  cd_void_s 
cell monolith_det_0_c monolith_det_0_u void -monolith_det_0_s  
cell monolith_det_1_c monolith_det_1_u void -monolith_det_1_s  
cell monolith_det_2_c monolith_det_2_u void -monolith_det_2_s  
cell monolith_det_3_c monolith_det_3_u void -monolith_det_3_s  
cell monolith_det_4_c monolith_det_4_u void -monolith_det_4_s  
cell monolith_det_5_c monolith_det_5_u void -monolith_det_5_s  
cell inner_radial_det_0_c inner_radial_det_0_u void -inner_radial_det_0_s  
cell inner_radial_det_1_c inner_radial_det_1_u void -inner_radial_det_1_s  
cell inner_radial_det_2_c inner_radial_det_2_u void -inner_radial_det_2_s  
cell inner_radial_det_3_c inner_radial_det_3_u void -inner_radial_det_3_s  
cell inner_radial_det_4_c inner_radial_det_4_u void -inner_radial_det_4_s  
cell inner_radial_det_5_c inner_radial_det_5_u void -inner_radial_det_5_s  
cell inner_radial_det_6_c inner_radial_det_6_u void -inner_radial_det_6_s  
cell inner_radial_det_7_c inner_radial_det_7_u void -inner_radial_det_7_s  
cell inner_radial_det_8_c inner_radial_det_8_u void -inner_radial_det_8_s  
cell inner_radial_det_9_c inner_radial_det_9_u void -inner_radial_det_9_s  
cell inner_radial_det_10_c inner_radial_det_10_u void -inner_radial_det_10_s  
cell inner_radial_det_11_c inner_radial_det_11_u void -inner_radial_det_11_s  
cell ex_core_det_0_c ex_core_det_0_u void -ex_core_det_0_s  
cell ex_core_det_1_c ex_core_det_1_u void -ex_core_det_1_s  
cell ex_core_det_2_c ex_core_det_2_u void -ex_core_det_2_s  
cell ex_core_det_3_c ex_core_det_3_u void -ex_core_det_3_s  
cell ex_core_det_4_c ex_core_det_4_u void -ex_core_det_4_s  
cell ex_core_det_5_c ex_core_det_5_u void -ex_core_det_5_s  
cell ex_core_det_6_c ex_core_det_6_u void -ex_core_det_6_s  
cell ex_core_det_7_c ex_core_det_7_u void -ex_core_det_7_s  
cell ex_core_det_8_c ex_core_det_8_u void -ex_core_det_8_s  
cell ex_core_det_9_c ex_core_det_9_u void -ex_core_det_9_s  
cell ex_core_det_10_c ex_core_det_10_u void -ex_core_det_10_s  
cell ex_core_det_11_c ex_core_det_11_u void -ex_core_det_11_s  
cell outside_hex1_c 0 fill core_lattice_u -outside_hex1_s monolith_det_0_s monolith_det_1_s monolith_det_2_s monolith_det_3_s monolith_det_4_s monolith_det_5_s inner_radial_det_0_s inner_radial_det_1_s inner_radial_det_2_s inner_radial_det_3_s inner_radial_det_4_s inner_radial_det_5_s inner_radial_det_6_s inner_radial_det_7_s inner_radial_det_8_s inner_radial_det_9_s inner_radial_det_10_s inner_radial_det_11_s ex_core_det_0_s ex_core_det_1_s ex_core_det_2_s ex_core_det_3_s ex_core_det_4_s ex_core_det_5_s ex_core_det_6_s ex_core_det_7_s ex_core_det_8_s ex_core_det_9_s ex_core_det_10_s ex_core_det_11_s 
cell outside_hex2_c 0 void -outside_hex2_s outside_hex1_s 
cell rpv_cyl_inner_s 0 fill cd_c -rpv_cyl_inner_s outside_hex2_s monolith_det_0_s monolith_det_1_s monolith_det_2_s monolith_det_3_s monolith_det_4_s monolith_det_5_s inner_radial_det_0_s inner_radial_det_1_s inner_radial_det_2_s inner_radial_det_3_s inner_radial_det_4_s inner_radial_det_5_s inner_radial_det_6_s inner_radial_det_7_s inner_radial_det_8_s inner_radial_det_9_s inner_radial_det_10_s inner_radial_det_11_s ex_core_det_0_s ex_core_det_1_s ex_core_det_2_s ex_core_det_3_s ex_core_det_4_s ex_core_det_5_s ex_core_det_6_s ex_core_det_7_s ex_core_det_8_s ex_core_det_9_s ex_core_det_10_s ex_core_det_11_s 
cell rpv_c 0 ss316 -rpv_cyl_outer_s rpv_cyl_inner_s 
cell diversion_layer_c 0 control_drum_b4c -b4c_outer_s rpv_cyl_outer_s 
cell shield_gap_c 0 shield_gap -shield_inner_s b4c_outer_s 
cell shield_c 0 ss316 -shield_outer_s shield_inner_s 
cell shield_outer_c 0 outside  shield_outer_s 

% ------- universes ---------------------------------

cell monolith_det_0_u 0 fill monolith_det_0_u -monolith_det_0_s  
cell monolith_det_1_u 0 fill monolith_det_1_u -monolith_det_1_s  
cell monolith_det_2_u 0 fill monolith_det_2_u -monolith_det_2_s  
cell monolith_det_3_u 0 fill monolith_det_3_u -monolith_det_3_s  
cell monolith_det_4_u 0 fill monolith_det_4_u -monolith_det_4_s  
cell monolith_det_5_u 0 fill monolith_det_5_u -monolith_det_5_s  
cell inner_radial_det_0_u 0 fill inner_radial_det_0_u -inner_radial_det_0_s  
cell inner_radial_det_1_u 0 fill inner_radial_det_1_u -inner_radial_det_1_s  
cell inner_radial_det_2_u 0 fill inner_radial_det_2_u -inner_radial_det_2_s  
cell inner_radial_det_3_u 0 fill inner_radial_det_3_u -inner_radial_det_3_s  
cell inner_radial_det_4_u 0 fill inner_radial_det_4_u -inner_radial_det_4_s  
cell inner_radial_det_5_u 0 fill inner_radial_det_5_u -inner_radial_det_5_s  
cell inner_radial_det_6_u 0 fill inner_radial_det_6_u -inner_radial_det_6_s  
cell inner_radial_det_7_u 0 fill inner_radial_det_7_u -inner_radial_det_7_s  
cell inner_radial_det_8_u 0 fill inner_radial_det_8_u -inner_radial_det_8_s  
cell inner_radial_det_9_u 0 fill inner_radial_det_9_u -inner_radial_det_9_s  
cell inner_radial_det_10_u 0 fill inner_radial_det_10_u -inner_radial_det_10_s  
cell inner_radial_det_11_u 0 fill inner_radial_det_11_u -inner_radial_det_11_s  
cell ex_core_det_0_u 0 fill ex_core_det_0_u -ex_core_det_0_s  
cell ex_core_det_1_u 0 fill ex_core_det_1_u -ex_core_det_1_s  
cell ex_core_det_2_u 0 fill ex_core_det_2_u -ex_core_det_2_s  
cell ex_core_det_3_u 0 fill ex_core_det_3_u -ex_core_det_3_s  
cell ex_core_det_4_u 0 fill ex_core_det_4_u -ex_core_det_4_s  
cell ex_core_det_5_u 0 fill ex_core_det_5_u -ex_core_det_5_s  
cell ex_core_det_6_u 0 fill ex_core_det_6_u -ex_core_det_6_s  
cell ex_core_det_7_u 0 fill ex_core_det_7_u -ex_core_det_7_s  
cell ex_core_det_8_u 0 fill ex_core_det_8_u -ex_core_det_8_s  
cell ex_core_det_9_u 0 fill ex_core_det_9_u -ex_core_det_9_s  
cell ex_core_det_10_u 0 fill ex_core_det_10_u -ex_core_det_10_s  
cell ex_core_det_11_u 0 fill ex_core_det_11_u -ex_core_det_11_s  

% ------- assembly lattice --------------------------

lat FA_lattice_u 2 0.0 0.0 19 19 3.4
inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
 inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
  inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
   inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
    inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
     inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u hp fuel_pin_u hp fuel_pin_u hp fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
      inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
       inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u hp fuel_pin_u hp fuel_pin_u hp fuel_pin_u hp fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
        inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
         inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u hp fuel_pin_u hp fuel_pin_u hp fuel_pin_u hp fuel_pin_u hp fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
          inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
           inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u hp fuel_pin_u hp fuel_pin_u hp fuel_pin_u hp fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
            inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
             inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u hp fuel_pin_u hp fuel_pin_u hp fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
              inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
               inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
                inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
                 inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
                  inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
                   
% ------- dummy lattice -----------------------------

lat dummy_lattice_u 2 0.0 0.0 19 19 3.4
inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
 inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
  inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
   inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
    inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
     inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u hp fuel_pin_u hp fuel_pin_u hp fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
      inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u fuel_pin_u fuel_pin_u dummy_pin1_u dummy_pin1_u fuel_pin_u fuel_pin_u fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
       inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u hp dummy_pin1_u hp dummy_pin1_u hp dummy_pin1_u hp fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
        inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u fuel_pin_u dummy_pin1_u dummy_pin1_u dummy_pin1_u dummy_pin1_u dummy_pin1_u dummy_pin1_u fuel_pin_u fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
         inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u hp fuel_pin_u hp dummy_pin1_u hp dummy_pin1_u hp fuel_pin_u hp fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
          inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u fuel_pin_u dummy_pin1_u dummy_pin1_u dummy_pin1_u dummy_pin1_u dummy_pin1_u dummy_pin1_u fuel_pin_u fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
           inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u hp dummy_pin1_u hp dummy_pin1_u hp dummy_pin1_u hp fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
            inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u fuel_pin_u fuel_pin_u dummy_pin1_u dummy_pin1_u fuel_pin_u fuel_pin_u fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
             inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u fuel_pin_u hp fuel_pin_u hp fuel_pin_u hp fuel_pin_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
              inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u dummy_pin1_u dummy_pin1_u dummy_pin1_u dummy_pin1_u dummy_pin1_u dummy_pin1_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
               inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
                inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
                 inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
                  inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u inf_monolith_u 
                   
% ------- control drum lattice ----------------------

lat cd_c 4 0.0 0.0 2 1 0.0 0.0 cd1 12 95.0 15 cd1 cd2 cd3 cd4 cd5 cd6 cd7 cd8 cd9 cd10 cd11 cd12

% ------- core lattice ------------------------------

lat core_lattice_u 3 0.0 0.0 9 9 32.0
Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u 
 Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u 
  Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u SW_universe W_universe NW_universe Be_assmebly_u Be_assmebly_u 
   Be_assmebly_u Be_assmebly_u Be_assmebly_u SSW_universe ISW_universe INW_universe NNW_universe Be_assmebly_u Be_assmebly_u 
    Be_assmebly_u Be_assmebly_u S_universe IS_universe void_assembly_u IN_universe N_universe Be_assmebly_u Be_assmebly_u 
     Be_assmebly_u Be_assmebly_u SSE_universe ISE_universe INE_universe NNE_universe Be_assmebly_u Be_assmebly_u Be_assmebly_u 
      Be_assmebly_u Be_assmebly_u SE_universe E_universe NE_universe Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u 
       Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u 
        Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u Be_assmebly_u 
         
% ---------------------------------------------------
% ------- Detector monolith_det_0_c_det
% ---------------------------------------------------

det monolith_det_0_c_det n dc monolith_det_0_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector monolith_det_1_c_det
% ---------------------------------------------------

det monolith_det_1_c_det n dc monolith_det_1_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector monolith_det_2_c_det
% ---------------------------------------------------

det monolith_det_2_c_det n dc monolith_det_2_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector monolith_det_3_c_det
% ---------------------------------------------------

det monolith_det_3_c_det n dc monolith_det_3_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector monolith_det_4_c_det
% ---------------------------------------------------

det monolith_det_4_c_det n dc monolith_det_4_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector monolith_det_5_c_det
% ---------------------------------------------------

det monolith_det_5_c_det n dc monolith_det_5_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_0_c_det
% ---------------------------------------------------

det inner_radial_det_0_c_det n dc inner_radial_det_0_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_1_c_det
% ---------------------------------------------------

det inner_radial_det_1_c_det n dc inner_radial_det_1_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_2_c_det
% ---------------------------------------------------

det inner_radial_det_2_c_det n dc inner_radial_det_2_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_3_c_det
% ---------------------------------------------------

det inner_radial_det_3_c_det n dc inner_radial_det_3_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_4_c_det
% ---------------------------------------------------

det inner_radial_det_4_c_det n dc inner_radial_det_4_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_5_c_det
% ---------------------------------------------------

det inner_radial_det_5_c_det n dc inner_radial_det_5_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_6_c_det
% ---------------------------------------------------

det inner_radial_det_6_c_det n dc inner_radial_det_6_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_7_c_det
% ---------------------------------------------------

det inner_radial_det_7_c_det n dc inner_radial_det_7_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_8_c_det
% ---------------------------------------------------

det inner_radial_det_8_c_det n dc inner_radial_det_8_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_9_c_det
% ---------------------------------------------------

det inner_radial_det_9_c_det n dc inner_radial_det_9_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_10_c_det
% ---------------------------------------------------

det inner_radial_det_10_c_det n dc inner_radial_det_10_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector inner_radial_det_11_c_det
% ---------------------------------------------------

det inner_radial_det_11_c_det n dc inner_radial_det_11_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_0_c_det
% ---------------------------------------------------

det ex_core_det_0_c_det n dc ex_core_det_0_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_1_c_det
% ---------------------------------------------------

det ex_core_det_1_c_det n dc ex_core_det_1_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_2_c_det
% ---------------------------------------------------

det ex_core_det_2_c_det n dc ex_core_det_2_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_3_c_det
% ---------------------------------------------------

det ex_core_det_3_c_det n dc ex_core_det_3_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_4_c_det
% ---------------------------------------------------

det ex_core_det_4_c_det n dc ex_core_det_4_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_5_c_det
% ---------------------------------------------------

det ex_core_det_5_c_det n dc ex_core_det_5_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_6_c_det
% ---------------------------------------------------

det ex_core_det_6_c_det n dc ex_core_det_6_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_7_c_det
% ---------------------------------------------------

det ex_core_det_7_c_det n dc ex_core_det_7_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_8_c_det
% ---------------------------------------------------

det ex_core_det_8_c_det n dc ex_core_det_8_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_9_c_det
% ---------------------------------------------------

det ex_core_det_9_c_det n dc ex_core_det_9_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_10_c_det
% ---------------------------------------------------

det ex_core_det_10_c_det n dc ex_core_det_10_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ex_core_det_11_c_det
% ---------------------------------------------------

det ex_core_det_11_c_det n dc ex_core_det_11_c dz 20 180 8

% ---------------------------------------------------
% ------- Detector ene_scale238
% ---------------------------------------------------

ene scale238 4 scale238_ext

% ---------------------------------------------------
% ------- Detector fluxspec
% ---------------------------------------------------

det fluxspec n dt -3 du 0 de scale238 

% ---------------------------------------------------
% ------- Detector ene_fast
% ---------------------------------------------------

ene fast 1 1.55000E-06 2.00000E+01

% ---------------------------------------------------
% ------- Detector fastflux
% ---------------------------------------------------

det fastflux n du 0 de fast dr 0 void 

% ---------------------------------------------------
% ------- Detector ene_thrm
% ---------------------------------------------------

ene thrm 1 1.00000E-11 1.55000E-06

% ---------------------------------------------------
% ------- Detector thrmflux
% ---------------------------------------------------

det thrmflux n du 0 dr 0 void 

% ---------------------------------------------------
% ------- Detector power
% ---------------------------------------------------

det power n dl core_lattice_u dr -8 void 

% ------- Inventory ---------------------------------

set inventory actinides O-16 O-17 O-18

% ------- Plots -------------------------------------

plot 3 1500 1500 
mesh 3 1500 1500 

