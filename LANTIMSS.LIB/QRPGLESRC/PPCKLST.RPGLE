     F/TITLE PPCKLST Print Picking List
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PPCKLST
     F*  Application ID      -    PPCKLST
     F*  Application Name    -    Print Picking List
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  PCKLST      - (I/DISK   ) IMS Picking List            PL
     F*  PCKLSD      - (I/DISK   ) IMS Picking list details    PD
     F*  WAREHED     - (I/DISK   ) IMS Warehouse Header        WH
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  WARELOC     - (I/DISK   ) IMS Warehouse Locations     WL
     F*  IPSWADD     - (I/DISK   ) IPS Wharehouse address
     F*  PPCKLSTO    - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S500 - Get Warehouse Addresses
     F* SY0010 - Format Date
     F* SMSG - Error messages to job log.
     F* S001   - GETREC d.company,f.company,*eq,prcoyno
     F* S002   - GETREC d.pcklst,f.pcklst,*eq,prcoyno,prseq
     F* S003   - SETLL d.pcklst,f.pcklsd,prcoyno,prseq
     F* S004   - GETREC D.PCKLST,F.PCKLSD,*NE,PRCOYNO,PRSEQ
     F* S005   - Process To Reset File Pointer(EOF) - PCKLSD
     F* S006   - GETREC D.PCKLST,F.WAREHED,*EQ,PRCOYNO,PDWHSE
     F* S007   - GETREC D.PCKLST,F.ITMMAST,*EQ,PRCOYNO,PDITEM
     F* S008   - GETREC D.PCKLST,F.WARELOC,*EQ,PRCOYNO,PDWHSE,PDLOCN
     F* S009   - GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLFWH
     F* S010   - GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLTWH
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FPCKLST    IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FPCKLSD    IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FWAREHED   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FWARELOC   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FIPSWADD   IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FPPCKLSTO  O    E             PRINTER
     F                                     INFDS(FIDS08)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                367    368B 0
     D  OLN08                188    189B 0
     D*
     D* Data structure for user define
     D*
     D @DS001          DS
     D  WK0005                 1     40
     D  ITSD                   1     20
     D*
     D* Data structure for user define
     D*
     D @DS002          DS
     D  WK0011                 1     40
     D  WHSD                   1     20
     D*
     D* Data structure for user define
     D*
     D @DS003          DS
     D  WK0012                 1     40
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
     I              CYCOYNO                     RN0013
     I              CYEMPCOL                    RN0014
     I              CYEMPHEAD                   RN0015
     I              CYPRDHEAD                   RN0016
     I              CYREFHEAD                   RN0017
     I              CYSDESC                     RN0018
     IIPSWADDF
     I              PDCONNAM                    RN0019
     I              PDCOYNO                     RN0020
     I              PDPSTCD                     RN0021
     I              PDTELEPH                    RN0022
     IITMSTRF
     I              ITALPHA                     RN0023
     I              ITCOYNO                     RN0024
     I              ITIDESC                     RN0025
     IPCKLSDF
     I              PDCOYNO                     RN0026
     IPCKLSTF
     I              PLCOYNO                     RN0027
     IWAREHEDF
     I              WHCOYNO                     RN0028
     I              WHWDESC                     RN0029
     IWARELOCF
     I              WLCOYNO                     RN0030
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
     C                   PARM                    PRSEQ             5 0
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
     C                   KFLD                    KDCO01
     C                   KFLD                    KDWH02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    RN0019        WK0001                         Contact name
     C     *LIKE         DEFINE    RN0020        WK0002                         Company number
     C     *LIKE         DEFINE    PDLIN1        WDLIN1                         Address
     C     *LIKE         DEFINE    PDLIN2        WDLIN2                         Address Line 2
     C     *LIKE         DEFINE    PDLIN3        WDLIN3                         Address Line 3
     C     *LIKE         DEFINE    PDLIN4        WDLIN4                         Address Line 4
     C     *LIKE         DEFINE    PDLIN5        WDLIN5                         Address Line 5
     C     *LIKE         DEFINE    PDLIN6        WDLIN6                         Address Line 6
     C     *LIKE         DEFINE    RN0021        WK0003                         Post code
     C     *LIKE         DEFINE    RN0022        WK0004                         Telephone number
     C     *LIKE         DEFINE    PDWHSE        WDWHSE                         Warehouse Number
     C     *LIKE         DEFINE    PDCOST        WDCOST                         Unit Cost
     C     *LIKE         DEFINE    RN0026        WK0006                         Company number
     C     *LIKE         DEFINE    PDITEM        WDITEM                         Item Number
     C     *LIKE         DEFINE    PDLOCN        WDLOCN                         Location
     C     *LIKE         DEFINE    PDPCKR        WDPCKR                         Picking Route
     C     *LIKE         DEFINE    PDSEQ         WDSEQ                          Picking list
     C     *LIKE         DEFINE    PDTQTY        WDTQTY                         Transaction Quantity
     C     *LIKE         DEFINE    PDWHSE        WK0007                         Warehouse Number
     C     *LIKE         DEFINE    RN0027        WK0008                         Company number
     C     *LIKE         DEFINE    PLCRDT        WK0010                         Created Date
     C     *LIKE         DEFINE    PLFWH         WLFWH                          From Warehouse
     C     *LIKE         DEFINE    PLTWH         WLTWH                          To Warehouse (if tra
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0013        HD0001
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0020        HD0002
     C     *LIKE         DEFINE    PDWHSE        HDWHSE
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0024        HD0003
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0026        HD0004
     C     *LIKE         DEFINE    PDSEQ         HDSEQ
     C     *LIKE         DEFINE    PDWHSE        HD0005
     C     *LIKE         DEFINE    PDPCKR        HDPCKR
     C     *LIKE         DEFINE    PDLOCN        HDLOCN
     C     *LIKE         DEFINE    PDITEM        HDITEM
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0027        HD0006
     C     *LIKE         DEFINE    PLSEQ         HLSEQ
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0028        HD0007
     C     *LIKE         DEFINE    WHWHSE        HHWHSE
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0030        HD0008
     C     *LIKE         DEFINE    WLWHSE        HD0010
     C     *LIKE         DEFINE    WLLOCN        HD0009
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
     C                   MOVE      *BLANKS       HLITEM           20
     C                   MOVE      *BLANKS       HLLOCN           10
     C                   MOVE      *BLANKS       HLWHSE            3
     C                   MOVE      *ZEROS        L1TQTY            9 0
     C                   MOVE      *BLANKS       ODATE            10
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0001            4            SYCCYYA
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0002            8 0          SYDATI
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0003           10            SYDATO
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0004            1            SYDFMT
     C                   MOVE      *BLANKS       SYDSEP            1
     C                   MOVE      *BLANKS       RN0005            1            SYDSEP
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0006            4            SYMMDDA
     C                   MOVE      *BLANKS       RN0007           20            WFCONNAM
     C                   MOVE      *BLANKS       WFLIN1           40
     C                   MOVE      *BLANKS       WFLIN2           40
     C                   MOVE      *BLANKS       WFLIN3           40
     C                   MOVE      *BLANKS       WFLIN4           40
     C                   MOVE      *BLANKS       WFLIN5           40
     C                   MOVE      *BLANKS       WFLIN6           40
     C                   MOVE      *BLANKS       WFNAR            20
     C                   MOVE      *BLANKS       WFNARR           14
     C                   MOVE      *BLANKS       RN0008            9            WFPSTCD
     C                   MOVE      *BLANKS       RN0009           15            WFTELEPH
     C                   MOVE      *BLANKS       WFWHSE            3
     C                   MOVE      *BLANKS       WKCRDT           10
     C                   MOVE      *BLANKS       RN0010           20            WTCONNAM
     C                   MOVE      *BLANKS       WTLIN1           40
     C                   MOVE      *BLANKS       WTLIN2           40
     C                   MOVE      *BLANKS       WTLIN3           40
     C                   MOVE      *BLANKS       WTLIN4           40
     C                   MOVE      *BLANKS       WTLIN5           40
     C                   MOVE      *BLANKS       WTLIN6           40
     C                   MOVE      *BLANKS       WTNARR           12
     C                   MOVE      *BLANKS       RN0011            9            WTPSTCD
     C                   MOVE      *BLANKS       RN0012           15            WtTELEPH
     C                   MOVE      *BLANKS       WTWHSE            3
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          003
     C                   MOVE      *BLANKS       KLCO01            3            PLCOYNO
     C                   MOVE      *ZEROS        KLSE02            5 0          PLSEQ
     C                   MOVE      *BLANKS       KDWH02            3            PDWHSE
     C                   MOVE      *BLANKS       KDIT02           20            PDITEM
     C                   MOVE      *BLANKS       KDLO03           10            PDLOCN
     C                   MOVE      *BLANKS       RN0031           99
     C                   MOVE      *BLANKS       SWRD07            1            RD STS          0030
     C                   MOVE      *BLANKS       KDCO01            3            PDCOYNO
     C                   MOVE      *BLANKS       RN0032           99
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       SAVIN            99            Save Indword
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
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
     C* Get company name
     C* GETREC d.company,f.company,*eq,prcoyno
     C*
     C                   EXSR      S001
     C*                                                               *
     C* SYDSEP = CYDSEP
     C                   MOVE      WYDSEP        RN0005
     C* SYDFMT = CYDFMT
     C                   MOVE      WYDFMT        RN0004
     C*                                                               *
     C* GETREC d.pcklst,f.pcklst,*eq,prcoyno,prseq
     C*
     C                   EXSR      S002
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* SYDATI = plcrdt
     C                   Z-ADD     WK0010        RN0002
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* WKCRDT = SYDATO
     C                   MOVE      RN0003        WKCRDT
     C* Start read from number
     C* SETLL d.pcklst,f.pcklsd,prcoyno,prseq
     C*
     C                   EXSR      S003
     C* GETREC D.PCKLST,F.PCKLSD,*NE,PRCOYNO,PRSEQ
     C*
     C                   EXSR      S004
     C* GETREC D.PCKLST,F.WAREHED,*EQ,PRCOYNO,PDWHSE
     C*
     C                   EXSR      S006
     C* GETREC D.PCKLST,F.ITMMAST,*EQ,PRCOYNO,PDITEM
     C*
     C                   EXSR      S007
     C* GETREC D.PCKLST,F.WARELOC,*EQ,PRCOYNO,PDWHSE,PDLOCN
     C*
     C                   EXSR      S008
     C* HLWHSE = pdwhse
     C                   MOVE      WK0007        HLWHSE
     C* HLITEM = pditem
     C                   MOVE      WDITEM        HLITEM
     C* HLLOCN = pdlocn
     C                   MOVE      WDLOCN        HLLOCN
     C*                                                               *
     C* Reverse date.
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* SYDATI = plcrdt
     C                   Z-ADD     WK0010        RN0002
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* ODATE = SYDATO
     C                   MOVE      RN0003        ODATE
     C*                                                               *
     C* *** Get Warehouse addresses for headings
     C* EXSUBR getwhad
     C                   EXSR      S500
     C* Print headings
     C* PRINT report,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* DOW %sts(d.pcklst,f.pcklsd)=*yes
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
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
     C                   EXSR      S500
     C* Print totals for item
     C* IF hlwhse <> pdwhse | hlitem <> pditem | hllocn <> pdlocn
     C     HLWHSE        IFNE      WK0007
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
     C* END                                                           *
     C                   END
     C* PRINT report,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* L1TQTY = *zero
     C                   Z-ADD     *ZERO         L1TQTY
     C* GETREC D.PCKLST,F.ITMMAST,*EQ,PRCOYNO,PDITEM
     C*
     C                   EXSR      S007
     C* GETREC D.PCKLST,F.WARELOC,*EQ,PRCOYNO,PDWHSE,PDLOCN
     C*
     C                   EXSR      S008
     C* New page for warehouse
     C* IF hlwhse <> pdwhse
     C     HLWHSE        IFNE      WK0007
     C* GETREC d.pcklst,f.warehed,*eq,prcoyno,pdwhse
     C*
     C                   EXSR      S006
     C* PRINT report,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* L1TQTY = l1tqty + pdtqty
     C     L1TQTY        ADD       WDTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        L1TQTY
     C* HLWHSE = pdwhse
     C                   MOVE      WK0007        HLWHSE
     C* HLITEM = pditem
     C                   MOVE      WDITEM        HLITEM
     C* HLLOCN = pdlocn
     C                   MOVE      WDLOCN        HLLOCN
     C* GETREC D.PCKLST,F.PCKLSD,*NE,PRCOYNO,PRSEQ
     C*
     C                   EXSR      S004
     C* END                                                           *
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
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
     C* S500 - Get Warehouse Addresses
     C*****************************************************************
     C     S500          BEGSR
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
     C                   MOVEL     *BLANKS       RN0008
     C* WFCONNAM = ' ' ; contact name
     C                   MOVEL     *BLANKS       RN0007
     C* WFTELEPH = ' ' ; telephone number
     C                   MOVEL     *BLANKS       RN0009
     C* WFNARR = ' ' ; from narrative
     C                   MOVEL     *BLANKS       WFNARR
     C* GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLFWH
     C*
     C                   EXSR      S009
     C* IF %Sts(D.IPSWADD,F.IPSWADD)=*YES
     C*  Status of last file I/O
     C     STS07         IFEQ      *ZERO
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
     C                   MOVE      WK0003        RN0008
     C* WFCONNAM = pdconnam
     C                   MOVE      WK0001        RN0007
     C* WFTELEPH = pdteleph
     C                   MOVE      WK0004        RN0009
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
     C                   MOVEL     *BLANKS       RN0011
     C* WTCONNAM = ' ' ; contact name
     C                   MOVEL     *BLANKS       RN0010
     C* WTTELEPH = ' ' ; telephone number
     C                   MOVEL     *BLANKS       RN0012
     C* WTNARR = ' ' ; to narrative
     C                   MOVEL     *BLANKS       WTNARR
     C* GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLTWH
     C*
     C                   EXSR      S010
     C* IF %Sts(D.IPSWADD,F.IPSWADD)=*YES
     C*  Status of last file I/O
     C     STS07         IFEQ      *ZERO
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
     C                   MOVE      WK0003        RN0011
     C* WTCONNAM = pdconnam
     C                   MOVE      WK0001        RN0010
     C* WTTELEPH = pdteleph
     C                   MOVE      WK0004        RN0012
     C* END                                                           *
     C                   END
     C*
     C     $S500         ENDSR
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
     C                   MOVEL     *BLANKS       RN0003
     C* ***                                                           *
     C* IF sydsep = ' '
     C     RN0005        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           RN0005
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYCCYY = %ljf(SYDATI) ; YEAR  4
     C*  Left Justify field into result field
     C                   MOVEL     RN0002        SYCCYY
     C* SYMMDD = %RJF(SYDATI) ; MMDD  4
     C*  Right Justify field into result field
     C                   MOVE      RN0002        SYMMDD
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
     C                   MOVE      *BLANK        RN0001
     C                   MOVEL     SYCCYY        RN0001
     C* SYMMDDA = %CTC(SYMMDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0006
     C                   MOVEL     SYMMDD        RN0006
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
     C     RN0004        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0001:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0004        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0001:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0002        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0003
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0002        RN0002
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0005        RN0005
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0004        RN0004
     C*
     C     $SY001        ENDSR
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
     C* S002   - GETREC d.pcklst,f.pcklst,*eq,prcoyno,prseq
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM001        KLCO01
     C                   Z-ADD     PRSEQ         KLSE02
     C     K0002         CHAIN     PCKLST                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PCKLST    PCKL
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PCKLST    PCKL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - SETLL d.pcklst,f.pcklsd,prcoyno,prseq
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST   WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD06                         RD.SW.WARELOC
     C                   MOVEL     *LOVAL        HD0005                         Warehouse Number
     C                   MOVEL     *LOVAL        HDPCKR                         Picking Route
     C                   MOVEL     *LOVAL        HDLOCN                         Location
     C                   MOVEL     *LOVAL        HDITEM                         Item Number
     C*
     C                   MOVEL     PRM001        KLCO01
     C                   MOVEL     PRM001        HD0004                         Company number
     C                   MOVEL     PRM001        RN0026                         Company number
     C                   Z-ADD     PRSEQ         KLSE02
     C                   Z-ADD     PRSEQ         HDSEQ                          Picking list
     C                   Z-ADD     PRSEQ         PDSEQ                          Picking list
     C*
     C     K0002         SETLL     PCKLSD                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC D.PCKLST,F.PCKLSD,*NE,PRCOYNO,PRSEQ
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM001        KLCO01
     C                   Z-ADD     PRSEQ         KLSE02
     C     K0002         READE     PCKLSD                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S005                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - Process To Reset File Pointer(EOF) - PCKLSD
     C**************************************************************************
     C     S005          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PCKLSD    ITMM
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0026        KLCO01
     C                   Z-ADD     PDSEQ         KLSE02                         Picking list
     C     K0002         SETGT     PCKLSD
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.PCKLST,F.WAREHED,*EQ,PRCOYNO,PDWHSE
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM001        KLCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     WK0007        KDWH02
     C     K0003         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.PCKLST,F.ITMMAST,*EQ,PRCOYNO,PDITEM
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM001        KLCO01
     C                   MOVEL     *BLANK        KDIT02
     C                   MOVEL     WDITEM        KDIT02
     C     K0004         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST   WARE
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMMAST   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - GETREC D.PCKLST,F.WARELOC,*EQ,PRCOYNO,PDWHSE,PDLOCN
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM001        KLCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     WK0007        KDWH02
     C                   MOVEL     *BLANK        KDLO03
     C                   MOVEL     WDLOCN        KDLO03
     C     K0005         CHAIN     WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WARELOC
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WARELOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLFWH
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     WLFWH         KDWH02
     C     K0006         CHAIN     IPSWADD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.IPSWADD
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.IPSWADD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - GETREC D.IPSWADD,F.IPSWADD,*EQ,PRCOYNO,PLTWH
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     WLTWH         KDWH02
     C     K0006         CHAIN     IPSWADD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.IPSWADD
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.IPSWADD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
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
     C     WFILE#        IFEQ      2                                            PCKLST
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            PCKLSD
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            WAREHED
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            ITMMAST
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            WARELOC
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      7                                            IPSWADD
     C     STS07         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS07                          ASSET LOCK STATUS
     C                   ELSE
     C     STS07         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS07                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     CYDESC        WYDESC                         Company description
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0013        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PCKLST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0027        WK0008                         Company number
     C                   MOVEL     PLCRBY        WK0009                         Created By
     C                   Z-ADD     PLCRDT        WK0010                         Created Date
     C                   MOVEL     PLFWH         WLFWH                          From Warehouse
     C                   Z-ADD     PLSEQ         WLSEQ                          Picking List No.
     C                   MOVEL     PLTWH         WLTWH                          To Warehouse (if tra
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0027        HD0006                         Company number
     C                   Z-ADD     PLSEQ         HLSEQ                          Picking List No.
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PCKLSD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   Z-ADD     PDCOST        WDCOST                         Unit Cost
     C                   MOVEL     RN0026        WK0006                         Company number
     C                   MOVEL     PDITEM        WDITEM                         Item Number
     C                   MOVEL     PDLOCN        WDLOCN                         Location
     C                   MOVEL     PDPCKR        WDPCKR                         Picking Route
     C                   Z-ADD     PDSEQ         WDSEQ                          Picking list
     C                   Z-ADD     PDTQTY        WDTQTY                         Transaction Quantity
     C                   MOVEL     PDWHSE        WK0007                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0026        HD0004                         Company number
     C                   Z-ADD     PDSEQ         HDSEQ                          Picking list
     C                   MOVEL     PDWHSE        HD0005                         Warehouse Number
     C                   MOVEL     PDPCKR        HDPCKR                         Picking Route
     C                   MOVEL     PDLOCN        HDLOCN                         Location
     C                   MOVEL     PDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0029        WK0011                         Warehouse Descriptio
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0028        HD0007                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0025        WK0005                         Item Description
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0024        HD0003                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WARELOC
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     WLDESC        WK0012                         Location Description
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0030        HD0008                         Company number
     C                   MOVEL     WLWHSE        HD0010                         Warehouse Number
     C                   MOVEL     WLLOCN        HD0009                         Location
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSWADD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     RN0019        WK0001                         Contact name
     C                   MOVEL     RN0020        WK0002                         Company number
     C                   MOVEL     PDLIN1        WDLIN1                         Address
     C                   MOVEL     PDLIN2        WDLIN2                         Address Line 2
     C                   MOVEL     PDLIN3        WDLIN3                         Address Line 3
     C                   MOVEL     PDLIN4        WDLIN4                         Address Line 4
     C                   MOVEL     PDLIN5        WDLIN5                         Address Line 5
     C                   MOVEL     PDLIN6        WDLIN6                         Address Line 6
     C                   MOVEL     RN0021        WK0003                         Post code
     C                   MOVEL     RN0022        WK0004                         Telephone number
     C                   MOVEL     PDWHSE        WDWHSE                         Warehouse Number
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0020        HD0002                         Company number
     C                   MOVEL     PDWHSE        HDWHSE                         Warehouse Number
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
