
% Increase counter:

if (exist('idx', 'var'));
  idx = idx + 1;
else;
  idx = 1;
end;

% Version, title and date:

VERSION                   (idx, [1:  13]) = 'Serpent 2.2.1' ;
COMPILE_DATE              (idx, [1:  20]) = 'Oct 30 2023 11:36:24' ;
DEBUG                     (idx, 1)        = 0 ;
TITLE                     (idx, [1:  28]) = 'Microreactor Serpent Input.i' ;
CONFIDENTIAL_DATA         (idx, 1)        = 0 ;
INPUT_FILE_NAME           (idx, [1:   9]) = 'serpent.i' ;
WORKING_DIRECTORY         (idx, [1:  58]) = '/home/willquin/python_modules/specific_diversion/nominal_0' ;
HOSTNAME                  (idx, [1:   7]) = 'r6i6n18' ;
CPU_TYPE                  (idx, [1:  44]) = 'Intel(R) Xeon(R) Platinum 8268 CPU @ 2.90GHz' ;
CPU_MHZ                   (idx, 1)        = 83899909.0 ;
START_DATE                (idx, [1:  24]) = 'Fri Jan 24 21:31:21 2025' ;
COMPLETE_DATE             (idx, [1:  24]) = 'Fri Jan 24 21:50:21 2025' ;

% Run parameters:

POP                       (idx, 1)        = 100000 ;
CYCLES                    (idx, 1)        = 160 ;
SKIP                      (idx, 1)        = 40 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1737779481445 ;
UFS_MODE                  (idx, 1)        = 0 ;
UFS_ORDER                 (idx, 1)        = 1.00000 ;
NEUTRON_TRANSPORT_MODE    (idx, 1)        = 1 ;
PHOTON_TRANSPORT_MODE     (idx, 1)        = 0 ;
GROUP_CONSTANT_GENERATION (idx, 1)        = 1 ;
B1_CALCULATION            (idx, [1:  3])  = [ 0 0 0 ] ;
B1_IMPLICIT_LEAKAGE       (idx, 1)        = 0 ;
B1_BURNUP_CORRECTION      (idx, 1)        = 0 ;

CRIT_SPEC_MODE            (idx, 1)        = 0 ;
IMPLICIT_REACTION_RATES   (idx, 1)        = 1 ;

% Optimization:

OPTIMIZATION_MODE         (idx, 1)        = 3 ;
RECONSTRUCT_MICROXS       (idx, 1)        = 0 ;
RECONSTRUCT_MACROXS       (idx, 1)        = 1 ;
DOUBLE_INDEXING           (idx, 1)        = 1 ;
MG_MAJORANT_MODE          (idx, 1)        = 0 ;

% Parallelization:

MPI_TASKS                 (idx, 1)        = 1 ;
OMP_THREADS               (idx, 1)        = 48 ;
MPI_REPRODUCIBILITY       (idx, 1)        = 0 ;
OMP_REPRODUCIBILITY       (idx, 1)        = 1 ;
OMP_HISTORY_PROFILE       (idx, [1:  48]) = [  9.93758E-01  1.00936E+00  1.00129E+00  1.00678E+00  1.00303E+00  9.97754E-01  1.00915E+00  9.97032E-01  1.00435E+00  1.00776E+00  1.00890E+00  9.99720E-01  1.00010E+00  1.00247E+00  9.97061E-01  1.00975E+00  9.99341E-01  1.00347E+00  9.99756E-01  1.00700E+00  9.66388E-01  9.63938E-01  1.00398E+00  9.93607E-01  1.00267E+00  9.96096E-01  1.00444E+00  1.00804E+00  9.99120E-01  1.00480E+00  1.00768E+00  1.00691E+00  9.99362E-01  9.94356E-01  1.00632E+00  9.95064E-01  9.74167E-01  9.78624E-01  1.00298E+00  1.00692E+00  1.00952E+00  9.96206E-01  1.00403E+00  9.94625E-01  1.00893E+00  1.00667E+00  1.00631E+00  1.00041E+00  ];
SHARE_BUF_ARRAY           (idx, 1)        = 0 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;
OMP_SHARED_QUEUE_LIM      (idx, 1)        = 0 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1:  21]) = './s2_xsdir_hpc_endfb8' ;
DECAY_DATA_FILE_PATH      (idx, [1:  46]) = '/hpc-common/data/serpent/xsdata/sss_endfb7.dec' ;
SFY_DATA_FILE_PATH        (idx, [1:   3]) = 'N/A' ;
NFY_DATA_FILE_PATH        (idx, [1:  46]) = '/hpc-common/data/serpent/xsdata/sss_endfb7.nfy' ;
BRA_DATA_FILE_PATH        (idx, [1:   3]) = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MIN_MACROXS               (idx, [1:   4]) = [  5.00000E-02 9.3E-10  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:   2]) = [  9.00000E-01  9.00000E-01 ] ;
ST_FRAC                   (idx, [1:   4]) = [  7.33420E-01 8.2E-05  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  2.66580E-01 0.00023  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  3.15576E-01 5.1E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  4.57764E-01 0.00012  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  2.97619E+01 0.00036  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CELL_SEARCH_FRAC          (idx, [1:  10]) = [  9.82770E-01 2.8E-06  1.70030E-02 0.00016  2.27325E-04 0.00037  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  1.24210E+02 0.00020  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  1.24160E+02 0.00020  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  1.47071E+02 0.00011  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  5.34290E+02 0.00036  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 160 ;
SIMULATED_HISTORIES       (idx, 1)        = 16000132 ;
MEAN_POP_SIZE             (idx, [1:   2]) = [  1.00001E+05 0.00044 ] ;
MEAN_POP_WGT              (idx, [1:   2]) = [  1.00001E+05 0.00044 ] ;
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  8.71865E+02 ;
RUNNING_TIME              (idx, 1)        =  1.90054E+01 ;
INIT_TIME                 (idx, [1:   2]) = [  3.86783E-01  3.86783E-01 ] ;
PROCESS_TIME              (idx, [1:   2]) = [  1.50667E-02  1.50667E-02 ] ;
TRANSPORT_CYCLE_TIME      (idx, [1:   3]) = [  1.86036E+01  1.86036E+01  0.00000E+00 ] ;
MPI_OVERHEAD_TIME         (idx, [1:   2]) = [  0.00000E+00  0.00000E+00 ] ;
ESTIMATED_RUNNING_TIME    (idx, [1:   2]) = [  1.90051E+01  0.00000E+00 ] ;
CPU_USAGE                 (idx, 1)        = 45.87458 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  4.76243E+01 0.00266 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.31155E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 191646.58 ;
ALLOC_MEMSIZE             (idx, 1)        = 19870.46 ;
MEMSIZE                   (idx, 1)        = 19493.73 ;
XS_MEMSIZE                (idx, 1)        = 1455.84 ;
MAT_MEMSIZE               (idx, 1)        = 293.06 ;
RES_MEMSIZE               (idx, 1)        = 37.56 ;
IFC_MEMSIZE               (idx, 1)        = 0.00 ;
MISC_MEMSIZE              (idx, 1)        = 17707.28 ;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00 ;
UNUSED_MEMSIZE            (idx, 1)        = 376.73 ;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 172 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 618154 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 13 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 54 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 54 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 0 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 1310 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Neutron physics options:

USE_DELNU                 (idx, 1)        = 1 ;
USE_URES                  (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
IMPL_CAPT                 (idx, 1)        = 0 ;
IMPL_NXN                  (idx, 1)        = 1 ;
IMPL_FISS                 (idx, 1)        = 0 ;
DOPPLER_PREPROCESSOR      (idx, 1)        = 1 ;
TMS_MODE                  (idx, 1)        = 0 ;
SAMPLE_FISS               (idx, 1)        = 1 ;
SAMPLE_CAPT               (idx, 1)        = 1 ;
SAMPLE_SCATT              (idx, 1)        = 1 ;

% Energy deposition:

EDEP_MODE                 (idx, 1)        = 0 ;
EDEP_DELAYED              (idx, 1)        = 1 ;
EDEP_KEFF_CORR            (idx, 1)        = 1 ;
EDEP_LOCAL_EGD            (idx, 1)        = 0 ;
EDEP_COMP                 (idx, [1:   9]) = [ 0 0 0 0 0 0 0 0 0 ] ;
EDEP_CAPT_E               (idx, 1)        =  0.00000E+00 ;

% Radioactivity data:

TOT_ACTIVITY              (idx, 1)        =  9.00078E+15 ;
TOT_DECAY_HEAT            (idx, 1)        =  8.11440E+02 ;
TOT_SF_RATE               (idx, 1)        =  1.81932E+05 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  8.61410E+09 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  6.18594E-03 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  0.00000E+00 ;
INHALATION_TOXICITY       (idx, 1)        =  7.15538E+04 ;
INGESTION_TOXICITY        (idx, 1)        =  3.98199E+02 ;
ACTINIDE_INH_TOX          (idx, 1)        =  7.15538E+04 ;
ACTINIDE_ING_TOX          (idx, 1)        =  3.98199E+02 ;
FISSION_PRODUCT_INH_TOX   (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ING_TOX   (idx, 1)        =  0.00000E+00 ;
SR90_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
TE132_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
I131_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
I132_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
CS134_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
CS137_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
PHOTON_DECAY_SOURCE       (idx, [1:   2]) = [  8.95836E+15  3.57883E+02 ] ;
NEUTRON_DECAY_SOURCE      (idx, 1)        =  0.00000E+00 ;
ALPHA_DECAY_SOURCE        (idx, 1)        =  8.54100E+09 ;
ELECTRON_DECAY_SOURCE     (idx, 1)        =  1.01179E+16 ;

% Normalization coefficient:

NORM_COEF                 (idx, [1:   4]) = [  3.75103E+12 0.00026  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  3.02702E-01 0.00061 ];
U235_FISS                 (idx, [1:   4]) = [  1.53420E+17 0.00029  9.94362E-01 3.1E-05 ];
U238_FISS                 (idx, [1:   4]) = [  8.69928E+14 0.00555  5.63819E-03 0.00552 ];
U235_CAPT                 (idx, [1:   4]) = [  4.43366E+16 0.00071  2.14487E-01 0.00069 ];
U238_CAPT                 (idx, [1:   4]) = [  5.98625E+16 0.00060  2.89595E-01 0.00048 ];
XE135_CAPT                (idx, [1:   4]) = [  1.09298E+15 0.00479  5.28762E-03 0.00482 ];
XE135M_CAPT               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC      (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_SRC_NEUTRON_FISS     (idx, [1:   2]) = [ 16000132 1.60000E+07 ] ;
BALA_SRC_NEUTRON_NXN      (idx, [1:   2]) = [ 0 2.44783E+05 ] ;
BALA_SRC_NEUTRON_VR       (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_SRC_NEUTRON_TOT      (idx, [1:   2]) = [ 16000132 1.62448E+07 ] ;

BALA_LOSS_NEUTRON_CAPT    (idx, [1:   2]) = [ 8674695 8.81725E+06 ] ;
BALA_LOSS_NEUTRON_FISS    (idx, [1:   2]) = [ 6520668 6.58125E+06 ] ;
BALA_LOSS_NEUTRON_LEAK    (idx, [1:   2]) = [ 804769 8.46274E+05 ] ;
BALA_LOSS_NEUTRON_CUT     (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_LOSS_NEUTRON_ERR     (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_LOSS_NEUTRON_TOT     (idx, [1:   2]) = [ 16000132 1.62448E+07 ] ;

BALA_NEUTRON_DIFF         (idx, [1:   2]) = [ 0 1.65403E-06 ] ;

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  5.00000E+06 0.0E+00 ];
TOT_POWDENS               (idx, [1:   2]) = [  1.49694E-02 3.1E-09 ];
TOT_GENRATE               (idx, [1:   2]) = [  3.75038E+17 1.9E-06 ];
TOT_FISSRATE              (idx, [1:   2]) = [  1.54267E+17 1.3E-07 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  2.06774E+17 0.00035 ];
TOT_ABSRATE               (idx, [1:   2]) = [  3.61041E+17 0.00020 ];
TOT_SRCRATE               (idx, [1:   2]) = [  3.75103E+17 0.00026 ];
TOT_FLUX                  (idx, [1:   2]) = [  1.10811E+20 0.00026 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  1.98403E+16 0.00130 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  3.80882E+17 0.00022 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  4.73872E+19 0.00033 ];
TOT_XE135_ABSRATE         (idx, [1:   2]) = [  1.09133E+15 0.00038 ];
TOT_XE135M_ABSRATE        (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
INI_FMASS                 (idx, 1)        =  3.34015E+02 ;
TOT_FMASS                 (idx, 1)        =  3.34015E+02 ;

% Equilibrium Xe-135 iteration:

I135_EQUIL_CONC           (idx, [1:   2]) = [  9.07867E-09 4.8E-07 ];
XE135_EQUIL_CONC          (idx, [1:   2]) = [  1.17215E-08 4.1E-05 ];
XE135M_EQUIL_CONC         (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  1.99111E+00 0.00020 ];
SIX_FF_F                  (idx, [1:   2]) = [  6.46237E-01 0.00026 ];
SIX_FF_P                  (idx, [1:   2]) = [  5.56184E-01 0.00022 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.47532E+00 0.00024 ];
SIX_FF_LF                 (idx, [1:   2]) = [  9.84904E-01 3.6E-05 ];
SIX_FF_LT                 (idx, [1:   2]) = [  9.61624E-01 5.7E-05 ];
SIX_FF_KINF               (idx, [1:   2]) = [  1.05582E+00 0.00027 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  9.99971E-01 0.00029 ];

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.43110E+00 2.0E-06 ];
FISSE                     (idx, [1:   2]) = [  2.02296E+02 1.3E-07 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  9.99927E-01 0.00031  9.93178E-01 0.00029  6.79308E-03 0.00473 ];
IMP_KEFF                  (idx, [1:   2]) = [  9.99716E-01 0.00021 ];
COL_KEFF                  (idx, [1:   2]) = [  9.99838E-01 0.00026 ];
ABS_KEFF                  (idx, [1:   2]) = [  9.99716E-01 0.00021 ];
ABS_KINF                  (idx, [1:   2]) = [  1.05554E+00 0.00019 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.68618E+01 8.1E-05 ];
IMP_ALF                   (idx, [1:   2]) = [  1.68618E+01 4.6E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  9.50886E-07 0.00137 ];
IMP_EALF                  (idx, [1:   2]) = [  9.50731E-07 0.00077 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  2.88905E-02 0.00413 ];
IMP_AFGE                  (idx, [1:   2]) = [  2.90390E-02 0.00119 ];

% Forward-weighted delayed neutron parameters:

PRECURSOR_GROUPS          (idx, 1)        = 6 ;
FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  6.70135E-03 0.00319  2.39092E-04 0.01702  1.21368E-03 0.00772  1.13744E-03 0.00726  2.60020E-03 0.00505  1.06863E-03 0.00771  4.42301E-04 0.01170 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  4.69046E-01 0.00464  1.33372E-02 2.7E-05  3.27244E-02 3.5E-05  1.20811E-01 1.9E-05  3.03096E-01 4.6E-05  8.50913E-01 8.3E-05  2.85723E+00 0.00013 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  6.81569E-03 0.00452  2.40712E-04 0.02569  1.23994E-03 0.01135  1.16226E-03 0.01048  2.64348E-03 0.00694  1.07802E-03 0.01207  4.51283E-04 0.01705 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  4.68780E-01 0.00629  1.33371E-02 3.6E-05  3.27253E-02 4.7E-05  1.20813E-01 2.7E-05  3.03106E-01 7.1E-05  8.51001E-01 0.00011  2.85704E+00 0.00018 ];

% Adjoint weighted time constants using Nauchi's method:

IFP_CHAIN_LENGTH          (idx, 1)        = 15 ;
ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  1.56830E-04 0.00072  1.56880E-04 0.00072  1.49451E-04 0.00903 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  1.56816E-04 0.00064  1.56866E-04 0.00064  1.49432E-04 0.00899 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  6.79684E-03 0.00459  2.44843E-04 0.02709  1.23297E-03 0.01173  1.14901E-03 0.01165  2.63590E-03 0.00704  1.08367E-03 0.01170  4.50453E-04 0.01752 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  4.69762E-01 0.00667  1.33368E-02 3.4E-05  3.27236E-02 5.6E-05  1.20818E-01 3.2E-05  3.03116E-01 7.3E-05  8.51012E-01 0.00013  2.85686E+00 0.00019 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  1.53502E-04 0.00179  1.53527E-04 0.00181  1.49774E-04 0.02193 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  1.53491E-04 0.00182  1.53516E-04 0.00184  1.49752E-04 0.02191 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  6.81393E-03 0.01542  2.59774E-04 0.08046  1.19009E-03 0.03648  1.16438E-03 0.03716  2.64431E-03 0.02656  1.11907E-03 0.04138  4.36299E-04 0.06148 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  4.69142E-01 0.02351  1.33372E-02 8.7E-05  3.27221E-02 0.00024  1.20809E-01 8.5E-05  3.03169E-01 0.00021  8.50995E-01 0.00043  2.85517E+00 0.00047 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  6.77897E-03 0.01469  2.58230E-04 0.07609  1.20167E-03 0.03553  1.13878E-03 0.03606  2.63714E-03 0.02555  1.10841E-03 0.03994  4.34740E-04 0.05848 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  4.68437E-01 0.02225  1.33376E-02 0.00012  3.27233E-02 0.00022  1.20806E-01 7.9E-05  3.03155E-01 0.00020  8.51028E-01 0.00042  2.85514E+00 0.00047 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -4.43723E+01 0.01526 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  1.54872E-04 0.00045 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  1.54858E-04 0.00033 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  6.83246E-03 0.00226 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -4.41205E+01 0.00244 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  5.69471E-07 0.00034 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  2.54507E-05 0.00019  2.54429E-05 0.00019  2.66645E-05 0.00193 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  2.64787E-04 0.00044  2.64877E-04 0.00044  2.50867E-04 0.00523 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  5.69555E-01 0.00021  5.69717E-01 0.00021  5.46448E-01 0.00511 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.10750E+01 0.00710 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  1.24160E+02 0.00020  1.21601E+02 0.00022 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:   1]) = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  2.00000E+01  6.06550E+00  3.67900E+00  2.23100E+00  1.35300E+00  8.21000E-01  5.00000E-01  3.02500E-01  1.83000E-01  1.11000E-01  6.74300E-02  4.08500E-02  2.47800E-02  1.50300E-02  9.11800E-03  5.50000E-03  3.51910E-03  2.23945E-03  1.42510E-03  9.06898E-04  3.67262E-04  1.48728E-04  7.55014E-05  4.80520E-05  2.77000E-05  1.59680E-05  9.87700E-06  4.00000E-06  3.30000E-06  2.60000E-06  2.10000E-06  1.85500E-06  1.50000E-06  1.30000E-06  1.15000E-06  1.12300E-06  1.09700E-06  1.07100E-06  1.04500E-06  1.02000E-06  9.96000E-07  9.72000E-07  9.50000E-07  9.10000E-07  8.50000E-07  7.80000E-07  6.25000E-07  5.00000E-07  4.00000E-07  3.50000E-07  3.20000E-07  3.00000E-07  2.80000E-07  2.50000E-07  2.20000E-07  1.80000E-07  1.40000E-07  1.00000E-07  8.00000E-08  6.70000E-08  5.80000E-08  5.00000E-08  4.20000E-08  3.50000E-08  3.00000E-08  2.50000E-08  2.00000E-08  1.50000E-08  1.00000E-08  5.00000E-09  1.00000E-11 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  9.10327E+05 0.00198  4.58081E+06 0.00093  1.02625E+07 0.00048  1.99482E+07 0.00025  2.19963E+07 0.00019  2.10250E+07 0.00017  2.00847E+07 0.00016  1.86334E+07 0.00018  1.76021E+07 0.00024  1.67189E+07 0.00028  1.62303E+07 0.00016  1.57191E+07 0.00023  1.54016E+07 0.00021  1.52240E+07 0.00022  1.50247E+07 0.00013  1.30997E+07 0.00026  1.24704E+07 0.00019  1.31380E+07 0.00015  1.28616E+07 0.00016  2.50297E+07 0.00018  2.38570E+07 0.00017  1.70423E+07 0.00017  1.08076E+07 0.00024  1.24352E+07 0.00022  1.14948E+07 0.00022  9.52544E+06 0.00034  1.61533E+07 0.00022  3.33900E+06 0.00065  4.14794E+06 0.00046  3.76348E+06 0.00038  2.20447E+06 0.00044  3.83460E+06 0.00041  2.62795E+06 0.00031  2.27228E+06 0.00071  4.40918E+05 0.00142  4.36727E+05 0.00090  4.50443E+05 0.00100  4.64434E+05 0.00117  4.60653E+05 0.00106  4.56374E+05 0.00059  4.71366E+05 0.00110  4.44439E+05 0.00085  8.44480E+05 0.00060  1.37084E+06 0.00066  1.79493E+06 0.00105  5.20447E+06 0.00078  6.73142E+06 0.00041  9.15837E+06 0.00057  6.90669E+06 0.00045  5.24535E+06 0.00025  4.06151E+06 0.00052  4.58484E+06 0.00036  8.00159E+06 0.00039  9.54896E+06 0.00032  1.54401E+07 0.00038  1.85914E+07 0.00041  2.10273E+07 0.00056  1.07869E+07 0.00050  6.79016E+06 0.00069  4.47928E+06 0.00076  3.75072E+06 0.00055  3.45987E+06 0.00115  2.72880E+06 0.00080  1.74847E+06 0.00092  1.55339E+06 0.00031  1.33853E+06 0.00114  1.08348E+06 0.00144  8.17795E+05 0.00106  5.11151E+05 0.00159  1.78032E+05 0.00328 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  1.05568E+00 0.00033 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  8.29552E+19 0.00026  2.78559E+19 0.00072 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  3.65904E-01 8.6E-05  6.11489E-01 0.00025 ];
INF_CAPT                  (idx, [1:   4]) = [  1.37129E-03 0.00031  3.33929E-03 0.00033 ];
INF_ABS                   (idx, [1:   4]) = [  1.97054E-03 0.00023  7.09281E-03 0.00052 ];
INF_FISS                  (idx, [1:   4]) = [  5.99252E-04 0.00028  3.75352E-03 0.00082 ];
INF_NSF                   (idx, [1:   4]) = [  1.45704E-03 0.00028  9.12459E-03 0.00082 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.43143E+00 6.9E-06  2.43094E+00 2.2E-07 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.02350E+02 4.1E-07  2.02270E+02 0.0E+00 ];
INF_INVV                  (idx, [1:   4]) = [  8.32856E-08 0.00021  2.01735E-06 0.00011 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  3.63934E-01 8.6E-05  6.04395E-01 0.00026 ];
INF_SCATT1                (idx, [1:   4]) = [  2.59199E-02 0.00017  2.10088E-02 0.00045 ];
INF_SCATT2                (idx, [1:   4]) = [  2.94088E-03 0.00166 -1.16239E-02 0.00095 ];
INF_SCATT3                (idx, [1:   4]) = [  4.47019E-04 0.00423 -1.20139E-02 0.00113 ];
INF_SCATT4                (idx, [1:   4]) = [ -1.37879E-05 0.29270 -1.07939E-02 0.00067 ];
INF_SCATT5                (idx, [1:   4]) = [ -5.49034E-06 0.55630 -9.28565E-03 0.00102 ];
INF_SCATT6                (idx, [1:   4]) = [ -1.15735E-04 0.02220 -7.98654E-03 0.00057 ];
INF_SCATT7                (idx, [1:   4]) = [ -2.80542E-05 0.05687 -6.23586E-03 0.00089 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  3.64003E-01 8.7E-05  6.04395E-01 0.00026 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.59380E-02 0.00018  2.10088E-02 0.00045 ];
INF_SCATTP2               (idx, [1:   4]) = [  2.94343E-03 0.00167 -1.16239E-02 0.00095 ];
INF_SCATTP3               (idx, [1:   4]) = [  4.47587E-04 0.00420 -1.20139E-02 0.00113 ];
INF_SCATTP4               (idx, [1:   4]) = [ -1.37441E-05 0.29489 -1.07939E-02 0.00067 ];
INF_SCATTP5               (idx, [1:   4]) = [ -5.42014E-06 0.55853 -9.28565E-03 0.00102 ];
INF_SCATTP6               (idx, [1:   4]) = [ -1.15788E-04 0.02199 -7.98654E-03 0.00057 ];
INF_SCATTP7               (idx, [1:   4]) = [ -2.80767E-05 0.05629 -6.23586E-03 0.00089 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  2.98658E-01 8.5E-05  5.82610E-01 0.00025 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.11611E+00 8.5E-05  5.72138E-01 0.00025 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  1.90136E-03 0.00022  7.09281E-03 0.00052 ];
INF_REMXS                 (idx, [1:   4]) = [  5.74781E-03 0.00019  1.07419E-02 0.00044 ];

% Poison cross sections:

INF_I135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_YIELD          (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_I135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_MICRO_ABS      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_I135_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_MACRO_ABS      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Poison universe-averaged densities:

I135_ADENS                (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
XE135_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM147_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM148_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM148M_ADENS              (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM149_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
SM149_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Poison decay constants:

PM147_LAMBDA              (idx, 1)        =  8.37254E-09 ;
PM148_LAMBDA              (idx, 1)        =  1.49451E-06 ;
PM148M_LAMBDA             (idx, 1)        =  1.94297E-07 ;
PM149_LAMBDA              (idx, 1)        =  3.62737E-06 ;
I135_LAMBDA               (idx, 1)        =  2.93061E-05 ;
XE135_LAMBDA              (idx, 1)        =  2.10657E-05 ;
XE135M_LAMBDA             (idx, 1)        =  7.55556E-04 ;
I135_BR                   (idx, 1)        =  9.01450E-01 ;

% Fission spectra:

INF_CHIT                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHIP                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHID                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

INF_S0                    (idx, [1:   8]) = [  3.60156E-01 8.5E-05  3.77797E-03 0.00030  3.64853E-03 0.00050  6.00747E-01 0.00026 ];
INF_S1                    (idx, [1:   8]) = [  2.67501E-02 0.00018 -8.30169E-04 0.00065 -3.00530E-04 0.00339  2.13094E-02 0.00042 ];
INF_S2                    (idx, [1:   8]) = [  3.08888E-03 0.00161 -1.47999E-04 0.00300 -2.38670E-04 0.00285 -1.13853E-02 0.00097 ];
INF_S3                    (idx, [1:   8]) = [  4.87892E-04 0.00455 -4.08730E-05 0.01135 -1.00280E-04 0.00596 -1.19136E-02 0.00114 ];
INF_S4                    (idx, [1:   8]) = [  5.73919E-06 0.72092 -1.95271E-05 0.00925 -4.67715E-05 0.01159 -1.07471E-02 0.00067 ];
INF_S5                    (idx, [1:   8]) = [  4.52140E-06 0.70576 -1.00117E-05 0.03003 -2.35216E-05 0.01791 -9.26213E-03 0.00104 ];
INF_S6                    (idx, [1:   8]) = [ -1.10229E-04 0.02438 -5.50626E-06 0.06870 -1.57387E-05 0.02940 -7.97080E-03 0.00056 ];
INF_S7                    (idx, [1:   8]) = [ -2.70244E-05 0.05946 -1.02972E-06 0.35985 -6.15378E-06 0.08973 -6.22971E-03 0.00086 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  3.60225E-01 8.5E-05  3.77797E-03 0.00030  3.64853E-03 0.00050  6.00747E-01 0.00026 ];
INF_SP1                   (idx, [1:   8]) = [  2.67682E-02 0.00018 -8.30169E-04 0.00065 -3.00530E-04 0.00339  2.13094E-02 0.00042 ];
INF_SP2                   (idx, [1:   8]) = [  3.09143E-03 0.00161 -1.47999E-04 0.00300 -2.38670E-04 0.00285 -1.13853E-02 0.00097 ];
INF_SP3                   (idx, [1:   8]) = [  4.88460E-04 0.00451 -4.08730E-05 0.01135 -1.00280E-04 0.00596 -1.19136E-02 0.00114 ];
INF_SP4                   (idx, [1:   8]) = [  5.78302E-06 0.71833 -1.95271E-05 0.00925 -4.67715E-05 0.01159 -1.07471E-02 0.00067 ];
INF_SP5                   (idx, [1:   8]) = [  4.59160E-06 0.68880 -1.00117E-05 0.03003 -2.35216E-05 0.01791 -9.26213E-03 0.00104 ];
INF_SP6                   (idx, [1:   8]) = [ -1.10281E-04 0.02418 -5.50626E-06 0.06870 -1.57387E-05 0.02940 -7.97080E-03 0.00056 ];
INF_SP7                   (idx, [1:   8]) = [ -2.70470E-05 0.05896 -1.02972E-06 0.35985 -6.15378E-06 0.08973 -6.22971E-03 0.00086 ];

% Micro-group spectrum:

B1_MICRO_FLX              (idx, [1: 140]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Integral parameters:

B1_KINF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_KEFF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_B2                     (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_ERR                    (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Critical spectra in infinite geometry:

B1_FLX                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS_FLX               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

B1_TOT                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CAPT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_ABS                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NSF                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NUBAR                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_KAPPA                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_INVV                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering cross sections:

B1_SCATT0                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT1                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT2                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT3                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT4                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT5                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT6                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT7                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering production cross sections:

B1_SCATTP0                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP1                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP2                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP3                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP4                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP5                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP6                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP7                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Diffusion parameters:

B1_TRANSPXS               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reduced absoption and removal:

B1_RABSXS                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_REMXS                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Poison cross sections:

B1_I135_YIELD             (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_I135_MICRO_ABS         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

B1_CHIT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHIP                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHID                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

B1_S0                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S1                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S2                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S3                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S4                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S5                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S6                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S7                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering production matrixes:

B1_SP0                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP1                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP2                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP3                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP4                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP5                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP6                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP7                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Additional diffusion parameters:

CMM_TRANSPXS              (idx, [1:   4]) = [  2.96947E-01 0.00017  6.27250E-01 0.00101 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  2.97487E-01 0.00038  6.22527E-01 0.00172 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  2.97610E-01 0.00031  6.24578E-01 0.00135 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  2.95754E-01 0.00054  6.34795E-01 0.00117 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.12253E+00 0.00017  5.31424E-01 0.00101 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.12050E+00 0.00038  5.35463E-01 0.00172 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.12004E+00 0.00031  5.33701E-01 0.00135 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.12707E+00 0.00054  5.25109E-01 0.00117 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  6.81569E-03 0.00452  2.40712E-04 0.02569  1.23994E-03 0.01135  1.16226E-03 0.01048  2.64348E-03 0.00694  1.07802E-03 0.01207  4.51283E-04 0.01705 ];
LAMBDA                    (idx, [1:  14]) = [  4.68780E-01 0.00629  1.33371E-02 3.6E-05  3.27253E-02 4.7E-05  1.20813E-01 2.7E-05  3.03106E-01 7.1E-05  8.51001E-01 0.00011  2.85704E+00 0.00018 ];

