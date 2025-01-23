     F/TITLE FS010 Print Picking List - FS Mod
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    FS010
     F*  Application ID      -    FS010
     F*  Application Name    -    Print Picking List - FS Mod
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Program Narrative
     F*
     F*  This is a modified version of PPCKLST for Farm Stores inc
     F*
     F*  It now prints an Invoice and writes records to a receiving file
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  IMSCPYD     - (I/DISK   ) IMS Company Details         CD
     F*  PCKLST      - (I/DISK   ) IMS Picking List            PL
     F*  PCKLSD      - (I/DISK   ) IMS Picking list details    PD
     F*  WAREHED     - (I/DISK   ) IMS Warehouse Header        WH
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  WARELOC     - (I/DISK   ) IMS Warehouse Locations     WL
     F*  UOM         - (I/DISK   ) IMS Unit of measure         UM
     F*  IPSITEML1   - (I/DISK   ) IPS Items By Item
     F*  FSRR        - (I/DISK   ) Farmstores Receiving Record
     F*  IPSWADD     - (I/DISK   ) IPS Wharehouse address
     F*  FSSTORL1    - (I/DISK   ) Farmstores RR By Wharehouse
     F*  FSRRX       - (U/DISK   ) Farmstores Receiving Record
     F*  FS0101O     - (O/PRINTER) Generated printer file
     F*  FS0102O     - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S500 - Write Receiving Record
     F* S501 - Get Warehouse Addresses
     F* SBRDAT - Converts DATE field into YEAR, MONTH, and DAYS
     F* SDMC - Convert date into Day_month_cenyr form.
     F* SMSG - Error messages to job log.
     F* S001   - GETREC d.company,f.company,*eq,prcoyno
     F* S002   - GETREC D.COMPANY,F.IMSCPYD,*EQ,PRCOYNO
     F* S003   - GETREC d.pcklst,f.pcklst,*eq,prcoyno,prseq
     F* S004   - SETLL d.pcklst,f.pcklsd,prcoyno,prseq
     F* S005   - GETREC D.PCKLST,F.PCKLSD,*NE,PRCOYNO,PRSEQ
     F* S006   - Process To Reset File Pointer(EOF) - PCKLSD
     F* S007   - GETREC D.PCKLST,F.WAREHED,*EQ,PRCOYNO,PDWHSE
     F* S008   - GETREC D.PCKLST,F.ITMMAST,*EQ,PRCOYNO,PDITEM
     F* S009   - GETREC D.PCKLST,F.WARELOC,*EQ,PRCOYNO,PDWHSE,PDLOCN
     F* S010   - GETREC D.UOM,F.UOM,*EQ,PRCOYNO,ITUOM
     F* S011   - GETREC D.IPSITEML1,F.IPSITEML1,*EQ,PRCOYNO,PDITEM
     F* S012   - WRITE D.FSRR,F.FSRR
     F* S013   - GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLFWH
     F* S014   - GETREC D.FSSTORL1,F.FSSTORL1,*EQ,PRCOYNO,PLFWH
     F* S015   - GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLTWH
     F* S016   - GETREC D.FSSTORL1,F.FSSTORL1,*EQ,PRCOYNO,PLTWH
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FIMSCPYD   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FPCKLST    IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FPCKLSD    IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FWAREHED   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FWARELOC   IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FUOM       IF   E           K DISK
     F                                     INFDS(FIDS08)
     F                                     INFSR(SFERR)
     FFILE0001  IF   E           K DISK
     F                                     INFDS(FIDS09)
     F                                     INFSR(SFERR)
     FFSRR      IF   E             DISK
     F                                     INFDS(FIDS10)
     F                                     INFSR(SFERR)
     FIPSWADD   IF   E           K DISK
     F                                     INFDS(FIDS11)
     F                                     INFSR(SFERR)
     FFSSTORL1  IF   E           K DISK
     F                                     INFDS(FIDS12)
     F                                     INFSR(SFERR)
     FFS0101O   O    E             PRINTER
     F                                     INFDS(FIDS14)
     FFS0102O   O    E             PRINTER
     F                                     INFDS(FIDS15)
     FFSRRX     O    E             DISK
     F                                     INFDS(FIDS13)
     F                                     RENAME(FSRRR:FSRRRX)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D G2              S              1    DIM(999)                             GRP STS
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS10          DS
     D  STS10            *STATUS
     D  REC10                397    400B 0
     D FIDS12          DS
     D  STS12            *STATUS
     D  REC12                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                397    400B 0
     D FIDS11          DS
     D  STS11            *STATUS
     D  REC11                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS13          DS
     D  STS13            *STATUS
     D  REC13                397    400B 0
     D FIDS14          DS
     D  STS14            *STATUS
     D  REC14                367    368B 0
     D  OLN14                188    189B 0
     D FIDS15          DS
     D  STS15            *STATUS
     D  REC15                367    368B 0
     D  OLN15                188    189B 0
     D*
     D* Data structure for user define
     D*
     D @DS003          DS
     D  WK0012                 1     40
     D  ITSD                   1     20
     D*
     D* Data structure for user define
     D*
     D @DS004          DS
     D  WK0019                 1     40
     D  WHSD                   1     20
     D*
     D* Data structure for user define
     D*
     D @DS005          DS
     D  WK0020                 1     40
     D  WLSD                   1     20
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
     D* Program status data structure
     D*
     D SDS            SDS
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
     ICOMPANYF
     I              CYCOYNO                     RN0011
     I              CYEMPCOL                    RN0012
     I              CYEMPHEAD                   RN0013
     I              CYPRDHEAD                   RN0014
     I              CYREFHEAD                   RN0015
     I              CYSDESC                     RN0016
     IIMSCPYDF
     I              CDCOYNO                     RN0017
     I              CDHEAD1                     RN0018
     I              CDHEAD2                     RN0019
     I              CDHEAD3                     RN0020
     IIPSITEMF
     I              PIBRNBR                     RN0021
     I              PICNVCDE                    RN0022
     I              PICOYNO                     RN0023
     I              PIPBRK1                     RN0024
     I              PIPBRK2                     RN0025
     I              PIPBRK3                     RN0026
     I              PIPBRK4                     RN0027
     I              PIPRCOD                     RN0028
     I              PIQBRK1                     RN0029
     I              PIQBRK2                     RN0030
     I              PIQBRK3                     RN0031
     I              PIQBRK4                     RN0032
     I              PISDESC                     RN0033
     I              PISPITM                     RN0034
     I              PISUPPN                     RN0035
     IIPSWADDF
     I              PDCONNAM                    RN0036
     I              PDCOYNO                     RN0037
     I              PDPSTCD                     RN0038
     I              PDTELEPH                    RN0039
     IITMSTRF
     I              ITALPHA                     RN0040
     I              ITCOYNO                     RN0041
     I              ITIDESC                     RN0042
     IPCKLSDF
     I              PDCOYNO                     RN0043
     IPCKLSTF
     I              PLCOYNO                     RN0044
     IUOMF
     I              UMCOYNO                     RN0045
     IWAREHEDF
     I              WHCOYNO                     RN0046
     I              WHWDESC                     RN0047
     IWARELOCF
     I              WLCOYNO                     RN0048
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
     C                   PARM                    PRSEQ             5 0
     C                   PARM                    XYMD              6 0
     C*
     C     PMSGCL        PLIST
     C                   PARM                    MSGACT            1
     C                   PARM                    MSGID             7
     C                   PARM                    MSGF             10
     C                   PARM                    MSGFL            10
     C                   PARM                    MSGDTA          132
     C********************************************************************
     C*                   K e y      L i s t
     C********************************************************************
     C*
     C     K0001         KLIST
     C                   KFLD                    KYCO01
     C*
     C     K0002         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KLSE02
     C*
     C     K0003         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KDWH02
     C*
     C     K0004         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KDIT02
     C*
     C     K0005         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KDWH02
     C                   KFLD                    KDLO03
     C*
     C     K0006         KLIST
     C                   KFLD                    KMCO01
     C                   KFLD                    KMUO02
     C*
     C     K0007         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIIT02
     C*
     C     K0008         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDWH02
     C*
     C     K0009         KLIST
     C                   KFLD                    KLCN01
     C                   KFLD                    KLWH02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RCCCAT        WCCCAT                         Category
     C     *LIKE         DEFINE    RCCEAC        WCCEAC                         Each Cost
     C     *LIKE         DEFINE    RCCIT#        WCCIT#                         Item Number
     C     *LIKE         DEFINE    RCCIV#        WCCIV#                         Invoice Number
     C     *LIKE         DEFINE    RCCIVD        WCCIVD                         Invoice Date
     C     *LIKE         DEFINE    RCCLOC        WCCLOC                         Location
     C     *LIKE         DEFINE    RCCNO         WCCNO                          Receiving Location
     C     *LIKE         DEFINE    RCCQTY        WCCQTY                         Quantity Received
     C     *LIKE         DEFINE    RCCRE#        WCCRE#                         Reorder Number
     C     *LIKE         DEFINE    RCCSBC        WCCSBC                         Sub-category
     C     *LIKE         DEFINE    RCCUNC        WCCUNC                         Unit Cost
     C     *LIKE         DEFINE    RCCVD#        WCCVD#                         Vendor Number
     C     *LIKE         DEFINE    WLCNO         WK0001                         Company number
     C     *LIKE         DEFINE    WLUSDF        WK0002                         Store Number
     C     *LIKE         DEFINE    WLWHSE        WK0003                         Warehouse Number
     C     *LIKE         DEFINE    RN0035        WK0005                         Supplier Number
     C     *LIKE         DEFINE    RN0036        WK0006                         Contact name
     C     *LIKE         DEFINE    RN0037        WK0007                         Company number
     C     *LIKE         DEFINE    PDLIN1        WDLIN1                         Address
     C     *LIKE         DEFINE    PDLIN2        WDLIN2                         Address Line 2
     C     *LIKE         DEFINE    PDLIN3        WDLIN3                         Address Line 3
     C     *LIKE         DEFINE    PDLIN4        WDLIN4                         Address Line 4
     C     *LIKE         DEFINE    PDLIN5        WDLIN5                         Address Line 5
     C     *LIKE         DEFINE    PDLIN6        WDLIN6                         Address Line 6
     C     *LIKE         DEFINE    RN0038        WK0008                         Post code
     C     *LIKE         DEFINE    RN0039        WK0009                         Telephone number
     C     *LIKE         DEFINE    PDWHSE        WDWHSE                         Warehouse Number
     C     *LIKE         DEFINE    RN0040        WK0010                         Alpha Search
     C     *LIKE         DEFINE    ITCLAS        WTCLAS                         Item Class
     C     *LIKE         DEFINE    RN0041        WK0011                         Company number
     C     *LIKE         DEFINE    ITCRTU        WTCRTU                         Created By
     C     *LIKE         DEFINE    ITDTCR        WTDTCR                         Created date
     C     *LIKE         DEFINE    ITDTLM        WTDTLM                         Amended date
     C     *LIKE         DEFINE    ITIGRP        WTIGRP                         Stock Group
     C     *LIKE         DEFINE    ITITEM        WTITEM                         Item Number
     C     *LIKE         DEFINE    ITITYP        WTITYP                         Item Type - business
     C     *LIKE         DEFINE    ITLMBY        WTLMBY                         Amended By
     C     *LIKE         DEFINE    ITMANF        WTMANF                         Manufacturers Item N
     C     *LIKE         DEFINE    ITNLAC        WTNLAC                         N/L Cost of Sales Ac
     C     *LIKE         DEFINE    ITNLAS        WTNLAS                         N/L Sales Account
     C     *LIKE         DEFINE    ITNLST        WTNLST                         N/L Stock Account
     C     *LIKE         DEFINE    ITPACK        WTPACK                         Packing Multiplier
     C     *LIKE         DEFINE    ITPALL        WTPALL                         Pallet label
     C     *LIKE         DEFINE    ITSANL        WTSANL                         Stock Analysis Code
     C     *LIKE         DEFINE    ITSIG         WTSIG                          Stock Inventory Grou
     C     *LIKE         DEFINE    ITSTUC        WTSTUC                         Standard unit cost
     C     *LIKE         DEFINE    ITSUBS        WTSUBS                         Substitute item numb
     C     *LIKE         DEFINE    ITSUPD        WTSUPD                         Superceding Item 'Fr
     C     *LIKE         DEFINE    ITSUPG        WTSUPG                         Superceding item 'To
     C     *LIKE         DEFINE    ITSVG         WTSVG                          Stock Value Group
     C     *LIKE         DEFINE    ITUDF2        WTUDF2                         User Defined 2
     C     *LIKE         DEFINE    ITUDF3        WTUDF3                         User Defined 3
     C     *LIKE         DEFINE    ITUOM         WTUOM                          Unit of Measure
     C     *LIKE         DEFINE    ITUOMO        WTUOMO                         Outer Unit of Measur
     C     *LIKE         DEFINE    ITVATC        WTVATC                         VAT Code
     C     *LIKE         DEFINE    ITWEIG        WTWEIG                         Item weight
     C     *LIKE         DEFINE    PDCOST        WDCOST                         Unit Cost
     C     *LIKE         DEFINE    RN0043        WK0013                         Company number
     C     *LIKE         DEFINE    PDITEM        WDITEM                         Item Number
     C     *LIKE         DEFINE    PDLOCN        WDLOCN                         Location
     C     *LIKE         DEFINE    PDPCKR        WDPCKR                         Picking Route
     C     *LIKE         DEFINE    PDSEQ         WDSEQ                          Picking list
     C     *LIKE         DEFINE    PDTQTY        WDTQTY                         Transaction Quantity
     C     *LIKE         DEFINE    PDTRNC        WDTRNC                         Transaction Type
     C     *LIKE         DEFINE    PDWHSE        WK0014                         Warehouse Number
     C     *LIKE         DEFINE    RN0044        WK0015                         Company number
     C     *LIKE         DEFINE    PLCRDT        WK0017                         Created Date
     C     *LIKE         DEFINE    PLFWH         WLFWH                          From Warehouse
     C     *LIKE         DEFINE    PLTWH         WLTWH                          To Warehouse (if tra
     C     *LIKE         DEFINE    RN0045        WK0018                         Company number
     C     *LIKE         DEFINE    UMQTYO        WMQTYO                         Quantity per unit
     C     *LIKE         DEFINE    UMUOM         WMUOM                          Unit of Measure
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0011        HD0001
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0017        HD0003
     C     *LIKE         DEFINE    REC10         HRC10
     C     *LIKE         DEFINE    REC12         HRC12
     C     *LIKE         DEFINE    WLCNO         HLCNO
     C     *LIKE         DEFINE    WLWHSE        HD0002
     C     *LIKE         DEFINE    REC09         HRC09
     C     *LIKE         DEFINE    RN0023        HD0005
     C     *LIKE         DEFINE    PIITEM        HIITEM
     C     *LIKE         DEFINE    RN0035        HD0006
     C     *LIKE         DEFINE    RN0021        HD0004
     C     *LIKE         DEFINE    REC11         HRC11
     C     *LIKE         DEFINE    RN0037        HD0007
     C     *LIKE         DEFINE    PDWHSE        HDWHSE
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0041        HD0008
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0043        HD0009
     C     *LIKE         DEFINE    PDSEQ         HDSEQ
     C     *LIKE         DEFINE    PDWHSE        HD0010
     C     *LIKE         DEFINE    PDPCKR        HDPCKR
     C     *LIKE         DEFINE    PDLOCN        HDLOCN
     C     *LIKE         DEFINE    PDITEM        HDITEM
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0044        HD0011
     C     *LIKE         DEFINE    PLSEQ         HLSEQ
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0046        HD0013
     C     *LIKE         DEFINE    WHWHSE        HHWHSE
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0048        HD0014
     C     *LIKE         DEFINE    WLWHSE        HD0016
     C     *LIKE         DEFINE    WLLOCN        HD0015
     C     *LIKE         DEFINE    REC08         HRC08
     C     *LIKE         DEFINE    RN0045        HD0012
     C     *LIKE         DEFINE    UMUOM         HMUOM
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
     C                   MOVE      *ZEROS        SVDY              4 0          Save days
     C                   MOVE      *ZEROS        SVCY              4 0          Save century
     C                   MOVE      *ZEROS        SVCC              2 0          Save century
     C                   MOVE      1             CHKVAR            1 0          Perform Valid.
     C                   MOVE      *ZEROS        ##CLOC            4 0
     C                   MOVE      *BLANKS       RN0001            4            #FSTOE
     C                   MOVE      *ZEROS        #INVNO           10 0
     C                   MOVE      *BLANKS       RN0002            4            #FSTOE
     C                   MOVE      *BLANKS       AUDF              4
     C                   MOVE      *ZEROS        EXTEND           11 2
     C                   MOVE      *BLANKS       HLITEM           15
     C                   MOVE      *BLANKS       HLLOCN           10
     C                   MOVE      *BLANKS       HLWHSE            3
     C                   MOVE      *ZEROS        INVDAT            8 0
     C                   MOVE      *ZEROS        INVNO             8 0
     C                   MOVE      *ZEROS        L1TQTY            9 0
     C                   MOVE      *ZEROS        ODATE             8 0
     C                   MOVE      *ZEROS        RN0003           13 2          Total
     C                   MOVE      *BLANKS       RN0004           20            WFCONNAM
     C                   MOVE      *BLANKS       WFLIN1           40
     C                   MOVE      *BLANKS       WFLIN2           40
     C                   MOVE      *BLANKS       WFLIN3           40
     C                   MOVE      *BLANKS       WFLIN4           40
     C                   MOVE      *BLANKS       WFLIN5           40
     C                   MOVE      *BLANKS       WFLIN6           40
     C                   MOVE      *BLANKS       WFNAR            20
     C                   MOVE      *BLANKS       WFNARR           14
     C                   MOVE      *BLANKS       RN0005            9            WFPSTCD
     C                   MOVE      *BLANKS       RN0006           15            WFTELEPH
     C                   MOVE      *BLANKS       WFWHSE            3
     C                   MOVE      *ZEROS        WKCRDT            8 0
     C                   MOVE      *ZEROS        RN0007            8 0          WKCRDT
     C                   MOVE      *BLANKS       WKUOM             5
     C                   MOVE      *ZEROS        WKUQ              3 0
     C                   MOVE      *BLANKS       RN0008           20            WTCONNAM
     C                   MOVE      *BLANKS       WTLIN1           40
     C                   MOVE      *BLANKS       WTLIN2           40
     C                   MOVE      *BLANKS       WTLIN3           40
     C                   MOVE      *BLANKS       WTLIN4           40
     C                   MOVE      *BLANKS       WTLIN5           40
     C                   MOVE      *BLANKS       WTLIN6           40
     C                   MOVE      *BLANKS       WTNARR           12
     C                   MOVE      *BLANKS       RN0009            9            WTPSTCD
     C                   MOVE      *BLANKS       RN0010           15            WtTELEPH
     C                   MOVE      *BLANKS       WTWHSE            3
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK10             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK12             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK11             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK13             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD07            1            RD STS          003
     C                   MOVE      *BLANKS       KLCO01            3            PLCOYNO
     C                   MOVE      *ZEROS        KLSE02            5 0          PLSEQ
     C                   MOVE      *BLANKS       KDWH02            3            PDWHSE
     C                   MOVE      *BLANKS       KDIT02           20            PDITEM
     C                   MOVE      *BLANKS       KDLO03           10            PDLOCN
     C                   MOVE      *BLANKS       SWRD08            1            RD STS          0030
     C                   MOVE      *BLANKS       KMCO01            3            UMCOYNO
     C                   MOVE      *BLANKS       KMUO02            5            UMUOM
     C                   MOVE      *BLANKS       RN0049           99
     C                   MOVE      *BLANKS       SWRD09            1            RD STS          0030
     C                   MOVE      *BLANKS       KICO01            3            PICOYNO
     C                   MOVE      *BLANKS       KIIT02           20            PIITEM
     C                   MOVE      *BLANKS       SWRD10            1            RD STS          0030
     C                   MOVE      *BLANKS       RN0050           99
     C                   MOVE      *BLANKS       SWRD11            1            RD STS
     C                   MOVE      *BLANKS       KDCO01            3            PDCOYNO
     C                   MOVE      *BLANKS       SWRD12            1            RD STS          0030
     C                   MOVE      *BLANKS       KLCN01            3            WLCNO
     C                   MOVE      *BLANKS       KLWH02            3            WLWHSE
     C                   MOVE      *BLANKS       SAVIN            99            Save Indword
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS
     C                   Z-ADD     *ZEROS        DAS001            5 0
     C                   Z-ADD     *ZEROS        DAS002            5 0
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C*
     C     *DTAARA       DEFINE    FSINVNO       @DS001            8 0
     C     *DTAARA       DEFINE    FSRCNUM       @DS002            3 0
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
     C* Get company name
     C* GETREC d.company,f.company,*eq,prcoyno
     C*
     C                   EXSR      S001
     C* GETREC D.COMPANY,F.IMSCPYD,*EQ,PRCOYNO
     C*
     C                   EXSR      S002
     C* GETREC d.pcklst,f.pcklst,*eq,prcoyno,prseq
     C*
     C                   EXSR      S003
     C* WKCRDT = %dmc(plcrdt)
     C*  Day Month Cenyr
     C                   Z-ADD     WK0017        NARG1
     C                   MOVE      'CMD'         DATFMT
     C                   EXSR      SDMC
     C                   Z-ADD     NRSLT         NRSLT0
     C                   Z-ADD     NRSLT0        WKCRDT
     C* WKCRDT2 = %dmc(plcrdt)
     C*  Day Month Cenyr
     C                   Z-ADD     WK0017        NARG1
     C                   MOVE      'CMD'         DATFMT
     C                   EXSR      SDMC
     C                   Z-ADD     NRSLT         NRSLT0
     C                   Z-ADD     NRSLT0        RN0007
     C* INVDAT = 20000000
     C                   Z-ADD     20000000      INVDAT
     C* INVDAT = INVDAT + *ymd
     C     INVDAT        ADD       XYMD          NRSLT0
     C                   Z-ADD     NRSLT0        INVDAT
     C* Start read from number
     C* SETLL d.pcklst,f.pcklsd,prcoyno,prseq
     C*
     C                   EXSR      S004
     C* GETREC D.PCKLST,F.PCKLSD,*NE,PRCOYNO,PRSEQ
     C*
     C                   EXSR      S005
     C* GETREC D.PCKLST,F.WAREHED,*EQ,PRCOYNO,PDWHSE
     C*
     C                   EXSR      S007
     C* GETREC D.PCKLST,F.ITMMAST,*EQ,PRCOYNO,PDITEM
     C*
     C                   EXSR      S008
     C* GETREC D.PCKLST,F.WARELOC,*EQ,PRCOYNO,PDWHSE,PDLOCN
     C*
     C                   EXSR      S009
     C* HLWHSE = pdwhse
     C                   MOVE      WK0014        HLWHSE
     C* HLITEM = pditem
     C                   MOVE      *BLANKS       HLITEM
     C                   MOVEL     WDITEM        HLITEM
     C* HLLOCN = pdlocn
     C                   MOVE      WDLOCN        HLLOCN
     C*                                                               *
     C*                                                               *
     C* GETDTAA FSINVNO,*LOCK
     C     *LOCK         IN        @DS001                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
     C                   END
     C* FSINVNO = FSINVNO + 1
     C     @DS001        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        @DS001
     C* INVNO = fsinvno
     C                   Z-ADD     @DS001        INVNO
     C* UPDDTAA FSINVNO
     C                   OUT       @DS001                               93
     C*                                                               *
     C* GETDTAA FSRCNUM,*LOCK
     C     *LOCK         IN        @DS002                               93
     C                   Z-ADD     0             DAS002
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS002
     C                   END
     C* FSRCNUM = FSRCNUM + 1
     C     @DS002        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        @DS002
     C* UPDDTAA FSRCNUM
     C                   OUT       @DS002                               93
     C*                                                               *
     C* Reverse date.
     C* ODATE = %DMC(PLCRDT)
     C*  Day Month Cenyr
     C                   Z-ADD     WK0017        NARG1
     C                   MOVE      'CMD'         DATFMT
     C                   EXSR      SDMC
     C                   Z-ADD     NRSLT         NRSLT0
     C                   Z-ADD     NRSLT0        ODATE
     C* *** Get Warehouse addresses for headings
     C* EXSUBR getwhad
     C                   EXSR      S501
     C* Print headings
     C* PRINT report,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT invoice,aaa
     C                   MOVE      '0'           *INOB
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OB
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* DOW %sts(d.pcklst,f.pcklsd)=*yes
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
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
     C* *** Get Warehouse addresses for headings
     C* EXSUBR getwhad
     C                   EXSR      S501
     C* Print totals for item
     C* IF hlwhse <> pdwhse | hlitem <> pditem | hllocn <> pdlocn
     C     HLWHSE        IFNE      WK0014
     C     HLITEM        ORNE      WDITEM
     C     HLLOCN        ORNE      WDLOCN
     C* IF %ovf(report)=*yes
     C*  Over flow on printer file.
     C     *INOA         IFEQ      '1'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* PRINT report,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT INVOICE,aaa
     C                   MOVE      '0'           *INOB
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OB
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* EXTEND = %RRS(L1TQTY * ITLPRC)
     C     L1TQTY        MULT      WTLPRC        NRSLT0
     C*  Round Result
     C                   Z-ADD(H)  NRSLT0        EXTEND
     C* TEXTEND = TEXTEND + EXTEND
     C     RN0003        ADD       EXTEND        NRSLT0
     C                   Z-ADD     NRSLT0        RN0003
     C* PRINT report,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT INVOICE,bbb
     C                   MOVE      '0'           *INOB
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OB
     C                   MOVEA     SAVIN         *IN
     C* EXSUBR fsrr
     C                   EXSR      S500
     C* L1TQTY = *zero
     C                   Z-ADD     *ZERO         L1TQTY
     C* GETREC D.PCKLST,F.ITMMAST,*EQ,PRCOYNO,PDITEM
     C*
     C                   EXSR      S008
     C* GETREC D.PCKLST,F.WARELOC,*EQ,PRCOYNO,PDWHSE,PDLOCN
     C*
     C                   EXSR      S009
     C* GETREC D.UOM,F.UOM,*EQ,PRCOYNO,ITUOM
     C*
     C                   EXSR      S010
     C* IF %STS(D.UOM,F.UOM) = *YES
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C* WKUOM = ITUOM
     C                   MOVE      WTUOM         WKUOM
     C* WKUQ = UMQTYO
     C                   Z-ADD     WMQTYO        WKUQ
     C* ELSE                                                          *
     C                   ELSE
     C* WKUOM = *BLANKS
     C                   MOVEL     *BLANKS       WKUOM
     C* WKUQ = *ZEROS
     C                   Z-ADD     *ZEROS        WKUQ
     C* END                                                           *
     C                   END
     C* New page for warehouse
     C* IF hlwhse <> pdwhse
     C     HLWHSE        IFNE      WK0014
     C* GETREC d.pcklst,f.warehed,*eq,prcoyno,pdwhse
     C*
     C                   EXSR      S007
     C* PRINT report,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT INVOICE,aaa
     C                   MOVE      '0'           *INOB
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OB
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* L1TQTY = l1tqty + pdtqty
     C     L1TQTY        ADD       WDTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        L1TQTY
     C* EXTEND = %RRS(L1TQTY * ITLPRC)
     C     L1TQTY        MULT      WTLPRC        NRSLT0
     C*  Round Result
     C                   Z-ADD(H)  NRSLT0        EXTEND
     C* TEXTEND = TEXTEND + EXTEND
     C     RN0003        ADD       EXTEND        NRSLT0
     C                   Z-ADD     NRSLT0        RN0003
     C* GETREC D.UOM,F.UOM,*EQ,PRCOYNO,ITUOM
     C*
     C                   EXSR      S010
     C* IF %STS(D.UOM,F.UOM) = *YES
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C* WKUOM = ITUOM
     C                   MOVE      WTUOM         WKUOM
     C* WKUQ = UMQTYO
     C                   Z-ADD     WMQTYO        WKUQ
     C* ELSE                                                          *
     C                   ELSE
     C* WKUOM = *BLANKS
     C                   MOVEL     *BLANKS       WKUOM
     C* WKUQ = *ZEROS
     C                   Z-ADD     *ZEROS        WKUQ
     C* END                                                           *
     C                   END
     C* HLWHSE = pdwhse
     C                   MOVE      WK0014        HLWHSE
     C* HLITEM = pditem
     C                   MOVE      *BLANKS       HLITEM
     C                   MOVEL     WDITEM        HLITEM
     C* HLLOCN = pdlocn
     C                   MOVE      WDLOCN        HLLOCN
     C* GETREC D.PCKLST,F.PCKLSD,*NE,PRCOYNO,PRSEQ
     C*
     C                   EXSR      S005
     C* END                                                           *
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
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
     C                   END
     C* Print totals for item
     C* IF %ovf(report)=*yes
     C*  Over flow on printer file.
     C     *INOA         IFEQ      '1'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* PRINT report,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT INVOICE,aaa
     C                   MOVE      '0'           *INOB
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OB
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* PRINT report,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT report,xxx
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT Invoice,bbb
     C                   MOVE      '0'           *INOB
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OB
     C                   MOVEA     SAVIN         *IN
     C* EXSUBR fsrr
     C                   EXSR      S500
     C* PRINT invoice,xxx
     C                   MOVE      '0'           *INOB
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0006                               OB
     C                   MOVEA     SAVIN         *IN
     C                   EXSR      SEND
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
     C                   RETURN
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* S500 - Write Receiving Record
     C*****************************************************************
     C     S500          BEGSR
     C*
     C* ##CLOC = %ctn(#TSTORE)
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        ##CLOC
     C                   MOVE      RN0002        ##CLOC
     C*                                                               *
     C* RCCLOC = ##CLOC
     C                   Z-ADD     ##CLOC        WCCLOC
     C* RCCNO = ##cloc * 1000
     C     ##CLOC        MULT      1000          NRSLT0
     C                   Z-ADD     NRSLT0        WCCNO
     C* RCCNO = rccno + FSRCNUM
     C     WCCNO         ADD       @DS002        NRSLT0
     C                   Z-ADD     NRSLT0        WCCNO
     C*                                                               *
     C* RCCIT# = %ljf(HLITEM)
     C*  Left Justify field into result field
     C                   MOVEL     HLITEM        WCCIT#
     C* #INVNO = INVNO
     C                   Z-ADD     INVNO         #INVNO
     C* RCCIV# = %CTC(#INVNO)
     C*  Convert To Character
     C                   MOVE      *BLANK        WCCIV#
     C                   MOVEL     #INVNO        WCCIV#
     C* RCCIVD = invdat
     C                   Z-ADD     INVDAT        WCCIVD
     C*                                                               *
     C* GETREC D.IPSITEML1,F.IPSITEML1,*EQ,PRCOYNO,PDITEM
     C*
     C                   EXSR      S011
     C* IF %STS(D.IPSITEML1,F.IPSITEML1) = *YES
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C* RCCVD# = %ljf(PISUPPN)
     C*  Left Justify field into result field
     C                   MOVEL     WK0005        WCCVD#
     C* ELSE                                                          *
     C                   ELSE
     C* RCCVD# = *BLANKS
     C                   MOVEL     *BLANKS       WCCVD#
     C* END                                                           *
     C                   END
     C*                                                               *
     C* AUDF = %LJF(ITUDF1)
     C*  Left Justify field into result field
     C                   MOVEL     WTUDF1        AUDF
     C* RCCCAT = %CTN(AUDF)
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        WCCCAT
     C                   MOVE      AUDF          WCCCAT
     C* AUDF = %LJF(ITUDF2)
     C*  Left Justify field into result field
     C                   MOVEL     WTUDF2        AUDF
     C* RCCSBC = %CTN(AUDF)
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        WCCSBC
     C                   MOVE      AUDF          WCCSBC
     C* RCCRE# = *BLANKS
     C                   MOVEL     *BLANKS       WCCRE#
     C*                                                               *
     C* RCCQTY = L1TQTY
     C                   Z-ADD     L1TQTY        WCCQTY
     C* RCCEAC = ITSTUC / WKUQ
     C     WKUQ          IFEQ      *ZERO
     C                   MOVE      *HIVAL        NRSLT0
     C                   ELSE
     C     WTSTUC        DIV       WKUQ          NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        WCCEAC
     C* RCCUNC = ITSTUC
     C                   Z-ADD     WTSTUC        WCCUNC
     C*                                                               *
     C* WRITE D.FSRR,F.FSRR
     C*
     C                   EXSR      S012
     C*
     C     $S500         ENDSR
     C/EJECT
     C*****************************************************************
     C* S501 - Get Warehouse Addresses
     C*****************************************************************
     C     S501          BEGSR
     C*
     C* *** Initialise "From" Fields
     C* WFWHSE = ' ' ; from warehouse
     C                   MOVEL     *BLANKS       WFWHSE
     C* WFLIN1 = ' ' ; address line 1
     C                   MOVEL     *BLANKS       WFLIN1
     C* WFLIN2 = ' ' ; address line 2
     C                   MOVEL     *BLANKS       WFLIN2
     C* WFLIN3 = ' ' ; address line 3
     C                   MOVEL     *BLANKS       WFLIN3
     C* WFLIN4 = ' ' ; address line 4
     C                   MOVEL     *BLANKS       WFLIN4
     C* WFLIN5 = ' ' ; address line 5
     C                   MOVEL     *BLANKS       WFLIN5
     C* WFLIN6 = ' ' ; address line 6
     C                   MOVEL     *BLANKS       WFLIN6
     C* WFPSTCD = ' ' ; post code
     C                   MOVEL     *BLANKS       RN0005
     C* WFCONNAM = ' ' ; contact name
     C                   MOVEL     *BLANKS       RN0004
     C* WFTELEPH = ' ' ; telephone number
     C                   MOVEL     *BLANKS       RN0006
     C* WFNARR = ' ' ; from narrative
     C                   MOVEL     *BLANKS       WFNARR
     C* #TSTORE = %LJF(*BLANKS)
     C*  Left Justify field into result field
     C                   MOVEL     *BLANKS       RN0002
     C* GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLFWH
     C*
     C                   EXSR      S013
     C* IF %Sts(D.IPSWADD,F.IPSWADD)=*YES
     C*  Status of last file I/O
     C     STS11         IFEQ      *ZERO
     C* GETREC D.FSSTORL1,F.FSSTORL1,*EQ,PRCOYNO,PLFWH
     C*
     C                   EXSR      S014
     C* #FSTORE = %LJF(WLUSDF)
     C*  Left Justify field into result field
     C                   MOVEL     WK0002        RN0001
     C* WFWHSE = plfwh
     C                   MOVE      WLFWH         WFWHSE
     C* WFLIN1 = pdlin1
     C                   MOVE      WDLIN1        WFLIN1
     C* WFLIN2 = pdlin2
     C                   MOVE      WDLIN2        WFLIN2
     C* WFLIN3 = pdlin3
     C                   MOVE      WDLIN3        WFLIN3
     C* WFLIN4 = pdlin4
     C                   MOVE      WDLIN4        WFLIN4
     C* WFLIN5 = pdlin5
     C                   MOVE      WDLIN5        WFLIN5
     C* WFLIN6 = pdlin6
     C                   MOVE      WDLIN6        WFLIN6
     C* WFPSTCD = pdpstcd
     C                   MOVE      WK0008        RN0005
     C* WFCONNAM = pdconnam
     C                   MOVE      WK0006        RN0004
     C* WFTELEPH = pdteleph
     C                   MOVE      WK0009        RN0006
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** To Warehouse
     C*                                                               *
     C* *** Initialise "From" Fields
     C* WTWHSE = ' ' ; from warehouse
     C                   MOVEL     *BLANKS       WTWHSE
     C* WTLIN1 = ' ' ; address line 1
     C                   MOVEL     *BLANKS       WTLIN1
     C* WTLIN2 = ' ' ; address line 2
     C                   MOVEL     *BLANKS       WTLIN2
     C* WTLIN3 = ' ' ; address line 3
     C                   MOVEL     *BLANKS       WTLIN3
     C* WTLIN4 = ' ' ; address line 4
     C                   MOVEL     *BLANKS       WTLIN4
     C* WTLIN5 = ' ' ; address line 5
     C                   MOVEL     *BLANKS       WTLIN5
     C* WTLIN6 = ' ' ; address line 6
     C                   MOVEL     *BLANKS       WTLIN6
     C* WTPSTCD = ' ' ; post code
     C                   MOVEL     *BLANKS       RN0009
     C* WTCONNAM = ' ' ; contact name
     C                   MOVEL     *BLANKS       RN0008
     C* WTTELEPH = ' ' ; telephone number
     C                   MOVEL     *BLANKS       RN0010
     C* WTNARR = ' ' ; to narrative
     C                   MOVEL     *BLANKS       WTNARR
     C* #TSTORE = %LJF(*BLANKS)
     C*  Left Justify field into result field
     C                   MOVEL     *BLANKS       RN0002
     C* GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLTWH
     C*
     C                   EXSR      S015
     C* IF %Sts(D.IPSWADD,F.IPSWADD)=*YES
     C*  Status of last file I/O
     C     STS11         IFEQ      *ZERO
     C* GETREC D.FSSTORL1,F.FSSTORL1,*EQ,PRCOYNO,PLTWH
     C*
     C                   EXSR      S016
     C* #TSTORE = %LJF(WLUSDF)
     C*  Left Justify field into result field
     C                   MOVEL     WK0002        RN0002
     C* WTWHSE = plfwh
     C                   MOVE      WLFWH         WTWHSE
     C* WTLIN1 = pdlin1
     C                   MOVE      WDLIN1        WTLIN1
     C* WTLIN2 = pdlin2
     C                   MOVE      WDLIN2        WTLIN2
     C* WTLIN3 = pdlin3
     C                   MOVE      WDLIN3        WTLIN3
     C* WTLIN4 = pdlin4
     C                   MOVE      WDLIN4        WTLIN4
     C* WTLIN5 = pdlin5
     C                   MOVE      WDLIN5        WTLIN5
     C* WTLIN6 = pdlin6
     C                   MOVE      WDLIN6        WTLIN6
     C* WTPSTCD = pdpstcd
     C                   MOVE      WK0008        RN0009
     C* WTCONNAM = pdconnam
     C                   MOVE      WK0006        RN0008
     C* WTTELEPH = pdteleph
     C                   MOVE      WK0009        RN0010
     C* END                                                           *
     C                   END
     C*
     C     $S501         ENDSR
     C/EJECT
     C*****************************************************************
     C* SBRDAT - Converts DATE field into YEAR, MONTH, and DAYS
     C*          Accepts numeric argument (DATE) and a format
     C*          (DATFMT) and breaks it into YEAR, MONTH, and DAYS.
     C*****************************************************************
     C     SBRDAT        BEGSR
     C*
     C                   Z-ADD     *ZERO         SVCY
     C                   Z-ADD     *ZERO         SVCC
     C                   Z-ADD     *ZERO         NRSLT
     C     NARG1         IFEQ      *HIVAL
     C                   MOVE      *HIVAL        NRSLT
     C                   ELSE
     C*
     C     DATFMT        IFNE      'JUL'
     C     DATFMT        ANDNE     'CJL'
     C*
     C     DATFMT        IFEQ      'YMD'
     C     DATFMT        OREQ      'MDY'
     C     DATFMT        OREQ      'DMY'
     C                   Z-ADD     NARG1         X1DATE
     C* Year_Month_Day
     C     DATFMT        IFEQ      'YMD'
     C                   Z-ADD     X12           SVYY
     C                   Z-ADD     X34           SVMM
     C                   Z-ADD     X56           SVDD
     C                   ELSE
     C*
     C* Month_Day_Year
     C     DATFMT        IFEQ      'MDY'
     C                   Z-ADD     X12           SVMM
     C                   Z-ADD     X34           SVDD
     C                   Z-ADD     X56           SVYY
     C                   ELSE
     C*
     C* Day_Month_Year
     C     DATFMT        IFEQ      'DMY'
     C                   Z-ADD     X12           SVDD
     C                   Z-ADD     X34           SVMM
     C                   Z-ADD     X56           SVYY
     C                   END
     C                   END
     C                   END
     C                   ELSE
     C*
     C                   Z-ADD     NARG1         X1CDAT                         CCYY
     C     DATFMT        IFEQ      'CMD'
     C                   Z-ADD     X12           SVCC
     C                   Z-ADD     X34           SVYY
     C                   Z-ADD     X56           SVMM
     C                   Z-ADD     X78           SVDD
     C                   ELSE
     C*
     C                   Z-ADD     X56           SVCC
     C                   Z-ADD     X78           SVYY
     C     DATFMT        IFEQ      'MDC'
     C                   Z-ADD     X12           SVMM
     C                   Z-ADD     X34           SVDD
     C                   ELSE
     C*
     C     DATFMT        IFEQ      'DMC'
     C                   Z-ADD     X12           SVDD
     C                   Z-ADD     X34           SVMM
     C                   END
     C                   END
     C                   END
     C                   END
     C                   MOVEL     SVCC          SVCY
     C                   MOVE      SVYY          SVCY
     C*
     C* Assign default to century.
     C     SVCC          IFEQ      *ZERO
     C     SVYY          IFGT      45
     C                   Z-ADD     19            SVCC
     C                   MOVEL     19            SVCY
     C                   ELSE
     C                   Z-ADD     20            SVCC
     C                   MOVEL     20            SVCY
     C                   ENDIF
     C                   END
     C* If year is 1900, 2100, 2200 then it's not a leap year.
     C* If year is 2000, 2400, 2800 then it's a leap year.
     C     SVYY          IFEQ      0
     C     SVCC          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   ELSE
     C* Check for leap year.
     C     SVYY          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   END
     C* Setup month of FEB and validate date.
     C     SVLEAP        IFEQ      0
     C                   Z-ADD     29            FEB
     C                   ELSE
     C                   Z-ADD     28            FEB
     C                   END
     C*
     C* Process julian date.
     C                   ELSE
     C     NARG1         IFGT      99366
     C     DATFMT        ANDEQ     'JUL'
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C     NARG1         IFGT      9999366
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C* Get the year.
     C     DATFMT        IFEQ      'JUL'
     C     NARG1         DIV       1000          SVYY
     C                   MVR                     SVDAYS
     C                   MOVE      SVYY          SVCY
     C                   ELSE
     C     NARG1         DIV       1000          SVCY                           CCYY
     C                   MVR                     SVDAYS
     C                   MOVEL     SVCY          SVCC
     C                   MOVE      SVCY          SVYY
     C                   END
     C*
     C* Assign default to century.
     C     SVCC          IFEQ      *ZERO
     C     SVCY          IFGT      45
     C                   Z-ADD     19            SVCC
     C                   MOVEL     19            SVCY
     C                   ELSE
     C                   Z-ADD     20            SVCC
     C                   MOVEL     20            SVCY
     C                   ENDIF
     C                   END
     C*
     C* If year is 1900, 2100, 2200 then it's not a leap year.
     C* If year is 2000, 2400, 2800 then it's a leap year.
     C     SVYY          IFEQ      0
     C     SVCC          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   ELSE
     C* Check for leap year.
     C     SVYY          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   END
     C* Setup month of FEB and validate date.
     C     SVLEAP        IFEQ      0
     C     SVDAYS        IFGT      366
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   Z-ADD     29            FEB
     C                   ELSE
     C     SVDAYS        IFGT      365
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   Z-ADD     28            FEB
     C                   END
     C*
     C                   END
     C                   END
     C*
     C* Change SVDAYS into month and days.
     C*
     C     NRSLT         IFNE      *HIVAL
     C*
     C                   MOVE      '0'           *IN92
     C                   DO        12            C1
     C* Jan, mar, may, jul, aug, oct, or dec.
     C     C1            IFEQ      1
     C     C1            OREQ      3
     C     C1            OREQ      5
     C     C1            OREQ      7
     C     C1            OREQ      8
     C     C1            OREQ      10
     C     C1            OREQ      12
     C     SVDAYS        IFGT      31
     C                   SUB       31            SVDAYS
     C                   ELSE
     C                   MOVE      '1'           *IN92
     C                   END
     C                   END
     C* apr, jun, sept, or nov.
     C     C1            IFEQ      4
     C     C1            OREQ      6
     C     C1            OREQ      9
     C     C1            OREQ      11
     C     SVDAYS        IFGT      30
     C                   SUB       30            SVDAYS
     C                   ELSE
     C                   MOVE      '1'           *IN92
     C                   END
     C                   END
     C* feb
     C     C1            IFEQ      2
     C     SVDAYS        IFGT      FEB
     C                   SUB       FEB           SVDAYS
     C                   ELSE
     C                   MOVE      '1'           *IN92
     C                   END
     C                   END
     C*
     C  N92              END
     C*
     C                   Z-ADD     C1            SVMM
     C                   Z-ADD     SVDAYS        SVDD
     C*
     C                   END
     C                   END
     C*
     C     SVMM          IFGT      12
     C     SVMM          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C* Jan, mar, may, jul, aug, oct, or dec.
     C     SVDD          IFGT      31
     C     SVDD          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C* apr, jun, sept, or nov.
     C     SVMM          IFEQ      4
     C     SVMM          OREQ      6
     C     SVMM          OREQ      9
     C     SVMM          OREQ      11
     C     SVDD          IFGT      30
     C     SVDD          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   END
     C* feb
     C     SVMM          IFEQ      2
     C     SVDD          IFGT      FEB
     C     SVDD          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   END
     C                   END
     C                   END
     C*
     C                   END
     C*
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SDMC - Convert date into Day_month_cenyr form.
     C*        Argument with value of zero results in zero.
     C*
     C* FUNCTION:    DMC(DATE)
     C*****************************************************************
     C     SDMC          BEGSR
     C*
     C     NARG1         IFEQ      *ZERO
     C                   Z-ADD     *ZERO         NRSLT
     C                   ELSE
     C*
     C* Break Date in MONTH, DAY, and YEAR.
     C                   EXSR      SBRDAT
     C     NRSLT         IFNE      *HIVAL
     C* Get result in DMC format.
     C                   Z-ADD     SVDD          X12
     C                   Z-ADD     SVMM          X34
     C                   Z-ADD     SVCC          X56
     C                   Z-ADD     SVYY          X78
     C                   Z-ADD     X1CDAT        NRSLT
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMSG - Error messages to job log.
     C*        calls message handling program to add error
     C*        messages to job log or extract message from message file
     C*****************************************************************
     C     SMSG          BEGSR
     C*
     C                   CALL      'CLMSG'       PMSGCL
     C                   ENDSR
     C/EJECT
     C**************************************************************************
     C* S001   - GETREC d.company,f.company,*eq,prcoyno
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM001        KYCO01
     C     K0001         CHAIN     COMPANY                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.COMPANY   IMSC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.COMPANY   IMSC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC D.COMPANY,F.IMSCPYD,*EQ,PRCOYNO
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM001        KYCO01
     C     K0001         CHAIN     IMSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.IMSCPYD   IMST
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.IMSCPYD   IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - GETREC d.pcklst,f.pcklst,*eq,prcoyno,prseq
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM001        KLCO01
     C                   Z-ADD     PRSEQ         KLSE02
     C     K0002         CHAIN     PCKLST                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PCKLST    PCKL
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PCKLST    PCKL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - SETLL d.pcklst,f.pcklsd,prcoyno,prseq
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.PCKLSD    ITMM
     C                   MOVE      'N'           SWRD06                         RD.SW.ITMMAST   WARE
     C                   MOVE      'N'           SWRD05                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD07                         RD.SW.WARELOC
     C                   MOVEL     *LOVAL        HD0010                         Warehouse Number
     C                   MOVEL     *LOVAL        HDPCKR                         Picking Route
     C                   MOVEL     *LOVAL        HDLOCN                         Location
     C                   MOVEL     *LOVAL        HDITEM                         Item Number
     C*
     C                   MOVEL     PRM001        KLCO01
     C                   MOVEL     PRM001        HD0009                         Company number
     C                   MOVEL     PRM001        RN0043                         Company number
     C                   Z-ADD     PRSEQ         KLSE02
     C                   Z-ADD     PRSEQ         HDSEQ                          Picking list
     C                   Z-ADD     PRSEQ         PDSEQ                          Picking list
     C*
     C     K0002         SETLL     PCKLSD                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - GETREC D.PCKLST,F.PCKLSD,*NE,PRCOYNO,PRSEQ
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM001        KLCO01
     C                   Z-ADD     PRSEQ         KLSE02
     C     K0002         READE     PCKLSD                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.PCKLSD    ITMM
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.PCKLSD    ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S006                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - Process To Reset File Pointer(EOF) - PCKLSD
     C**************************************************************************
     C     S006          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.PCKLSD    ITMM
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.PCKLSD    ITMM
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0043        KLCO01
     C                   Z-ADD     PDSEQ         KLSE02                         Picking list
     C     K0002         SETGT     PCKLSD
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.PCKLST,F.WAREHED,*EQ,PRCOYNO,PDWHSE
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM001        KLCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     WK0014        KDWH02
     C     K0003         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - GETREC D.PCKLST,F.ITMMAST,*EQ,PRCOYNO,PDITEM
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM001        KLCO01
     C                   MOVEL     *BLANK        KDIT02
     C                   MOVEL     WDITEM        KDIT02
     C     K0004         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.ITMMAST   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.ITMMAST   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.PCKLST,F.WARELOC,*EQ,PRCOYNO,PDWHSE,PDLOCN
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM001        KLCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     WK0014        KDWH02
     C                   MOVEL     *BLANK        KDLO03
     C                   MOVEL     WDLOCN        KDLO03
     C     K0005         CHAIN     WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.WARELOC
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.WARELOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - GETREC D.UOM,F.UOM,*EQ,PRCOYNO,ITUOM
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KMCO01
     C                   MOVEL     PRM001        KMCO01
     C                   MOVEL     *BLANK        KMUO02
     C                   MOVEL     WTUOM         KMUO02
     C     K0006         CHAIN     UOM                                9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.UOM
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - GETREC D.IPSITEML1,F.IPSITEML1,*EQ,PRCOYNO,PDITEM
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     PRM001        KICO01
     C                   MOVEL     *BLANK        KIIT02
     C                   MOVEL     WDITEM        KIIT02
     C     K0007         CHAIN     FILE0001                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.IPSITEML1
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.IPSITEML1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - WRITE D.FSRR,F.FSRR
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   Z-ADD     13            WFILE#                         SET FILE#
     C                   WRITE     FSRRRX                               90      ADD REC TO FSRR
     C                   Z-ADD     STS13         STS10                          SYNC STATUS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   Z-ADD     REC13         REC10
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLFWH
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     WLFWH         KDWH02
     C     K0008         CHAIN     IPSWADD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD11                         RD.SW.IPSWADD
     C                   Z-ADD     *ZERO         HRC11                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD11                         RD.SW.IPSWADD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - GETREC D.FSSTORL1,F.FSSTORL1,*EQ,PRCOYNO,PLFWH
     C**************************************************************************
     C     S014          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCN01
     C                   MOVEL     PRM001        KLCN01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     WLFWH         KLWH02
     C     K0009         CHAIN     FSSTORL1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.FSSTORL1
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.FSSTORL1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLTWH
     C**************************************************************************
     C     S015          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     WLTWH         KDWH02
     C     K0008         CHAIN     IPSWADD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD11                         RD.SW.IPSWADD
     C                   Z-ADD     *ZERO         HRC11                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD11                         RD.SW.IPSWADD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - GETREC D.FSSTORL1,F.FSSTORL1,*EQ,PRCOYNO,PLTWH
     C**************************************************************************
     C     S016          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCN01
     C                   MOVEL     PRM001        KLCN01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     WLTWH         KLWH02
     C     K0009         CHAIN     FSSTORL1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.FSSTORL1
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.FSSTORL1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   READ      FSRR                                   90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            COMPANY
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            IMSCPYD
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            PCKLST
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            PCKLSD
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            WAREHED
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            ITMMAST
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      7                                            WARELOC
     C     STS07         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS07                          ASSET LOCK STATUS
     C                   ELSE
     C     STS07         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS07                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      8                                            UOM
     C     STS08         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS08                          ASSET LOCK STATUS
     C                   ELSE
     C     STS08         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS08                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      9                                            IPSITEML1
     C     STS09         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS09                          ASSET LOCK STATUS
     C                   ELSE
     C     STS09         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS09                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      10                                           FSRR
     C     STS10         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS10                          ASSET LOCK STATUS
     C                   ELSE
     C     STS10         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS10                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      11                                           IPSWADD
     C     STS11         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS11                          ASSET LOCK STATUS
     C                   ELSE
     C     STS11         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS11                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      12                                           FSSTORL1
     C     STS12         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS12                          ASSET LOCK STATUS
     C                   ELSE
     C     STS12         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS12                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      13                                           FSRRX
     C     STS13         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS13                          ASSET LOCK STATUS
     C                   ELSE
     C     STS13         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS13                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From Work Area To File - FSRR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      10
     C                   Z-ADD     WCCCAT        RCCCAT                         Category
     C                   Z-ADD     WCCEAC        RCCEAC                         Each Cost
     C                   MOVEL     WCCIT#        RCCIT#                         Item Number
     C                   MOVEL     WCCIV#        RCCIV#                         Invoice Number
     C                   Z-ADD     WCCIVD        RCCIVD                         Invoice Date
     C                   Z-ADD     WCCLOC        RCCLOC                         Location
     C                   Z-ADD     WCCNO         RCCNO                          Receiving Location
     C                   Z-ADD     WCCQTY        RCCQTY                         Quantity Received
     C                   MOVEL     WCCRE#        RCCRE#                         Reorder Number
     C                   Z-ADD     WCCSBC        RCCSBC                         Sub-category
     C                   Z-ADD     WCCUNC        RCCUNC                         Unit Cost
     C                   MOVEL     WCCVD#        RCCVD#                         Vendor Number
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     CYDESC        WYDESC                         Company description
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0011        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0018        WK0004                         User Field 1 Heading
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0017        HD0003                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PCKLST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0044        WK0015                         Company number
     C                   MOVEL     PLCRBY        WK0016                         Created By
     C                   Z-ADD     PLCRDT        WK0017                         Created Date
     C                   MOVEL     PLFWH         WLFWH                          From Warehouse
     C                   Z-ADD     PLSEQ         WLSEQ                          Picking List No.
     C                   MOVEL     PLTWH         WLTWH                          To Warehouse (if tra
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0044        HD0011                         Company number
     C                   Z-ADD     PLSEQ         HLSEQ                          Picking List No.
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PCKLSD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   Z-ADD     PDCOST        WDCOST                         Unit Cost
     C                   MOVEL     RN0043        WK0013                         Company number
     C                   MOVEL     PDITEM        WDITEM                         Item Number
     C                   MOVEL     PDLOCN        WDLOCN                         Location
     C                   MOVEL     PDPCKR        WDPCKR                         Picking Route
     C                   Z-ADD     PDSEQ         WDSEQ                          Picking list
     C                   Z-ADD     PDTQTY        WDTQTY                         Transaction Quantity
     C                   MOVEL     PDTRNC        WDTRNC                         Transaction Type
     C                   MOVEL     PDWHSE        WK0014                         Warehouse Number
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0043        HD0009                         Company number
     C                   Z-ADD     PDSEQ         HDSEQ                          Picking list
     C                   MOVEL     PDWHSE        HD0010                         Warehouse Number
     C                   MOVEL     PDPCKR        HDPCKR                         Picking Route
     C                   MOVEL     PDLOCN        HDLOCN                         Location
     C                   MOVEL     PDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0047        WK0019                         Warehouse Descriptio
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0046        HD0013                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     RN0040        WK0010                         Alpha Search
     C                   MOVEL     ITCLAS        WTCLAS                         Item Class
     C                   MOVEL     RN0041        WK0011                         Company number
     C                   MOVEL     ITCRTU        WTCRTU                         Created By
     C                   Z-ADD     ITDTCR        WTDTCR                         Created date
     C                   Z-ADD     ITDTLM        WTDTLM                         Amended date
     C                   MOVEL     RN0042        WK0012                         Item Description
     C                   MOVEL     ITIGRP        WTIGRP                         Stock Group
     C                   MOVEL     ITITEM        WTITEM                         Item Number
     C                   MOVEL     ITITYP        WTITYP                         Item Type - business
     C                   MOVEL     ITLMBY        WTLMBY                         Amended By
     C                   Z-ADD     ITLPRC        WTLPRC                         List Price
     C                   MOVEL     ITMANF        WTMANF                         Manufacturers Item N
     C                   MOVEL     ITNLAC        WTNLAC                         N/L Cost of Sales Ac
     C                   MOVEL     ITNLAS        WTNLAS                         N/L Sales Account
     C                   MOVEL     ITNLST        WTNLST                         N/L Stock Account
     C                   Z-ADD     ITPACK        WTPACK                         Packing Multiplier
     C                   MOVEL     ITPALL        WTPALL                         Pallet label
     C                   Z-ADD     ITQTYO        WTQTYO                         Outer Quantity
     C                   MOVEL     ITSANL        WTSANL                         Stock Analysis Code
     C                   MOVEL     ITSIG         WTSIG                          Stock Inventory Grou
     C                   Z-ADD     ITSTUC        WTSTUC                         Standard unit cost
     C                   MOVEL     ITSUBS        WTSUBS                         Substitute item numb
     C                   MOVEL     ITSUPD        WTSUPD                         Superceding Item 'Fr
     C                   MOVEL     ITSUPG        WTSUPG                         Superceding item 'To
     C                   MOVEL     ITSVG         WTSVG                          Stock Value Group
     C                   MOVEL     ITUDF1        WTUDF1                         User Defined 1
     C                   MOVEL     ITUDF2        WTUDF2                         User Defined 2
     C                   MOVEL     ITUDF3        WTUDF3                         User Defined 3
     C                   MOVEL     ITUOM         WTUOM                          Unit of Measure
     C                   MOVEL     ITUOMO        WTUOMO                         Outer Unit of Measur
     C                   MOVEL     ITVATC        WTVATC                         VAT Code
     C                   Z-ADD     ITWEIG        WTWEIG                         Item weight
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0041        HD0008                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WARELOC
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     WLDESC        WK0020                         Location Description
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0048        HD0014                         Company number
     C                   MOVEL     WLWHSE        HD0016                         Warehouse Number
     C                   MOVEL     WLLOCN        HD0015                         Location
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - UOM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      08
     C                   MOVEL     RN0045        WK0018                         Company number
     C                   Z-ADD     UMQTYO        WMQTYO                         Quantity per unit
     C                   MOVEL     UMUOM         WMUOM                          Unit of Measure
     C                   Z-ADD     REC08         HRC08
     C                   MOVEL     RN0045        HD0012                         Company number
     C                   MOVEL     UMUOM         HMUOM                          Unit of Measure
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSITEML1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      09
     C                   MOVEL     RN0035        WK0005                         Supplier Number
     C                   Z-ADD     REC09         HRC09
     C                   MOVEL     RN0023        HD0005                         Company number
     C                   MOVEL     PIITEM        HIITEM                         Item Number
     C                   MOVEL     RN0035        HD0006                         Supplier Number
     C                   MOVEL     RN0021        HD0004                         Branch Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - FSRR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      10
     C                   Z-ADD     RCCCAT        WCCCAT                         Category
     C                   Z-ADD     RCCEAC        WCCEAC                         Each Cost
     C                   MOVEL     RCCIT#        WCCIT#                         Item Number
     C                   MOVEL     RCCIV#        WCCIV#                         Invoice Number
     C                   Z-ADD     RCCIVD        WCCIVD                         Invoice Date
     C                   Z-ADD     RCCLOC        WCCLOC                         Location
     C                   Z-ADD     RCCNO         WCCNO                          Receiving Location
     C                   Z-ADD     RCCQTY        WCCQTY                         Quantity Received
     C                   MOVEL     RCCRE#        WCCRE#                         Reorder Number
     C                   Z-ADD     RCCSBC        WCCSBC                         Sub-category
     C                   Z-ADD     RCCUNC        WCCUNC                         Unit Cost
     C                   MOVEL     RCCVD#        WCCVD#                         Vendor Number
     C                   Z-ADD     REC10         HRC10
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSWADD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      11
     C                   MOVEL     RN0036        WK0006                         Contact name
     C                   MOVEL     RN0037        WK0007                         Company number
     C                   MOVEL     PDLIN1        WDLIN1                         Address
     C                   MOVEL     PDLIN2        WDLIN2                         Address Line 2
     C                   MOVEL     PDLIN3        WDLIN3                         Address Line 3
     C                   MOVEL     PDLIN4        WDLIN4                         Address Line 4
     C                   MOVEL     PDLIN5        WDLIN5                         Address Line 5
     C                   MOVEL     PDLIN6        WDLIN6                         Address Line 6
     C                   MOVEL     RN0038        WK0008                         Post code
     C                   MOVEL     RN0039        WK0009                         Telephone number
     C                   MOVEL     PDWHSE        WDWHSE                         Warehouse Number
     C                   Z-ADD     REC11         HRC11
     C                   MOVEL     RN0037        HD0007                         Company number
     C                   MOVEL     PDWHSE        HDWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - FSSTORL1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      12
     C                   MOVEL     WLCNO         WK0001                         Company number
     C                   MOVEL     WLUSDF        WK0002                         Store Number
     C                   MOVEL     WLWHSE        WK0003                         Warehouse Number
     C                   Z-ADD     REC12         HRC12
     C                   MOVEL     WLCNO         HLCNO                          Company number
     C                   MOVEL     WLWHSE        HD0002                         Warehouse Number
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
