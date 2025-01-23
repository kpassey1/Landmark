     F/TITLE MPORDHR       Receiving Input
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MPORDHR
     F*  Application ID      -    MPORDHR
     F*  Application Name    -          Receiving Input
     F*  Date Generated      -    Jan 12, 2012
     F*
     F********************************************************************
     F*  Program Narrative
     F*
     F*  Modified 01/03/02 By Kevin
     F*  1. only update IMS if the CDIMS flag in IPSCPYD = Y
     F*  2. update the on-hand stock according to the CDTRNR flag in IMSTRN
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  WRKPORD     - (U/DISK   ) Receiving Work File         WK
     F*  PORDH       - (U/DISK   ) Purchase Order header       PH
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  IMSCPYD     - (I/DISK   ) IMS Company Details         CD
     F*  IMSTRN      - (I/DISK   ) IMS Transaction Types       TT
     F*  PORDD       - (U/DISK   ) Purchase Order Header       PO
     F*  WLOCITM1    - (I/DISK   ) IMS Loc Item In item loc
     F*  IPSITEM     - (I/DISK   ) IPS Supplied Items
     F*  IPSCPYD     - (U/DISK   ) IPS Company Details         CD
     F*  GRNHIS      - (U/DISK   ) G.R.N. History              GR
     F*  STOKMOV     - (I/DISK   ) IMS Stock movement history  ST
     F*  WAREDET     - (U/DISK   ) Warehouse Item Details      WD
     F*  SUPLIER     - (I/DISK   ) IMS Supplier Master         SU
     F*  CCYCOD      - (I/DISK   ) IMS Currency Code           CC
     F*  WRITTYP     - (U/DISK   ) IMS Warehouse Item Types    WT
     F*  WARELOC     - (I/DISK   ) IMS Warehouse Locations     WL
     F*  STOKMOVX    - (U/DISK   ) IMS Stock movement history  ST
     F*  FILE0001    - (U/DISK   ) IMS Loc Item In item loc
     F*  MPORDHRD    - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCRCANC    - Cancel all update
     F*
     F* N79     - SCR005 PUTOVR
     F*
     F*  SCR001     - Initial list panel
     F*
     F*  01     - SCR001S1 / RN0001 : DSPATR(PC)
     F*  01     - SCR001S1 / RN0001 : DSPATR(RI)
     F*  02     - SCR001S1 / RN0001 : DSPATR(PR)
     F*  03     - SCR001S1 / RN0001 : DSPATR(UL)
     F*  04     - SCR001S1 / RN0001 : DSPATR(ND)
     F*  63     - SCR001C1 SFLDSPCTL
     F*  64     - SCR001C1 SFLDSP
     F*  65     - SCR001S1 SFLNXTCHG
     F*  66     - SCR001C1 SFLINZ
     F*  99     - SCR001 OVERLAY
     F* N63     - SCR001C1 SFLCLR
     F* N64     - SCR001C1 ERASE(SCR001S1)
     F* N67     - SCR001C1 SFLEND
     F* N79     - SCR001 PUTOVR
     F* N79     - SCR001C1 PUTOVR
     F*
     F*  SCR002     - Display all details for header
     F*
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F*  SCR003     - Display order details
     F*
     F*  01     - SCR003S1 / ACT : DSPATR(PC)
     F*  01     - SCR003S1 / ACT : DSPATR(RI)
     F*  02     - SCR003S1 / ACT : DSPATR(PR)
     F*  03     - SCR003S1 / ACT : DSPATR(UL)
     F*  04     - SCR003S1 / ACT : DSPATR(ND)
     F*  63     - SCR003C1 SFLDSPCTL
     F*  64     - SCR003C1 SFLDSP
     F*  65     - SCR003S1 SFLNXTCHG
     F*  66     - SCR003C1 SFLINZ
     F*  99     - SCR003 OVERLAY
     F* N63     - SCR003C1 SFLCLR
     F* N64     - SCR003C1 ERASE(SCR003S1)
     F* N67     - SCR003C1 SFLEND
     F* N79     - SCR003 PUTOVR
     F* N79     - SCR003C1 PUTOVR
     F*
     F*  SETSPEC    - Update all receipts
     F*
     F*  01     - SCR004 / WSOS07 : DSPATR(PC)
     F*  01     - SCR004 / WSOS07 : DSPATR(RI)
     F*  02     - SCR004 / WSOS07 : DSPATR(UL)
     F* N79     - SCR004 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - Initial list panel
     F* S002 - Display all details for header
     F* S003 - Display order details
     F* S004 - Update all receipts
     F* S005 - Cancel all update
     F* SREDSP -  Redisplay Windows within stack.
     F* SC3BKW - Roll Backward
     F* SC3EDT - Check record requested
     F* SC3FWD - Roll forward
     F* SYSDAT - System Date
     F* SY0010 - Format Date
     F* SCMD - Processes OS/400 Commands
     F* SMSG - calls message handling program to either clear, add, or
     F* S006   - CLRSCR SCR001
     F* S007   - Process To Initialize SubFile - SCR001S1
     F* S008   - GETREC d.company,*eq,COYNO#
     F* S009   - GETREC d.imscpyd,f.imscpyd,*eq,COYNO#
     F* S010   - SETLL D.PORDH,F.PORDH,SVK001,SVK002
     F* S011   - Process To Reset File Pointer(EOF) - PORDH
     F* S012   - GETBLK D.PORDH,F.PORDH,*PV,SVK001
     F* S013   - Process To Reset File Pointer(BOF) - PORDH
     F* S014   - CLRSCR SCR002
     F* S015   - GETREC D.PORDH,F.PORDH,*lock,*eq,SVK001,SVK002
     F* S016   - SETLL d.pordd,f.pordd,COYNO#,phpord
     F* S017   - GETREC d.pordd,*ne,COYNO#,phpord
     F* S018   - Process To Reset File Pointer(EOF) - PORDD
     F* S019   - SETLL D.WLOCITM1,F.WLOCITM1,POCOYNO,POWHSE,POITEM
     F* S020   - GETREC D.WLOCITM1,F.WLOCITM1,*NE,POCOYNO,POWHSE,POITEM
     F* S021   - Process To Reset File Pointer(EOF) - WLOCITM1
     F* S022   - WRITE d.wrkpord,f.wrkpord
     F* S023   - UPDATE d.pordh,f.pordh
     F* S024   - CLRSCR SCR003
     F* S025   - Process To Initialize SubFile - SCR003S1
     F* S026   - SETLL D.PORDD,F.PORDD,COYNO#,phpord,SVposeq
     F* S027   - GETREC D.IPSCPYD,*EQ,COYNO#
     F* S028   - UPDATE d.ipscpyd,f.ipscpyd
     F* S029   - SETLL d.wrkpord,f.wrkpord,COYNO#,phpord
     F* S030   - GETREC d.wrkpord,*ne,COYNO#,phpord
     F* S031   - Process To Reset File Pointer(EOF) - WRKPORD
     F* S032   - GETREC d.pordd,*eq,COYNO#,wkpord,wkline
     F* S033   - UPDATE d.pordd,f.pordd
     F* S034   - WRITE d.grnhis,f.grnhis
     F* S035   - GETREC D.IMSTRN,F.IMSTRN,*EQ,COYNO#,CDTRNR
     F* S036   - WRITE D.STOKMOV,F.STOKMOV
     F* S037   - GETREC d.waredet,*eq,pocoyno,powhse,poitem
     F* S038   - GETREC d.suplier,f.suplier,*eq,COYNO#,phsuppn,phbrnbr
     F* S039   - GETREC d.suplier,f.ccycod,*eq,COYNO#,sucurr
     F* S040   - GETREC D.WLOCITM1,F.WLOCITM1,*EQ,WKCOYNO,WKWHSE,WKITEM,WKLOCN
     F* S041   - UPDATE d.wlocitm1,f.wlocitm1
     F* S042   - Referential Integrity Check (Update) For File WLOCITM1
     F* S043   - UPDATE d.waredet,f.waredet
     F* S044   - Referential Integrity Check (Update) For File WAREDET
     F* S045   - GETREC D.WAREHED,F.WRITTYP,*EQ,POCOYNO,POWHSE,POITEM,CDTRNR
     F* S046   - UPDATE D.WAREHED,F.WRITTYP
     F* S047   - WRITE D.WAREHED,F.WRITTYP
     F* S048   - DELETE d.wrkpord,f.wrkpord
     F* S049   - GETBLK D.PORDD,F.PORDD,*PV,COYNO#,phpord
     F* S050   - Process To Reset File Pointer(BOF) - PORDD
     F* S051   - Process To Reset File Pointer(EOF) - PORDD
     F* S052   - GETREC D.WRKPORD,F.WRKPORD,*EQ,POCOYNO,POPORD,POSEQ
     F* S053   - GETREC D.IPSITEM,F.IPSITEM,*EQ,POCOYNO,PHSUPPN,PHBRNBR,poitem
     F* S054   - SETLL D.WRKPORD,F.WRKPORD,POCOYNO,POPORD,POSEQ
     F* S055   - GETREC D.WRKPORD,F.WRKPORD,*ne,POCOYNO,POPORD,POSEQ
     F* S056   - Process To Reset File Pointer(EOF) - WRKPORD
     F* S004V - Update all receipts
     F* *PSSR - Program Execution Errors Handler
     F* SATRIB - Display Attribute Handler
     F* SLOCK - Update Lock Flag
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FMPORDHRD  CF   E             WORKSTN
     F                                     SFILE(SCR001S1:RRN01)
     F                                     SFILE(SCR003S1:RRN02)
     F                                     INFDS(DSPFDS)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FIMSCPYD   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FIMSTRN    IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FWLOCITM1  IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FIPSITEM   IF   E           K DISK
     F                                     INFDS(FIDS08)
     F                                     INFSR(SFERR)
     FSTOKMOV   IF   E           K DISK
     F                                     INFDS(FIDS11)
     F                                     INFSR(SFERR)
     FSUPLIER   IF   E           K DISK
     F                                     INFDS(FIDS13)
     F                                     INFSR(SFERR)
     FCCYCOD    IF   E           K DISK
     F                                     INFDS(FIDS14)
     F                                     INFSR(SFERR)
     FWARELOC   IF   E           K DISK
     F                                     INFDS(FIDS16)
     F                                     INFSR(SFERR)
     FPORDH     UF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FPORDD     UF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FIPSCPYD   UF   E           K DISK
     F                                     INFDS(FIDS09)
     F                                     INFSR(SFERR)
     FWAREDET   UF   E           K DISK
     F                                     INFDS(FIDS12)
     F                                     INFSR(SFERR)
     FFILE0001  UF   E             DISK
     F                                     INFDS(FIDS18)
     F                                     RENAME(WLOCITMF:FMT002)
     F                                     INFSR(SFERR)
     FGRNHIS    UF A E           K DISK
     F                                     INFDS(FIDS10)
     F                                     INFSR(SFERR)
     FWRKPORD   UF A E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FWRITTYP   UF A E           K DISK
     F                                     INFDS(FIDS15)
     F                                     INFSR(SFERR)
     FSTOKMOVX  UF A E             DISK
     F                                     INFDS(FIDS17)
     F                                     RENAME(STOKMOVF:FMT001)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D CST             S              1    DIM(2560)                            Command string
     D A1              S             80    DIM(4) CTDATA PERRCD(1)              Alpha constants i
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(6) CTDATA PERRCD(1)              Fld Attr. Indic t
     D DA2             S             34    DIM(6) ALT(DA1)
     D FIDS14          DS
     D  STS14            *STATUS
     D  REC14                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS10          DS
     D  STS10            *STATUS
     D  REC10                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                397    400B 0
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS11          DS
     D  STS11            *STATUS
     D  REC11                397    400B 0
     D FIDS13          DS
     D  STS13            *STATUS
     D  REC13                397    400B 0
     D FIDS12          DS
     D  STS12            *STATUS
     D  REC12                397    400B 0
     D FIDS16          DS
     D  STS16            *STATUS
     D  REC16                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS15          DS
     D  STS15            *STATUS
     D  REC15                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS17          DS
     D  STS17            *STATUS
     D  REC17                397    400B 0
     D FIDS18          DS
     D  STS18            *STATUS
     D  REC18                397    400B 0
     D*
     D* Company Number
     D*
     D @DS001          DS             3
     D  COYNO#                 1      3
     D*
     D* KDPKEY3 - data area
     D*
     D @DS002          DS            27
     D  KDPKEY                 1     27
     D*
     D* INFDS for cursor location
     D*
     D DSPFDS          DS
     D  ROW                  370    370
     D  COL                  371    371
     D  SFLRRN               378    379B 0
     D*
     D* Work Data Structure for cursor
     D*
     D @DS003          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
     D*
     D* Display Attribute Structure
     D*
     D @DS004          DS
     D  FLDSCR                 1     10
     D  FLDNAM                11     20
     D  FLDINX                21     24  0
     D  DSPERR                25     25
     D  #DS                   26     26
     D  #HI                   27     27
     D  #RI                   28     28
     D  #UL                   29     29
     D  #BL                   30     30
     D  #CS                   31     31
     D  #PC                   32     32
     D  #ND                   33     33
     D  #PR                   34     34
     D  #GN                   35     35
     D  #RD                   36     36
     D  #PK                   37     37
     D  #WT                   38     38
     D  #TQ                   39     39
     D  #YW                   40     40
     D  #BU                   41     41
     D  DA6                   27     41    DIM(15)                              Fld Attr. Wrk Ary
     D  #ATRIB                11     41
     D  #FROM                 25     28  0
     D  #TO                   29     32  0
     D  #CLF                  25     32  0
     D  #MAP                   1     24
     D*
     D* Named constants
     D*
     D C0001           C                   CONST('Action must be 5')
     D*
     D* Named constants
     D*
     D C0002           C                   CONST('Record not found for-
     D                                      Display')
     D*
     D* Named constants
     D*
     D C0003           C                   CONST('MIPSTXTHC')
     D*
     D* Named constants
     D*
     D C0004           C                   CONST('Action must be 2')
     D*
     D* Date Manipulation Data Struct.
     D*
     D                 DS
     D  X1CDAT                 1      8  0
     D  X1DATE                 1      6  0
     D  X12                    1      2  0
     D  X34                    3      4  0
     D  X56                    5      6  0
     D  X78                    7      8  0
     D*
     D* Message data structure
     D*
     D @DS005          DS
     D  MSGDTA                 1    132
     D  UMESG1                 1     51
     D  UMESG2                52    102
     D  UMESG3               103    132
     D*
     D* Program status data structure
     D*
     D SDS            SDS
     D  WSID                 244    253
     D  USER                 254    263
     D  PGM              *PROC
     D  USTAT                 11     15  0
     D  USRCLN                21     28
     D  UROUTN                29     36
     D  MSGID                 40     46
     D  ULIB                  81     90
     D  UMSGTX                91    170
     D  UFILE                201    208
     D  UFSTAT               209    213
     D  UFSRCL               228    235
     D  UJOBN                264    269  0
     D  UCDAT                288    293  0
     D  UCTIM                294    299  0
     ICCYCODF
     I              CCCOYNO                     RN0014
     ICOMPANYF
     I              CYCOYNO                     RN0015
     I              CYEMPCOL                    RN0016
     I              CYEMPHEAD                   RN0017
     I              CYPRDHEAD                   RN0018
     I              CYREFHEAD                   RN0019
     I              CYSDESC                     RN0020
     IGRNHISF
     I              GRBRNBR                     RN0021
     I              GRCOYNO                     RN0022
     I              GRDLVDT                     RN0023
     I              GRGRNPR                     RN0024
     I              GRIDESC                     RN0025
     I              GRINVNUM                    RN0026
     I              GRNLALL                     RN0027
     I              GRPRICE                     RN0028
     I              GRQRCYC                     RN0029
     I              GRRCAUD                     RN0030
     I              GRRECBY                     RN0031
     I              GRRECPR                     RN0032
     I              GRSUPPN                     RN0033
     I              GRWNAME                     RN0034
     IIMSCPYDF
     I              CDCOYNO                     RN0035
     I              CDHEAD1                     RN0036
     I              CDHEAD2                     RN0037
     I              CDHEAD3                     RN0038
     IIMSTRMF
     I              TTCOYNO                     RN0039
     IIPSCPYDF
     I              CDAUDAM                     RN0040
     I              CDAUDGR                     RN0041
     I              CDAUDOR                     RN0042
     I              CDAUDPR                     RN0043
     I              CDAUDRE                     RN0044
     I              CDCOYNO                     RN0045
     IIPSITEMF
     I              PIBRNBR                     RN0046
     I              PICNVCDE                    RN0047
     I              PICOYNO                     RN0048
     I              PIPBRK1                     RN0049
     I              PIPBRK2                     RN0050
     I              PIPBRK3                     RN0051
     I              PIPBRK4                     RN0052
     I              PIPRCOD                     RN0053
     I              PIQBRK1                     RN0054
     I              PIQBRK2                     RN0055
     I              PIQBRK3                     RN0056
     I              PIQBRK4                     RN0057
     I              PISDESC                     RN0058
     I              PISPITM                     RN0059
     I              PISUPPN                     RN0060
     IPORDDF
     I              POCOYNO                     RN0061
     I              PODLVDT                     RN0062
     I              POIDESC                     RN0063
     I              PONLALL                     RN0064
     I              POPRICE                     RN0065
     I              POQRCVD                     RN0066
     I              POQRCYC                     RN0067
     IPORDHF
     I              PHBRNBR                     RN0068
     I              PHBUYER                     RN0069
     I              PHCMPDT                     RN0070
     I              PHCONNAM                    RN0071
     I              PHCOYNO                     RN0072
     I              PHCUSORD                    RN0073
     I              PHDLVDT                     RN0074
     I              PHENTDT                     RN0075
     I              PHLRCVDT                    RN0076
     I              PHNLALL                     RN0077
     I              PHNOPOS                     RN0078
     I              PHRLAUD                     RN0079
     I              PHSHIPV                     RN0080
     I              PHSLIN1                     RN0081
     I              PHSLIN2                     RN0082
     I              PHSLIN3                     RN0083
     I              PHSLIN4                     RN0084
     I              PHSLIN5                     RN0085
     I              PHSLIN6                     RN0086
     I              PHSNAME                     RN0087
     I              PHSPSTCD                    RN0088
     I              PHSUPPN                     RN0089
     I              PHWLIN1                     RN0090
     I              PHWLIN2                     RN0091
     I              PHWLIN3                     RN0092
     I              PHWLIN4                     RN0093
     I              PHWLIN5                     RN0094
     I              PHWLIN6                     RN0095
     I              PHWNAME                     RN0096
     I              PHWPSTCD                    RN0097
     ISTOKMOVF
     I              STBRNBR                     RN0098
     I              STCOYNO                     RN0099
     I              STSUPPN                     RN0100
     ISUPLIERF
     I              SUALPHA                     RN0101
     I              SUBRNBR                     RN0102
     I              SUCONNAM                    RN0103
     I              SUCOYNO                     RN0104
     I              SUPSTCD                     RN0105
     I              SUSUPPN                     RN0106
     I              SUTELEPH                    RN0107
     IWDETAILF
     I              WDCOYNO                     RN0108
     I              WDSUPPN                     RN0109
     IWARELOCF
     I              WLCOYNO                     RN0110
     IWLOCITMF
     I              WICOYNO                     RN0111
     IWRITTYPF
     I              WTCOYNO                     RN0112
     IWRKPORDF
     I              WKCOYNO                     RN0113
     I              WKPRICE                     RN0114
     I              WKQRCVD                     RN0115
     IFMT001
     I              STBRNBR                     RN0098
     I              STCOYNO                     RN0099
     I              STSUPPN                     RN0100
     IFMT002
     I              WICOYNO                     RN0111
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    PGO
     C                   PARM                    KDPKEY           27
     C                   PARM                    WK0601
     C*
     C     P0002         PLIST
     C                   PARM                    XHPORD           10
     C                   PARM                    DT1550
     C*
     C     P0003         PLIST
     C                   PARM                    COYNO#            3
     C                   PARM                    WOPORD
     C                   PARM                    SEQ155
     C*
     C     *ENTRY        PLIST
     C                   PARM                    XYMD              6 0
     C*
     C     PMSGCL        PLIST
     C                   PARM                    MSGACT            1
     C                   PARM                    MSGID
     C                   PARM                    MSGF             10
     C                   PARM                    MSGFL            10
     C                   PARM                    MSGDTA
     C*
     C     PHELP         PLIST
     C                   PARM                    APPSET
     C                   PARM                    APPTYP
     C                   PARM                    APPPGM
     C                   PARM                    APPSCR
     C                   PARM                    APPROW
     C                   PARM                    APPCOL
     C********************************************************************
     C*                   K e y      L i s t
     C********************************************************************
     C*
     C     K0001         KLIST
     C                   KFLD                    KYCO01
     C*
     C     K0002         KLIST
     C                   KFLD                    KYCO01
     C                   KFLD                    KDTR02
     C*
     C     K0003         KLIST
     C                   KFLD                    KDCO01
     C*
     C     K0004         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHPO02
     C*
     C     K0005         KLIST
     C                   KFLD                    KHCO01
     C*
     C     K0006         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C*
     C     K0007         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KIIT03
     C*
     C     K0008         KLIST
     C                   KFLD                    KKCO01
     C                   KFLD                    KKPO02
     C                   KFLD                    KKLI03
     C                   KFLD                    KKSE04
     C*
     C     K0009         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C                   KFLD                    KOSE03
     C*
     C     K0010         KLIST
     C                   KFLD                    KKCO01
     C                   KFLD                    KKPO02
     C*
     C     K0011         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTTR02
     C*
     C     K0012         KLIST
     C                   KFLD                    KDCO02
     C                   KFLD                    KDWH03
     C                   KFLD                    KDIT04
     C*
     C     K0013         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUSU02
     C                   KFLD                    KUBR03
     C*
     C     K0014         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUCU02
     C*
     C     K0015         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KIIT03
     C                   KFLD                    KILO04
     C*
     C     K0016         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KILO03
     C*
     C     K0017         KLIST
     C                   KFLD                    KHCO02
     C                   KFLD                    KHWH03
     C                   KFLD                    KDIT04
     C                   KFLD                    KTTR05
     C*
     C     K0018         KLIST
     C                   KFLD                    KKCO02
     C                   KFLD                    KKPO03
     C                   KFLD                    KKLI04
     C*
     C     K0019         KLIST
     C                   KFLD                    KICO02
     C                   KFLD                    KISU03
     C                   KFLD                    KIBR04
     C                   KFLD                    KIIT05
     C*
     C     K0020         KLIST
     C                   KFLD                    KKCO03
     C                   KFLD                    KKPO04
     C                   KFLD                    KKLI05
     C*
     C     K0021         KLIST
     C                   KFLD                    KKCO04
     C                   KFLD                    KKPO05
     C                   KFLD                    KKLI06
     C*
     C     K0022         KLIST
     C                   KFLD                    KKCO05
     C                   KFLD                    KKPO06
     C                   KFLD                    KKLI07
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CCEXCC        WCEXCC                         Exchange Calc
     C     *LIKE         DEFINE    CCEXCR        WCEXCR                         Exchange Rate
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    RN0021        WK0001                         Branch Number
     C     *LIKE         DEFINE    GRCCDE        WRCCDE                         Conversion Code
     C     *LIKE         DEFINE    GRCONV        WRCONV                         Conversion Qty
     C     *LIKE         DEFINE    RN0022        WK0002                         Company number
     C     *LIKE         DEFINE    RN0023        WK0003                         Delivery Date
     C     *LIKE         DEFINE    RN0024        WK0004                         Grn Printed Y/N
     C     *LIKE         DEFINE    RN0025        WK0005                         Item Description
     C     *LIKE         DEFINE    GRITEM        WRITEM                         Item Number
     C     *LIKE         DEFINE    RN0027        WK0007                         Allocated account
     C     *LIKE         DEFINE    GRPCDE        WRPCDE                         Pricing code
     C     *LIKE         DEFINE    GRPORD        WRPORD                         Purchase Order Numbe
     C     *LIKE         DEFINE    RN0028        WK0008                         Price
     C     *LIKE         DEFINE    GRQORD        WRQORD                         Quantity Ordered
     C     *LIKE         DEFINE    RN0029        WK0009                         Received this cycle
     C     *LIKE         DEFINE    RN0030        WK0010                         Goods Received Note
     C     *LIKE         DEFINE    RN0032        WK0012                         Yes no
     C     *LIKE         DEFINE    GRREQ         WRREQ                          Date Requested yymmd
     C     *LIKE         DEFINE    GRSEQ         WRSEQ                          Sequence
     C     *LIKE         DEFINE    RN0033        WK0013                         Supplier Number
     C     *LIKE         DEFINE    GRUOM         WRUOM                          Unit of Measure
     C     *LIKE         DEFINE    GRWHSE        WRWHSE                         Warehouse Number
     C     *LIKE         DEFINE    RN0034        WK0014                         Wharehouse name
     C     *LIKE         DEFINE    CDTRNP        WDTRNP                         Purchasing Trans
     C     *LIKE         DEFINE    CDTRNR        WDTRNR                         Receiving Trans
     C     *LIKE         DEFINE    TTONHC        WTONHC                         On Hand Calculation
     C     *LIKE         DEFINE    TTUPDC        WTUPDC                         Update Cost
     C     *LIKE         DEFINE    RN0041        WK0015                         Goods Received Audit
     C     *LIKE         DEFINE    CDIMS         WDIMS                          IMS to be used
     C     *LIKE         DEFINE    PIITEM        WK0016                         Item Number
     C     *LIKE         DEFINE    POCCDE        WOCCDE                         Conversion Code
     C     *LIKE         DEFINE    POCONV        WOCONV                         Conversion Qty
     C     *LIKE         DEFINE    RN0061        WK0017                         Company number
     C     *LIKE         DEFINE    RN0062        WK0018                         Delivery Date
     C     *LIKE         DEFINE    RN0064        WK0020                         Allocated account
     C     *LIKE         DEFINE    POPCDE        WOPCDE                         Pricing code
     C     *LIKE         DEFINE    POPORD        WOPORD                         Purchase Order Numbe
     C     *LIKE         DEFINE    RN0065        WK0021                         Price
     C     *LIKE         DEFINE    RN0067        WK0023                         Received this cycle
     C     *LIKE         DEFINE    POUOM         WOUOM                          Unit of Measure
     C     *LIKE         DEFINE    RN0070        WK0026                         Completed Date
     C     *LIKE         DEFINE    RN0072        WK0028                         Company number
     C     *LIKE         DEFINE    RN0074        WK0030                         Delivery Date
     C     *LIKE         DEFINE    RN0075        WK0031                         Entered Date
     C     *LIKE         DEFINE    RN0076        WK0032                         Last Receipt Date
     C     *LIKE         DEFINE    RN0078        WK0034                         Purchase oprders pri
     C     *LIKE         DEFINE    PHOPNL        WHOPNL                         Open Lines on order
     C     *LIKE         DEFINE    PHOS01        WHOS01                         New Order
     C     *LIKE         DEFINE    PHOS02        WHOS02                         Updated Order/Line s
     C     *LIKE         DEFINE    PHOS03        WHOS03                         No action since last
     C     *LIKE         DEFINE    PHOS04        WHOS04                         P.O. Pending
     C     *LIKE         DEFINE    PHOS05        WHOS05                         Some receiving since
     C     *LIKE         DEFINE    PHOS06        WHOS06                         Print P.O.Requested
     C     *LIKE         DEFINE    PHOS07        WHOS07                         Print Receiving List
     C     *LIKE         DEFINE    PHOS08        WHOS08                         Order fully recd
     C     *LIKE         DEFINE    PHOS09        WHOS09                         special order attent
     C     *LIKE         DEFINE    PHOS10        WHOS10                         P.O. has been printe
     C     *LIKE         DEFINE    PHOS11        WHOS11                         P.O. has been adjust
     C     *LIKE         DEFINE    RN0079        WK0035                         Receiving list|Audit
     C     *LIKE         DEFINE    RN0095        WK0050                         Line 6
     C     *LIKE         DEFINE    RN0099        WK0053                         Company number
     C     *LIKE         DEFINE    STDTAC        WTDTAC                         Actual date
     C     *LIKE         DEFINE    STDTTR        WTDTTR                         Transaction date
     C     *LIKE         DEFINE    STITEM        WK0054                         Item Number
     C     *LIKE         DEFINE    STLOCN        WTLOCN                         Location
     C     *LIKE         DEFINE    STTQTY        WTTQTY                         Transaction quantity
     C     *LIKE         DEFINE    STTREF        WTTREF                         Transaction Referenc
     C     *LIKE         DEFINE    STTTYP        WTTTYP                         Transaction Type
     C     *LIKE         DEFINE    STUCST        WTUCST                         Input unit cost
     C     *LIKE         DEFINE    STWHSE        WK0055                         Warehouse Number
     C     *LIKE         DEFINE    SUCURR        WUCURR                         Currency code
     C     *LIKE         DEFINE    WDLCST        WK0056                         Cost at Last Receipt
     C     *LIKE         DEFINE    WDLRDT        WK0057                         Date Of Last Receipt
     C     *LIKE         DEFINE    WDNORP        WK0058                         No. of Orders Receiv
     C     *LIKE         DEFINE    WDNORY        WK0059                         No. of Orders Receiv
     C     *LIKE         DEFINE    WDQOH         WK0060                         Quantity On Hand
     C     *LIKE         DEFINE    WDQOO         WK0061                         Quantity On Order
     C     *LIKE         DEFINE    WDUCST        WK0062                         Unit Cost / Calc / w
     C     *LIKE         DEFINE    RN0111        WK0063                         Company number
     C     *LIKE         DEFINE    WIITEM        WK0064                         Item Number
     C     *LIKE         DEFINE    WILOCN        WK0065                         Location
     C     *LIKE         DEFINE    WIQOH         WK0066                         Quantity on hand
     C     *LIKE         DEFINE    WIWHSE        WK0067                         Warehouse Number
     C     *LIKE         DEFINE    RN0112        WK0068                         Company number
     C     *LIKE         DEFINE    WTITEM        WK0069                         Item Number
     C     *LIKE         DEFINE    WTTRNC        WK0070                         Transaction Type
     C     *LIKE         DEFINE    WTTRPQ        WK0071                         Trans Period Quantit
     C     *LIKE         DEFINE    WTTRPV        WK0072                         Trans Period Value
     C     *LIKE         DEFINE    WTTRYQ        WK0073                         Trans YTD Quantity
     C     *LIKE         DEFINE    WTTRYV        WK0074                         Trans YTD Value
     C     *LIKE         DEFINE    WTWHSE        WK0075                         Warehouse Number
     C     *LIKE         DEFINE    RN0113        WK0076                         Company number
     C     *LIKE         DEFINE    WKITEM        WK0077                         Item Number
     C     *LIKE         DEFINE    WKLINE        WK0078                         Line Number
     C     *LIKE         DEFINE    WKLOCN        WK0079                         Location
     C     *LIKE         DEFINE    WKPORD        WK0080                         Purchase Order Numbe
     C     *LIKE         DEFINE    RN0114        WK0081                         Price
     C     *LIKE         DEFINE    RN0115        WK0082                         Quantity received
     C     *LIKE         DEFINE    WKSEQ         WK0083                         Sequence
     C     *LIKE         DEFINE    WKWHSE        WK0084                         Warehouse
     C     *LIKE         DEFINE    REC14         HRC14
     C     *LIKE         DEFINE    RN0014        HD0001
     C     *LIKE         DEFINE    CCCURR        HCCURR
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0015        HD0002
     C     *LIKE         DEFINE    RN0022        HD0003
     C     *LIKE         DEFINE    RN0030        HD0004
     C     *LIKE         DEFINE    GRPORD        HRPORD
     C     *LIKE         DEFINE    GRSEQ         HRSEQ
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0035        HD0005
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0039        HD0006
     C     *LIKE         DEFINE    TTTRNC        HTTRNC
     C     *LIKE         DEFINE    REC09         HRC09
     C     *LIKE         DEFINE    RN0045        HD0007
     C     *LIKE         DEFINE    REC08         HRC08
     C     *LIKE         DEFINE    RN0048        HD0009
     C     *LIKE         DEFINE    RN0060        HD0010
     C     *LIKE         DEFINE    RN0046        HD0008
     C     *LIKE         DEFINE    PIITEM        HIITEM
     C     *LIKE         DEFINE    REC11         HRC11
     C     *LIKE         DEFINE    RN0099        HD0013
     C     *LIKE         DEFINE    REC13         HRC13
     C     *LIKE         DEFINE    RN0104        HD0015
     C     *LIKE         DEFINE    RN0106        HD0016
     C     *LIKE         DEFINE    RN0102        HD0014
     C     *LIKE         DEFINE    REC16         HRC16
     C     *LIKE         DEFINE    RN0110        HD0018
     C     *LIKE         DEFINE    WLWHSE        HLWHSE
     C     *LIKE         DEFINE    WLLOCN        HLLOCN
     C     *LIKE         DEFINE    REC12         HRC12
     C     *LIKE         DEFINE    RN0108        HD0017
     C     *LIKE         DEFINE    WDWHSE        HDWHSE
     C     *LIKE         DEFINE    WDITEM        HDITEM
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0111        HD0019
     C     *LIKE         DEFINE    WIWHSE        HIWHSE
     C     *LIKE         DEFINE    WIITEM        HD0020
     C     *LIKE         DEFINE    WILOCN        HILOCN
     C     *LIKE         DEFINE    REC15         HRC15
     C     *LIKE         DEFINE    RN0112        HD0021
     C     *LIKE         DEFINE    WTWHSE        HTWHSE
     C     *LIKE         DEFINE    WTITEM        HTITEM
     C     *LIKE         DEFINE    WTTRNC        HD0022
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0113        HD0023
     C     *LIKE         DEFINE    WKPORD        HKPORD
     C     *LIKE         DEFINE    WKLINE        HKLINE
     C     *LIKE         DEFINE    WKSEQ         HKSEQ
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        NARG3            30 9          Numeric argumnt
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *BLANKS       AARG2           256            Alpha argument2
     C                   MOVE      *BLANKS       ARSLT           256            Alpha result
     C                   MOVE      *ZEROS        NARG1            30 9          Numer argument1
     C                   MOVE      *ZEROS        NRSLT            30 9          Numeric result
     C                   MOVE      *BLANKS       DATFMT            3            Date format
     C                   MOVE      *ZEROS        SVDAT             6 0          Save date
     C                   MOVE      *ZEROS        SVYY              2 0          Save year
     C                   MOVE      *ZEROS        SVMM              2 0          Save month
     C                   MOVE      *ZEROS        SVDD              2 0          Save days
     C                   MOVE      *ZEROS        SVDAYS            3 0          Save days
     C                   MOVE      *ZEROS        SVLEAP            1 0          If leap year
     C                   MOVE      *ZEROS        FEB               2 0          NOD in feb/Leap
     C                   MOVE      *ZEROS        SVCY              4 0          Save days
     C                   MOVE      *ZEROS        SVCC              2 0          Save century
     C                   MOVE      1             CHKVAR            1 0          Perform Valid.
     C                   MOVE      *ZEROS        ##DATE            8 0
     C                   MOVE      *ZEROS        ##YEAR            2 0
     C                   MOVE      *ZEROS        ACT               1 0
     C                   MOVE      *ZEROS        ACTION            1 0
     C                   MOVE      *ZEROS        RN0001            1 0          Action select field
     C                   MOVE      *ZEROS        COUNT             3 0
     C                   MOVE      *ZEROS        RN0002           12 5          price
     C                   MOVE      *ZEROS        DT1550           15 5
     C                   MOVE      *ZEROS        EXFLAG            1 0
     C                   MOVE      *BLANKS       F12               1
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *BLANKS       ITMANF           20
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *BLANKS       MTLOCN            1
     C                   MOVE      *BLANKS       PGO               3
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *ZEROS        RN0003            5 0          Reposition fld for..
     C                   MOVE      *BLANKS       POS001            3
     C                   MOVE      *BLANKS       POS002           10
     C                   MOVE      *ZEROS        SEQ155           15 5
     C                   MOVE      *BLANKS       SVDESC           40
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *BLANKS       SVK002           10
     C                   MOVE      *BLANKS       SVPORD           20
     C                   MOVE      *ZEROS        RN0004            5 0          Save Key fld for....
     C                   MOVE      *BLANKS       RN0005           20            SVSNAME
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0006            4            SYCCYYA
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0007            8 0          SYDATI
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0008           10            SYDATO
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0009            1            SYDFMT
     C                   MOVE      *BLANKS       SYDSEP            1
     C                   MOVE      *BLANKS       RN0010            1            SYDSEP
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0011            4            SYMMDDA
     C                   MOVE      *BLANKS       UPDATE            1
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *ZEROS        WK0601            6 0
     C                   MOVE      *ZEROS        WK1521           15 6
     C                   MOVE      *ZEROS        WK1522           15 6
     C                   MOVE      *ZEROS        WK1523           15 6
     C                   MOVE      *BLANKS       RN0012           10            WSDLVDT
     C                   MOVE      *BLANKS       WSMANF           20
     C                   MOVE      *BLANKS       WSOS07            1
     C                   MOVE      *BLANKS       WSOS09            1
     C                   MOVE      *ZEROS        RN0013            9 0          FL0001
     C                   MOVE      *ZEROS        LCK14             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK10             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK11             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK13             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK12             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK16             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK15             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *BLANKS       RN0116            3            Branch Number
     C                   MOVE      *BLANKS       EDCARR           20            Carrier
     C                   MOVE      *BLANKS       RN0117            3            Company number
     C                   MOVE      *ZEROS        EDDTTR            8 0          Transaction Date
     C                   MOVE      *BLANKS       RN0118            6            Supplier Number
     C                   MOVE      *ZEROS        EDTIME            6 0          Expected time
     C                   MOVE      *BLANKS       EDTREF           15            Transaction Referenc
     C                   MOVE      *ZEROS        LCK17             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK18             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       IN03             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD03            1            RD STS
     C                   MOVE      *BLANKS       SWRD04            1            RD STS
     C                   MOVE      *BLANKS       SWRD05            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       KDTR02            2            CDTRNP
     C                   MOVE      *BLANKS       KDCO01            3            CDCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       KHCO01            3            PHCOYNO
     C                   MOVE      *BLANKS       KHPO02           10            PHPORD
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          0030
     C                   MOVE      *BLANKS       KOCO01            3            POCOYNO
     C                   MOVE      *BLANKS       KOPO02           10            POPORD
     C                   MOVE      *BLANKS       SWRD07            1            RD STS          0030
     C                   MOVE      *BLANKS       KICO01            3            WICOYNO
     C                   MOVE      *BLANKS       KIWH02            3            WIWHSE
     C                   MOVE      *BLANKS       KIIT03           20            WIITEM
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          0030
     C                   MOVE      *BLANKS       KKCO01            3            WKCOYNO
     C                   MOVE      *BLANKS       KKPO02           10            WKPORD
     C                   MOVE      *ZEROS        KKLI03            5 0          WKLINE
     C                   MOVE      *ZEROS        KKSE04            5 0          WKSEQ
     C                   MOVE      *BLANKS       INS02            99            Savd.Ind
     C                   MOVE      *ZEROS        KOSE03            5 0          POSEQ
     C                   MOVE      *BLANKS       SWRD09            1            RD STS          0030
     C                   MOVE      *BLANKS       KTCO01            3            TTCOYNO
     C                   MOVE      *BLANKS       KTTR02            2            TTTRNC
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       SWRD11            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD12            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD15            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD16            1            RD STS          0030
     C                   MOVE      *BLANKS       KDCO02            3            WDCOYNO
     C                   MOVE      *BLANKS       KDWH03            3            WDWHSE
     C                   MOVE      *BLANKS       KDIT04           20            WDITEM
     C                   MOVE      *BLANKS       SWRD13            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD14            1            RD STS          0030
     C                   MOVE      *BLANKS       KUCO01            3            SUCOYNO
     C                   MOVE      *BLANKS       KUSU02            6            SUSUPPN
     C                   MOVE      *BLANKS       KUBR03            3            SUBRNBR
     C                   MOVE      *BLANKS       KUCU02            3            SUCURR
     C                   MOVE      *BLANKS       KILO04           10            WILOCN
     C                   MOVE      *BLANKS       RIERR             1            RI FLAG
     C                   MOVE      *BLANKS       KILO03           10            WILOCN
     C                   MOVE      *BLANKS       KHCO02            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH03            3            WHWHSE
     C                   MOVE      *BLANKS       KTTR05            2            WTTRNC
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       KKCO02            3            WKCOYNO
     C                   MOVE      *BLANKS       KKPO03           10            WKPORD
     C                   MOVE      *ZEROS        KKLI04            5 0          WKLINE
     C                   MOVE      *BLANKS       SWRD08            1            RD STS          0030
     C                   MOVE      *BLANKS       KICO02            3            PICOYNO
     C                   MOVE      *BLANKS       KISU03            6            PISUPPN
     C                   MOVE      *BLANKS       KIBR04            3            PIBRNBR
     C                   MOVE      *BLANKS       KIIT05           20            PIITEM
     C                   MOVE      *BLANKS       KKCO03            3            WKCOYNO
     C                   MOVE      *BLANKS       KKPO04           10            WKPORD
     C                   MOVE      *ZEROS        KKLI05            5 0          WKLINE
     C                   MOVE      *BLANKS       KKCO04            3            WKCOYNO
     C                   MOVE      *BLANKS       KKPO05           10            WKPORD
     C                   MOVE      *ZEROS        KKLI06            5 0          WKLINE
     C                   MOVE      *BLANKS       KKCO05            3            WKCOYNO
     C                   MOVE      *BLANKS       KKPO06           10            WKPORD
     C                   MOVE      *ZEROS        KKLI07            5 0          WKLINE
     C                   MOVE      *BLANKS       RN0120           99
     C                   MOVE      *ZEROS        VALIDF            1 0          Flag for validation
     C                   MOVE      *ZEROS        LISTF             1 0          List of value flag
     C                   MOVE      *BLANKS       RN0121           99
     C                   MOVE      *BLANKS       CMDERR            1
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        RSLT02            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *BLANKS       APPSET           10
     C                   MOVE      'D'           APPTYP            1
     C                   MOVE      *BLANKS       APPSCR           10
     C                   MOVE      *ZEROS        APPROW            3 0
     C                   MOVE      *ZEROS        APPCOL            3 0
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   MOVEL     A1(1)         WSOS07                         Set up default value
     C                   MOVEL     'LANDIPS'     APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   Z-ADD     1             XRN01
     C                   Z-ADD     1             XRN02
     C                   Z-ADD     *ZEROS        X0                4 0          INDEX 0
     C                   Z-ADD     *ZEROS        X1                3 0          INDEX 1
     C                   Z-ADD     *ZEROS        SP                3 0          Stk ptr
     C                   Z-ADD     *ZEROS        CT                3 0          Counter
     C                   Z-ADD     *ZEROS        SRN01             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN01             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN01             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        DAS002            5 0
     C                   Z-ADD     *ZEROS        DAS001            5 0
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN         0030
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ         0030
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS
     C                   Z-ADD     *ZEROS        SWSKPR            1 0                        SKIPRE
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS06             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS07             5 0          SV STS
     C                   Z-ADD     *ZEROS        SRN02             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN02             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN02             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
     C                   Z-ADD     *ZEROS        RN0119           30 9
     C                   Z-ADD     *ZEROS        WRRN02            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ02            3 0          WRK ADJ
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     1             C3                5 0          *CST INDEX
     C                   Z-ADD     1             CALLST            1 0          CALL STSEX
     C                   Z-ADD     *ZEROS        XNO               1 0          *NO keyword
     C                   Z-ADD     *ZEROS        LEN              15 5
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C                   MOVE      '0'           *IN60
     C*
     C     *DTAARA       DEFINE    COMPNUMB      @DS001
     C     *DTAARA       DEFINE    KDPKEY3       @DS002
     C/EJECT
     C********************************************************************
     C*        M a i n l i n e      R o u t i n e
     C********************************************************************
     C                   EXSR      SMAIN
     C*
     C/EJECT
     C*****************************************************************
     C* SMAIN - Main flow of the program.
     C*****************************************************************
     C     SMAIN         BEGSR
     C*
     C*
     C* Clear Message Subfile.
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C*      *------------------------------------------*
     C*      *  Process all screens.                    *
     C*      *------------------------------------------*
     C                   MOVEL     'SCR001'      SCRNID
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SCR001'      S001
     C     SCRNID        CASEQ     'SCR002'      S002
     C     SCRNID        CASEQ     'SCR003'      S003
     C     SCRNID        CASEQ     'SETSPEC'     S004
     C     SCRNID        CASEQ     'SCRCANC'     S005
     C     SCRNID        CASEQ     'SEND'        SEND
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SEND - END of program.
     C*****************************************************************
     C     SEND          BEGSR
     C*
     C     LRFLAG        IFEQ      'Y'
     C     LRFLAG        OREQ      *BLANK
     C                   MOVE      '1'           *INLR
     C                   END                                                    LRFLAG EQ 'Y'
     C                   MOVE      *BLANK        SCRNID
     C                   RETURN
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* S001 - Initial list panel
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0010'        *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* WK0601 = *ymd
     C                   Z-ADD     XYMD          WK0601
     C* PGO = ' '
     C                   MOVEL     *BLANKS       PGO
     C* GETDTAA KDPKEY3
     C                   IN        @DS002                               93
     C                   Z-ADD     0             DAS002
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS002
     C                   END
     C* CALL 'MITMKV',pgo,KDPKEY,wk0601
     C                   Z-ADD     1             CALLST
     C                   CALL      'MITMKV'      P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF pgo <> '@@*'
     C     PGO           IFNE      '@@*'
     C* SIGNOFF                                                       *
     C                   MOVEA     *BLANKS       CST
     C                   MOVEA     'SIGNOFF '    CST
     C                   EXSR      SCMD
     C* END                                                           *
     C                   END
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C*                                                               *
     C* GETDTAA COMPNUMB
     C                   IN        @DS001                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* CLRSCR SCR001
     C*
     C                   EXSR      S006
     C* GETREC d.company,*eq,COYNO#
     C*
     C                   EXSR      S008
     C* SYDFMT = CYDFMT
     C                   MOVE      WYDFMT        RN0009
     C* SYDSEP = CYDSEP
     C                   MOVE      WYDSEP        RN0010
     C* SVDESC = cydesc
     C                   MOVE      XYDESC        SVDESC
     C* GETREC d.imscpyd,f.imscpyd,*eq,COYNO#
     C*
     C                   EXSR      S009
     C* Set Key values to parms passed
     C* SVK001 = COYNO#
     C                   MOVE      COYNO#        SVK001
     C* SVK002 = ' '
     C                   MOVEL     *BLANKS       SVK002
     C*                                                               *
     C* Set Reposition values to parms passed
     C* POS001 = COYNO#
     C                   MOVE      COYNO#        POS001
     C* POS002 = ' '
     C                   MOVEL     *BLANKS       POS002
     C*                                                               *
     C* SETLL D.PORDH,F.PORDH,SVK001,SVK002
     C*
     C                   EXSR      S010
     C* *** REad first set of Purchase orders
     C* FLDATR action,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORDH,F.PORDH,*NE,SVK001
     C*
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR001S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN01
     C*
     C                   Z-ADD     1             XRN01                          Init Next RRN
     C                   Z-ADD     XRN01         SRN01
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS01
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDH
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        RN0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0044
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0042
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     K0005         READE(N)  PORDH                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0012                         Company number
     C                   MOVEL     *BLANK        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*                                                               *
     C* IF PHOS04 ='Y' *or PHOS08 = 'Y'
     C     WHOS04        IFEQ      'Y'
     C     WHOS08        OREQ      'Y'
     C* SKIPREC                                                       *
     C                   Z-ADD     1             SWSKPR
     C* ELSE                                                          *
     C                   ELSE
     C* FLDATR action,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN01
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   Z-ADD     *ZEROS        RN0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0044
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0042
     C                   MOVEA     INS01         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR001S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     INS01         *IN
     C                   END
     C     RRN01         IFGT      SRN01
     C                   Z-ADD     SRN01         RRN01
     C                   END
     C                   EXSR      S011                                         CHK EOF
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN63
     C                   MOVE      '1'           *IN65
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   WRITE     SCR001
     C* Turn off SFLDSP in case of empty subfile
     C     RRN01         IFLT      1
     C                   MOVE      '0'           *IN64
     C                   ELSE
     C                   MOVE      '1'           *IN64
     C                   END
     C     ERN01         IFEQ      1
     C                   MOVE      '1'           *IN67
     C                   ELSE
     C                   MOVE      '0'           *IN67
     C                   END
     C                   Z-ADD     RRN01         DRN01
     C                   EXFMT     SCR001C1
     C     SFLRRN        IFGT      0
     C     DRN01         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN01
     C                   Z-ADD     SFLRRN        DRN01
     C                   END
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '1'           *IN(80)
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Exit program on function key 3
     C*                                                               *
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Backward
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*                                                               *
     C* DOBLK D.PORDH
     C*
     C                   Z-ADD     RRN01         SRN01                          Save RRN
     C                   Z-ADD     1             RRN01                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS01
     C     SRN01         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR001S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C* IF ACTION=5
     C     RN0001        IFEQ      5
     C* MODE = ACTION
     C                   Z-ADD     RN0001        MODE
     C* EXSCR SCR002
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* ACTION = 0
     C                   Z-ADD     *ZERO         RN0001
     C* ELSE                                                          *
     C                   ELSE
     C* IF ACTION<>0
     C     RN0001        IFNE      *ZERO
     C* DSPERR ACTION,'Action must be 5'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN01         RRN01
     C                   MOVEA     INS01         *IN
     C*
     C*
     C*                                                               *
     C* FLDATR action,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORDH,F.PORDH,*PV,SVK001
     C*
     C                   EXSR      S012
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR001S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN01
     C*
     C                   Z-ADD     1             XRN01                          Init Next RRN
     C                   Z-ADD     XRN01         SRN01
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS01
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDH
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        RN0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0044
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0042
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     K0005         READE(N)  PORDH                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0012                         Company number
     C                   MOVEL     *BLANK        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C*                                                               *
     C* IF PHOS04 ='Y' *or PHOS08 = 'Y'
     C     WHOS04        IFEQ      'Y'
     C     WHOS08        OREQ      'Y'
     C* SKIPREC                                                       *
     C                   Z-ADD     1             SWSKPR
     C* ELSE                                                          *
     C                   ELSE
     C* FLDATR action,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN01
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   Z-ADD     *ZEROS        RN0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0044
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0042
     C                   MOVEA     INS01         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR001S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     INS01         *IN
     C                   END
     C     RRN01         IFGT      SRN01
     C                   Z-ADD     SRN01         RRN01
     C                   END
     C                   EXSR      S011                                         RESET FP
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Forward
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C*                                                               *
     C* DOBLK D.PORDH
     C*
     C                   Z-ADD     RRN01         SRN01                          Save RRN
     C                   Z-ADD     1             RRN01                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS01
     C     SRN01         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR001S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C* IF ACTION=5
     C     RN0001        IFEQ      5
     C* MODE = ACTION
     C                   Z-ADD     RN0001        MODE
     C* EXSCR SCR002
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* ACTION = 0
     C                   Z-ADD     *ZERO         RN0001
     C* ELSE                                                          *
     C                   ELSE
     C* IF ACTION<>0
     C     RN0001        IFNE      *ZERO
     C* DSPERR ACTION,'Action must be 5'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN01         RRN01
     C                   MOVEA     INS01         *IN
     C*
     C*
     C*                                                               *
     C* COUNT = 0
     C                   Z-ADD     *ZERO         COUNT
     C* FLDATR action,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORDH,F.PORDH,*NE,SVK001
     C*
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR001S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN01
     C*
     C                   Z-ADD     1             XRN01                          Init Next RRN
     C                   Z-ADD     XRN01         SRN01
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS01
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDH
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        RN0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0044
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0042
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     K0005         READE(N)  PORDH                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0012                         Company number
     C                   MOVEL     *BLANK        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* IF PHOS04 ='Y' *or PHOS08 = 'Y'
     C     WHOS04        IFEQ      'Y'
     C     WHOS08        OREQ      'Y'
     C* SKIPREC                                                       *
     C                   Z-ADD     1             SWSKPR
     C* ELSE                                                          *
     C                   ELSE
     C* COUNT = count + 1
     C     COUNT         ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        COUNT
     C* FLDATR action,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN01
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   Z-ADD     *ZEROS        RN0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0044
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0042
     C                   MOVEA     INS01         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR001S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     INS01         *IN
     C                   END
     C     RRN01         IFGT      SRN01
     C                   Z-ADD     SRN01         RRN01
     C                   END
     C                   EXSR      S011                                         RESET FP
     C*                                                               *
     C* IF count = 0
     C     COUNT         IFEQ      *ZERO
     C* FLDATR action,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORDH,F.PORDH,*pv,SVK001
     C*
     C                   EXSR      S012
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR001S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN01
     C*
     C                   Z-ADD     1             XRN01                          Init Next RRN
     C                   Z-ADD     XRN01         SRN01
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS01
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDH
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        RN0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0044
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0042
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     K0005         READE(N)  PORDH                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0012                         Company number
     C                   MOVEL     *BLANK        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C*                                                               *
     C* IF PHOS04 ='Y' *or PHOS08 = 'Y'
     C     WHOS04        IFEQ      'Y'
     C     WHOS08        OREQ      'Y'
     C* SKIPREC                                                       *
     C                   Z-ADD     1             SWSKPR
     C* ELSE                                                          *
     C                   ELSE
     C* FLDATR action,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN01
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   Z-ADD     *ZEROS        RN0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0044
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0042
     C                   MOVEA     INS01         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR001S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     INS01         *IN
     C                   END
     C     RRN01         IFGT      SRN01
     C                   Z-ADD     SRN01         RRN01
     C                   END
     C                   EXSR      S011                                         RESET FP
     C* END                                                           *
     C                   END
     C*                                                               *
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Check for any selected records on post-enter.
     C* Reset reposition flag and update flag
     C* POSFLG = 0
     C                   Z-ADD     *ZERO         POSFLG
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C*                                                               *
     C* DOBLK D.PORDH
     C*
     C                   Z-ADD     RRN01         SRN01                          Save RRN
     C                   Z-ADD     1             RRN01                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS01
     C     SRN01         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR001S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C* IF ACTION=5
     C     RN0001        IFEQ      5
     C* MODE = ACTION
     C                   Z-ADD     RN0001        MODE
     C* EXSCR SCR002
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* ACTION = 0
     C                   Z-ADD     *ZERO         RN0001
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* ELSE                                                          *
     C                   ELSE
     C* IF ACTION<>0
     C     RN0001        IFNE      *ZERO
     C* DSPERR ACTION,'Action must be 5'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN01         RRN01
     C                   MOVEA     INS01         *IN
     C*
     C*
     C* *** Check for reposition
     C* IF (POS002<>' ')
     C     POS002        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* END                                                           *
     C                   END
     C* If reposition values entered, set key
     C* values to reposition values.
     C* IF POSFLG=1
     C     POSFLG        IFEQ      1
     C* SVK001 = POS001
     C                   MOVE      POS001        SVK001
     C* SVK002 = POS002
     C                   MOVE      POS002        SVK002
     C* END                                                           *
     C                   END
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.PORDH,F.PORDH,SVK001,SVK002
     C*
     C                   EXSR      S010
     C*                                                               *
     C* FLDATR action,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORDH,F.PORDH,*NE,SVK001
     C*
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR001S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN01
     C*
     C                   Z-ADD     1             XRN01                          Init Next RRN
     C                   Z-ADD     XRN01         SRN01
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS01
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDH
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        RN0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0044
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0042
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     K0005         READE(N)  PORDH                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0012                         Company number
     C                   MOVEL     *BLANK        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*                                                               *
     C* IF PHOS04 = 'Y' *or PHOS08 = 'Y'
     C     WHOS04        IFEQ      'Y'
     C     WHOS08        OREQ      'Y'
     C* SKIPREC                                                       *
     C                   Z-ADD     1             SWSKPR
     C* ELSE                                                          *
     C                   ELSE
     C* FLDATR action,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'RN0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN01
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   Z-ADD     *ZEROS        RN0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0044
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0042
     C                   MOVEA     INS01         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR001S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     INS01         *IN
     C                   END
     C     RRN01         IFGT      SRN01
     C                   Z-ADD     SRN01         RRN01
     C                   END
     C                   EXSR      S011                                         RESET FP
     C*                                                               *
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00199        ENDSR
     C/EJECT
     C*****************************************************************
     C* S002 - Display all details for header
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0010'        *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C*                                                               *
     C* SVK001 = PHCOYNO
     C                   MOVE      WK0028        SVK001
     C* SVK002 = PHPORD
     C                   MOVE      XHPORD        SVK002
     C* CLRSCR SCR002
     C*
     C                   EXSR      S014
     C* PHCOYNO = SVK001
     C                   MOVE      SVK001        WK0028
     C* PHPORD = SVK002
     C                   MOVE      SVK002        XHPORD
     C* CYDESC = svdesc
     C                   MOVE      SVDESC        XYDESC
     C* Get selected record for display function.
     C* GETREC D.PORDH,F.PORDH,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S015
     C* If record locked, Display lock message
     C* from OS/400 and return.
     C* IF %lock(D.PORDh,F.PORDh)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK02         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.PORDH,F.PORDH)=*no
     C*  Status of last file I/O
     C     STS02         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Display'
     C                   MOVEL     C0002         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C* ***  reverse date
     C* SYDATI = phdlvdt
     C                   Z-ADD     WK0030        RN0007
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0008
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0008        RN0012
     C*                                                               *
     C* *** if fully received output error
     C* IF phos08 = 'Y'
     C     WHOS08        IFEQ      'Y'
     C* DSPERR *NONE,'USR2011','ERRORS',*LIBL
     C                   MOVEL     'USR2093'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
     C                   END
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   EXFMT     SCR002
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Fully Recd
     C*
     C     *INKH         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Fully received requested
     C* MTLOCN = 'N'
     C                   MOVE      'N'           MTLOCN
     C* SETLL d.pordd,f.pordd,COYNO#,phpord
     C*
     C                   EXSR      S016
     C* DOU %sts(d.pordd,f.pordd)=*no
     C     RSLT01        DOUEQ     1
     C* GETREC d.pordd,*ne,COYNO#,phpord
     C*
     C                   EXSR      S017
     C* IF %sts(d.pordd,f.pordd)=*yes
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C* WKQRCVD = poqord - poqrcvd
     C     XOQORD        SUB       WK0022        NRSLT0
     C                   Z-ADD     NRSLT0        WK0082
     C* IF wkqrcvd > 0
     C     WK0082        IFGT      *ZERO
     C* WKCOYNO = pocoyno
     C                   MOVE      WK0017        WK0076
     C* WKPORD = popord
     C                   MOVE      WOPORD        WK0080
     C* WKITEM = poitem
     C                   MOVE      XOITEM        WK0077
     C* WKLINE = poseq
     C                   Z-ADD     XOSEQ         WK0078
     C* WKPRICE = POPRICE
     C                   Z-ADD     WK0021        WK0081
     C* WKWHSE = POWHSE
     C                   MOVE      XOWHSE        WK0084
     C* SETLL D.WLOCITM1,F.WLOCITM1,POCOYNO,POWHSE,POITEM
     C*
     C                   EXSR      S019
     C* GETREC D.WLOCITM1,F.WLOCITM1,*NE,POCOYNO,POWHSE,POITEM
     C*
     C                   EXSR      S020
     C* IF %STS(D.WLOCITM1,F.WLOCITM1)=*YES
     C*  Status of last file I/O
     C     STS07         IFEQ      *ZERO
     C* WKLOCN = wilocn
     C                   MOVE      WK0065        WK0079
     C* ELSE                                                          *
     C                   ELSE
     C* MTLOCN = 'Y'
     C                   MOVE      'Y'           MTLOCN
     C* END                                                           *
     C                   END
     C* WRITE d.wrkpord,f.wrkpord
     C*
     C                   EXSR      S022
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XNO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* *** Display details screen
     C* UPDATE = 'N'
     C                   MOVE      'N'           UPDATE
     C* EXSCR scr003
     C                   ADD       1             SP
     C                   MOVEL     'SCR002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C*                                                               *
     C* IF update = 'Y'  *and F12 = 'N'
     C     UPDATE        IFEQ      'Y'
     C     F12           ANDEQ     'N'
     C* IF phos08 = 'Y'
     C     WHOS08        IFEQ      'Y'
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* PHCMPDT = ##DATE
     C                   Z-ADD     ##DATE        WK0026
     C* END                                                           *
     C                   END
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* PHLRCVDT = ##DATE
     C                   Z-ADD     ##DATE        WK0032
     C* PHOS03 = 'N'
     C                   MOVE      'N'           WHOS03
     C* PHOS05 = 'Y'
     C                   MOVE      'Y'           WHOS05
     C* PHOS07 = wsos07
     C                   MOVE      WSOS07        WHOS07
     C* PHOS09 = wsos09
     C                   MOVE      WSOS09        WHOS09
     C* UPDATE d.pordh,f.pordh
     C*
     C                   EXSR      S023
     C*                                                               *
     C* END ; end UPDATE
     C                   END
     C* *** Return to list of pords
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Messages
     C*
     C     *INKJ         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* ***  Update header text details
     C*                                                               *
     C* DT1550 = 0
     C                   Z-ADD     *ZERO         DT1550
     C* CALL 'MIPSTXTHC',phpord,dt1550
     C                   Z-ADD     1             CALLST
     C                   CALL      C0003         P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Prev Panel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to list panel on function key 12
     C* RLSREC D.PORDH,F.PORDH
     C*
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   UNLOCK    PORDH                                91      RLS LCK PORDH
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Output details for purchase order     y 14
     C* SVSNAME = phsname
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     WK0042        RN0005
     C* UPDATE = 'N'
     C                   MOVE      'N'           UPDATE
     C* EXSCR SCR003
     C                   ADD       1             SP
     C                   MOVEL     'SCR002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* IF update = 'Y'
     C     UPDATE        IFEQ      'Y'
     C* IF phos08 = 'Y'
     C     WHOS08        IFEQ      'Y'
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* PHCMPDT = ##DATE
     C                   Z-ADD     ##DATE        WK0026
     C* END                                                           *
     C                   END
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* PHLRCVDT = ##DATE
     C                   Z-ADD     ##DATE        WK0032
     C* PHOS03 = 'N'
     C                   MOVE      'N'           WHOS03
     C* PHOS05 = 'Y'
     C                   MOVE      'Y'           WHOS05
     C* PHOS07 = wsos07
     C                   MOVE      WSOS07        WHOS07
     C* PHOS09 = wsos09
     C                   MOVE      WSOS09        WHOS09
     C* UPDATE d.pordh,f.pordh
     C*
     C                   EXSR      S023
     C* END                                                           *
     C                   END
     C* *** return to rolling screen
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 - Display order details
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0010'        *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* SVPORD = phpord
     C                   MOVE      *BLANKS       SVPORD
     C                   MOVEL     XHPORD        SVPORD
     C* CLRSCR SCR003
     C*
     C                   EXSR      S024
     C* CYDESC = svdesc
     C                   MOVE      SVDESC        XYDESC
     C* PHPORD = svpord
     C                   MOVE      *BLANKS       XHPORD
     C                   MOVEL     SVPORD        XHPORD
     C*                                                               *
     C* Set Key values to parms passed
     C* SVPOSEQ = 0
     C                   Z-ADD     *ZERO         RN0004
     C* POSPOSEQ = 0
     C                   Z-ADD     *ZERO         RN0003
     C*                                                               *
     C* SETLL D.PORDD,F.PORDD,COYNO#,phpord,SVposeq
     C*
     C                   EXSR      S026
     C*                                                               *
     C* EXSUBR sc3fwd
     C                   EXSR      SC3FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN63
     C                   MOVE      '1'           *IN65
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   WRITE     SCR003
     C* Turn off SFLDSP in case of empty subfile
     C     RRN02         IFLT      1
     C                   MOVE      '0'           *IN64
     C                   ELSE
     C                   MOVE      '1'           *IN64
     C                   END
     C     ERN02         IFEQ      1
     C                   MOVE      '1'           *IN67
     C                   ELSE
     C                   MOVE      '0'           *IN67
     C                   END
     C                   Z-ADD     RRN02         DRN02
     C                   EXFMT     SCR003C1
     C     SFLRRN        IFGT      0
     C     DRN02         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN02
     C                   Z-ADD     SFLRRN        DRN02
     C                   END
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '1'           *IN(80)
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Exit program on function key 3
     C*                                                               *
     C* EXSCR SCrcanc
     C                   ADD       1             SP
     C                   MOVEL     'SCR003  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN03
     C                   EXSR      S005
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C* IF exflag = 1
     C     EXFLAG        IFEQ      1
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Accept
     C*
     C     *INKN         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** accept all update
     C* F12 = 'N'
     C                   MOVE      'N'           F12
     C* EXSCR setspec
     C                   ADD       1             SP
     C                   MOVEL     'SCR003  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN03
     C                   EXSR      S004
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C*                                                               *
     C* IF f12 = 'N'
     C     F12           IFEQ      'N'
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Backward
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*                                                               *
     C* EXSUBR sc3edt
     C                   EXSR      SC3EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C*                                                               *
     C* EXSUBR sc3bkw
     C                   EXSR      SC3BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Forward
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C*                                                               *
     C* EXSUBR sc3edt
     C                   EXSR      SC3EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C*                                                               *
     C* EXSUBR sc3fwd
     C                   EXSR      SC3FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Check for any selected records on post-enter.
     C*                                                               *
     C* Reset reposition flag and update flag
     C* POSFLG = 0
     C                   Z-ADD     *ZERO         POSFLG
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C*                                                               *
     C* EXSUBR sc3edt
     C                   EXSR      SC3EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C* *** Check for reposition
     C* IF (POSposeq<>0)
     C     RN0003        IFNE      *ZERO
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVPOSEQ = POSposeq
     C                   Z-ADD     RN0003        RN0004
     C* END                                                           *
     C                   END
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.PORDD,F.PORDD,COYNO#,phpord,SVposeq
     C*
     C                   EXSR      S026
     C*                                                               *
     C* EXSUBR sc3fwd
     C                   EXSR      SC3FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00399        ENDSR
     C/EJECT
     C*****************************************************************
     C* S004 - Update all receipts
     C*****************************************************************
     C     S004          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '01'          *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C* WSOS07 = phos07
     C                   MOVE      WHOS07        WSOS07
     C* WSOS09 = phos09
     C                   MOVE      WHOS09        WSOS09
     C* GRINVNUM = ' '
     C                   MOVEL     *BLANKS       WK0006
     C* GRRECBY = ' '
     C                   MOVEL     *BLANKS       WK0011
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   EXFMT     SCR004
     C                   MOVEA     '01'          *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* F12 = 'Y'
     C                   MOVE      'Y'           F12
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S004V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C* *** accept all update
     C* *** Find next GRN number
     C* GETREC D.IPSCPYD,*EQ,COYNO#
     C*
     C                   EXSR      S027
     C* CDAUDGR = cdaudgr + 1
     C     WK0015        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        WK0015
     C* UPDATE d.ipscpyd,f.ipscpyd
     C*
     C                   EXSR      S028
     C* Read all work file records
     C* SETLL d.wrkpord,f.wrkpord,COYNO#,phpord
     C*
     C                   EXSR      S029
     C* GETREC d.wrkpord,*ne,COYNO#,phpord
     C*
     C                   EXSR      S030
     C* DOW %sts(d.wrkpord,f.wrkpord)=*yes
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* *** Update purchase order line
     C* GETREC d.pordd,*eq,COYNO#,wkpord,wkline
     C*
     C                   EXSR      S032
     C* GRQORD = poqord - poqrcvd
     C     XOQORD        SUB       WK0022        NRSLT0
     C                   Z-ADD     NRSLT0        WRQORD
     C*                                                               *
     C* IF grqord < 0
     C     WRQORD        IFLT      *ZERO
     C* GRQORD = 0
     C                   Z-ADD     *ZERO         WRQORD
     C* END                                                           *
     C                   END
     C* POQRCVD = poqrcvd + wkqrcvd
     C     WK0022        ADD       WK0082        NRSLT0
     C                   Z-ADD     NRSLT0        WK0022
     C* POQRCYC = poqrcyc + wkqrcvd
     C     WK0023        ADD       WK0082        NRSLT0
     C                   Z-ADD     NRSLT0        WK0023
     C* UPDATE d.pordd,f.pordd
     C*
     C                   EXSR      S033
     C* *** ADD TO GRN HISTORY FILE
     C* GRCOYNO = pocoyno
     C                   MOVE      WK0017        WK0002
     C* GRRCAUD = cdaudgr
     C                   Z-ADD     WK0015        WK0010
     C* GRPORD = popord
     C                   MOVE      WOPORD        WRPORD
     C* GRSEQ poseq
     C* GRSEQ = wkline
     C                   Z-ADD     WK0078        WRSEQ
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C* GRDLVDT = ##DATE
     C                   Z-ADD     ##DATE        WK0003
     C* GRREQ = podlvdt
     C                   Z-ADD     WK0018        WRREQ
     C* GRITEM = poitem
     C                   MOVE      XOITEM        WRITEM
     C* GRIDESC = poidesc
     C                   MOVE      WK0019        WK0005
     C*                                                               *
     C* IF wkprice = 0
     C     WK0081        IFEQ      *ZERO
     C* GRPRICE = poprice
     C                   Z-ADD     WK0021        WK0008
     C* ELSE                                                          *
     C                   ELSE
     C* GRPRICE = wkprice
     C                   Z-ADD     WK0081        WK0008
     C* END                                                           *
     C                   END
     C*                                                               *
     C* GRQRCYC = wkqrcvd
     C                   Z-ADD     WK0082        WK0009
     C* GRNLALL = ponlall
     C                   MOVE      WK0020        WK0007
     C* IF wkwhse = ' '
     C     WK0084        IFEQ      *BLANKS
     C* GRWHSE = powhse
     C                   MOVE      XOWHSE        WRWHSE
     C* ELSE                                                          *
     C                   ELSE
     C* GRWHSE = wkwhse
     C                   MOVE      WK0084        WRWHSE
     C* END                                                           *
     C                   END
     C* GRUOM = pouom
     C                   MOVE      WOUOM         WRUOM
     C* GRCONV = poconv
     C                   Z-ADD     WOCONV        WRCONV
     C* GRCCDE = poccde
     C                   MOVE      WOCCDE        WRCCDE
     C* GRPCDE = popcde
     C                   MOVE      WOPCDE        WRPCDE
     C* GRSUPPN = PHSUPPN
     C                   MOVE      WK0044        WK0013
     C* GRBRNBR = phbrnbr
     C                   MOVE      WK0024        WK0001
     C* GRWNAME = phwname
     C                   MOVE      WK0051        WK0014
     C* GRGRNPR = 'N'
     C                   MOVE      'N'           WK0004
     C* GRRECPR = 'N'
     C                   MOVE      'N'           WK0012
     C* WRITE d.grnhis,f.grnhis
     C*
     C                   EXSR      S034
     C*                                                               *
     C*                                                               *
     C* *** Get the IMS company record
     C*                                                               *
     C* GETREC D.IMSCPYD,*EQ,COYNO#
     C*
     C                   EXSR      S009
     C* IF %STS(d.IMSCPYD,f.IMSCPYd)=*yes
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C*                                                               *
     C* *** Only do the stock updates if CDIMS = Y
     C* IF cdims='Y'
     C     WDIMS         IFEQ      'Y'
     C* ***                                                           *
     C* *** Get the Transaction type details
     C*                                                               *
     C* GETREC D.IMSTRN,F.IMSTRN,*EQ,COYNO#,CDTRNR
     C*
     C                   EXSR      S035
     C* IF %STS(D.IMSTRN,F.IMSTRN)=*no
     C*  Status of last file I/O
     C     STS05         IFNE      *ZERO
     C* TTONHC = ' '
     C                   MOVE      *BLANKS       WTONHC
     C* TTUPDC = ' '
     C                   MOVE      *BLANKS       WTUPDC
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Add Stock Movement.
     C* STCOYNO = POCOYNO
     C                   MOVE      WK0017        WK0053
     C* STWHSE = POWHSE
     C                   MOVE      XOWHSE        WK0055
     C* STITEM = POITEM
     C                   MOVE      XOITEM        WK0054
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C* STDTAC = ##DATE
     C                   Z-ADD     ##DATE        WTDTAC
     C* STDTTR = PODLVDT
     C                   Z-ADD     WK0018        WTDTTR
     C* STTQTY = WKQRCVD
     C                   Z-ADD     WK0082        WTTQTY
     C* STTREF = %BCT('P/o.',POPORD,1)
     C*  Concatenate with blanks inserted
     C                   Z-ADD     1             C1
     C                   MOVE      *BLANKS       AARG1
     C                   MOVEL     'P/o.'        AARG1
     C     AARG1         CAT(P)    WOPORD:C1     ARSLT0
     C                   MOVE      *BLANKS       WTTREF
     C                   MOVEL     ARSLT0        WTTREF
     C* STTTYP = cdtrnr
     C                   MOVE      WDTRNR        WTTTYP
     C*                                                               *
     C* IF WKPRICE = 0
     C     WK0081        IFEQ      *ZERO
     C* STUCST = POPRICE
     C                   Z-ADD     WK0021        WTUCST
     C* ELSE                                                          *
     C                   ELSE
     C* STUCST = WKPRICE
     C                   Z-ADD     WK0081        WTUCST
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Missing Fields Added KP 17/05/02
     C* STLOCN = wklocn
     C                   MOVE      WK0079        WTLOCN
     C* STDTTR = ##date
     C                   Z-ADD     ##DATE        WTDTTR
     C*                                                               *
     C* WRITE D.STOKMOV,F.STOKMOV
     C*
     C                   EXSR      S036
     C* ==========                                                    *
     C* *** Update warehouse details file
     C* IF WKPRICE = 0
     C     WK0081        IFEQ      *ZERO
     C* DTPRICE = POPRICE       ; set the price accordingly
     C                   Z-ADD     WK0021        RN0002
     C* ELSE                                                          *
     C                   ELSE
     C* DTPRICE = WKPRICE
     C                   Z-ADD     WK0081        RN0002
     C* END                                                           *
     C                   END
     C* GETREC d.waredet,*eq,pocoyno,powhse,poitem
     C*
     C                   EXSR      S037
     C* IF %sts(d.waredet,f.waredet)=*yes
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C* DTPRICE = wkprice
     C                   Z-ADD     WK0081        RN0002
     C* GETREC d.suplier,f.suplier,*eq,COYNO#,phsuppn,phbrnbr
     C*
     C                   EXSR      S038
     C* IF %sts(d.suplier,f.suplier)=*yes&sucurr<>' '
     C*  Status of last file I/O
     C     STS13         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     WUCURR        IFNE      *BLANKS
     C                   Z-ADD     1             RN0119
     C                   ELSE
     C                   Z-ADD     0             RN0119
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0119        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* GETREC d.suplier,f.ccycod,*eq,COYNO#,sucurr
     C*
     C                   EXSR      S039
     C* IF %sts(d.suplier,f.ccycod)=*yes
     C*  Status of last file I/O
     C     STS14         IFEQ      *ZERO
     C* DTPRICE = dtprice / ccexcr
     C     WCEXCR        IFEQ      *ZERO
     C                   MOVE      *HIVAL        RN0119
     C                   ELSE
     C     RN0002        DIV       WCEXCR        RN0119
     C                   END
     C                   Z-ADD     RN0119        RN0002
     C* IF ccexcc = 'M'
     C     WCEXCC        IFEQ      'M'
     C* DTPRICE = dtprice * ccexcr
     C     RN0002        MULT      WCEXCR        RN0119
     C                   Z-ADD     RN0119        RN0002
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Update stock by location
     C* GETREC D.WLOCITM1,F.WLOCITM1,*EQ,WKCOYNO,WKWHSE,WKITEM,WKLOCN
     C*
     C                   EXSR      S040
     C*                                                               *
     C* *** TTONHC = A - add to on hand
     C*                                                               *
     C* IF TTONHC='A'
     C     WTONHC        IFEQ      'A'
     C* WIQOH = wiqoh + wkqrcvd
     C     WK0066        ADD       WK0082        RN0119
     C                   Z-ADD     RN0119        WK0066
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** TTONHC = S - sub from on hand
     C*                                                               *
     C* IF TTONHC='S'
     C     WTONHC        IFEQ      'S'
     C* WIQOH = wiqoh - wkqrcvd
     C     WK0066        SUB       WK0082        RN0119
     C                   Z-ADD     RN0119        WK0066
     C* END                                                           *
     C                   END
     C*                                                               *
     C* UPDATE d.wlocitm1,f.wlocitm1
     C*
     C                   EXSR      S041
     C*                                                               *
     C* *** TTONHC = A - add to on hand
     C*                                                               *
     C* IF TTONHC='A'
     C     WTONHC        IFEQ      'A'
     C* WDQOH = wdqoh + wkqrcvd
     C     WK0060        ADD       WK0082        RN0119
     C                   Z-ADD     RN0119        WK0060
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** TTONHC = S - sub from on hand
     C*                                                               *
     C* IF TTONHC='S'
     C     WTONHC        IFEQ      'S'
     C* WDQOH = wdqoh - wkqrcvd
     C     WK0060        SUB       WK0082        RN0119
     C                   Z-ADD     RN0119        WK0060
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF TTUPDC='Y'
     C     WTUPDC        IFEQ      'Y'
     C* WK1521 = wdqoh * wducst
     C     WK0060        MULT      WK0062        RN0119
     C                   Z-ADD     RN0119        WK1521
     C* WK1522 = wkqrcvd * dtprice
     C     WK0082        MULT      RN0002        RN0119
     C                   Z-ADD     RN0119        WK1522
     C* WK1521 = wk1521 + wk1522
     C     WK1521        ADD       WK1522        RN0119
     C                   Z-ADD     RN0119        WK1521
     C*                                                               *
     C* *** UPDATE AVERAGE COST
     C*                                                               *
     C* WDUCST = wk1521 / wdqoh
     C     WK0060        IFEQ      *ZERO
     C                   MOVE      *HIVAL        RN0119
     C                   ELSE
     C     WK1521        DIV       WK0060        RN0119
     C                   END
     C                   Z-ADD     RN0119        WK0062
     C*                                                               *
     C* *** Update cost of last receipt
     C*                                                               *
     C* WDLCST = dtPRICE
     C                   Z-ADD     RN0002        WK0056
     C* END ;   >>>>  TTUPDC IF = 'Y'
     C                   END
     C*                                                               *
     C* *** Reduce On-order figure
     C*                                                               *
     C* WDQOO = wdqoo - wkqrcvd
     C     WK0061        SUB       WK0082        RN0119
     C                   Z-ADD     RN0119        WK0061
     C*                                                               *
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C* WDLRDT = ##DATE
     C                   Z-ADD     ##DATE        WK0057
     C* WDNORP = wdnorp + 1
     C     WK0058        ADD       1             RN0119
     C                   Z-ADD     RN0119        WK0058
     C* WDNORY = wdnory + 1
     C     WK0059        ADD       1             RN0119
     C                   Z-ADD     RN0119        WK0059
     C* UPDATE d.waredet,f.waredet
     C*
     C                   EXSR      S043
     C* *** Add/Update Transactions summary.
     C* GETREC D.WAREHED,F.WRITTYP,*EQ,POCOYNO,POWHSE,POITEM,CDTRNR
     C*
     C                   EXSR      S045
     C* WTTRPQ = wttrpq + wkqrcvd
     C     WK0071        ADD       WK0082        RN0119
     C                   Z-ADD     RN0119        WK0071
     C* WTTRYQ = wttryq + wkqrcvd
     C     WK0073        ADD       WK0082        RN0119
     C                   Z-ADD     RN0119        WK0073
     C* WK1523 = wkqrcvd * wkprice
     C     WK0082        MULT      WK0081        RN0119
     C                   Z-ADD     RN0119        WK1523
     C* WTTRPV = WTTRPV + wk1523
     C     WK0072        ADD       WK1523        RN0119
     C                   Z-ADD     RN0119        WK0072
     C* WTTRYV = WTTRyV + wk1523
     C     WK0074        ADD       WK1523        RN0119
     C                   Z-ADD     RN0119        WK0074
     C* IF %sts(d.warehed,f.writtyp)=*yes
     C*  Status of last file I/O
     C     STS15         IFEQ      *ZERO
     C* UPDATE D.WAREHED,F.WRITTYP
     C*
     C                   EXSR      S046
     C* ELSE                                                          *
     C                   ELSE
     C* WTCOYNO wkcoyno
     C* WTWHSE wkwhse
     C* WTITEM wkitem
     C* WTCOYNO = pocoyno
     C                   MOVE      WK0017        WK0068
     C* WTWHSE = powhse
     C                   MOVE      XOWHSE        WK0075
     C* WTITEM = poitem
     C                   MOVE      XOITEM        WK0069
     C* WTTRNC = cdtrnr
     C                   MOVE      WDTRNR        WK0070
     C* WRITE D.WAREHED,F.WRITTYP
     C*
     C                   EXSR      S047
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END ; CDIMS = 'Y'
     C                   END
     C* *** id order fully received
     C* PHOS08 = 'Y'
     C                   MOVE      'Y'           WHOS08
     C* SETLL d.pordd,f.pordd,COYNO#,phpord
     C*
     C                   EXSR      S016
     C* DOU %sts(d.pordd,f.pordd)=*no
     C     RSLT02        DOUEQ     1
     C* GETREC d.pordd,*ne,COYNO#,phpord
     C*
     C                   EXSR      S017
     C* *** Check line is fully received
     C* IF %sts(d.pordd,f.pordd)=*yes
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C* IF poqrcvd < poqord
     C     WK0022        IFLT      XOQORD
     C* PHOS08 = 'N'
     C                   MOVE      'N'           WHOS08
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             RN0119
     C                   ELSE
     C                   Z-ADD     0             RN0119
     C                   END
     C     RN0119        IFEQ      XNO
     C                   Z-ADD     1             RN0119
     C                   ELSE
     C                   Z-ADD     0             RN0119
     C                   END
     C                   Z-ADD     RN0119        RSLT02
     C                   END
     C*                                                               *
     C* END ; IMSCPYD exists
     C                   END
     C*                                                               *
     C* DELETE d.wrkpord,f.wrkpord
     C*
     C                   EXSR      S048
     C* GETREC d.wrkpord,*ne,COYNO#,phpord
     C*
     C                   EXSR      S030
     C* END ; DOU WRKPORD ='Y'
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C                   Z-ADD     1             RN0119
     C                   ELSE
     C                   Z-ADD     0             RN0119
     C                   END
     C     RN0119        IFEQ      XYES
     C                   Z-ADD     1             RN0119
     C                   ELSE
     C                   Z-ADD     0             RN0119
     C                   END
     C                   Z-ADD     RN0119        RSLT01
     C                   END
     C*                                                               *
     C*                                                               *
     C* *** Update order header
     C* UPDATE = 'Y'
     C                   MOVE      'Y'           UPDATE
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C                   END
     C                   END
     C                   END
     C     $00499        ENDSR
     C/EJECT
     C*****************************************************************
     C* S005 - Cancel all update
     C*****************************************************************
     C     S005          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '01'          *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C* CLRFLD exflag
     C*
     C                   Z-ADD     *ZERO         EXFLAG
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   EXFMT     SCR005
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Resume
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Edit for correct option
     C*                                                               *
     C* IF exflag=1
     C     EXFLAG        IFEQ      1
     C* *** remove all work file records
     C* SETLL d.wrkpord,f.wrkpord,COYNO#,phpord
     C*
     C                   EXSR      S029
     C* DOU %sts(d.wrkpord,f.wrkpord)=*no
     C     RSLT01        DOUEQ     1
     C* GETREC d.wrkpord,*ne,COYNO#,phpord
     C*
     C                   EXSR      S030
     C* IF %sts(d.wrkpord,f.wrkpord)=*yes
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C*                                                               *
     C* DELETE d.wrkpord,f.wrkpord
     C*
     C                   EXSR      S048
     C* END                                                           *
     C                   END
     C* END                                                           *
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C                   Z-ADD     1             RN0119
     C                   ELSE
     C                   Z-ADD     0             RN0119
     C                   END
     C     RN0119        IFEQ      XNO
     C                   Z-ADD     1             RN0119
     C                   ELSE
     C                   Z-ADD     0             RN0119
     C                   END
     C                   Z-ADD     RN0119        RSLT01
     C                   END
     C* release order
     C* RLSREC d.pordh,f.pordh
     C*
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   UNLOCK    PORDH                                91      RLS LCK PORDH
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF exflag=2
     C     EXFLAG        IFEQ      2
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C     $00599        ENDSR
     C/EJECT
     C*****************************************************************
     C* SREDSP -  Redisplay Windows within stack.
     C*****************************************************************
     C     SREDSP        BEGSR
     C*
     C                   Z-ADD     SP            CT
     C     CT            DOWGT     1
     C     STY(CT)       ANDNE     'F'
     C                   SUB       1             CT
     C                   END
     C*
     C*  Redisplay Windows within stack.
     C*
     C     CT            DOWLE     SP
     C     CT            ANDGT     0
     C*
     C     SID(CT)       IFEQ      'SCR001'
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR001
     C                   WRITE     SCR001C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SCR002'
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
     C                   ELSE
     C     SID(CT)       IFEQ      'SCR003'
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR003
     C                   WRITE     SCR003C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SETSPEC'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR004
     C                   ELSE
     C     SID(CT)       IFEQ      'SCRCANC'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR005
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C*
     C                   ADD       1             CT
     C                   END
     C*
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SC3BKW - Roll Backward
     C*****************************************************************
     C     SC3BKW        BEGSR
     C*
     C* *** Scroll information backwards
     C*                                                               *
     C* FLDATR act,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'ACT     '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORDD,F.PORDD,*PV,COYNO#,phpord
     C*
     C                   EXSR      S049
     C*
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     COYNO#        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     XHPORD        KOPO02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     6             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR003S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR003C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN02
     C*
     C                   Z-ADD     1             XRN02                          Init Next RRN
     C                   Z-ADD     XRN02         SRN02
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS02
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD06        DOUNE     'Y'                                          RD.SW.PORDD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        ACT
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   Z-ADD     *ZEROS        XOQORD
     C                   Z-ADD     *ZEROS        WK0022
     C                   Z-ADD     *ZEROS        RN0013
     C                   MOVEL     *BLANKS       WSMANF
     C                   MOVEL     *BLANKS       WK0019
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C     K0006         READE(N)  PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC06                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0011                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.PORDD
     C                   END
     C*
     C     SWRD06        IFEQ      'Y'                                          RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C*                                                               *
     C* WKQRCVD = 0
     C                   Z-ADD     *ZERO         WK0082
     C* GETREC D.WRKPORD,F.WRKPORD,*EQ,POCOYNO,POPORD,POSEQ
     C*
     C                   EXSR      S052
     C* WSRCDTT = wkqrcvd
     C                   Z-ADD     WK0082        RN0013
     C*                                                               *
     C* ITMANF = ' '
     C                   MOVEL     *BLANKS       ITMANF
     C* GETREC D.IPSITEM,F.IPSITEM,*EQ,POCOYNO,PHSUPPN,PHBRNBR,poitem
     C*
     C                   EXSR      S053
     C* WSMANF = PIITEM
     C                   MOVE      WK0016        WSMANF
     C*                                                               *
     C* FLDATR act,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'ACT     '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR003  '    FLDSCR
     C                   EXSR      SATRIB
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN02
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR003S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN02         NXTRRN
     C                   Z-ADD     *ZEROS        ACT
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   Z-ADD     *ZEROS        XOQORD
     C                   Z-ADD     *ZEROS        WK0022
     C                   Z-ADD     *ZEROS        RN0013
     C                   MOVEL     *BLANKS       WSMANF
     C                   MOVEL     *BLANKS       WK0019
     C                   MOVEA     INS02         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR003S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR003S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR003S1                             90
     C                   MOVEA     INS02         *IN
     C                   END
     C     RRN02         IFGT      SRN02
     C                   Z-ADD     SRN02         RRN02
     C                   END
     C                   EXSR      S051                                         CHK EOF
     C*
     C     $SC3BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* SC3EDT - Check record requested
     C*****************************************************************
     C     SC3EDT        BEGSR
     C*
     C* *** Check for any selected records on post-enter.
     C*                                                               *
     C* DOBLK D.PORDD
     C*
     C                   Z-ADD     RRN02         SRN02                          Save RRN
     C                   Z-ADD     1             RRN02                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS02
     C     SRN02         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR003S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C* IF ACT=2
     C     ACT           IFEQ      2
     C* SEQ155 = POSEQ
     C                   Z-ADD     XOSEQ         SEQ155
     C* CALL 'MPORLOCC',COYNO#,POPORD,seq155
     C                   Z-ADD     1             CALLST
     C                   CALL      'MPORLOCC'    P0003                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ACT = 0
     C                   Z-ADD     *ZERO         ACT
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* IF ACT<>0
     C     ACT           IFNE      *ZERO
     C* DSPERR ACT,'Action must be 2'
     C                   MOVEL     C0004         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'ACT     '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR003  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR003S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN02         RRN02
     C                   MOVEA     INS02         *IN
     C*
     C*
     C*
     C     $SC3ED        ENDSR
     C/EJECT
     C*****************************************************************
     C* SC3FWD - Roll forward
     C*****************************************************************
     C     SC3FWD        BEGSR
     C*
     C* *** Scroll information forwards
     C*                                                               *
     C* COUNT = 0
     C                   Z-ADD     *ZERO         COUNT
     C* FLDATR act,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'ACT     '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORDD,F.PORDD,*NE,COYNO#,phpord
     C*
     C*
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     COYNO#        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     XHPORD        KOPO02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     6             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR003S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR003C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN02
     C*
     C                   Z-ADD     1             XRN02                          Init Next RRN
     C                   Z-ADD     XRN02         SRN02
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS02
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD06        DOUNE     'Y'                                          RD.SW.PORDD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        ACT
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   Z-ADD     *ZEROS        XOQORD
     C                   Z-ADD     *ZEROS        WK0022
     C                   Z-ADD     *ZEROS        RN0013
     C                   MOVEL     *BLANKS       WSMANF
     C                   MOVEL     *BLANKS       WK0019
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C     K0006         READE(N)  PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC06                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0011                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.PORDD
     C                   END
     C*
     C     SWRD06        IFEQ      'Y'                                          RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*                                                               *
     C* WKQRCVD = 0
     C                   Z-ADD     *ZERO         WK0082
     C* WSRCDTT = 0
     C                   Z-ADD     *ZERO         RN0013
     C* SETLL D.WRKPORD,F.WRKPORD,POCOYNO,POPORD,POSEQ
     C*
     C                   EXSR      S054
     C* GETREC D.WRKPORD,F.WRKPORD,*ne,POCOYNO,POPORD,POSEQ
     C*
     C                   EXSR      S055
     C* DOW %sts(D.WRKPORD,F.WRKPORD)=*yes
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C                   Z-ADD     1             RN0119
     C                   ELSE
     C                   Z-ADD     0             RN0119
     C                   END
     C     RN0119        IFEQ      XYES
     C                   Z-ADD     1             RN0119
     C                   ELSE
     C                   Z-ADD     0             RN0119
     C                   END
     C                   Z-ADD     RN0119        RSLT01
     C     RSLT01        DOWEQ     1
     C* WSRCDTT = wsrcdtt + wkqrcvd
     C     RN0013        ADD       WK0082        RN0119
     C                   Z-ADD     RN0119        RN0013
     C* GETREC D.WRKPORD,F.WRKPORD,*ne,POCOYNO,POPORD,POSEQ
     C*
     C                   EXSR      S055
     C* END                                                           *
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C                   Z-ADD     1             RN0119
     C                   ELSE
     C                   Z-ADD     0             RN0119
     C                   END
     C     RN0119        IFEQ      XYES
     C                   Z-ADD     1             RN0119
     C                   ELSE
     C                   Z-ADD     0             RN0119
     C                   END
     C                   Z-ADD     RN0119        RSLT01
     C                   END
     C*                                                               *
     C* ITMANF = ' '
     C                   MOVEL     *BLANKS       ITMANF
     C* GETREC D.IPSITEM,F.IPSITEM,*EQ,POCOYNO,PHSUPPN,PHBRNBR,poitem
     C*
     C                   EXSR      S053
     C* WSMANF = PIITEM
     C                   MOVE      WK0016        WSMANF
     C*                                                               *
     C* COUNT = count + 1
     C     COUNT         ADD       1             RN0119
     C                   Z-ADD     RN0119        COUNT
     C* FLDATR act,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'ACT     '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR003  '    FLDSCR
     C                   EXSR      SATRIB
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN02
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR003S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN02         NXTRRN
     C                   Z-ADD     *ZEROS        ACT
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   Z-ADD     *ZEROS        XOQORD
     C                   Z-ADD     *ZEROS        WK0022
     C                   Z-ADD     *ZEROS        RN0013
     C                   MOVEL     *BLANKS       WSMANF
     C                   MOVEL     *BLANKS       WK0019
     C                   MOVEA     INS02         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR003S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR003S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR003S1                             90
     C                   MOVEA     INS02         *IN
     C                   END
     C     RRN02         IFGT      SRN02
     C                   Z-ADD     SRN02         RRN02
     C                   END
     C                   EXSR      S051                                         RESET FP
     C*                                                               *
     C* IF count = 0
     C     COUNT         IFEQ      *ZERO
     C* EXSUBR sc3bkw
     C                   EXSR      SC3BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $SC3FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $SC3FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* SYSDAT - System Date
     C*****************************************************************
     C     SYSDAT        BEGSR
     C*
     C* ##YEAR = %LJF(*YMD)
     C*  Left Justify field into result field
     C                   MOVEL     XYMD          ##YEAR
     C* IF ##YEAR > 39
     C     ##YEAR        IFGT      39
     C* ##DATE = 19000000 + *YMD
     C     19000000      ADD       XYMD          RN0119
     C                   Z-ADD     RN0119        ##DATE
     C* ELSE                                                          *
     C                   ELSE
     C* ##DATE = 20000000 + *YMD
     C     20000000      ADD       XYMD          RN0119
     C                   Z-ADD     RN0119        ##DATE
     C* END                                                           *
     C                   END
     C*
     C     $SYSDA        ENDSR
     C/EJECT
     C*****************************************************************
     C* SY0010 - Format Date
     C*****************************************************************
     C     SY0010        BEGSR
     C*
     C* *** INPUT PARAMETER = SYDATI - CYMD field 8N CMD
     C* ***                 = SYDSEP - date seperator
     C* ***                 = SYDFMT - date format
     C* ***                                                           *
     C* *** OUTPUT PARAMETER = SYDATO - Char date field 10A
     C* *** Split date components
     C*                                                               *
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0008
     C* ***                                                           *
     C* IF sydsep = ' '
     C     RN0010        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           RN0010
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYCCYY = %ljf(SYDATI) ; YEAR  4
     C*  Left Justify field into result field
     C                   MOVEL     RN0007        SYCCYY
     C* SYMMDD = %RJF(SYDATI) ; MMDD  4
     C*  Right Justify field into result field
     C                   MOVE      RN0007        SYMMDD
     C* SYMM = %ljf(SYMMDD) ; Month 2
     C*  Left Justify field into result field
     C                   MOVEL     SYMMDD        SYMM
     C* SYDD = %rjf(SYMMDD) ; Days  2
     C*  Right Justify field into result field
     C                   MOVE      SYMMDD        SYDD
     C*                                                               *
     C* *** Convert elements to Char
     C*                                                               *
     C* SYCCYYA = %CTC(SYCCYY)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0006
     C                   MOVEL     SYCCYY        RN0006
     C* SYMMDDA = %CTC(SYMMDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0011
     C                   MOVEL     SYMMDD        RN0011
     C* SYMMA = %CTC(SYMM)
     C*  Convert To Character
     C                   MOVE      *BLANK        SYMMA
     C                   MOVEL     SYMM          SYMMA
     C* SYDDA = %CTC(SYDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        SYDDA
     C                   MOVEL     SYDD          SYDDA
     C*                                                               *
     C* IF SYDFMT = '1'
     C     RN0009        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0008        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0010:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0008        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0010:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0009        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0008        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0010:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0008        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0010:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0007        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0008
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0007        RN0007
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0010        RN0010
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0009        RN0009
     C*
     C     $SY001        ENDSR
     C/EJECT
     C*****************************************************************
     C* SCMD - Processes OS/400 Commands
     C*****************************************************************
     C     SCMD          BEGSR
     C*
     C                   MOVE      'N'           CMDERR                         Error flag
     C                   Z-ADD     2560          LEN
     C                   MOVE      '1'           *IN79
     C* Validate command syntax
     C*
     C                   CALL      'QCMDCHK'                            92
     C                   PARM                    CST                            CMD string
     C                   PARM                    LEN                            Length
     C* Check command syntax failure
     C*
     C     *IN92         IFEQ      '1'
     C                   MOVE      'Y'           CMDERR
     C                   END
     C* Execute command
     C*
     C     CMDERR        IFEQ      'N'
     C                   CALL      'QCMDEXC'                            92
     C                   PARM                    CST
     C                   PARM                    LEN
     C* Check command failure
     C*
     C     *IN92         IFEQ      '1'
     C                   MOVE      'Y'           CMDERR
     C                   END
     C                   END
     C*
     C                   MOVEA     *BLANKS       CST
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMSG - calls message handling program to either clear, add, or
     C*        remove messages from message subfile or extracts
     C*        messages from message files.
     C*****************************************************************
     C     SMSG          BEGSR
     C*
     C* Add message to message subfile
     C*
     C     MSGACT        IFEQ      'A'
     C     MSGACT        OREQ      'R'
     C                   MOVE      'Y'           MSGFLG
     C                   ELSE
     C* Clear message subfile or extract message from message file.
     C*
     C     MSGACT        IFEQ      'C'
     C                   MOVE      'N'           MSGFLG
     C                   END
     C                   END
     C*
     C     MSGACT        IFEQ      'C'
     C     MSGACT        OREQ      'A'
     C     MSGACT        OREQ      'E'
     C                   CALL      'CLMSG'       PMSGCL
     C                   MOVE      *BLANK        MSGID
     C                   MOVE      *BLANK        MSGF
     C                   MOVE      *BLANK        MSGFL
     C* Do not clear the message data field if message is extracted
     C* from message file
     C     MSGACT        IFNE      'E'
     C                   MOVE      *BLANK        MSGDTA
     C                   END
     C                   END
     C*
     C                   ENDSR
     C/EJECT
     C**************************************************************************
     C* S006   - CLRSCR SCR001
     C**************************************************************************
     C     S006          BEGSR
     C                   MOVEL     *BLANK        POS002                         INZ POS002
     C                   MOVEL     *BLANK        XYDESC                         INZ XYDESC
     C                   Z-ADD     *ZEROS        RN0001                         INZ RN0001
     C                   MOVEL     *BLANK        XHPORD                         INZ XHPORD
     C                   MOVEL     *BLANK        XHWHSE                         INZ XHWHSE
     C                   MOVEL     *BLANK        WK0024                         INZ WK0024
     C                   MOVEL     *BLANK        WK0042                         INZ WK0042
     C                   MOVEL     *BLANK        WK0044                         INZ WK0044
     C                   EXSR      S007                                         INZ SFL
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - Process To Initialize SubFile - SCR001S1
     C**************************************************************************
     C     S007          BEGSR
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C*
     C                   MOVEA     '1110'        *IN(63)                        SFLCLR SFLDSP
     C                   MOVEA     *IN           INSAV1
     C     1             DO        12            RRN01
     C                   WRITE     SCR001S1                             90
     C                   END
     C*
     C                   Z-ADD     1             RRN01
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - GETREC d.company,*eq,COYNO#
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     COYNO#        KYCO01
     C     K0001         CHAIN     COMPANY                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.COMPANY   IMSC
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.COMPANY   IMSC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01                         Company number
     C                   MOVEL     RN0015        KYCO01
     C     K0001         CHAIN     IMSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.IMSCPYD   IMST
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.IMSCPYD   IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01                         Company number
     C                   MOVEL     RN0035        KYCO01
     C                   MOVEL     *BLANK        KDTR02
     C                   MOVEL     CDTRNP        KDTR02
     C     K0002         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC d.imscpyd,f.imscpyd,*eq,COYNO#
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     COYNO#        KDCO01
     C     K0003         CHAIN     IMSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.IMSCPYD
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.IMSCPYD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - SETLL D.PORDH,F.PORDH,SVK001,SVK002
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   MOVEL     *LOVAL        HD0012                         Company number
     C                   MOVEL     *LOVAL        HHPORD                         Purchase Order Numbe
     C*
     C                   MOVEL     SVK001        KHCO01
     C                   MOVEL     SVK001        HD0012                         Company number
     C                   MOVEL     SVK001        RN0072                         Company number
     C                   MOVEL     SVK002        KHPO02
     C                   MOVEL     SVK002        HHPORD                         Purchase Order Numbe
     C                   MOVEL     SVK002        PHPORD                         Purchase Order Numbe
     C*
     C     K0004         SETLL     PORDH                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - Process To Reset File Pointer(EOF) - PORDH
     C**************************************************************************
     C     S011          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.PORDH
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0072        KHCO01
     C     K0005         SETGT     PORDH
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ01
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - GETBLK D.PORDH,F.PORDH,*PV,SVK001
     C**************************************************************************
     C     S012          BEGSR
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     WRRN01        WLCNTR                         INIT LOOP CNTR
     C                   ADD       WADJ01        WLCNTR                         ADD ADJ.CNTR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDH
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     K0005         READPE(N) PORDH                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0012                         Company number
     C                   MOVEL     *BLANK        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S013                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - Process To Reset File Pointer(BOF) - PORDH
     C**************************************************************************
     C     S013          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.PORDH
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0072        KHCO01
     C     K0005         SETLL     PORDH
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - CLRSCR SCR002
     C**************************************************************************
     C     S014          BEGSR
     C                   MOVEL     *BLANK        RN0012                         INZ RN0012
     C                   MOVEL     *BLANK        XYDESC                         INZ XYDESC
     C                   MOVEL     *BLANK        XHPORD                         INZ XHPORD
     C                   MOVEL     *BLANK        XHWHSE                         INZ XHWHSE
     C                   MOVEL     *BLANK        WK0024                         INZ WK0024
     C                   MOVEL     *BLANK        WK0025                         INZ WK0025
     C                   MOVEL     *BLANK        WK0027                         INZ WK0027
     C                   MOVEL     *BLANK        WK0029                         INZ WK0029
     C                   MOVEL     *BLANK        WK0033                         INZ WK0033
     C                   MOVEL     *BLANK        WK0036                         INZ WK0036
     C                   MOVEL     *BLANK        WK0037                         INZ WK0037
     C                   MOVEL     *BLANK        WK0038                         INZ WK0038
     C                   MOVEL     *BLANK        WK0039                         INZ WK0039
     C                   MOVEL     *BLANK        WK0040                         INZ WK0040
     C                   MOVEL     *BLANK        WK0041                         INZ WK0041
     C                   MOVEL     *BLANK        WK0042                         INZ WK0042
     C                   MOVEL     *BLANK        WK0043                         INZ WK0043
     C                   MOVEL     *BLANK        WK0044                         INZ WK0044
     C                   MOVEL     *BLANK        WK0045                         INZ WK0045
     C                   MOVEL     *BLANK        WK0046                         INZ WK0046
     C                   MOVEL     *BLANK        WK0047                         INZ WK0047
     C                   MOVEL     *BLANK        WK0048                         INZ WK0048
     C                   MOVEL     *BLANK        WK0049                         INZ WK0049
     C                   MOVEL     *BLANK        WK0051                         INZ WK0051
     C                   MOVEL     *BLANK        WK0052                         INZ WK0052
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - GETREC D.PORDH,F.PORDH,*lock,*eq,SVK001,SVK002
     C**************************************************************************
     C     S015          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     SVK002        KHPO02
     C     K0004         CHAIN     PORDH                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - SETLL d.pordd,f.pordd,COYNO#,phpord
     C**************************************************************************
     C     S016          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD06                         RD.SW.PORDD
     C                   MOVEL     *LOVAL        HD0011                         Company number
     C                   MOVEL     *LOVAL        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C*
     C                   MOVEL     COYNO#        KOCO01
     C                   MOVEL     COYNO#        HD0011                         Company number
     C                   MOVEL     COYNO#        RN0061                         Company number
     C                   MOVEL     XHPORD        KOPO02
     C                   MOVEL     XHPORD        HOPORD                         Purchase Order Numbe
     C                   MOVEL     XHPORD        POPORD                         Purchase Order Numbe
     C*
     C     K0006         SETLL     PORDD                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS06                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S017   - GETREC d.pordd,*ne,COYNO#,phpord
     C**************************************************************************
     C     S017          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     COYNO#        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     XHPORD        KOPO02
     C     K0006         READE(N)  PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S018                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - Process To Reset File Pointer(EOF) - PORDD
     C**************************************************************************
     C     S018          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.PORDD
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.PORDD
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0061        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C     K0006         SETGT     PORDD
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S019   - SETLL D.WLOCITM1,F.WLOCITM1,POCOYNO,POWHSE,POITEM
     C**************************************************************************
     C     S019          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD07                         RD.SW.WLOCITM1
     C                   MOVEL     *LOVAL        HD0019                         Company number
     C                   MOVEL     *LOVAL        HIWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HD0020                         Item Number
     C                   MOVEL     *LOVAL        HILOCN                         Location
     C*
     C                   MOVEL     WK0017        KICO01
     C                   MOVEL     WK0017        HD0019                         Company number
     C                   MOVEL     WK0017        RN0111                         Company number
     C                   MOVEL     XOWHSE        KIWH02
     C                   MOVEL     XOWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     XOWHSE        WIWHSE                         Warehouse Number
     C                   MOVEL     XOITEM        KIIT03
     C                   MOVEL     XOITEM        HD0020                         Item Number
     C                   MOVEL     XOITEM        WIITEM                         Item Number
     C*
     C     K0007         SETLL     WLOCITM1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS07                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S020   - GETREC D.WLOCITM1,F.WLOCITM1,*NE,POCOYNO,POWHSE,POITEM
     C**************************************************************************
     C     S020          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     WK0017        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     XOWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     XOITEM        KIIT03
     C     K0007         READE     WLOCITM1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.WLOCITM1
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.WLOCITM1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S021                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S021   - Process To Reset File Pointer(EOF) - WLOCITM1
     C**************************************************************************
     C     S021          BEGSR
     C*
     C     SWRD07        IFNE      'Y'                                          RD.SW.WLOCITM1
     C     STS07         ANDNE     1122                                         RCD LOCK
     C     STS07         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD07                         RD.SW.WLOCITM1
     C                   Z-ADD     STS07         SVS07                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0111        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03                         Item Number
     C                   MOVEL     WIITEM        KIIT03
     C     K0007         SETGT     WLOCITM1
     C                   Z-ADD     SVS07         STS07                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S022   - WRITE d.wrkpord,f.wrkpord
     C**************************************************************************
     C     S022          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C*          ---------------------------------------------------------------
     C*          | Auto Increment
     C*          ---------------------------------------------------------------
     C                   MOVEL     WK0076        KKCO01                         INITIALIZE KKCO01
     C                   MOVEL     WK0080        KKPO02                         INITIALIZE KKPO02
     C                   Z-ADD     WK0078        KKLI03                         INITIALIZE KKLI03
     C                   Z-ADD     *HIVAL        KKSE04                         INITIALIZE KKSE04
     C     K0008         SETGT     WRKPORD
     C                   READP(N)  WRKPORD                              9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C     RN0113        ANDEQ     KKCO01                                       Company number
     C     WKPORD        ANDEQ     KKPO02                                       Purchase Order Numbe
     C     WKLINE        ANDEQ     KKLI03                                       Line Number
     C     WKSEQ         ADD       1             WK0083                         Sequence
     C                   ELSE
     C                   Z-ADD     1             WK0083
     C                   END
     C*
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     WRKPORDF                             90      ADD REC TO WRKPORD
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S023   - UPDATE d.pordh,f.pordh
     C**************************************************************************
     C     S023          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0012        KHCO01
     C                   MOVEL     *BLANK        KHPO02                         Purchase Order Numbe
     C                   MOVEL     HHPORD        KHPO02
     C     K0004         CHAIN     PORDH                              9091      CHAIN  PORDH
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0068        IFEQ      WK0024
     C     RN0069        ANDEQ     WK0025
     C     RN0070        ANDEQ     WK0026
     C     RN0071        ANDEQ     WK0027
     C     RN0072        ANDEQ     WK0028
     C     RN0073        ANDEQ     WK0029
     C     RN0074        ANDEQ     WK0030
     C     RN0075        ANDEQ     WK0031
     C     RN0076        ANDEQ     WK0032
     C     RN0077        ANDEQ     WK0033
     C     RN0078        ANDEQ     WK0034
     C     PHOPNL        ANDEQ     WHOPNL
     C     PHOS01        ANDEQ     WHOS01
     C     PHOS02        ANDEQ     WHOS02
     C     PHOS03        ANDEQ     WHOS03
     C     PHOS04        ANDEQ     WHOS04
     C     PHOS05        ANDEQ     WHOS05
     C     PHOS06        ANDEQ     WHOS06
     C     PHOS07        ANDEQ     WHOS07
     C     PHOS08        ANDEQ     WHOS08
     C     PHOS09        ANDEQ     WHOS09
     C     PHOS10        ANDEQ     WHOS10
     C     PHOS11        ANDEQ     WHOS11
     C     PHPORD        ANDEQ     XHPORD
     C     RN0079        ANDEQ     WK0035
     C     RN0081        ANDEQ     WK0036
     C     RN0082        ANDEQ     WK0037
     C     RN0083        ANDEQ     WK0038
     C     RN0084        ANDEQ     WK0039
     C     RN0085        ANDEQ     WK0040
     C     RN0086        ANDEQ     WK0041
     C     RN0087        ANDEQ     WK0042
     C     RN0088        ANDEQ     WK0043
     C     RN0089        ANDEQ     WK0044
     C     PHWHSE        ANDEQ     XHWHSE
     C     RN0090        ANDEQ     WK0045
     C     RN0091        ANDEQ     WK0046
     C     RN0092        ANDEQ     WK0047
     C     RN0093        ANDEQ     WK0048
     C     RN0094        ANDEQ     WK0049
     C     RN0095        ANDEQ     WK0050
     C     RN0096        ANDEQ     WK0051
     C     RN0097        ANDEQ     WK0052
     C                   UNLOCK    PORDH                                91      RLS LCK PORDH
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    PORDHF                               90      UPDATE PORDH
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S024   - CLRSCR SCR003
     C**************************************************************************
     C     S024          BEGSR
     C                   Z-ADD     *ZEROS        RN0003                         INZ RN0003
     C                   MOVEL     *BLANK        XYDESC                         INZ XYDESC
     C                   Z-ADD     *ZEROS        ACT                            INZ ACT
     C                   Z-ADD     *ZEROS        RN0013                         INZ RN0013
     C                   MOVEL     *BLANK        WSMANF                         INZ WSMANF
     C                   MOVEL     *BLANK        XOITEM                         INZ XOITEM
     C                   Z-ADD     *ZEROS        XOQORD                         INZ XOQORD
     C                   Z-ADD     *ZEROS        XOSEQ                          INZ XOSEQ
     C                   MOVEL     *BLANK        XOWHSE                         INZ XOWHSE
     C                   MOVEL     *BLANK        WK0019                         INZ WK0019
     C                   Z-ADD     *ZEROS        WK0022                         INZ WK0022
     C                   MOVEL     *BLANK        XHPORD                         INZ XHPORD
     C                   EXSR      S025                                         INZ SFL
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S025   - Process To Initialize SubFile - SCR003S1
     C**************************************************************************
     C     S025          BEGSR
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR003C1                                     CLEAR SUBFILE
     C*
     C                   MOVEA     '1110'        *IN(63)                        SFLCLR SFLDSP
     C                   MOVEA     *IN           INSAV1
     C     1             DO        6             RRN02
     C                   WRITE     SCR003S1                             90
     C                   END
     C*
     C                   Z-ADD     1             RRN02
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S026   - SETLL D.PORDD,F.PORDD,COYNO#,phpord,SVposeq
     C**************************************************************************
     C     S026          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD06                         RD.SW.PORDD
     C                   MOVEL     *LOVAL        HD0011                         Company number
     C                   MOVEL     *LOVAL        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C*
     C                   MOVEL     COYNO#        KOCO01
     C                   MOVEL     COYNO#        HD0011                         Company number
     C                   MOVEL     COYNO#        RN0061                         Company number
     C                   MOVEL     XHPORD        KOPO02
     C                   MOVEL     XHPORD        HOPORD                         Purchase Order Numbe
     C                   MOVEL     XHPORD        POPORD                         Purchase Order Numbe
     C                   Z-ADD     RN0004        KOSE03
     C                   Z-ADD     RN0004        HOSEQ                          Sequence
     C                   Z-ADD     RN0004        POSEQ                          Sequence
     C*
     C     K0009         SETLL     PORDD                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS06                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S027   - GETREC D.IPSCPYD,*EQ,COYNO#
     C**************************************************************************
     C     S027          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     COYNO#        KDCO01
     C     K0003         CHAIN(N)  IPSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.IPSCPYD
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.IPSCPYD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S028   - UPDATE d.ipscpyd,f.ipscpyd
     C**************************************************************************
     C     S028          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     HD0007        KDCO01
     C     K0003         CHAIN     IPSCPYD                            9091      CHAIN  IPSCPYD
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0041        IFEQ      WK0015
     C     CDIMS         ANDEQ     WDIMS
     C                   UNLOCK    IPSCPYD                              91      RLS LCK IPSCPYD
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    IPSCPYDF                             90      UPDATE IPSCPYD
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S029   - SETLL d.wrkpord,f.wrkpord,COYNO#,phpord
     C**************************************************************************
     C     S029          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD
     C                   MOVEL     *LOVAL        HD0023                         Company number
     C                   MOVEL     *LOVAL        HKPORD                         Purchase Order Numbe
     C                   Z-ADD     *LOVAL        HKLINE                         Line Number
     C                   Z-ADD     *LOVAL        HKSEQ                          Sequence
     C*
     C                   MOVEL     COYNO#        KKCO01
     C                   MOVEL     COYNO#        HD0023                         Company number
     C                   MOVEL     COYNO#        RN0113                         Company number
     C                   MOVEL     XHPORD        KKPO02
     C                   MOVEL     XHPORD        HKPORD                         Purchase Order Numbe
     C                   MOVEL     XHPORD        WKPORD                         Purchase Order Numbe
     C*
     C     K0010         SETLL     WRKPORD                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S030   - GETREC d.wrkpord,*ne,COYNO#,phpord
     C**************************************************************************
     C     S030          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KKCO01
     C                   MOVEL     COYNO#        KKCO01
     C                   MOVEL     *BLANK        KKPO02
     C                   MOVEL     XHPORD        KKPO02
     C     K0010         READE(N)  WRKPORD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.WRKPORD
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S031                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S031   - Process To Reset File Pointer(EOF) - WRKPORD
     C**************************************************************************
     C     S031          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.WRKPORD
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KKCO01                         Company number
     C                   MOVEL     RN0113        KKCO01
     C                   MOVEL     *BLANK        KKPO02                         Purchase Order Numbe
     C                   MOVEL     WKPORD        KKPO02
     C     K0010         SETGT     WRKPORD
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S032   - GETREC d.pordd,*eq,COYNO#,wkpord,wkline
     C**************************************************************************
     C     S032          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     COYNO#        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     WK0080        KOPO02
     C                   Z-ADD     WK0078        KOSE03
     C     K0009         CHAIN(N)  PORDD                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S033   - UPDATE d.pordd,f.pordd
     C**************************************************************************
     C     S033          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     HD0011        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     HOPORD        KOPO02
     C                   Z-ADD     HOSEQ         KOSE03                         Sequence
     C     K0009         CHAIN     PORDD                              9091      CHAIN  PORDD
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     POCCDE        IFEQ      WOCCDE
     C     POCONV        ANDEQ     WOCONV
     C     RN0061        ANDEQ     WK0017
     C     RN0062        ANDEQ     WK0018
     C     RN0063        ANDEQ     WK0019
     C     POITEM        ANDEQ     XOITEM
     C     RN0064        ANDEQ     WK0020
     C     POPCDE        ANDEQ     WOPCDE
     C     POPORD        ANDEQ     WOPORD
     C     RN0065        ANDEQ     WK0021
     C     POQORD        ANDEQ     XOQORD
     C     RN0066        ANDEQ     WK0022
     C     RN0067        ANDEQ     WK0023
     C     POSEQ         ANDEQ     XOSEQ
     C     POUOM         ANDEQ     WOUOM
     C     POWHSE        ANDEQ     XOWHSE
     C                   UNLOCK    PORDD                                91      RLS LCK PORDD
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    PORDDF                               90      UPDATE PORDD
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S034   - WRITE d.grnhis,f.grnhis
     C**************************************************************************
     C     S034          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     GRNHISF                              90      ADD REC TO GRNHIS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S035   - GETREC D.IMSTRN,F.IMSTRN,*EQ,COYNO#,CDTRNR
     C**************************************************************************
     C     S035          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     COYNO#        KTCO01
     C                   MOVEL     *BLANK        KTTR02
     C                   MOVEL     WDTRNR        KTTR02
     C     K0011         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S036   - WRITE D.STOKMOV,F.STOKMOV
     C**************************************************************************
     C     S036          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   MOVEL     *BLANKS       RN0098                         Branch Number
     C                   MOVEL     *BLANKS       STLOCT                         Other Location
     C                   MOVEL     *BLANKS       STPCKL                         Picking List Y/N
     C                   Z-ADD     *ZERO         STSEQ                          Picking List No.
     C                   MOVEL     *BLANKS       RN0100                         Supplier Number
     C                   Z-ADD     *ZERO         STTIME                         Expected Time
     C                   Z-ADD     *ZERO         STWEIG                         Weight
     C                   MOVEL     *BLANKS       STWHST                         Other Warehouse
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C                   WRITE     FMT001                               90      ADD REC TO STOKMOV
     C                   Z-ADD     STS17         STS11                          SYNC STATUS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   Z-ADD     REC17         REC11
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S037   - GETREC d.waredet,*eq,pocoyno,powhse,poitem
     C**************************************************************************
     C     S037          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO02
     C                   MOVEL     WK0017        KDCO02
     C                   MOVEL     *BLANK        KDWH03
     C                   MOVEL     XOWHSE        KDWH03
     C                   MOVEL     *BLANK        KDIT04
     C                   MOVEL     XOITEM        KDIT04
     C     K0012         CHAIN(N)  WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.WAREDET
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.WAREDET
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S038   - GETREC d.suplier,f.suplier,*eq,COYNO#,phsuppn,phbrnbr
     C**************************************************************************
     C     S038          BEGSR
     C                   Z-ADD     13            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     COYNO#        KUCO01
     C                   MOVEL     *BLANK        KUSU02
     C                   MOVEL     WK0044        KUSU02
     C                   MOVEL     *BLANK        KUBR03
     C                   MOVEL     WK0024        KUBR03
     C     K0013         CHAIN     SUPLIER                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD13                         RD.SW.SUPLIER   CCYC
     C                   Z-ADD     *ZERO         HRC13                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD13                         RD.SW.SUPLIER   CCYC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S039   - GETREC d.suplier,f.ccycod,*eq,COYNO#,sucurr
     C**************************************************************************
     C     S039          BEGSR
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     COYNO#        KUCO01
     C                   MOVEL     *BLANK        KUCU02
     C                   MOVEL     WUCURR        KUCU02
     C     K0014         CHAIN     CCYCOD                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD14                         RD.SW.CCYCOD
     C                   Z-ADD     *ZERO         HRC14                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD14                         RD.SW.CCYCOD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S040   - GETREC D.WLOCITM1,F.WLOCITM1,*EQ,WKCOYNO,WKWHSE,WKITEM,WKLOCN
     C**************************************************************************
     C     S040          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     WK0076        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     WK0084        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     WK0077        KIIT03
     C                   MOVEL     *BLANK        KILO04
     C                   MOVEL     WK0079        KILO04
     C     K0015         CHAIN     WLOCITM1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.WLOCITM1
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.WLOCITM1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S041   - UPDATE d.wlocitm1,f.wlocitm1
     C**************************************************************************
     C     S041          BEGSR
     C                   Z-ADD     18            WFILE#                         SET FILE#
     C                   Z-ADD     HRC07         REC07
     C     HRC07         CHAIN     FILE0001                           9091
     C                   Z-ADD     STS18         STS07                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0111        IFEQ      WK0063
     C     WIITEM        ANDEQ     WK0064
     C     WILOCN        ANDEQ     WK0065
     C     WIQOH         ANDEQ     WK0066
     C     WIWHSE        ANDEQ     WK0067
     C                   UNLOCK    FILE0001                             91      RLS LCK FILE0001
     C                   ELSE
     C*
     C                   EXSR      S042                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    FMT002                               90      UPDATE WLOCITM1
     C                   Z-ADD     STS18         STS07                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   ELSE
     C                   UNLOCK    FILE0001                             91      RLS LCK FILE0001
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS07
     C                   END
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S042   - Referential Integrity Check (Update) For File WLOCITM1
     C**************************************************************************
     C     S042          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0111        IFNE      WK0063
     C     WIWHSE        ORNE      WK0067
     C     WIITEM        ORNE      WK0064
     C*
     C                   MOVEL     WK0063        KICO01                         Company number
     C                   MOVEL     WK0067        KIWH02                         Warehouse Number
     C                   MOVEL     WK0064        KIIT03                         Item Number
     C     K0007         SETLL     WAREDET                                90    Warehouse Item Detai
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(3)         MSGDTA                         Cannot add Location
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $042
     C                   END
     C                   END                                                    END-Compare fld.
     C     RN0111        IFNE      WK0063
     C     WIWHSE        ORNE      WK0067
     C     WILOCN        ORNE      WK0065
     C*
     C                   MOVEL     WK0063        KICO01                         Company number
     C                   MOVEL     WK0067        KIWH02                         Warehouse Number
     C                   MOVEL     WK0065        KILO03                         Location
     C     K0016         SETLL     WARELOC                                90    IMS Warehouse Locati
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(4)         MSGDTA                         Cannot add Location
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $042
     C                   END
     C                   END                                                    END-Compare fld.
     C     $042          ENDSR
     C/EJECT
     C**************************************************************************
     C* S043   - UPDATE d.waredet,f.waredet
     C**************************************************************************
     C     S043          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO02                         Company number
     C                   MOVEL     HD0017        KDCO02
     C                   MOVEL     *BLANK        KDWH03                         Warehouse Number
     C                   MOVEL     HDWHSE        KDWH03
     C                   MOVEL     *BLANK        KDIT04                         Item Number
     C                   MOVEL     HDITEM        KDIT04
     C     K0012         CHAIN     WAREDET                            9091      CHAIN  WAREDET
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     WDLCST        IFEQ      WK0056
     C     WDLRDT        ANDEQ     WK0057
     C     WDNORP        ANDEQ     WK0058
     C     WDNORY        ANDEQ     WK0059
     C     WDQOH         ANDEQ     WK0060
     C     WDQOO         ANDEQ     WK0061
     C     WDUCST        ANDEQ     WK0062
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   ELSE
     C*
     C                   EXSR      S044                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WDETAILF                             90      UPDATE WAREDET
     C                   ELSE
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS12
     C                   END
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S044   - Referential Integrity Check (Update) For File WAREDET
     C**************************************************************************
     C     S044          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     $044          ENDSR
     C/EJECT
     C**************************************************************************
     C* S045   - GETREC D.WAREHED,F.WRITTYP,*EQ,POCOYNO,POWHSE,POITEM,CDTRNR
     C**************************************************************************
     C     S045          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO02
     C                   MOVEL     WK0017        KHCO02
     C                   MOVEL     *BLANK        KHWH03
     C                   MOVEL     XOWHSE        KHWH03
     C                   MOVEL     *BLANK        KDIT04
     C                   MOVEL     XOITEM        KDIT04
     C                   MOVEL     *BLANK        KTTR05
     C                   MOVEL     WDTRNR        KTTR05
     C     K0017         CHAIN(N)  WRITTYP                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD15                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     *ZERO         HRC15                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WRITTYP   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S046   - UPDATE D.WAREHED,F.WRITTYP
     C**************************************************************************
     C     S046          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO02                         Company number
     C                   MOVEL     HD0021        KHCO02
     C                   MOVEL     *BLANK        KHWH03                         Warehouse Number
     C                   MOVEL     HTWHSE        KHWH03
     C                   MOVEL     *BLANK        KDIT04                         Item Number
     C                   MOVEL     HTITEM        KDIT04
     C                   MOVEL     *BLANK        KTTR05                         Transaction Type
     C                   MOVEL     HD0022        KTTR05
     C     K0017         CHAIN     WRITTYP                            9091      CHAIN  WRITTYP
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0112        IFEQ      WK0068
     C     WTITEM        ANDEQ     WK0069
     C     WTTRNC        ANDEQ     WK0070
     C     WTTRPQ        ANDEQ     WK0071
     C     WTTRPV        ANDEQ     WK0072
     C     WTTRYQ        ANDEQ     WK0073
     C     WTTRYV        ANDEQ     WK0074
     C     WTWHSE        ANDEQ     WK0075
     C                   UNLOCK    WRITTYP                              91      RLS LCK WRITTYP
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WRITTYPF                             90      UPDATE WRITTYP
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S047   - WRITE D.WAREHED,F.WRITTYP
     C**************************************************************************
     C     S047          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     WRITTYPF                             90      ADD REC TO WRITTYP
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S048   - DELETE d.wrkpord,f.wrkpord
     C**************************************************************************
     C     S048          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   MOVEL     *BLANK        KKCO01
     C                   MOVEL     WK0076        KKCO01
     C                   MOVEL     *BLANK        KKPO02
     C                   MOVEL     WK0080        KKPO02
     C                   Z-ADD     WK0078        KKLI03
     C                   Z-ADD     WK0083        KKSE04
     C     K0008         SETLL     WRKPORD                                      SETLL  WRKPORD
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - WRKPORD
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0008         READE     WRKPORD                              9190    READE  WRKPORD
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    WRKPORD                              91      DELETE WRKPORD
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C*
     C     K0008         SETLL     WRKPORD                                      RESUME FILE POINTER
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S049   - GETBLK D.PORDD,F.PORDD,*PV,COYNO#,phpord
     C**************************************************************************
     C     S049          BEGSR
     C*
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     COYNO#        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     XHPORD        KOPO02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     WRRN02        WLCNTR                         INIT LOOP CNTR
     C                   ADD       WADJ02        WLCNTR                         ADD ADJ.CNTR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD06        DOUNE     'Y'                                          RD.SW.PORDD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C     K0006         READPE(N) PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC06                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0011                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.PORDD
     C                   END
     C*
     C     SWRD06        IFEQ      'Y'                                          RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S050                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S050   - Process To Reset File Pointer(BOF) - PORDD
     C**************************************************************************
     C     S050          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.PORDD
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.PORDD
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0061        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C     K0006         SETLL     PORDD
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S051   - Process To Reset File Pointer(EOF) - PORDD
     C**************************************************************************
     C     S051          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.PORDD
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.PORDD
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0061        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C     K0006         SETGT     PORDD
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ02
     C     WCNTR         IFNE      *ZERO
     C                   ADD       6             WADJ02
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN02        WADJ02
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S052   - GETREC D.WRKPORD,F.WRKPORD,*EQ,POCOYNO,POPORD,POSEQ
     C**************************************************************************
     C     S052          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KKCO02
     C                   MOVEL     WK0017        KKCO02
     C                   MOVEL     *BLANK        KKPO03
     C                   MOVEL     WOPORD        KKPO03
     C                   Z-ADD     XOSEQ         KKLI04
     C     K0018         CHAIN(N)  WRKPORD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.WRKPORD
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S053   - GETREC D.IPSITEM,F.IPSITEM,*EQ,POCOYNO,PHSUPPN,PHBRNBR,poitem
     C**************************************************************************
     C     S053          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO02
     C                   MOVEL     WK0017        KICO02
     C                   MOVEL     *BLANK        KISU03
     C                   MOVEL     WK0044        KISU03
     C                   MOVEL     *BLANK        KIBR04
     C                   MOVEL     WK0024        KIBR04
     C                   MOVEL     *BLANK        KIIT05
     C                   MOVEL     XOITEM        KIIT05
     C     K0019         CHAIN     IPSITEM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S054   - SETLL D.WRKPORD,F.WRKPORD,POCOYNO,POPORD,POSEQ
     C**************************************************************************
     C     S054          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD
     C                   MOVEL     *LOVAL        HD0023                         Company number
     C                   MOVEL     *LOVAL        HKPORD                         Purchase Order Numbe
     C                   Z-ADD     *LOVAL        HKLINE                         Line Number
     C                   Z-ADD     *LOVAL        HKSEQ                          Sequence
     C*
     C                   MOVEL     WK0017        KKCO03
     C                   MOVEL     WK0017        HD0023                         Company number
     C                   MOVEL     WK0017        RN0113                         Company number
     C                   MOVEL     WOPORD        KKPO04
     C                   MOVEL     WOPORD        HKPORD                         Purchase Order Numbe
     C                   MOVEL     WOPORD        WKPORD                         Purchase Order Numbe
     C                   Z-ADD     XOSEQ         KKLI05
     C                   Z-ADD     XOSEQ         HKLINE                         Line Number
     C                   Z-ADD     XOSEQ         WKLINE                         Line Number
     C*
     C     K0020         SETLL     WRKPORD                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S055   - GETREC D.WRKPORD,F.WRKPORD,*ne,POCOYNO,POPORD,POSEQ
     C**************************************************************************
     C     S055          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KKCO04
     C                   MOVEL     WK0017        KKCO04
     C                   MOVEL     *BLANK        KKPO05
     C                   MOVEL     WOPORD        KKPO05
     C                   Z-ADD     XOSEQ         KKLI06
     C     K0021         READE(N)  WRKPORD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.WRKPORD
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S056                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S056   - Process To Reset File Pointer(EOF) - WRKPORD
     C**************************************************************************
     C     S056          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.WRKPORD
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KKCO05                         Company number
     C                   MOVEL     RN0113        KKCO05
     C                   MOVEL     *BLANK        KKPO06                         Purchase Order Numbe
     C                   MOVEL     WKPORD        KKPO06
     C                   Z-ADD     WKLINE        KKLI07                         Line Number
     C     K0022         SETGT     WRKPORD
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004V - Update all receipts
     C* Validation subroutine for -- SETSPEC
     C**************************************************************************
     C     S004V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     WSOS07        IFEQ      A1(2)                                        Lst Valid/Invalid va
     C     WSOS07        OREQ      A1(1)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WSOS07'      FLDNAM
     C                   MOVEL     'SETSPEC'     FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'USR2094'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C                   ENDSR
     C**************************************************************************
     C/EJECT
     C*****************************************************************
     C* *PSSR - Program Execution Errors Handler
     C*****************************************************************
     C     *PSSR         BEGSR
     C     UERCNT        IFNE      *ZERO
     C                   MOVEL     '*CANCL'      URSUME
     C                   ELSE
     C                   Z-ADD     1             UERCNT
     C                   MOVE      'R'           MSGACT
     C                   MOVE      *BLANKS       MSGF
     C                   MOVEL     'QCPFMSG'     MSGF
     C                   MOVE      *BLANKS       MSGFL
     C                   MOVEL     'QSYS'        MSGFL
     C                   MOVE      *BLANKS       MSGDTA
     C     UMSGTX        IFNE      *BLANKS
     C                   MOVEL     UMSGTX        MSGDTA
     C                   ELSE
     C                   MOVEL     UROUTN        MSGDTA
     C                   END
     C*
     C     USTAT         IFEQ      *ZEROS
     C                   MOVE      UFSTAT        USTAT
     C                   MOVE      UFSRCL        USRCLN
     C                   END
     C                   MOVE      USTAT         USTAT4
     C*
     C     MSGID         IFEQ      *BLANKS
     C                   MOVE      USTAT4        MSGID
     C                   MOVEL     'RPG'         MSGID
     C                   MOVEL     'QRPGMSGE'    MSGF
     C                   END
     C*
     C                   CALL      'CLMSG'       PMSGCL                   93
     C*
     C                   MOVEL     '1'           UEROPT
     C                   EXFMT     PSSR0001
     C*
     C     UEROPT        IFEQ      '1'
     C                   MOVEL     '*GETIN  '    URSUME
     C                   ELSE
     C     UEROPT        IFEQ      '2'
     C                   MOVEL     '*CANCL  '    URSUME
     C                   ELSE
     C     UEROPT        IFEQ      '3'
     C                   MOVE      '        '    URSUME
     C                   END
     C                   END
     C                   END
     C                   END
     C*
     C                   MOVEL     *BLANK        MSGID
     C                   MOVE      *ZERO         UERCNT
     C*
     C                   ENDSR     URSUME
     C*/EJECT
     C*****************************************************************
     C* SATRIB - Display Attribute Handler
     C*****************************************************************
     C     SATRIB        BEGSR
     C*
     C* FIND TABLE OFFSET BY SCREEN ID AND FIELD NAME AND FIELD INDEX
     C*
     C                   Z-ADD     1             X0
     C     #MAP          LOOKUP    DA1(X0)                                90
     C     *IN90         IFEQ      '1'                                          IF FIND
     C                   MOVEA     DA2(X0)       DA3
     C*
     C*          ------------------------------------------------------
     C*          | @DSPERR/VALIDATION FIELD DISPLAY ATTRIBUTES
     C*          ------------------------------------------------------
     C     DSPERR        IFNE      *BLANK
     C     DA3(6)        IFNE      *BLANK                                       TURN ON *PC
     C                   MOVE      DA3(6)        X1
     C     DSPERR        IFEQ      'X'
     C                   MOVE      '0'           *IN80
     C                   MOVEA     '1'           *IN(X1)
     C                   ELSE                                                   x-DSPERR EQ 'X'
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    DSPERR EQ 'X'
     C                   END                                                    DA3,6 NE *BLANK
     C*
     C     DA3(2)        IFNE      *BLANK                                       TURN ON *RI
     C                   MOVE      DA3(2)        X1
     C     DSPERR        IFEQ      'X'
     C                   MOVEA     '1'           *IN(X1)
     C                   ELSE                                                   x-DSPERR EQ 'X'
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    DSPERR EQ 'X'
     C                   END                                                    DA3,2 NE *BLANK
     C*
     C     DA3(3)        IFNE      *BLANK                                       TURN OFF *UL
     C     DA3(16)       ANDEQ     ' Y'                                         KEEP UL
     C                   MOVE      DA3(3)        X1
     C     DSPERR        IFEQ      'X'
     C                   MOVEA     '0'           *IN(X1)
     C                   ELSE                                                   x-DSPERR EQ 'X'
     C                   MOVEA     '1'           *IN(X1)
     C                   END                                                    DSPERR EQ 'X'
     C                   END                                                    DA3,3 NE *BLANK
     C                   ELSE                                                   x-DSPERR NE *BL
     C*
     C*          ------------------------------------------------------
     C*          | *DS - RESET FIELD DISPLAY ATTRIBUTES
     C*          ------------------------------------------------------
     C     #DS           IFNE      *BLANK
     C     1             DO        15            X0
     C     DA3(X0)       IFNE      *BLANK
     C     X0            IFEQ      3
     C     DA3(16)       ANDEQ     ' Y'
     C                   ELSE                                                   x-X0 EQ 3
     C                   MOVE      DA3(X0)       X1
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    X0 EQ 3
     C                   END                                                    DA3,X0 NE *BLAN
     C                   END                                                    1 DO 15
     C*          ------------------------------------------------------
     C*          | *DS - TURN ON ORIGINAL COLOR ATTRIBUTES
     C*          |       IF THERE IS NO COLOR SPECIFIED
     C*          ------------------------------------------------------
     C     DA3(17)       IFNE      *BLANK
     C     #GN           ANDEQ     *BLANK
     C     #RD           ANDEQ     *BLANK
     C     #WT           ANDEQ     *BLANK
     C     #PK           ANDEQ     *BLANK
     C     #TQ           ANDEQ     *BLANK
     C     #YW           ANDEQ     *BLANK
     C     #BU           ANDEQ     *BLANK
     C                   MOVE      DA3(17)       X1
     C                   MOVEA     '1'           *IN(X1)
     C                   END                                                    DA3,17 NE *BLAN
     C                   END                                                    #DS NE *BLANK
     C*
     C*          ------------------------------------------------------
     C*          | LOOP TO TURN ON/OFF ATTRIBUTE INDICATORS
     C*          ------------------------------------------------------
     C     1             DO        15            X0
     C     DA3(X0)       IFNE      *BLANK
     C                   MOVE      DA3(X0)       X1
     C*          ------------------------------------------------------
     C*          | TURN ON ATTRIBUTE INDICATORS
     C*          ------------------------------------------------------
     C     DA6(X0)       IFNE      *BLANK
     C                   MOVEA     '1'           *IN(X1)
     C                   ELSE                                                   x-DA6,X0 NE *BL
     C*          ------------------------------------------------------
     C*          | FOR COLOR ATTRIBUTE, RESET OTHER COLOR THAT ARE
     C*          | NOT SPECIFIED.
     C*          ------------------------------------------------------
     C     X0            IFGE      9
     C     X0            ANDLE     15
     C     #GN           IFNE      *BLANK
     C     #RD           ORNE      *BLANK
     C     #WT           ORNE      *BLANK
     C     #PK           ORNE      *BLANK
     C     #TQ           ORNE      *BLANK
     C     #YW           ORNE      *BLANK
     C     #BU           ORNE      *BLANK
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    #GN NE *BLANK
     C                   END                                                    X0 GE 9
     C                   END                                                    DA6,X0 NE *BLAN
     C                   END                                                    DA3,X0 NE *BLAN
     C                   END                                                    1 DO 15
     C                   END                                                    DSPERR NE *BLAN
     C                   END                                                    *IN90 EQ '1'
     C*
     C                   MOVE      *BLANK        #ATRIB
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SLOCK - Update Lock Flag
     C*****************************************************************
     C     SLOCK         BEGSR
     C     STS02         IFEQ      1218                                         LOCK(SYS)-PORDH
     C     STS02         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK02                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK02                          SET ON LOCK FLAG
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    STOKMOVX                             91      STOKMOVX  FILE0001
     C                   UNLOCK    FILE0001                             91      FILE0001  MPORDHRD
     C                   READ      GRNHIS                                 90
     C                   READ      STOKMOV                                90
     C                   READ      WARELOC                                90
     C                   READ      STOKMOVX                               90
     C                   READ      FILE0001                               90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            WRKPORD
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            PORDH
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            COMPANY
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            IMSCPYD
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            IMSTRN
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            PORDD
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      7                                            WLOCITM1
     C     STS07         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS07                          ASSET LOCK STATUS
     C                   ELSE
     C     STS07         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS07                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      8                                            IPSITEM
     C     STS08         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS08                          ASSET LOCK STATUS
     C                   ELSE
     C     STS08         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS08                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      9                                            IPSCPYD
     C     STS09         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS09                          ASSET LOCK STATUS
     C                   ELSE
     C     STS09         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS09                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      10                                           GRNHIS
     C     STS10         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS10                          ASSET LOCK STATUS
     C                   ELSE
     C     STS10         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS10                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      11                                           STOKMOV
     C     STS11         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS11                          ASSET LOCK STATUS
     C                   ELSE
     C     STS11         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS11                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      12                                           WAREDET
     C     STS12         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS12                          ASSET LOCK STATUS
     C                   ELSE
     C     STS12         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS12                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      13                                           SUPLIER
     C     STS13         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS13                          ASSET LOCK STATUS
     C                   ELSE
     C     STS13         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS13                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      14                                           CCYCOD
     C     STS14         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS14                          ASSET LOCK STATUS
     C                   ELSE
     C     STS14         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS14                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      15                                           WRITTYP
     C     STS15         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS15                          ASSET LOCK STATUS
     C                   ELSE
     C     STS15         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS15                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      16                                           WARELOC
     C     STS16         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS16                          ASSET LOCK STATUS
     C                   ELSE
     C     STS16         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS16                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      17                                           STOKMOVX
     C     STS17         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS17                          ASSET LOCK STATUS
     C                   ELSE
     C     STS17         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS17                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      18                                           FILE0001
     C     STS18         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS18                          ASSET LOCK STATUS
     C                   ELSE
     C     STS18         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS18                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOF - Move Fields From Work Area To File(s)
     C*****************************************************************
     C     SMVTOF        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WRKPORD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0076        RN0113                         Company number
     C                   MOVEL     WK0077        WKITEM                         Item Number
     C                   Z-ADD     WK0078        WKLINE                         Line Number
     C                   MOVEL     WK0079        WKLOCN                         Location
     C                   MOVEL     WK0080        WKPORD                         Purchase Order Numbe
     C                   Z-ADD     WK0081        RN0114                         Price
     C                   Z-ADD     WK0082        RN0115                         Quantity received
     C                   Z-ADD     WK0083        WKSEQ                          Sequence
     C                   MOVEL     WK0084        WKWHSE                         Warehouse
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - PORDH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     WK0024        RN0068                         Branch Number
     C                   MOVEL     WK0025        RN0069                         Buyers Code
     C                   Z-ADD     WK0026        RN0070                         Completed Date
     C                   MOVEL     WK0027        RN0071                         Contact name
     C                   MOVEL     WK0028        RN0072                         Company number
     C                   MOVEL     WK0029        RN0073                         Our customers ref
     C                   Z-ADD     WK0030        RN0074                         Delivery Date
     C                   Z-ADD     WK0031        RN0075                         Entered Date
     C                   Z-ADD     WK0032        RN0076                         Last Receipt Date
     C                   MOVEL     WK0033        RN0077                         Allocation Acc
     C                   Z-ADD     WK0034        RN0078                         Purchase oprders pri
     C                   Z-ADD     WHOPNL        PHOPNL                         Open Lines on order
     C                   MOVEL     WHOS01        PHOS01                         New Order
     C                   MOVEL     WHOS02        PHOS02                         Updated Order/Line s
     C                   MOVEL     WHOS03        PHOS03                         No action since last
     C                   MOVEL     WHOS04        PHOS04                         P.O. Pending
     C                   MOVEL     WHOS05        PHOS05                         Some receiving since
     C                   MOVEL     WHOS06        PHOS06                         Print P.O.Requested
     C                   MOVEL     WHOS07        PHOS07                         Print Receiving List
     C                   MOVEL     WHOS08        PHOS08                         Order fully recd
     C                   MOVEL     WHOS09        PHOS09                         special order attent
     C                   MOVEL     WHOS10        PHOS10                         P.O. has been printe
     C                   MOVEL     WHOS11        PHOS11                         P.O. has been adjust
     C                   MOVEL     XHPORD        PHPORD                         Purchase Order Numbe
     C                   Z-ADD     WK0035        RN0079                         Receiving list|Audit
     C                   MOVEL     WK0036        RN0081                         Supplier Address
     C                   MOVEL     WK0037        RN0082                         Line 2
     C                   MOVEL     WK0038        RN0083                         Line 3
     C                   MOVEL     WK0039        RN0084                         Line 4
     C                   MOVEL     WK0040        RN0085                         Line 5
     C                   MOVEL     WK0041        RN0086                         Line 6
     C                   MOVEL     WK0042        RN0087                         Supplier name
     C                   MOVEL     WK0043        RN0088                         Post code
     C                   MOVEL     WK0044        RN0089                         Supplier Account
     C                   MOVEL     XHWHSE        PHWHSE                         Warehouse
     C                   MOVEL     WK0045        RN0090                         Address
     C                   MOVEL     WK0046        RN0091                         Line 2
     C                   MOVEL     WK0047        RN0092                         Line 3
     C                   MOVEL     WK0048        RN0093                         Line 4
     C                   MOVEL     WK0049        RN0094                         Line 5
     C                   MOVEL     WK0050        RN0095                         Line 6
     C                   MOVEL     WK0051        RN0096                         Wharehouse Name
     C                   MOVEL     WK0052        RN0097                         Post code
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - PORDD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     WOCCDE        POCCDE                         Conversion Code
     C                   Z-ADD     WOCONV        POCONV                         Conversion Qty
     C                   MOVEL     WK0017        RN0061                         Company number
     C                   Z-ADD     WK0018        RN0062                         Delivery Date
     C                   MOVEL     WK0019        RN0063                         Item Description
     C                   MOVEL     XOITEM        POITEM                         Item Number
     C                   MOVEL     WK0020        RN0064                         Allocated account
     C                   MOVEL     WOPCDE        POPCDE                         Pricing code
     C                   MOVEL     WOPORD        POPORD                         Purchase Order Numbe
     C                   Z-ADD     WK0021        RN0065                         Price
     C                   Z-ADD     XOQORD        POQORD                         Quantity ordered
     C                   Z-ADD     WK0022        RN0066                         Quantity received
     C                   Z-ADD     WK0023        RN0067                         Received this cycle
     C                   Z-ADD     XOSEQ         POSEQ                          Sequence
     C                   MOVEL     WOUOM         POUOM                          Unit of Measure
     C                   MOVEL     XOWHSE        POWHSE                         Warehouse
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WLOCITM1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     WK0063        RN0111                         Company number
     C                   MOVEL     WK0064        WIITEM                         Item Number
     C                   MOVEL     WK0065        WILOCN                         Location
     C                   Z-ADD     WK0066        WIQOH                          Quantity on hand
     C                   MOVEL     WK0067        WIWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - IPSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      09
     C                   Z-ADD     WK0015        RN0041                         Goods Received Audit
     C                   MOVEL     WDIMS         CDIMS                          IMS to be used
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - GRNHIS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      10
     C                   MOVEL     WK0001        RN0021                         Branch Number
     C                   MOVEL     WRCCDE        GRCCDE                         Conversion Code
     C                   Z-ADD     WRCONV        GRCONV                         Conversion Qty
     C                   MOVEL     WK0002        RN0022                         Company number
     C                   Z-ADD     WK0003        RN0023                         Delivery Date
     C                   MOVEL     WK0004        RN0024                         Grn Printed Y/N
     C                   MOVEL     WK0005        RN0025                         Item Description
     C                   MOVEL     WK0006        RN0026                         Invoice number
     C                   MOVEL     WRITEM        GRITEM                         Item Number
     C                   MOVEL     WK0007        RN0027                         Allocated account
     C                   MOVEL     WRPCDE        GRPCDE                         Pricing code
     C                   MOVEL     WRPORD        GRPORD                         Purchase Order Numbe
     C                   Z-ADD     WK0008        RN0028                         Price
     C                   Z-ADD     WRQORD        GRQORD                         Quantity Ordered
     C                   Z-ADD     WK0009        RN0029                         Received this cycle
     C                   Z-ADD     WK0010        RN0030                         Goods Received Note
     C                   MOVEL     WK0011        RN0031                         Received By
     C                   MOVEL     WK0012        RN0032                         Yes no
     C                   Z-ADD     WRREQ         GRREQ                          Date Requested yymmd
     C                   Z-ADD     WRSEQ         GRSEQ                          Sequence
     C                   MOVEL     WK0013        RN0033                         Supplier Number
     C                   MOVEL     WRUOM         GRUOM                          Unit of Measure
     C                   MOVEL     WRWHSE        GRWHSE                         Warehouse Number
     C                   MOVEL     WK0014        RN0034                         Wharehouse name
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - STOKMOV
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      11
     C                   MOVEL     WK0053        RN0099                         Company number
     C                   Z-ADD     WTDTAC        STDTAC                         Actual date
     C                   Z-ADD     WTDTTR        STDTTR                         Transaction date
     C                   MOVEL     WK0054        STITEM                         Item Number
     C                   MOVEL     WTLOCN        STLOCN                         Location
     C                   Z-ADD     WTTQTY        STTQTY                         Transaction quantity
     C                   MOVEL     WTTREF        STTREF                         Transaction Referenc
     C                   MOVEL     WTTTYP        STTTYP                         Transaction Type
     C                   Z-ADD     WTUCST        STUCST                         Input unit cost
     C                   MOVEL     WK0055        STWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      12
     C                   Z-ADD     WK0056        WDLCST                         Cost at Last Receipt
     C                   Z-ADD     WK0057        WDLRDT                         Date Of Last Receipt
     C                   Z-ADD     WK0058        WDNORP                         No. of Orders Receiv
     C                   Z-ADD     WK0059        WDNORY                         No. of Orders Receiv
     C                   Z-ADD     WK0060        WDQOH                          Quantity On Hand
     C                   Z-ADD     WK0061        WDQOO                          Quantity On Order
     C                   Z-ADD     WK0062        WDUCST                         Unit Cost / Calc / w
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      15
     C                   MOVEL     WK0068        RN0112                         Company number
     C                   MOVEL     WK0069        WTITEM                         Item Number
     C                   MOVEL     WK0070        WTTRNC                         Transaction Type
     C                   Z-ADD     WK0071        WTTRPQ                         Trans Period Quantit
     C                   Z-ADD     WK0072        WTTRPV                         Trans Period Value
     C                   Z-ADD     WK0073        WTTRYQ                         Trans YTD Quantity
     C                   Z-ADD     WK0074        WTTRYV                         Trans YTD Value
     C                   MOVEL     WK0075        WTWHSE                         Warehouse Number
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WRKPORD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0113        WK0076                         Company number
     C                   MOVEL     WKITEM        WK0077                         Item Number
     C                   Z-ADD     WKLINE        WK0078                         Line Number
     C                   MOVEL     WKLOCN        WK0079                         Location
     C                   MOVEL     WKPORD        WK0080                         Purchase Order Numbe
     C                   Z-ADD     RN0114        WK0081                         Price
     C                   Z-ADD     RN0115        WK0082                         Quantity received
     C                   Z-ADD     WKSEQ         WK0083                         Sequence
     C                   MOVEL     WKWHSE        WK0084                         Warehouse
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0113        HD0023                         Company number
     C                   MOVEL     WKPORD        HKPORD                         Purchase Order Numbe
     C                   Z-ADD     WKLINE        HKLINE                         Line Number
     C                   Z-ADD     WKSEQ         HKSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0068        WK0024                         Branch Number
     C                   MOVEL     RN0069        WK0025                         Buyers Code
     C                   Z-ADD     RN0070        WK0026                         Completed Date
     C                   MOVEL     RN0071        WK0027                         Contact name
     C                   MOVEL     RN0072        WK0028                         Company number
     C                   MOVEL     RN0073        WK0029                         Our customers ref
     C                   Z-ADD     RN0074        WK0030                         Delivery Date
     C                   Z-ADD     RN0075        WK0031                         Entered Date
     C                   Z-ADD     RN0076        WK0032                         Last Receipt Date
     C                   MOVEL     RN0077        WK0033                         Allocation Acc
     C                   Z-ADD     RN0078        WK0034                         Purchase oprders pri
     C                   Z-ADD     PHOPNL        WHOPNL                         Open Lines on order
     C                   MOVEL     PHOS01        WHOS01                         New Order
     C                   MOVEL     PHOS02        WHOS02                         Updated Order/Line s
     C                   MOVEL     PHOS03        WHOS03                         No action since last
     C                   MOVEL     PHOS04        WHOS04                         P.O. Pending
     C                   MOVEL     PHOS05        WHOS05                         Some receiving since
     C                   MOVEL     PHOS06        WHOS06                         Print P.O.Requested
     C                   MOVEL     PHOS07        WHOS07                         Print Receiving List
     C                   MOVEL     PHOS08        WHOS08                         Order fully recd
     C                   MOVEL     PHOS09        WHOS09                         special order attent
     C                   MOVEL     PHOS10        WHOS10                         P.O. has been printe
     C                   MOVEL     PHOS11        WHOS11                         P.O. has been adjust
     C                   MOVEL     PHPORD        XHPORD                         Purchase Order Numbe
     C                   Z-ADD     RN0079        WK0035                         Receiving list|Audit
     C                   MOVEL     RN0081        WK0036                         Supplier Address
     C                   MOVEL     RN0082        WK0037                         Line 2
     C                   MOVEL     RN0083        WK0038                         Line 3
     C                   MOVEL     RN0084        WK0039                         Line 4
     C                   MOVEL     RN0085        WK0040                         Line 5
     C                   MOVEL     RN0086        WK0041                         Line 6
     C                   MOVEL     RN0087        WK0042                         Supplier name
     C                   MOVEL     RN0088        WK0043                         Post code
     C                   MOVEL     RN0089        WK0044                         Supplier Account
     C                   MOVEL     PHWHSE        XHWHSE                         Warehouse
     C                   MOVEL     RN0090        WK0045                         Address
     C                   MOVEL     RN0091        WK0046                         Line 2
     C                   MOVEL     RN0092        WK0047                         Line 3
     C                   MOVEL     RN0093        WK0048                         Line 4
     C                   MOVEL     RN0094        WK0049                         Line 5
     C                   MOVEL     RN0095        WK0050                         Line 6
     C                   MOVEL     RN0096        WK0051                         Wharehouse Name
     C                   MOVEL     RN0097        WK0052                         Post code
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0072        HD0012                         Company number
     C                   MOVEL     PHPORD        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0015        HD0002                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     CDTRNP        WDTRNP                         Purchasing Trans
     C                   MOVEL     CDTRNR        WDTRNR                         Receiving Trans
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0035        HD0005                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSTRN
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     TTONHC        WTONHC                         On Hand Calculation
     C                   MOVEL     TTUPDC        WTUPDC                         Update Cost
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0039        HD0006                         Company number
     C                   MOVEL     TTTRNC        HTTRNC                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     POCCDE        WOCCDE                         Conversion Code
     C                   Z-ADD     POCONV        WOCONV                         Conversion Qty
     C                   MOVEL     RN0061        WK0017                         Company number
     C                   Z-ADD     RN0062        WK0018                         Delivery Date
     C                   MOVEL     RN0063        WK0019                         Item Description
     C                   MOVEL     POITEM        XOITEM                         Item Number
     C                   MOVEL     RN0064        WK0020                         Allocated account
     C                   MOVEL     POPCDE        WOPCDE                         Pricing code
     C                   MOVEL     POPORD        WOPORD                         Purchase Order Numbe
     C                   Z-ADD     RN0065        WK0021                         Price
     C                   Z-ADD     POQORD        XOQORD                         Quantity ordered
     C                   Z-ADD     RN0066        WK0022                         Quantity received
     C                   Z-ADD     RN0067        WK0023                         Received this cycle
     C                   Z-ADD     POSEQ         XOSEQ                          Sequence
     C                   MOVEL     POUOM         WOUOM                          Unit of Measure
     C                   MOVEL     POWHSE        XOWHSE                         Warehouse
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0061        HD0011                         Company number
     C                   MOVEL     POPORD        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     POSEQ         HOSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     RN0111        WK0063                         Company number
     C                   MOVEL     WIITEM        WK0064                         Item Number
     C                   MOVEL     WILOCN        WK0065                         Location
     C                   Z-ADD     WIQOH         WK0066                         Quantity on hand
     C                   MOVEL     WIWHSE        WK0067                         Warehouse Number
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0111        HD0019                         Company number
     C                   MOVEL     WIWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WIITEM        HD0020                         Item Number
     C                   MOVEL     WILOCN        HILOCN                         Location
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSITEM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      08
     C                   MOVEL     PIITEM        WK0016                         Item Number
     C                   Z-ADD     REC08         HRC08
     C                   MOVEL     RN0048        HD0009                         Company number
     C                   MOVEL     RN0060        HD0010                         Supplier Number
     C                   MOVEL     RN0046        HD0008                         Branch Number
     C                   MOVEL     PIITEM        HIITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      09
     C                   Z-ADD     RN0041        WK0015                         Goods Received Audit
     C                   MOVEL     CDIMS         WDIMS                          IMS to be used
     C                   Z-ADD     REC09         HRC09
     C                   MOVEL     RN0045        HD0007                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKMOV
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      11
     C                   MOVEL     RN0099        WK0053                         Company number
     C                   Z-ADD     STDTAC        WTDTAC                         Actual date
     C                   Z-ADD     STDTTR        WTDTTR                         Transaction date
     C                   MOVEL     STITEM        WK0054                         Item Number
     C                   MOVEL     STLOCN        WTLOCN                         Location
     C                   Z-ADD     STTQTY        WTTQTY                         Transaction quantity
     C                   MOVEL     STTREF        WTTREF                         Transaction Referenc
     C                   MOVEL     STTTYP        WTTTYP                         Transaction Type
     C                   Z-ADD     STUCST        WTUCST                         Input unit cost
     C                   MOVEL     STWHSE        WK0055                         Warehouse Number
     C                   Z-ADD     REC11         HRC11
     C                   MOVEL     RN0099        HD0013                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      12
     C                   Z-ADD     WDLCST        WK0056                         Cost at Last Receipt
     C                   Z-ADD     WDLRDT        WK0057                         Date Of Last Receipt
     C                   Z-ADD     WDNORP        WK0058                         No. of Orders Receiv
     C                   Z-ADD     WDNORY        WK0059                         No. of Orders Receiv
     C                   Z-ADD     WDQOH         WK0060                         Quantity On Hand
     C                   Z-ADD     WDQOO         WK0061                         Quantity On Order
     C                   Z-ADD     WDUCST        WK0062                         Unit Cost / Calc / w
     C                   Z-ADD     REC12         HRC12
     C                   MOVEL     RN0108        HD0017                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SUPLIER
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      13
     C                   MOVEL     SUCURR        WUCURR                         Currency code
     C                   Z-ADD     REC13         HRC13
     C                   MOVEL     RN0104        HD0015                         Company number
     C                   MOVEL     RN0106        HD0016                         Supplier Number
     C                   MOVEL     RN0102        HD0014                         Branch Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - CCYCOD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      14
     C                   MOVEL     CCEXCC        WCEXCC                         Exchange Calc
     C                   Z-ADD     CCEXCR        WCEXCR                         Exchange Rate
     C                   Z-ADD     REC14         HRC14
     C                   MOVEL     RN0014        HD0001                         Company number
     C                   MOVEL     CCCURR        HCCURR                         Currency code
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      15
     C                   MOVEL     RN0112        WK0068                         Company number
     C                   MOVEL     WTITEM        WK0069                         Item Number
     C                   MOVEL     WTTRNC        WK0070                         Transaction Type
     C                   Z-ADD     WTTRPQ        WK0071                         Trans Period Quantit
     C                   Z-ADD     WTTRPV        WK0072                         Trans Period Value
     C                   Z-ADD     WTTRYQ        WK0073                         Trans YTD Quantity
     C                   Z-ADD     WTTRYV        WK0074                         Trans YTD Value
     C                   MOVEL     WTWHSE        WK0075                         Warehouse Number
     C                   Z-ADD     REC15         HRC15
     C                   MOVEL     RN0112        HD0021                         Company number
     C                   MOVEL     WTWHSE        HTWHSE                         Warehouse Number
     C                   MOVEL     WTITEM        HTITEM                         Item Number
     C                   MOVEL     WTTRNC        HD0022                         Transaction Type
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C********************************************************************
     C*            C o m p i l e   T i m e   A r r a y
     C*               I n i t i a l i z a t i o n
     C********************************************************************
**   Alpha Constant Array - A1
N
Y
Cannot add Location Record Location Does no t exist
Cannot add Location Record Location Does not Exist
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SETSPEC   WSOS07    0000  0102    01                   Y
SCR001    RN0001    0000  0103    010402               Y
SCR003    ACT       0000  0103    010402               Y
