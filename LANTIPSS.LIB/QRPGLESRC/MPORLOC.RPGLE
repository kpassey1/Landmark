     F/TITLE MPORLOC    P.O. Receiving Locations
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MPORLOC
     F*  Application ID      -    MPORLOC
     F*  Application Name    -       P.O. Receiving Locations
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  WRKPORD     - (U/DISK   ) Receiving Work File         WK
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  IMSCPYD     - (I/DISK   ) IMS Company Details         CD
     F*  IMSTRN      - (I/DISK   ) IMS Transaction Types       TT
     F*  PORDD       - (I/DISK   ) IPS Purchase Order Detail
     F*  PORDH       - (I/DISK   ) IPS Purchase Order header
     F*  IPSCPYD     - (I/DISK   ) IPS Company Details         CD
     F*  WAREDETR1   - (I/DISK   ) IMS Warehouse Item Details  WD
     F*  WLOCITM1    - (I/DISK   ) IMS Loc Item In item loc
     F*  MPORLOCD    - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SC0003     - List Screen for WRKPORD
     F*
     F*  01     - SCR001S1 / FL0002 : DSPATR(PC)
     F*  01     - SCR001S1 / FL0002 : DSPATR(RI)
     F*  02     - SCR001S1 / FL0002 : DSPATR(UL)
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
     F*  SC0004     - Detail Screen for WRKPORD
     F*
     F*  01     - SCR002 / WKLOCN : DSPATR(PR)
     F*  01     - SCR002 / RN0059 : DSPATR(PR)
     F*  01     - SCR002 / RN0060 : DSPATR(PR)
     F*  01     - SCR002 / WKWHSE : DSPATR(PR)
     F*  02     - SCR002 / WKLOCN : DSPATR(UL)
     F*  02     - SCR002 / RN0059 : DSPATR(UL)
     F*  02     - SCR002 / RN0060 : DSPATR(UL)
     F*  02     - SCR002 / WKWHSE : DSPATR(UL)
     F*  03     - SCR002 / RN0059 : DSPATR(PC)
     F*  03     - SCR002 / RN0059 : DSPATR(RI)
     F*  04     - SCR002 / RN0060 : DSPATR(PC)
     F*  04     - SCR002 / RN0060 : DSPATR(RI)
     F*  05     - SCR002 / WKLOCN : DSPATR(PC)
     F*  05     - SCR002 / WKLOCN : DSPATR(RI)
     F*  06     - SCR002 / WKWHSE : DSPATR(PC)
     F*  06     - SCR002 / WKWHSE : DSPATR(RI)
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F*  SC0005     -        Select Warehouse
     F*
     F*  01     - SCR003 / T01 : DSPATR(PR)
     F*  02     - SCR003 / T01 : DSPATR(ND)
     F*  03     - SCR003 / T01 : DSPATR(PR)
     F*  04     - SCR003 / T01 : DSPATR(ND)
     F*  05     - SCR003 / T01 : DSPATR(PR)
     F*  06     - SCR003 / T01 : DSPATR(ND)
     F*  07     - SCR003 / T01 : DSPATR(PR)
     F*  08     - SCR003 / T01 : DSPATR(ND)
     F*  09     - SCR003 / T01 : DSPATR(PR)
     F*  10     - SCR003 / T01 : DSPATR(ND)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F* N79     - SCR003 PUTOVR
     F*
     F*  SC0006     -        Select Location
     F*
     F*  01     - SCR004 / T03 : DSPATR(PR)
     F*  02     - SCR004 / T03 : DSPATR(ND)
     F*  03     - SCR004 / T03 : DSPATR(PR)
     F*  04     - SCR004 / T03 : DSPATR(ND)
     F*  05     - SCR004 / T03 : DSPATR(PR)
     F*  06     - SCR004 / T03 : DSPATR(ND)
     F*  07     - SCR004 / T03 : DSPATR(PR)
     F*  08     - SCR004 / T03 : DSPATR(ND)
     F*  09     - SCR004 / T03 : DSPATR(PR)
     F*  10     - SCR004 / T03 : DSPATR(ND)
     F*  80     - SCR004 / T03 : DSPATR(PC)
     F*  80     - SCR004 / T03 : DSPATR(PC)
     F*  80     - SCR004 / T03 : DSPATR(PC)
     F*  80     - SCR004 / T03 : DSPATR(PC)
     F*  80     - SCR004 / T03 : DSPATR(PC)
     F* N79     - SCR004 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - List Screen for WRKPORD
     F* S002 - Detail Screen for WRKPORD
     F* S003 -        Select Warehouse
     F* S004 -        Select Location
     F* SREDSP -  Redisplay Windows within stack.
     F* S03BKW - SCRN SUB
     F* S03EDT - SCRN SUB
     F* S03FWD - SCRN SUB
     F* S05ABR - SCRN SUB
     F* S05AFR - SCRN SUB
     F* S05ALD - SCRN SUB
     F* S06ABR - SCRN SUB
     F* S06AFR - SCRN SUB
     F* S06ALD - SCRN SUB
     F* SMSG - calls message handling program to either clear, add, or
     F* S005   - GETREC D.company,*eq,prm001
     F* S006   - GETREC D.RECLOC,F.PORDD,F.PORDH,*EQ,prm001,prm002,prm003
     F* S007   - GETREC D.IPSCPYD,F.IPSCPYD,*EQ,PRM001
     F* S008   - SETLL D.RECLOC,F.WRKPORD,SVK004,SVK005,SVK006,SVK007
     F* S009   - GETREC D.RECLOC,F.WRKPORD,*lock,*eq,SVK004,SVK005,SVK006,SVK007
     F* S010   - GETREC D.RECLOC,F.WAREDETR1,*eq,WKCOYNO,WKITEM,WKWHSE
     F* S011   - GETREC D.RECLOC,F.WLOCITM1,*eq,WKCOYNO,WKWHSE,WKITEM,WKLOCN
     F* S012   - GETREC D.RECLOC,F.WRKPORD,*eq,SVK004,SVK005,SVK006,SVK007
     F* S013   - DELETE D.RECLOC,F.WRKPORD
     F* S014   - UPDATE D.RECLOC,F.WRKPORD
     F* S015   - WRITE D.RECLOC,F.WRKPORD
     F* S016   - GETBLK D.RECLOC,F.WRKPORD,F.WAREDETR1,F.WLOCITM1,*PV,SVK004,SVK
     F* S017   - Process To Reset File Pointer(BOF) - WRKPORD   WAREDETR1 WLOCIT
     F* S018   - Process To Reset File Pointer(EOF) - WRKPORD   WAREDETR1 WLOCIT
     F* S019   - GETREC D.RECLOC,F.WRKPORD,F.WAREDETR1,F.WLOCITM1,*EQ,WKCOYNO,WK
     F* S020   - SETLL D.RECLOC,F.WAREDETR1,SVK008,SVK009,SVK05
     F* S021   - GETREC D.RECLOC,F.WAREDETR1,*PV,SVK008,SVK009
     F* S022   - Process To Reset File Pointer(BOF) - WAREDETR1
     F* S023   - GETREC D.RECLOC,F.WAREDETR1,*NE,SVK008,SVK009
     F* S024   - Process To Reset File Pointer(EOF) - WAREDETR1
     F* S025   - SETLL D.RECLOC,F.WLOCITM1,SVK011,SVK012,SVK013,SVK06
     F* S026   - GETREC D.RECLOC,F.WLOCITM1,*PV,SVK011,SVK012,SVK013
     F* S027   - Process To Reset File Pointer(BOF) - WLOCITM1
     F* S028   - GETREC D.RECLOC,F.WLOCITM1,*NE,SVK011,SVK012,SVK013
     F* S029   - Process To Reset File Pointer(EOF) - WLOCITM1
     F* S002V - Detail Screen for WRKPORD
     F* *PSSR - Program Execution Errors Handler
     F* SCLF   - CLF : Cursor Location On Field Handler
     F* SATRIB - Display Attribute Handler
     F* SLOCK - Update Lock Flag
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FMPORLOCD  CF   E             WORKSTN
     F                                     SFILE(SCR001S1:RRN01)
     F                                     INFDS(DSPFDS)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FIMSCPYD   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FIMSTRN    IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FPORDD     IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FPORDH     IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FIPSCPYD   IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FFILE0001  IF   E           K DISK
     F                                     INFDS(FIDS08)
     F                                     INFSR(SFERR)
     FWLOCITM1  IF   E           K DISK
     F                                     INFDS(FIDS09)
     F                                     INFSR(SFERR)
     FWRKPORD   UF A E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A01             S              3    DIM(6)
     D A02             S             10    DIM(6)
     D A03             S              5  0 DIM(6)
     D A04             S              5  0 DIM(6)
     D B01             S              3    DIM(5)
     D B02             S             10    DIM(5)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D A1              S             80    DIM(8) CTDATA PERRCD(1)              Alpha constants i
     D N1              S             30  9 DIM(4) CTDATA PERRCD(1)              Numeric constants
     D DA4             S             24    DIM(5) CTDATA PERRCD(1)              CLF : Cursor Loca
     D DA5             S              8    DIM(5) ALT(DA4)
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(19) CTDATA PERRCD(1)             Fld Attr. Indic t
     D DA2             S             34    DIM(19) ALT(DA1)
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
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
     D @DS001          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
     D*
     D* Display Attribute Structure
     D*
     D @DS002          DS
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
     D C0001           C                   CONST('Record not found for-
     D                                      Edit')
     D*
     D* Named constants
     D*
     D C0002           C                   CONST('Record not found for-
     D                                      Delete')
     D*
     D* Named constants
     D*
     D C0003           C                   CONST('Record not found for-
     D                                      Display')
     D*
     D* Named constants
     D*
     D C0004           C                   CONST('Invalid cursor loc f-
     D                                     or prompt')
     D*
     D* Named constants
     D*
     D C0005           C                   CONST('Warehouse required i-
     D                                     f IMS used')
     D*
     D* Named constants
     D*
     D C0006           C                   CONST('Location required if-
     D                                      IMS used')
     D*
     D* Named constants
     D*
     D C0007           C                   CONST('Invalid action choic-
     D                                     e')
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
     D @DS003          DS
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
     D @DS004          DS
     D  T01                    1      5P 0 DIM(5)
     D  T01001                 1      1P 0
     D  T01002                 2      2P 0
     D  T01003                 3      3P 0
     D  T01004                 4      4P 0
     D  T01005                 5      5P 0
     D @DS005          DS
     D  T02                    1     15    DIM(5)
     D  T02001                 1      3
     D  T02002                 4      6
     D  T02003                 7      9
     D  T02004                10     12
     D  T02005                13     15
     D @DS006          DS
     D  T03                    1      5P 0 DIM(5)
     D  T03001                 1      1P 0
     D  T03002                 2      2P 0
     D  T03003                 3      3P 0
     D  T03004                 4      4P 0
     D  T03005                 5      5P 0
     D @DS007          DS
     D  T04                    1     50    DIM(5)
     D  T04001                 1     10
     D  T04002                11     20
     D  T04003                21     30
     D  T04004                31     40
     D  T04005                41     50
     ICOMPANYF
     I              CYCOYNO                     RN0001
     I              CYEMPCOL                    RN0002
     I              CYEMPHEAD                   RN0003
     I              CYPRDHEAD                   RN0004
     I              CYREFHEAD                   RN0005
     I              CYSDESC                     RN0006
     IIMSCPYDF
     I              CDCOYNO                     RN0007
     I              CDHEAD1                     RN0008
     I              CDHEAD2                     RN0009
     I              CDHEAD3                     RN0010
     IIMSTRMF
     I              TTCOYNO                     RN0011
     IIPSCPYDF
     I              CDAUDAM                     RN0012
     I              CDAUDGR                     RN0013
     I              CDAUDOR                     RN0014
     I              CDAUDPR                     RN0015
     I              CDAUDRE                     RN0016
     I              CDCOYNO                     RN0017
     IPORDDF
     I              POCOYNO                     RN0018
     I              PODLVDT                     RN0019
     I              POIDESC                     RN0020
     I              PONLALL                     RN0021
     I              POPRICE                     RN0022
     I              POQRCVD                     RN0023
     I              POQRCYC                     RN0024
     IPORDHF
     I              PHBRNBR                     RN0025
     I              PHBUYER                     RN0026
     I              PHCMPDT                     RN0027
     I              PHCONNAM                    RN0028
     I              PHCOYNO                     RN0029
     I              PHCUSORD                    RN0030
     I              PHDLVDT                     RN0031
     I              PHENTDT                     RN0032
     I              PHLRCVDT                    RN0033
     I              PHNLALL                     RN0034
     I              PHNOPOS                     RN0035
     I              PHRLAUD                     RN0036
     I              PHSHIPV                     RN0037
     I              PHSLIN1                     RN0038
     I              PHSLIN2                     RN0039
     I              PHSLIN3                     RN0040
     I              PHSLIN4                     RN0041
     I              PHSLIN5                     RN0042
     I              PHSLIN6                     RN0043
     I              PHSNAME                     RN0044
     I              PHSPSTCD                    RN0045
     I              PHSUPPN                     RN0046
     I              PHWLIN1                     RN0047
     I              PHWLIN2                     RN0048
     I              PHWLIN3                     RN0049
     I              PHWLIN4                     RN0050
     I              PHWLIN5                     RN0051
     I              PHWLIN6                     RN0052
     I              PHWNAME                     RN0053
     I              PHWPSTCD                    RN0054
     IWDETAILF
     I              WDCOYNO                     RN0055
     I              WDSUPPN                     RN0056
     IWLOCITMF
     I              WICOYNO                     RN0057
     IWRKPORDF
     I              WKCOYNO                     RN0058
     I              WKPRICE                     RN0059
     I              WKQRCVD                     RN0060
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRM001            3
     C                   PARM                    PRM002           10
     C                   PARM                    PRM003            5 0
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
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C                   KFLD                    KOSE03
     C*
     C     K0004         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C*
     C     K0005         KLIST
     C                   KFLD                    KDCO01
     C*
     C     K0006         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C                   KFLD                    KOSE03
     C                   KFLD                    KKSE04
     C*
     C     K0007         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KKIT02
     C                   KFLD                    KKWH03
     C*
     C     K0008         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KKWH02
     C                   KFLD                    KKIT03
     C                   KFLD                    KKLO04
     C*
     C     K0009         KLIST
     C                   KFLD                    KKCO01
     C                   KFLD                    KKPO02
     C                   KFLD                    KKLI03
     C*
     C     K0010         KLIST
     C                   KFLD                    KDCO02
     C                   KFLD                    KDIT03
     C                   KFLD                    KDWH04
     C*
     C     K0011         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KIIT03
     C                   KFLD                    KILO04
     C*
     C     K0012         KLIST
     C                   KFLD                    KKCO01
     C                   KFLD                    KKPO02
     C                   KFLD                    KKLI03
     C                   KFLD                    KKSE04
     C*
     C     K0013         KLIST
     C                   KFLD                    KDCO02
     C                   KFLD                    KDIT03
     C*
     C     K0014         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KIIT03
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYDESC        WYDESC                         Company description
     C     *LIKE         DEFINE    CDIMS         WDIMS                          IMS to be used
     C     *LIKE         DEFINE    RN0018        WK0001                         Company number
     C     *LIKE         DEFINE    POPORD        WOPORD                         Purchase Order Numbe
     C     *LIKE         DEFINE    RN0029        WK0005                         Company number
     C     *LIKE         DEFINE    RN0055        WK0007                         Company number
     C     *LIKE         DEFINE    WDITEM        WK0008                         Item Number
     C     *LIKE         DEFINE    WDWHSE        WK0009                         Warehouse Number
     C     *LIKE         DEFINE    RN0057        WK0010                         Company number
     C     *LIKE         DEFINE    WIITEM        WK0011                         Item Number
     C     *LIKE         DEFINE    WILOCN        WK0012                         Location
     C     *LIKE         DEFINE    WIWHSE        WK0013                         Warehouse Number
     C     *LIKE         DEFINE    RN0058        WK0014                         Company number
     C     *LIKE         DEFINE    WKLINE        WK0015                         Line Number
     C     *LIKE         DEFINE    WKPORD        WK0016                         Purchase Order Numbe
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0001        HD0001
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0007        HD0002
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0011        HD0003
     C     *LIKE         DEFINE    TTTRNC        HTTRNC
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0017        HD0004
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0018        HD0005
     C     *LIKE         DEFINE    POPORD        HOPORD
     C     *LIKE         DEFINE    POSEQ         HOSEQ
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0029        HD0006
     C     *LIKE         DEFINE    PHPORD        HHPORD
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
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *ZEROS        SVCY              4 0          Save days
     C                   MOVE      *ZEROS        SVCC              2 0          Save century
     C                   MOVE      1             CHKVAR            1 0          Perform Valid.
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z3                3 0          Loop Counter . . . .
     C                   MOVE      *BLANKS       ERROR             1
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *ZEROS        FL0002            1 0
     C                   MOVE      *BLANKS       FST05             3
     C                   MOVE      *BLANKS       FST06            10
     C                   MOVE      *BLANKS       F04001            3
     C                   MOVE      *BLANKS       F04002           10
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *ZEROS        Z4                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z5                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z6                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *BLANKS       LST05             3
     C                   MOVE      *BLANKS       LST06            10
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *ZEROS        PS0301            5 0
     C                   MOVE      *BLANKS       SVDESC           40
     C                   MOVE      *BLANKS       SVK004            3
     C                   MOVE      *BLANKS       SVK005           10
     C                   MOVE      *ZEROS        SVK006            5 0
     C                   MOVE      *ZEROS        SVK007            5 0
     C                   MOVE      *BLANKS       SVK008            3
     C                   MOVE      *BLANKS       SVK009           20
     C                   MOVE      *BLANKS       SVK010            3
     C                   MOVE      *BLANKS       SVK011            3
     C                   MOVE      *BLANKS       SVK012            3
     C                   MOVE      *BLANKS       SVK013           20
     C                   MOVE      *BLANKS       SVK014           10
     C                   MOVE      *BLANKS       SVK05             3
     C                   MOVE      *BLANKS       SVK06            10
     C                   MOVE      *ZEROS        S05CNT            3 0
     C                   MOVE      *ZEROS        S06CNT            3 0
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       SWRD03            1            RD STS
     C                   MOVE      *BLANKS       SWRD04            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       KDTR02            2            CDTRNP
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD08            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD09            1            RD STS          0030
     C                   MOVE      *BLANKS       KOCO01            3            POCOYNO
     C                   MOVE      *BLANKS       KOPO02           10            POPORD
     C                   MOVE      *ZEROS        KOSE03            5 0          POSEQ
     C                   MOVE      *BLANKS       SWRD07            1            RD STS          0030
     C                   MOVE      *BLANKS       KDCO01            3            CDCOYNO
     C                   MOVE      *ZEROS        KKSE04            5 0          WKSEQ
     C                   MOVE      *BLANKS       KKIT02           20            WKITEM
     C                   MOVE      *BLANKS       KKWH03            3            WKWHSE
     C                   MOVE      *BLANKS       KKWH02            3            WKWHSE
     C                   MOVE      *BLANKS       KKIT03           20            WKITEM
     C                   MOVE      *BLANKS       KKLO04           10            WKLOCN
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       KKCO01            3            WKCOYNO
     C                   MOVE      *BLANKS       KKPO02           10            WKPORD
     C                   MOVE      *ZEROS        KKLI03            5 0          WKLINE
     C                   MOVE      *BLANKS       KDCO02            3            WDCOYNO
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       KDWH04            3            WDWHSE
     C                   MOVE      *BLANKS       KICO01            3            WICOYNO
     C                   MOVE      *BLANKS       KIWH02            3            WIWHSE
     C                   MOVE      *BLANKS       KIIT03           20            WIITEM
     C                   MOVE      *BLANKS       KILO04           10            WILOCN
     C                   MOVE      *ZEROS        VALIDF            1 0          Flag for validation
     C                   MOVE      *ZEROS        RANGEF            1 0          Range chk flag
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *BLANKS       APPSET           10
     C                   MOVE      'D'           APPTYP            1
     C                   MOVE      *BLANKS       APPSCR           10
     C                   MOVE      *ZEROS        APPROW            3 0
     C                   MOVE      *ZEROS        APPCOL            3 0
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   MOVE      *ZEROS        T01001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T01002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T01003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T01004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T01005                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T03001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T03002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T03003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T03004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T03005                         Init DS/*DTA flds
     C                   MOVEL     'LANDIPS'     APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   Z-ADD     1             XRN01
     C                   Z-ADD     *ZEROS        X0                4 0          INDEX 0
     C                   Z-ADD     *ZEROS        X1                3 0          INDEX 1
     C                   Z-ADD     *ZEROS        OFFSET            4 0          OFFSET
     C                   Z-ADD     *ZEROS        NRSLT            30 9          RESULT
     C                   Z-ADD     *ZEROS        X0                4 0          INDEX 0
     C                   Z-ADD     *ZEROS        SP                3 0          Stk ptr
     C                   Z-ADD     *ZEROS        CT                3 0          Counter
     C                   Z-ADD     *ZEROS        SRN01             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN01             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN01             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     *ZEROS        SVS08             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        RN0061           30 9
     C                   Z-ADD     *ZEROS        SVS09             5 0          SV STS
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     *ZEROS        XNO               1 0          *NO keyword
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C                   MOVE      '0'           *IN60
     C*
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
     C                   MOVEL     'SC0003'      SCRNID
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SC0003'      S001
     C     SCRNID        CASEQ     'SC0004'      S002
     C     SCRNID        CASEQ     'SC0005'      S003
     C     SCRNID        CASEQ     'SC0006'      S004
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
     C* S001 - List Screen for WRKPORD
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '01'          *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* POSEQ = 0
     C                   Z-ADD     *ZERO         XOSEQ
     C*                                                               *
     C* Set Keys to values from header file.
     C* PS0301 = 0
     C                   Z-ADD     *ZERO         PS0301
     C* WKCOYNO = prm001
     C                   MOVE      PRM001        WK0014
     C* WKPORD = prm002
     C                   MOVE      PRM002        WK0016
     C* WKLINE = prm003
     C                   Z-ADD     PRM003        WK0015
     C* SVK004 = prm001
     C                   MOVE      PRM001        SVK004
     C* SVK005 = prm002
     C                   MOVE      PRM002        SVK005
     C* SVK006 = prm003
     C                   Z-ADD     PRM003        SVK006
     C* SVK007 = PS0301
     C                   Z-ADD     PS0301        SVK007
     C* GETREC D.company,*eq,prm001
     C*
     C                   EXSR      S005
     C* SVDESC = cydesc
     C                   MOVE      WYDESC        SVDESC
     C* GETREC D.RECLOC,F.PORDD,F.PORDH,*EQ,prm001,prm002,prm003
     C*
     C                   EXSR      S006
     C* Get company details for IMS usage.
     C* GETREC D.IPSCPYD,F.IPSCPYD,*EQ,PRM001
     C*
     C                   EXSR      S007
     C*                                                               *
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.RECLOC,F.WRKPORD,SVK004,SVK005,SVK006,SVK007
     C*
     C                   EXSR      S008
     C*                                                               *
     C* Fill List panel.
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
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
     C* *** Return to calling program
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Create
     C*
     C     *INKF         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Process ADD Request on function key 6
     C*                                                               *
     C* MODE = 6
     C                   Z-ADD     6             MODE
     C* EXSCR SC0004
     C                   ADD       1             SP
     C                   MOVEL     'SC0003  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* SETLL D.RECLOC,F.WRKPORD,SVK004,SVK005,SVK006,SVK007
     C*
     C                   EXSR      S008
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*     1. Check for any selected records.
     C* EXSUBR S03EDT
     C                   EXSR      S03EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S03BKW
     C                   EXSR      S03BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C*     1. Check for selected records.
     C* EXSUBR S03EDT
     C                   EXSR      S03EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Check for any selected records on post-enter.
     C*                                                               *
     C* Reset reposition flag and check for any
     C* selected records.
     C* POSFLG = 0
     C                   Z-ADD     *ZERO         POSFLG
     C* EXSUBR S03EDT
     C                   EXSR      S03EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* *** Check for reposition
     C*                                                               *
     C* IF PS0301<>0
     C     PS0301        IFNE      *ZERO
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* If reposition values entered, set key
     C* values to reposition values.
     C* SVK007 = PS0301
     C                   Z-ADD     PS0301        SVK007
     C* PS0301 = 0
     C                   Z-ADD     *ZERO         PS0301
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.RECLOC,F.WRKPORD,SVK004,SVK005,SVK006,SVK007
     C*
     C                   EXSR      S008
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00199        ENDSR
     C/EJECT
     C*****************************************************************
     C* S002 - Detail Screen for WRKPORD
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '000000'      *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C*                                                               *
     C* Refresh exit flag at start of detail
     C* EXTSCR = 0
     C                   Z-ADD     *ZERO         EXTSCR
     C*                                                               *
     C* Process Edit, Delete, and Display action choices
     C* IF MODE=2 | MODE=4 | MODE=5
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C     MODE          OREQ      5
     C*                                                               *
     C* Save Key values prior to clearing screens,
     C* otherwise, keys will be lost when screen is
     C* cleared.
     C* SVK004 = WKCOYNO
     C                   MOVE      WK0014        SVK004
     C* SVK005 = WKPORD
     C                   MOVE      WK0016        SVK005
     C* SVK006 = WKLINE
     C                   Z-ADD     WK0015        SVK006
     C* SVK007 = WKSEQ
     C                   Z-ADD     XKSEQ         SVK007
     C* WKWHSE = ' '
     C                   MOVEL     *BLANKS       XKWHSE
     C* WKLOCN = ' '
     C                   MOVEL     *BLANKS       XKLOCN
     C* WKQRCVD = 0
     C                   Z-ADD     *ZERO         WK0018
     C* WKPRICE = 0
     C                   Z-ADD     *ZERO         WK0017
     C* WKCOYNO = SVK004
     C                   MOVE      SVK004        WK0014
     C* WKPORD = SVK005
     C                   MOVE      SVK005        WK0016
     C* WKLINE = SVK006
     C                   Z-ADD     SVK006        WK0015
     C* WKSEQ = SVK007
     C                   Z-ADD     SVK007        XKSEQ
     C* GRPATR grppr1,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'GRPPR1  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GRPATR grppr1,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GRPPR1  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETREC D.RECLOC,F.WRKPORD,*lock,*eq,SVK004,SVK005,SVK006,SVK007
     C*
     C                   EXSR      S009
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.RECLOC,F.WRKPORD)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK01         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.RECLOC,F.WRKPORD)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Edit'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* GETREC D.RECLOC,F.WAREDETR1,*eq,WKCOYNO,WKITEM,WKWHSE
     C*
     C                   EXSR      S010
     C* GETREC D.RECLOC,F.WLOCITM1,*eq,WKCOYNO,WKWHSE,WKITEM,WKLOCN
     C*
     C                   EXSR      S011
     C* MODDSC = 'CHANGE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'CHANGE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Protect Data fields from being changed for
     C* delete and display action choices.
     C* GRPATR grppr1,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'GRPPR1  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.RECLOC,F.WRKPORD,*lock,*eq,SVK004,SVK005,SVK006,SVK007
     C*
     C                   EXSR      S009
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.RECLOC,F.WRKPORD)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK01         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.RECLOC,F.WRKPORD)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Delete'
     C                   MOVEL     C0002         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* GETREC D.RECLOC,F.WAREDETR1,*eq,WKCOYNO,WKITEM,WKWHSE
     C*
     C                   EXSR      S010
     C* GETREC D.RECLOC,F.WLOCITM1,*eq,WKCOYNO,WKWHSE,WKITEM,WKLOCN
     C*
     C                   EXSR      S011
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.RECLOC,F.WRKPORD,*eq,SVK004,SVK005,SVK006,SVK007
     C*
     C                   EXSR      S012
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.RECLOC,F.WRKPORD)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Display'
     C                   MOVEL     C0003         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* GETREC D.RECLOC,F.WAREDETR1,*eq,WKCOYNO,WKITEM,WKWHSE
     C*
     C                   EXSR      S010
     C* GETREC D.RECLOC,F.WLOCITM1,*eq,WKCOYNO,WKWHSE,WKITEM,WKLOCN
     C*
     C                   EXSR      S011
     C* MODDSC = 'DISPLAY'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DISPLAY'     MODDSC
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C*                                                               *
     C* Clear screens for Add function.
     C* GRPATR grppr1,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'GRPPR1  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* GRPATR grppr1,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GRPPR1  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* WKWHSE = ' '
     C                   MOVEL     *BLANKS       XKWHSE
     C* WKLOCN = ' '
     C                   MOVEL     *BLANKS       XKLOCN
     C* WKQRCVD = 0
     C                   Z-ADD     *ZERO         WK0018
     C* WKPRICE = 0
     C                   Z-ADD     *ZERO         WK0017
     C* WKCOYNO = POCOYNO
     C                   MOVE      WK0001        WK0014
     C* WKITEM = POITEM
     C                   MOVE      XOITEM        XKITEM
     C* WKPORD = POPORD
     C                   MOVE      WOPORD        WK0016
     C* WKLINE = POSEQ
     C                   Z-ADD     XOSEQ         WK0015
     C* SVK004 = POCOYNO
     C                   MOVE      WK0001        SVK004
     C* SVK005 = POPORD
     C                   MOVE      WOPORD        SVK005
     C* SVK006 = POSEQ
     C                   Z-ADD     XOSEQ         SVK006
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
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
     C                   MOVEA     '0000'        *IN(3)
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
     C* Prompt
     C*
     C     *INKD         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* ** Check for any prompt fields.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* ** Check header fields for prompt.
     C* ** check detail fields for prompt
     C*                                                               *
     C* IF MODE=2|MODE=6
     C     MODE          IFEQ      2
     C     MODE          OREQ      6
     C*                                                               *
     C* IF %clf(RECLOC.WRKPORD.WKWHSE)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XKWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* ** Clear prompt work field used by
     C* ** prompt window.
     C* F04001 = ' '
     C                   MOVEL     *BLANKS       F04001
     C* ** Display prompt window.
     C* EXSCR SC0005
     C                   ADD       1             SP
     C                   MOVEL     'SC0004  '    SID(SP)
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
     C* ** Signal that F4 has been processed.
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* ** If user selected a value, the prompt
     C* ** work field will be filled in. Load
     C* ** this value to field being prompted.
     C* IF F04001<>' '
     C     F04001        IFNE      *BLANKS
     C* WKWHSE = F04001
     C                   MOVE      F04001        XKWHSE
     C* GETREC D.RECLOC,F.WAREDETR1,*eq,WKCOYNO,WKITEM,WKWHSE
     C*
     C                   EXSR      S010
     C* GETREC D.RECLOC,F.WLOCITM1,*eq,WKCOYNO,WKWHSE,WKITEM,WKLOCN
     C*
     C                   EXSR      S011
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF %clf(RECLOC.WRKPORD.WKLOCN)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XKLOCN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* ** Clear prompt work field used by
     C* ** prompt window.
     C* F04002 = ' '
     C                   MOVEL     *BLANKS       F04002
     C* ** Display prompt window.
     C* EXSCR SC0006
     C                   ADD       1             SP
     C                   MOVEL     'SC0004  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S004
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* ** Signal that F4 has been processed.
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* ** If user selected a value, the prompt
     C* ** work field will be filled in. Load
     C* ** this value to field being prompted.
     C* IF F04002<>' '
     C     F04002        IFNE      *BLANKS
     C* WKLOCN = F04002
     C                   MOVE      F04002        XKLOCN
     C* GETREC D.RECLOC,F.WAREDETR1,*eq,WKCOYNO,WKITEM,WKWHSE
     C*
     C                   EXSR      S010
     C* GETREC D.RECLOC,F.WLOCITM1,*eq,WKCOYNO,WKWHSE,WKITEM,WKLOCN
     C*
     C                   EXSR      S011
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If no fields processed for prompt
     C* ** (UPDFLG=0), display error.
     C* IF UPDFLG=0
     C     UPDFLG        IFEQ      *ZERO
     C* DSPERR *none,'Invalid cursor loc for prompt'
     C                   MOVEL     C0004         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to list panel on function key 12
     C* Set exit flag to signal previous screen
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C*                                                               *
     C* Release record if edit or delete functions
     C* IF mode=2 | mode=4
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C* RLSREC D.RECLOC,F.WRKPORD
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   UNLOCK    WRKPORD                              91      RLS LCK WRKPORD
     C* END                                                           *
     C                   END
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Delete
     C*
     C     *INKN         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Perform updates to file on function key 14
     C*                                                               *
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* DELETE D.RECLOC,F.WRKPORD
     C*
     C                   EXSR      S013
     C*                                                               *
     C* IF %STS(D.RECLOC,F.WRKPORD)=*YES
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S002V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C* *** Perform updates to file on f14
     C* *** IMS in use?
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C* IF cdims ='Y'
     C     WDIMS         IFEQ      'Y'
     C* * W/house and locn required if IMS used.
     C* IF wkwhse = ' ' *OR wklocn = ' '
     C     XKWHSE        IFEQ      *BLANKS
     C     XKLOCN        OREQ      *BLANKS
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF ERROR ='N'
     C     ERROR         IFEQ      'N'
     C* ** Revise
     C* IF MODE=2|MODE=6
     C     MODE          IFEQ      2
     C     MODE          OREQ      6
     C*                                                               *
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* UPDATE D.RECLOC,F.WRKPORD
     C*
     C                   EXSR      S014
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.RECLOC,F.WRKPORD
     C*
     C                   EXSR      S015
     C* ** Set keys for first record to display.
     C* SVK004 = WKCOYNO
     C                   MOVE      WK0014        SVK004
     C* SVK005 = WKPORD
     C                   MOVE      WK0016        SVK005
     C* SVK006 = WKLINE
     C                   Z-ADD     WK0015        SVK006
     C* SVK007 = WKSEQ
     C                   Z-ADD     XKSEQ         SVK007
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.RECLOC,F.WRKPORD)=*YES
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ELSE  ;ERROR = 'Y'
     C                   ELSE
     C* IF wkwhse = ' '
     C     XKWHSE        IFEQ      *BLANKS
     C* DSPERR WKWHSE,'Warehouse required if IMS used'
     C                   MOVEL     C0005         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XKWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* IF wklocn = ' '
     C     XKLOCN        IFEQ      *BLANKS
     C* DSPERR WKLOCN,'Location required if IMS used'
     C                   MOVEL     C0006         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XKLOCN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 -        Select Warehouse
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST05 = ' '
     C                   MOVEL     *BLANKS       FST05
     C* LST05 = ' '
     C                   MOVEL     *BLANKS       LST05
     C* SVK05 = ' '
     C                   MOVEL     *BLANKS       SVK05
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK008 = WKCOYNO
     C                   MOVE      WK0014        SVK008
     C* SVK009 = WKITEM
     C                   MOVE      XKITEM        SVK009
     C* S05CNT = 005
     C                   Z-ADD     005           S05CNT
     C* ** Array forward read.
     C* EXSUBR S05AFR
     C                   EXSR      S05AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
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
     C                   EXFMT     SCR003
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
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK05 = FST05
     C                   MOVE      FST05         SVK05
     C* ** Array Backwards read.
     C* EXSUBR S05ABR
     C                   EXSR      S05ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK05 = LST05
     C                   MOVE      LST05         SVK05
     C* ** Array Forward Read.
     C* EXSUBR S05AFR
     C                   EXSR      S05AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I05 = 1
     C                   Z-ADD     1             Z5
     C* DOW (I05<=C05)&(T01(I05)<>1)
     C     Z5            DOWLE     Z2
     C     T01(Z5)       ANDNE     1
     C* I05 = I05+1
     C     Z5            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z5
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I05<=C05)&(T01(I05)=1)
     C     Z5            IFLE      Z2
     C     T01(Z5)       ANDEQ     1
     C* F04001 = B01(I05)
     C                   MOVE      B01(Z5)       F04001
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00399        ENDSR
     C/EJECT
     C*****************************************************************
     C* S004 -        Select Location
     C*****************************************************************
     C     S004          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST06 = ' '
     C                   MOVEL     *BLANKS       FST06
     C* LST06 = ' '
     C                   MOVEL     *BLANKS       LST06
     C* SVK06 = ' '
     C                   MOVEL     *BLANKS       SVK06
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK011 = WKCOYNO
     C                   MOVE      WK0014        SVK011
     C* SVK012 = WKWHSE
     C                   MOVE      XKWHSE        SVK012
     C* SVK013 = WKITEM
     C                   MOVE      XKITEM        SVK013
     C* S06CNT = 005
     C                   Z-ADD     005           S06CNT
     C* ** Array forward read.
     C* EXSUBR S06AFR
     C                   EXSR      S06AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
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
     C                   EXFMT     SCR004
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
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK06 = FST06
     C                   MOVE      FST06         SVK06
     C* ** Array Backwards read.
     C* EXSUBR S06ABR
     C                   EXSR      S06ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK06 = LST06
     C                   MOVE      LST06         SVK06
     C* ** Array Forward Read.
     C* EXSUBR S06AFR
     C                   EXSR      S06AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I06 = 1
     C                   Z-ADD     1             Z6
     C* DOW (I06<=C06)&(T03(I06)<>1)
     C     Z6            DOWLE     Z3
     C     T03(Z6)       ANDNE     1
     C* I06 = I06+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I06<=C06)&(T03(I06)=1)
     C     Z6            IFLE      Z3
     C     T03(Z6)       ANDEQ     1
     C* F04002 = B02(I06)
     C                   MOVE      B02(Z6)       F04002
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00499        ENDSR
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
     C     SID(CT)       IFEQ      'SC0003'
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR001
     C                   WRITE     SCR001C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0004'
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0005'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR003
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0006'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR004
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
     C* S03BKW - SCRN SUB
     C*****************************************************************
     C     S03BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* C03 = 0
     C                   Z-ADD     *ZERO         Z1
     C* A004 = ' '
     C                   MOVEA     *BLANKS       A01
     C* A005 = ' '
     C                   MOVEA     *BLANKS       A02
     C* A006 = 0
     C                   Z-ADD     *ZERO         A03
     C* A007 = 0
     C                   Z-ADD     *ZERO         A04
     C* GETBLK D.RECLOC,F.WRKPORD,F.WAREDETR1,F.WLOCITM1,*PV,SVK004,SVK005,SVK00
     C*        6,*SUPPRESS
     C*
     C                   EXSR      S016
     C*
     C                   MOVEL     *BLANK        KKCO01
     C                   MOVEL     SVK004        KKCO01
     C                   MOVEL     *BLANK        KKPO02
     C                   MOVEL     SVK005        KKPO02
     C                   Z-ADD     SVK006        KKLI03
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     6             WLCNTR                         INIT LOOP CNTR
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.WRKPORD   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   Z-ADD     *ZEROS        XKSEQ
     C                   MOVEL     *BLANKS       XKWHSE
     C                   MOVEL     *BLANKS       XKLOCN
     C                   Z-ADD     *ZEROS        WK0018
     C                   Z-ADD     *ZEROS        WK0017
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0009         READE(N)  WRKPORD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0009                         Company number
     C                   MOVEL     *BLANK        HKPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HKLINE                         Line Number
     C                   Z-ADD     *ZERO         HKSEQ                          Auto incr. Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.WRKPORD   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO02                         Company number
     C                   MOVEL     RN0058        KDCO02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WKITEM        KDIT03
     C                   MOVEL     *BLANK        KDWH04
     C                   MOVEL     WKWHSE        KDWH04
     C     K0010         CHAIN     FILE0001                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0058        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     WKWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     WKITEM        KIIT03
     C                   MOVEL     *BLANK        KILO04
     C                   MOVEL     WKLOCN        KILO04
     C     K0011         CHAIN     WLOCITM1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WLOCITM1
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WLOCITM1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C* C03 = C03+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* A004(C03) = WKCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0014        A01(Z1)
     C* A005(C03) = WKPORD
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      WK0016        A02(Z1)
     C* A006(C03) = WKLINE
     C                   Z-ADD     WK0015        A03(Z1)
     C* A007(C03) = WKSEQ
     C                   Z-ADD     XKSEQ         A04(Z1)
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
     C                   Z-ADD     WRRN01        WCNTR                          SYNC THE COUNTR
     C     RRN01         IFGT      SRN01
     C                   Z-ADD     SRN01         RRN01
     C                   END
     C                   EXSR      S018                                         CHK EOF
     C*
     C     $S03BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03EDT - SCRN SUB
     C*****************************************************************
     C     S03EDT        BEGSR
     C*
     C* ** Process Maintenance on Detail Panel (MB)
     C* **   1. Check for any selected records, If record
     C* **      selected, display detail panel.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* I03 = 0
     C                   Z-ADD     *ZERO         Z4
     C* DOBLK D.RECLOC
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
     C                   MOVEA     '01'          *IN(1)
     C* I03 = I03+1
     C     Z4            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z4
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0002=2)|(FL0002=4)|(FL0002=5)
     C     FL0002        IFEQ      2
     C     FL0002        OREQ      4
     C     FL0002        OREQ      5
     C* MODE = FL0002
     C                   Z-ADD     FL0002        MODE
     C* ** set keys from hidden key arrays.
     C* WKCOYNO = A004(I03)
     C                   MOVE      A01(Z4)       WK0014
     C* WKPORD = A005(I03)
     C                   MOVE      A02(Z4)       WK0016
     C* WKLINE = A006(I03)
     C                   Z-ADD     A03(Z4)       WK0015
     C* WKSEQ = A007(I03)
     C                   Z-ADD     A04(Z4)       XKSEQ
     C* ** Get record and any secondary records.
     C* GETREC D.RECLOC,F.WRKPORD,F.WAREDETR1,F.WLOCITM1,*EQ,WKCOYNO,WKPORD,WKLI
     C*        NE,WKSEQ
     C*
     C                   EXSR      S019
     C* ** Display Screen.
     C* EXSCR SC0004
     C                   ADD       1             SP
     C                   MOVEL     'SC0003  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03ED
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* FL0002 = 0
     C                   Z-ADD     *ZERO         FL0002
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** Process any optional action codes.
     C*    1. Set keys from hidden key arrays.
     C*    2. Get record and any secondary records.
     C*    3. Display Screen.
     C*                                                               *
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0002<>0)&(UPDFLG=0)
     C     FL0002        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0002,'Invalid action choice'
     C                   MOVEL     C0007         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     '01'          *IN(1)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN01         RRN01
     C                   MOVEA     INS01         *IN
     C*
     C*
     C*
     C     $S03ED        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03FWD - SCRN SUB
     C*****************************************************************
     C     S03FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C03 = 0
     C                   Z-ADD     *ZERO         Z1
     C* A004 = ' '
     C                   MOVEA     *BLANKS       A01
     C* A005 = ' '
     C                   MOVEA     *BLANKS       A02
     C* A006 = 0
     C                   Z-ADD     *ZERO         A03
     C* A007 = 0
     C                   Z-ADD     *ZERO         A04
     C* GETBLK D.RECLOC,F.WRKPORD,F.WAREDETR1,F.WLOCITM1,*NE,SVK004,SVK005,SVK00
     C*        6,*SUPPRESS
     C*
     C*
     C                   MOVEL     *BLANK        KKCO01
     C                   MOVEL     SVK004        KKCO01
     C                   MOVEL     *BLANK        KKPO02
     C                   MOVEL     SVK005        KKPO02
     C                   Z-ADD     SVK006        KKLI03
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     6             WLCNTR                         INIT LOOP CNTR
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.WRKPORD   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   Z-ADD     *ZEROS        XKSEQ
     C                   MOVEL     *BLANKS       XKWHSE
     C                   MOVEL     *BLANKS       XKLOCN
     C                   Z-ADD     *ZEROS        WK0018
     C                   Z-ADD     *ZEROS        WK0017
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0009         READE(N)  WRKPORD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0009                         Company number
     C                   MOVEL     *BLANK        HKPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HKLINE                         Line Number
     C                   Z-ADD     *ZERO         HKSEQ                          Auto incr. Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.WRKPORD   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO02                         Company number
     C                   MOVEL     RN0058        KDCO02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WKITEM        KDIT03
     C                   MOVEL     *BLANK        KDWH04
     C                   MOVEL     WKWHSE        KDWH04
     C     K0010         CHAIN     FILE0001                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0058        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     WKWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     WKITEM        KIIT03
     C                   MOVEL     *BLANK        KILO04
     C                   MOVEL     WKLOCN        KILO04
     C     K0011         CHAIN     WLOCITM1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WLOCITM1
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WLOCITM1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C* C03 = C03+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* A004(C03) = WKCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0014        A01(Z1)
     C* A005(C03) = WKPORD
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      WK0016        A02(Z1)
     C* A006(C03) = WKLINE
     C                   Z-ADD     WK0015        A03(Z1)
     C* A007(C03) = WKSEQ
     C                   Z-ADD     XKSEQ         A04(Z1)
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
     C                   Z-ADD     WRRN01        WCNTR                          SYNC THE COUNTR
     C     RRN01         IFGT      SRN01
     C                   Z-ADD     SRN01         RRN01
     C                   END
     C                   EXSR      S018                                         RESET FP
     C*                                                               *
     C* IF c03 = 0
     C     Z1            IFEQ      *ZERO
     C* EXSUBR s03bkw
     C                   EXSR      S03BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $S03FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* S05ABR - SCRN SUB
     C*****************************************************************
     C     S05ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C05 = 0
     C                   Z-ADD     *ZERO         Z2
     C* ** Set pointer to first record on screen.
     C* SETLL D.RECLOC,F.WAREDETR1,SVK008,SVK009,SVK05
     C*
     C                   EXSR      S020
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.RECLOC,F.WAREDETR1,*PV,SVK008,SVK009
     C*
     C                   EXSR      S021
     C* DOW (C05<S05CNT)&%STS(D.RECLOC,F.WAREDETR1)=*YES
     C     Z2            IFLT      S05CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C05 = C05+1
     C     Z2            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z2
     C* GETREC D.RECLOC,F.WAREDETR1,*PV,SVK008,SVK009
     C*
     C                   EXSR      S021
     C* END                                                           *
     C     Z2            IFLT      S05CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0061        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S05ALD
     C                   EXSR      S05ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S05AB
     C                   END
     C*
     C     $S05AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S05AFR - SCRN SUB
     C*****************************************************************
     C     S05AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.RECLOC,F.WAREDETR1,SVK008,SVK009,SVK05
     C*
     C                   EXSR      S020
     C* ** Load arrays from this point.
     C* EXSUBR S05ALD
     C                   EXSR      S05ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S05AF
     C                   END
     C*
     C     $S05AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S05ALD - SCRN SUB
     C*****************************************************************
     C     S05ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T01 = 0
     C                   Z-ADD     *ZERO         T01
     C* B01 = ' '
     C                   MOVEA     *BLANKS       B01
     C* T02 = ' '
     C                   MOVEA     *BLANKS       T02
     C* C05 = 0
     C                   Z-ADD     *ZERO         Z2
     C* ** protect select field
     C* DOW C05<S05CNT
     C     Z2            DOWLT     S05CNT
     C* C05 = C05+1
     C     Z2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* FLDATR T01(C05),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z2            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C05 = 0
     C                   Z-ADD     *ZERO         Z2
     C* GETREC D.RECLOC,F.WAREDETR1,*NE,SVK008,SVK009
     C*
     C                   EXSR      S023
     C* DOW (C05<S05CNT)&%STS(D.RECLOC,F.WAREDETR1)=*YES
     C     Z2            IFLT      S05CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C05 = C05+1
     C     Z2            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z2
     C* ** Unprotect select field.
     C* FLDATR T01(C05),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z2            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B01(C05) = RECLOC.WAREDETR1.WDWHSE
     C                   MOVE      *BLANKS       B01(Z2)
     C                   MOVE      WK0009        B01(Z2)
     C* ** load screen array.
     C* T02(C05) = RECLOC.WAREDETR1.WDWHSE
     C                   MOVE      *BLANKS       T02(Z2)
     C                   MOVE      WK0009        T02(Z2)
     C* ** Save first record on screen.
     C* IF C05=1
     C     Z2            IFEQ      1
     C* FST05 = B01(C05)
     C                   MOVE      B01(Z2)       FST05
     C* END                                                           *
     C                   END
     C* IF C05<S05CNT
     C     Z2            IFLT      S05CNT
     C* GETREC D.RECLOC,F.WAREDETR1,*NE,SVK008,SVK009
     C*
     C                   EXSR      S023
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z2            IFLT      S05CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0061        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C05>0
     C     Z2            IFGT      *ZERO
     C* LST05 = B01(C05)
     C                   MOVE      B01(Z2)       LST05
     C* END                                                           *
     C                   END
     C*
     C     $S05AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S06ABR - SCRN SUB
     C*****************************************************************
     C     S06ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C06 = 0
     C                   Z-ADD     *ZERO         Z3
     C* ** Set pointer to first record on screen.
     C* SETLL D.RECLOC,F.WLOCITM1,SVK011,SVK012,SVK013,SVK06
     C*
     C                   EXSR      S025
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.RECLOC,F.WLOCITM1,*PV,SVK011,SVK012,SVK013
     C*
     C                   EXSR      S026
     C* DOW (C06<S06CNT)&%STS(D.RECLOC,F.WLOCITM1)=*YES
     C     Z3            IFLT      S06CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C06 = C06+1
     C     Z3            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z3
     C* GETREC D.RECLOC,F.WLOCITM1,*PV,SVK011,SVK012,SVK013
     C*
     C                   EXSR      S026
     C* END                                                           *
     C     Z3            IFLT      S06CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0061        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S06ALD
     C                   EXSR      S06ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S06AB
     C                   END
     C*
     C     $S06AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S06AFR - SCRN SUB
     C*****************************************************************
     C     S06AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.RECLOC,F.WLOCITM1,SVK011,SVK012,SVK013,SVK06
     C*
     C                   EXSR      S025
     C* ** Load arrays from this point.
     C* EXSUBR S06ALD
     C                   EXSR      S06ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S06AF
     C                   END
     C*
     C     $S06AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S06ALD - SCRN SUB
     C*****************************************************************
     C     S06ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T03 = 0
     C                   Z-ADD     *ZERO         T03
     C* B02 = ' '
     C                   MOVEA     *BLANKS       B02
     C* T04 = ' '
     C                   MOVEA     *BLANKS       T04
     C* C06 = 0
     C                   Z-ADD     *ZERO         Z3
     C* ** protect select field
     C* DOW C06<S06CNT
     C     Z3            DOWLT     S06CNT
     C* C06 = C06+1
     C     Z3            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z3
     C* FLDATR T03(C06),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     Z3            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C06 = 0
     C                   Z-ADD     *ZERO         Z3
     C* GETREC D.RECLOC,F.WLOCITM1,*NE,SVK011,SVK012,SVK013
     C*
     C                   EXSR      S028
     C* DOW (C06<S06CNT)&%STS(D.RECLOC,F.WLOCITM1)=*YES
     C     Z3            IFLT      S06CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C06 = C06+1
     C     Z3            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z3
     C* ** Unprotect select field.
     C* FLDATR T03(C06),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     Z3            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B02(C06) = RECLOC.WLOCITM1.WILOCN
     C                   MOVE      *BLANKS       B02(Z3)
     C                   MOVE      WK0012        B02(Z3)
     C* ** load screen array.
     C* T04(C06) = RECLOC.WLOCITM1.WILOCN
     C                   MOVE      *BLANKS       T04(Z3)
     C                   MOVE      WK0012        T04(Z3)
     C* ** Save first record on screen.
     C* IF C06=1
     C     Z3            IFEQ      1
     C* FST06 = B02(C06)
     C                   MOVE      B02(Z3)       FST06
     C* END                                                           *
     C                   END
     C* IF C06<S06CNT
     C     Z3            IFLT      S06CNT
     C* GETREC D.RECLOC,F.WLOCITM1,*NE,SVK011,SVK012,SVK013
     C*
     C                   EXSR      S028
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z3            IFLT      S06CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0061        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C06>0
     C     Z3            IFGT      *ZERO
     C* LST06 = B02(C06)
     C                   MOVE      B02(Z3)       LST06
     C* END                                                           *
     C                   END
     C*
     C     $S06AL        ENDSR
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
     C* S005   - GETREC D.company,*eq,prm001
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM001        KYCO01
     C     K0001         CHAIN     COMPANY                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.COMPANY   IMSC
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.COMPANY   IMSC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01                         Company number
     C                   MOVEL     RN0001        KYCO01
     C     K0001         CHAIN     IMSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.IMSCPYD   IMST
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.IMSCPYD   IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01                         Company number
     C                   MOVEL     RN0007        KYCO01
     C                   MOVEL     *BLANK        KDTR02
     C                   MOVEL     CDTRNP        KDTR02
     C     K0002         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.IMSTRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.RECLOC,F.PORDD,F.PORDH,*EQ,prm001,prm002,prm003
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     PRM001        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     PRM002        KOPO02
     C                   Z-ADD     PRM003        KOSE03
     C     K0003         CHAIN     PORDD                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.PORDD     PORD
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.PORDD     PORD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0018        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     POPORD        KOPO02
     C     K0004         CHAIN     PORDH                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.PORDH     WRKP
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.PORDH     WRKP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.IPSCPYD,F.IPSCPYD,*EQ,PRM001
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM001        KDCO01
     C     K0005         CHAIN     IPSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.IPSCPYD
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.IPSCPYD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - SETLL D.RECLOC,F.WRKPORD,SVK004,SVK005,SVK006,SVK007
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   MOVE      'N'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   MOVE      'N'           SWRD09                         RD.SW.WLOCITM1
     C                   Z-ADD     *LOVAL        HKSEQ                          Auto incr. Sequence
     C*
     C                   MOVEL     SVK004        KOCO01
     C                   MOVEL     SVK004        HD0009                         Company number
     C                   MOVEL     SVK004        RN0058                         Company number
     C                   MOVEL     SVK005        KOPO02
     C                   MOVEL     SVK005        HKPORD                         Purchase Order Numbe
     C                   MOVEL     SVK005        WKPORD                         Purchase Order Numbe
     C                   Z-ADD     SVK006        KOSE03
     C                   Z-ADD     SVK006        HKLINE                         Line Number
     C                   Z-ADD     SVK006        WKLINE                         Line Number
     C                   Z-ADD     SVK007        KKSE04
     C                   Z-ADD     SVK007        HKSEQ                          Auto incr. Sequence
     C                   Z-ADD     SVK007        WKSEQ                          Auto incr. Sequence
     C*
     C     K0006         SETLL     WRKPORD                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.RECLOC,F.WRKPORD,*lock,*eq,SVK004,SVK005,SVK006,SVK007
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     SVK004        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     SVK005        KOPO02
     C                   Z-ADD     SVK006        KOSE03
     C                   Z-ADD     SVK007        KKSE04
     C     K0006         CHAIN     WRKPORD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - GETREC D.RECLOC,F.WAREDETR1,*eq,WKCOYNO,WKITEM,WKWHSE
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     WK0014        KOCO01
     C                   MOVEL     *BLANK        KKIT02
     C                   MOVEL     XKITEM        KKIT02
     C                   MOVEL     *BLANK        KKWH03
     C                   MOVEL     XKWHSE        KKWH03
     C     K0007         CHAIN     FILE0001                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - GETREC D.RECLOC,F.WLOCITM1,*eq,WKCOYNO,WKWHSE,WKITEM,WKLOCN
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     WK0014        KOCO01
     C                   MOVEL     *BLANK        KKWH02
     C                   MOVEL     XKWHSE        KKWH02
     C                   MOVEL     *BLANK        KKIT03
     C                   MOVEL     XKITEM        KKIT03
     C                   MOVEL     *BLANK        KKLO04
     C                   MOVEL     XKLOCN        KKLO04
     C     K0008         CHAIN     WLOCITM1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WLOCITM1
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WLOCITM1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - GETREC D.RECLOC,F.WRKPORD,*eq,SVK004,SVK005,SVK006,SVK007
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     SVK004        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     SVK005        KOPO02
     C                   Z-ADD     SVK006        KOSE03
     C                   Z-ADD     SVK007        KKSE04
     C     K0006         CHAIN(N)  WRKPORD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - DELETE D.RECLOC,F.WRKPORD
     C**************************************************************************
     C     S013          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     WK0014        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     WK0016        KOPO02
     C                   Z-ADD     WK0015        KOSE03
     C                   Z-ADD     XKSEQ         KKSE04
     C     K0006         SETLL     WRKPORD                                      SETLL  WRKPORD
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - WRKPORD
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0006         READE     WRKPORD                              9190    READE  WRKPORD
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    WRKPORD                              91      DELETE WRKPORD
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(1)         MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(2)         MSGDTA                         No record found to d
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C*
     C     K0006         SETLL     WRKPORD                                      RESUME FILE POINTER
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - UPDATE D.RECLOC,F.WRKPORD
     C**************************************************************************
     C     S014          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     HD0009        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     HKPORD        KOPO02
     C                   Z-ADD     HKLINE        KOSE03                         Line Number
     C                   Z-ADD     HKSEQ         KKSE04                         Auto incr. Sequence
     C     K0006         CHAIN     WRKPORD                            9091      CHAIN  WRKPORD
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0058        IFEQ      WK0014
     C     WKITEM        ANDEQ     XKITEM
     C     WKLINE        ANDEQ     WK0015
     C     WKLOCN        ANDEQ     XKLOCN
     C     WKPORD        ANDEQ     WK0016
     C     RN0059        ANDEQ     WK0017
     C     RN0060        ANDEQ     WK0018
     C     WKSEQ         ANDEQ     XKSEQ
     C     WKWHSE        ANDEQ     XKWHSE
     C                   UNLOCK    WRKPORD                              91      RLS LCK WRKPORD
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WRKPORDF                             90      UPDATE WRKPORD
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(3)         MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(4)         MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - WRITE D.RECLOC,F.WRKPORD
     C**************************************************************************
     C     S015          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C*          ---------------------------------------------------------------
     C*          | Auto Increment
     C*          ---------------------------------------------------------------
     C                   MOVEL     WK0014        KOCO01                         INITIALIZE KOCO01
     C                   MOVEL     WK0016        KOPO02                         INITIALIZE KOPO02
     C                   Z-ADD     WK0015        KOSE03                         INITIALIZE KOSE03
     C                   Z-ADD     *HIVAL        KKSE04                         INITIALIZE KKSE04
     C     K0006         SETGT     WRKPORD
     C                   READP(N)  WRKPORD                              9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C     RN0058        ANDEQ     KOCO01                                       Company number
     C     WKPORD        ANDEQ     KOPO02                                       Purchase Order Numbe
     C     WKLINE        ANDEQ     KOSE03                                       Line Number
     C     WKSEQ         ADD       5             XKSEQ                          Auto incr. Sequence
     C                   ELSE
     C                   Z-ADD     5             XKSEQ
     C                   END
     C*
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     WRKPORDF                             90      ADD REC TO WRKPORD
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(5)         MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(6)         MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - GETBLK D.RECLOC,F.WRKPORD,F.WAREDETR1,F.WLOCITM1,*PV,SVK004,SVK
     C**************************************************************************
     C     S016          BEGSR
     C*
     C                   MOVEL     *BLANK        KKCO01
     C                   MOVEL     SVK004        KKCO01
     C                   MOVEL     *BLANK        KKPO02
     C                   MOVEL     SVK005        KKPO02
     C                   Z-ADD     SVK006        KKLI03
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.WRKPORD   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0009         READPE(N) WRKPORD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0009                         Company number
     C                   MOVEL     *BLANK        HKPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HKLINE                         Line Number
     C                   Z-ADD     *ZERO         HKSEQ                          Auto incr. Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.WRKPORD   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO02                         Company number
     C                   MOVEL     RN0058        KDCO02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WKITEM        KDIT03
     C                   MOVEL     *BLANK        KDWH04
     C                   MOVEL     WKWHSE        KDWH04
     C     K0010         CHAIN     FILE0001                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0058        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     WKWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     WKITEM        KIIT03
     C                   MOVEL     *BLANK        KILO04
     C                   MOVEL     WKLOCN        KILO04
     C     K0011         CHAIN     WLOCITM1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WLOCITM1
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WLOCITM1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S017                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S017   - Process To Reset File Pointer(BOF) - WRKPORD   WAREDETR1 WLOCIT
     C**************************************************************************
     C     S017          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.WRKPORD   WARE
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KKCO01                         Company number
     C                   MOVEL     RN0058        KKCO01
     C                   MOVEL     *BLANK        KKPO02                         Purchase Order Numbe
     C                   MOVEL     WKPORD        KKPO02
     C                   Z-ADD     WKLINE        KKLI03                         Line Number
     C     K0009         SETLL     WRKPORD
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS08         SVS08                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO02                         Company number
     C                   MOVEL     RN0055        KDCO02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     WDITEM        KDIT03
     C                   MOVEL     *BLANK        KDWH04                         Warehouse Number
     C                   MOVEL     WDWHSE        KDWH04
     C     K0010         SETLL     FILE0001
     C                   Z-ADD     SVS08         STS08                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - Process To Reset File Pointer(EOF) - WRKPORD   WAREDETR1 WLOCIT
     C**************************************************************************
     C     S018          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.WRKPORD   WARE
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KKCO01                         Company number
     C                   MOVEL     RN0058        KKCO01
     C                   MOVEL     *BLANK        KKPO02                         Purchase Order Numbe
     C                   MOVEL     WKPORD        KKPO02
     C                   Z-ADD     WKLINE        KKLI03                         Line Number
     C     K0009         SETGT     WRKPORD
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS08         SVS08                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO02                         Company number
     C                   MOVEL     RN0055        KDCO02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     WDITEM        KDIT03
     C                   MOVEL     *BLANK        KDWH04                         Warehouse Number
     C                   MOVEL     WDWHSE        KDWH04
     C     K0010         SETGT     FILE0001
     C                   Z-ADD     SVS08         STS08                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       6             WADJ01
     C                   END
     C                   MOVEL     A1(8)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S019   - GETREC D.RECLOC,F.WRKPORD,F.WAREDETR1,F.WLOCITM1,*EQ,WKCOYNO,WK
     C**************************************************************************
     C     S019          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KKCO01
     C                   MOVEL     WK0014        KKCO01
     C                   MOVEL     *BLANK        KKPO02
     C                   MOVEL     WK0016        KKPO02
     C                   Z-ADD     WK0015        KKLI03
     C                   Z-ADD     XKSEQ         KKSE04
     C     K0012         CHAIN(N)  WRKPORD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.WRKPORD   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO02                         Company number
     C                   MOVEL     RN0058        KDCO02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WKITEM        KDIT03
     C                   MOVEL     *BLANK        KDWH04
     C                   MOVEL     WKWHSE        KDWH04
     C     K0010         CHAIN     FILE0001                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0058        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     WKWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     WKITEM        KIIT03
     C                   MOVEL     *BLANK        KILO04
     C                   MOVEL     WKLOCN        KILO04
     C     K0011         CHAIN     WLOCITM1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WLOCITM1
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WLOCITM1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S020   - SETLL D.RECLOC,F.WAREDETR1,SVK008,SVK009,SVK05
     C**************************************************************************
     C     S020          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   MOVE      'N'           SWRD09                         RD.SW.WLOCITM1
     C*
     C                   MOVEL     SVK008        KDCO02
     C                   MOVEL     SVK008        HD0007                         Company number
     C                   MOVEL     SVK008        RN0055                         Company number
     C                   MOVEL     SVK009        KDIT03
     C                   MOVEL     SVK009        HDITEM                         Item Number
     C                   MOVEL     SVK009        WDITEM                         Item Number
     C                   MOVEL     SVK05         KDWH04
     C                   MOVEL     SVK05         HDWHSE                         Warehouse Number
     C                   MOVEL     SVK05         WDWHSE                         Warehouse Number
     C*
     C     K0010         SETLL     FILE0001                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS08                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S021   - GETREC D.RECLOC,F.WAREDETR1,*PV,SVK008,SVK009
     C**************************************************************************
     C     S021          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO02
     C                   MOVEL     SVK008        KDCO02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     SVK009        KDIT03
     C     K0013         READPE    FILE0001                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S022                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S022   - Process To Reset File Pointer(BOF) - WAREDETR1
     C**************************************************************************
     C     S022          BEGSR
     C*
     C     SWRD08        IFNE      'Y'                                          RD.SW.WAREDETR1 WLOC
     C     STS08         ANDNE     1122                                         RCD LOCK
     C     STS08         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   Z-ADD     STS08         SVS08                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO02                         Company number
     C                   MOVEL     RN0055        KDCO02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     WDITEM        KDIT03
     C     K0013         SETLL     FILE0001
     C                   Z-ADD     SVS08         STS08                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S023   - GETREC D.RECLOC,F.WAREDETR1,*NE,SVK008,SVK009
     C**************************************************************************
     C     S023          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO02
     C                   MOVEL     SVK008        KDCO02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     SVK009        KDIT03
     C     K0013         READE     FILE0001                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S024                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S024   - Process To Reset File Pointer(EOF) - WAREDETR1
     C**************************************************************************
     C     S024          BEGSR
     C*
     C     SWRD08        IFNE      'Y'                                          RD.SW.WAREDETR1 WLOC
     C     STS08         ANDNE     1122                                         RCD LOCK
     C     STS08         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD08                         RD.SW.WAREDETR1 WLOC
     C                   Z-ADD     STS08         SVS08                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO02                         Company number
     C                   MOVEL     RN0055        KDCO02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     WDITEM        KDIT03
     C     K0013         SETGT     FILE0001
     C                   Z-ADD     SVS08         STS08                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S025   - SETLL D.RECLOC,F.WLOCITM1,SVK011,SVK012,SVK013,SVK06
     C**************************************************************************
     C     S025          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD09                         RD.SW.WLOCITM1
     C*
     C                   MOVEL     SVK011        KICO01
     C                   MOVEL     SVK011        HD0008                         Company number
     C                   MOVEL     SVK011        RN0057                         Company number
     C                   MOVEL     SVK012        KIWH02
     C                   MOVEL     SVK012        HIWHSE                         Warehouse Number
     C                   MOVEL     SVK012        WIWHSE                         Warehouse Number
     C                   MOVEL     SVK013        KIIT03
     C                   MOVEL     SVK013        HIITEM                         Item Number
     C                   MOVEL     SVK013        WIITEM                         Item Number
     C                   MOVEL     SVK06         KILO04
     C                   MOVEL     SVK06         HILOCN                         Location
     C                   MOVEL     SVK06         WILOCN                         Location
     C*
     C     K0011         SETLL     WLOCITM1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS09                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S026   - GETREC D.RECLOC,F.WLOCITM1,*PV,SVK011,SVK012,SVK013
     C**************************************************************************
     C     S026          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK011        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK012        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     SVK013        KIIT03
     C     K0014         READPE    WLOCITM1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WLOCITM1
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WLOCITM1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S027                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S027   - Process To Reset File Pointer(BOF) - WLOCITM1
     C**************************************************************************
     C     S027          BEGSR
     C*
     C     SWRD09        IFNE      'Y'                                          RD.SW.WLOCITM1
     C     STS09         ANDNE     1122                                         RCD LOCK
     C     STS09         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD09                         RD.SW.WLOCITM1
     C                   Z-ADD     STS09         SVS09                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0057        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03                         Item Number
     C                   MOVEL     WIITEM        KIIT03
     C     K0014         SETLL     WLOCITM1
     C                   Z-ADD     SVS09         STS09                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S028   - GETREC D.RECLOC,F.WLOCITM1,*NE,SVK011,SVK012,SVK013
     C**************************************************************************
     C     S028          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK011        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK012        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     SVK013        KIIT03
     C     K0014         READE     WLOCITM1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WLOCITM1
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WLOCITM1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S029                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S029   - Process To Reset File Pointer(EOF) - WLOCITM1
     C**************************************************************************
     C     S029          BEGSR
     C*
     C     SWRD09        IFNE      'Y'                                          RD.SW.WLOCITM1
     C     STS09         ANDNE     1122                                         RCD LOCK
     C     STS09         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD09                         RD.SW.WLOCITM1
     C                   Z-ADD     STS09         SVS09                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0057        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03                         Item Number
     C                   MOVEL     WIITEM        KIIT03
     C     K0014         SETGT     WLOCITM1
     C                   Z-ADD     SVS09         STS09                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002V - Detail Screen for WRKPORD
     C* Validation subroutine for -- SC0004
     C**************************************************************************
     C     S002V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     WK0018        IFLE      N1(1)                                        High value
     C     WK0018        ANDGE     N1(2)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0018'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
     C     RANGEF        IFEQ      1                                            Range check
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'USR2109'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     WK0017        IFLE      N1(3)                                        High value
     C     WK0017        ANDGE     N1(4)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0017'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
     C     RANGEF        IFEQ      1                                            Range check
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'USR2010'     MSGID                          Message id.
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
     C* SCLF   - CLF : Cursor Location On Field Handler
     C*****************************************************************
     C     SCLF          BEGSR
     C*
     C* FIND TABLE OFFSET BY SCREEN ID AND FIELD NAME AND FIELD INDEX
     C*
     C                   Z-ADD     1             X0
     C     #MAP          LOOKUP    DA4(X0)                                90
     C     *IN90         IFEQ      '1'                                          IF FIND
     C                   MOVE      DA5(X0)       #CLF
     C*          ------------------------------------------------------
     C*          | CALCULATE CURRENT SCREEN OFFSET
     C*          ------------------------------------------------------
     C* Get row
     C                   Z-ADD     0             HALFWD
     C                   MOVE      ROW           BYTE2
     C                   Z-ADD     HALFWD        APPROW
     C* Get column
     C                   Z-ADD     0             HALFWD
     C                   MOVE      COL           BYTE2
     C                   Z-ADD     HALFWD        APPCOL
     C*
     C     APPROW        SUB       1             OFFSET
     C     OFFSET        MULT      80            OFFSET
     C                   ADD       APPCOL        OFFSET
     C*          ------------------------------------------------------
     C*          | CHECK OFFSET BOUNDARY
     C*          ------------------------------------------------------
     C     OFFSET        IFGE      #FROM
     C     OFFSET        ANDLE     #TO
     C                   Z-ADD     1             NRSLT
     C                   ELSE                                                   x-OFFSET GE #FR
     C                   Z-ADD     0             NRSLT
     C                   END                                                    OFFSET GE #FROM
     C*
     C                   MOVE      *BLANK        #ATRIB
     C                   END                                                    *IN90 EQ '1'
     C                   ENDSR
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
     C     STS01         IFEQ      1218                                         LOCK(SYS)-WRKPORD
     C     STS01         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK01                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK01                          SET ON LOCK FLAG
     C                   END
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
     C     WFILE#        IFEQ      2                                            COMPANY
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
     C     WFILE#        IFEQ      3                                            IMSCPYD
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
     C     WFILE#        IFEQ      4                                            IMSTRN
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
     C     WFILE#        IFEQ      5                                            PORDD
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
     C     WFILE#        IFEQ      6                                            PORDH
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
     C     WFILE#        IFEQ      7                                            IPSCPYD
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
     C     WFILE#        IFEQ      8                                            WAREDETR1
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
     C     WFILE#        IFEQ      9                                            WLOCITM1
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
     C                   MOVEL     WK0014        RN0058                         Company number
     C                   MOVEL     XKITEM        WKITEM                         Item Number
     C                   Z-ADD     WK0015        WKLINE                         Line Number
     C                   MOVEL     XKLOCN        WKLOCN                         Location
     C                   MOVEL     WK0016        WKPORD                         Purchase Order Numbe
     C                   Z-ADD     WK0017        RN0059                         Price
     C                   Z-ADD     WK0018        RN0060                         Quantity Received
     C                   Z-ADD     XKSEQ         WKSEQ                          Auto incr. Sequence
     C                   MOVEL     XKWHSE        WKWHSE                         Warehouse Number
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
     C                   MOVEL     RN0058        WK0014                         Company number
     C                   MOVEL     WKITEM        XKITEM                         Item Number
     C                   Z-ADD     WKLINE        WK0015                         Line Number
     C                   MOVEL     WKLOCN        XKLOCN                         Location
     C                   MOVEL     WKPORD        WK0016                         Purchase Order Numbe
     C                   Z-ADD     RN0059        WK0017                         Price
     C                   Z-ADD     RN0060        WK0018                         Quantity Received
     C                   Z-ADD     WKSEQ         XKSEQ                          Auto incr. Sequence
     C                   MOVEL     WKWHSE        XKWHSE                         Warehouse Number
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0058        HD0009                         Company number
     C                   MOVEL     WKPORD        HKPORD                         Purchase Order Numbe
     C                   Z-ADD     WKLINE        HKLINE                         Line Number
     C                   Z-ADD     WKSEQ         HKSEQ                          Auto incr. Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     CYDESC        WYDESC                         Company description
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0007        HD0002                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSTRN
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0011        HD0003                         Company number
     C                   MOVEL     TTTRNC        HTTRNC                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0018        WK0001                         Company number
     C                   MOVEL     RN0020        WK0002                         Item Description
     C                   MOVEL     POITEM        XOITEM                         Item Number
     C                   MOVEL     RN0021        WK0003                         Allocated account
     C                   MOVEL     POPORD        WOPORD                         Purchase Order Numbe
     C                   Z-ADD     POQORD        XOQORD                         Quantity ordered
     C                   Z-ADD     RN0023        WK0004                         Quantity received
     C                   Z-ADD     POSEQ         XOSEQ                          Sequence
     C                   MOVEL     POWHSE        XOWHSE                         Warehouse Number
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0018        HD0005                         Company number
     C                   MOVEL     POPORD        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     POSEQ         HOSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     RN0029        WK0005                         Company number
     C                   MOVEL     PHPORD        XHPORD                         Purchase Order Numbe
     C                   MOVEL     RN0044        WK0006                         Supplier name
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0029        HD0006                         Company number
     C                   MOVEL     PHPORD        HHPORD                         Purchase Order Numbe
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     CDIMS         WDIMS                          IMS to be used
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0017        HD0004                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDETR1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      08
     C                   MOVEL     RN0055        WK0007                         Company number
     C                   MOVEL     WDITEM        WK0008                         Item Number
     C                   MOVEL     WDWHSE        WK0009                         Warehouse Number
     C                   Z-ADD     REC08         HRC08
     C                   MOVEL     RN0055        HD0007                         Company number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      09
     C                   MOVEL     RN0057        WK0010                         Company number
     C                   MOVEL     WIITEM        WK0011                         Item Number
     C                   MOVEL     WILOCN        WK0012                         Location
     C                   MOVEL     WIWHSE        WK0013                         Warehouse Number
     C                   Z-ADD     REC09         HRC09
     C                   MOVEL     RN0057        HD0008                         Company number
     C                   MOVEL     WIWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WIITEM        HIITEM                         Item Number
     C                   MOVEL     WILOCN        HILOCN                         Location
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
Record deleted from file Receiving Work File         WK
No record found to delete from file Receiving Work File         WK
Record update for file Receiving Work File         WK
Unable to update record for file Receiving Work File         WK
Record added to file Receiving Work File         WK
Unable to add record to file Receiving Work File         WK
The beginning of the file was reached
The end of the file was reached
**   Numeric Constant Array - N1
000000000000999999999000000000
000000000000000000001000000000
000000000000009999999000000000
000000000000000000000000000000
**   Cursor Location on field map Array - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SC0004    XKWHSE    000006670669
SC0004    XKLOCN    000007470756
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0004    WK0017    0000  03      03
SC0004    WK0018    0000  04      04
SC0003    FL0002    0000  0102    01                   Y
SC0004    XKWHSE    0000  06      06
SC0004    XKLOCN    0000  05      05
SC0004    GRPPR1    0000    02        01
SC0005    T01       0001            0201
SC0005    T01       0002            0403
SC0005    T01       0003            0605
SC0005    T01       0004            0807
SC0005    T01       0005            1009
SC0006    T03       0001            0201
SC0006    T03       0002            0403
SC0006    T03       0003            0605
SC0006    T03       0004            0807
SC0006    T03       0005            1009
