     F/TITLE PSTKMHIS     Stock Movement History
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PSTKMHIS
     F*  Application ID      -    PSTKMHIS
     F*  Application Name    -        Stock Movement History
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  STOKMOV7    - (I/DISK   ) IMS Whse/Item/Trans. Date
     F*  WAREHED     - (I/DISK   ) IMS Warehouse Header        WH
     F*  WAREDET     - (I/DISK   ) IMS Warehouse Item Details  WD
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  IMSTRN      - (I/DISK   ) IMS Transaction Types       TT
     F*  PSTKMHISO   - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SY0010 - Format Date
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYN
     F* S002   - SETLL D.STOKMOV7,F.STOKMOV7,PRCOYN,PRFWHS,PRFITM
     F* S003   - GETREC D.STOKMOV7,F.STOKMOV7,*NE,PRCOYN
     F* S004   - Process To Reset File Pointer(EOF) - STOKMOV7
     F* S005   - GETREC D.WAREHED,F.WAREHED,*EQ,PRCOYN,STWHSE
     F* S006   - GETREC D.WAREHED,F.WAREDET,*EQ,PRCOYN,STWHSE,STITEM
     F* S007   - GETREC D.ITMMAST,F.ITMMAST,*EQ,PRCOYN,WDITEM
     F* S008   - GETREC D.IMSTRN,F.IMSTRN,*EQ,PRCOYN,STTTYP
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FSTOKMOV7  IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FWAREHED   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FWAREDET   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FIMSTRN    IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FFILE0001  O    E             PRINTER
     F                                     INFDS(FIDS07)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                367    368B 0
     D  OLN07                188    189B 0
     D*
     D* Named constants
     D*
     D C0001           C                   CONST('99999999999999999999')
     D*
     D* Named constants
     D*
     D C0002           C                   CONST('** STOCK ERROR **')
     D*
     D* Named constants
     D*
     D C0003           C                   CONST('** Item invalid **')
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
     I              CYCOYNO                     RN0007
     I              CYEMPCOL                    RN0008
     I              CYEMPHEAD                   RN0009
     I              CYPRDHEAD                   RN0010
     I              CYREFHEAD                   RN0011
     I              CYSDESC                     RN0012
     IIMSTRMF
     I              TTCOYNO                     RN0013
     IITMSTRF
     I              ITALPHA                     RN0014
     I              ITCOYNO                     RN0015
     I              ITIDESC                     RN0016
     ISTOKMOVF
     I              STBRNBR                     RN0017
     I              STCOYNO                     RN0018
     I              STSUPPN                     RN0019
     IWDETAILF
     I              WDCOYNO                     RN0020
     I              WDSUPPN                     RN0021
     IWAREHEDF
     I              WHCOYNO                     RN0022
     I              WHWDESC                     RN0023
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRCOYN            3
     C                   PARM                    PRFWHS            3
     C                   PARM                    PRM002            3
     C                   PARM                    PRFITM           20
     C                   PARM                    PRM001           20
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
     C                   KFLD                    KTCO01
     C                   KFLD                    KTWH02
     C                   KFLD                    KTIT03
     C*
     C     K0003         KLIST
     C                   KFLD                    KTCO01
     C*
     C     K0004         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C*
     C     K0005         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C*
     C     K0006         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KTIT04
     C*
     C     K0007         KLIST
     C                   KFLD                    KTCO03
     C                   KFLD                    KTTR04
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    TTDESC        WTDESC                         Description
     C     *LIKE         DEFINE    TTONHC        WTONHC                         On Hand Calculation
     C     *LIKE         DEFINE    RN0016        WK0001                         Item Description
     C     *LIKE         DEFINE    STDTTR        WTDTTR                         Transaction Date
     C     *LIKE         DEFINE    STITEM        WTITEM                         Item Number
     C     *LIKE         DEFINE    STTQTY        WTTQTY                         Transaction Quantity
     C     *LIKE         DEFINE    WDWHSE        WK0006                         Warehouse Number
     C     *LIKE         DEFINE    RN0022        WK0007                         Company number
     C     *LIKE         DEFINE    WHWHSE        WK0009                         Warehouse Number
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0007        HD0001
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0013        HD0002
     C     *LIKE         DEFINE    TTTRNC        HTTRNC
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0015        HD0003
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0018        HD0004
     C     *LIKE         DEFINE    STWHSE        HTWHSE
     C     *LIKE         DEFINE    STITEM        HD0005
     C     *LIKE         DEFINE    STDTTR        HTDTTR
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0020        HD0006
     C     *LIKE         DEFINE    WDWHSE        HDWHSE
     C     *LIKE         DEFINE    WDITEM        HDITEM
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0022        HD0007
     C     *LIKE         DEFINE    WHWHSE        HHWHSE
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
     C                   MOVE      *BLANKS       ERROR            17
     C                   MOVE      *BLANKS       FIRST             1
     C                   MOVE      *BLANKS       IDESC            30
     C                   MOVE      *ZEROS        NMVQTY            9 0
     C                   MOVE      *BLANKS       ODATE            10
     C                   MOVE      *ZEROS        QTYAV             9 0
     C                   MOVE      *ZEROS        QTYIN             9 0
     C                   MOVE      *ZEROS        QTYOT             9 0
     C                   MOVE      *BLANKS       SVITEM           20
     C                   MOVE      *BLANKS       SVWHSE            3
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0001            4            SYCCYYA
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0002            8 0          SYDATI
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0003           10            Output Date
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
     C                   MOVE      *ZEROS        WDCBAL            9 0
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD06            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       KTCO01            3            STCOYNO
     C                   MOVE      *BLANKS       KTWH02            3            STWHSE
     C                   MOVE      *BLANKS       KTIT03           20            STITEM
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          0030
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       KTCO02            3            ITCOYNO
     C                   MOVE      *BLANKS       KTIT04           20            ITITEM
     C                   MOVE      *BLANKS       KTCO03            3            TTCOYNO
     C                   MOVE      *BLANKS       KTTR04            2            TTTRNC
     C                   MOVE      *BLANKS       RN0024           99
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       SAVIN            99            Save Indord
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     *ZEROS        XNO               1 0          *NO keyword
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
     C*                                                               *
     C* *** Get Company Name.
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYN
     C*
     C                   EXSR      S001
     C*                                                               *
     C* SYDFMT = cydfmt
     C                   MOVE      WYDFMT        RN0004
     C* SYDSEP = cydsep
     C                   MOVE      WYDSEP        RN0005
     C*                                                               *
     C* *** Check if 'To' parameters blank.
     C* IF PRTWHS = ' '
     C     PRM002        IFEQ      *BLANKS
     C* IF PRFWHS <> ' '
     C     PRFWHS        IFNE      *BLANKS
     C* PRTWHS = PRFWHS
     C                   MOVE      PRFWHS        PRM002
     C* ELSE                                                          *
     C                   ELSE
     C* PRTWHS = '999'
     C                   MOVE      '999'         PRM002
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Check if 'To' parameters blank.
     C* IF PRTITM = ' '
     C     PRM001        IFEQ      *BLANKS
     C* IF PRFITM <> ' '
     C     PRFITM        IFNE      *BLANKS
     C* PRTITM = PRFITM
     C                   MOVE      PRFITM        PRM001
     C* ELSE                                                          *
     C                   ELSE
     C* PRTITM = '99999999999999999999'
     C                   MOVE      *BLANKS       PRM001
     C                   MOVEL     C0001         PRM001
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Set limits on Movements.
     C* SETLL D.STOKMOV7,F.STOKMOV7,PRCOYN,PRFWHS,PRFITM
     C*
     C                   EXSR      S002
     C* GETREC D.STOKMOV7,F.STOKMOV7,*NE,PRCOYN
     C*
     C                   EXSR      S003
     C*                                                               *
     C* *** Set Read loop.
     C* DOW %STS(D.STOKMOV7,F.STOKMOV7)=*YES
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
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
     C*                                                               *
     C* *** Check movement is in range selected.
     C* IF STWHSE >= PRFWHS & STWHSE <= PRTWHS
     C     WTWHSE        IFGE      PRFWHS
     C     WTWHSE        ANDLE     PRM002
     C* IF STITEM >= PRFITM & STITEM <= PRTITM
     C     WTITEM        IFGE      PRFITM
     C     WTITEM        ANDLE     PRM001
     C*                                                               *
     C* *** Check for change of warehouse or item.
     C* IF STWHSE <> SVWHSE | STITEM <> SVITEM
     C     WTWHSE        IFNE      SVWHSE
     C     WTITEM        ORNE      SVITEM
     C*                                                               *
     C* *** Not First cycle.
     C* IF FIRST <> ' '
     C     FIRST         IFNE      *BLANKS
     C* ERROR = ' '
     C                   MOVEL     *BLANKS       ERROR
     C*                                                               *
     C* *** Check if calculated balance not equal to on-hand.
     C* IF WDQOH <> WDCBAL
     C     WK0005        IFNE      WDCBAL
     C* ERROR = '** STOCK ERROR **'
     C                   MOVE      *BLANKS       ERROR
     C                   MOVEL     C0002         ERROR
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Print item totals.
     C* PRINT MVTHIS,DD3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0006                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Print Headings
     C* IF STWHSE <> SVWHSE
     C     WTWHSE        IFNE      SVWHSE
     C* GETREC D.WAREHED,F.WAREHED,*EQ,PRCOYN,STWHSE
     C*
     C                   EXSR      S005
     C* PRINT MVTHIS,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* IF FIRST = ' '
     C     FIRST         IFEQ      *BLANKS
     C* PRINT MVTHIS,AH2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* PRINT MVTHIS,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Get Opening Bal. & calculate avail. for new item.
     C* GETREC D.WAREHED,F.WAREDET,*EQ,PRCOYN,STWHSE,STITEM
     C*
     C                   EXSR      S006
     C* IF %sts(D.WAREHED,F.WAREDET)=*no
     C*  Status of last file I/O
     C     STS04         IFNE      *ZERO
     C* WDCBAL = 0
     C                   Z-ADD     *ZERO         WDCBAL
     C* WDITEM = stitem
     C                   MOVE      WTITEM        WK0002
     C* WDOBAL = 0
     C                   Z-ADD     *ZERO         WK0003
     C* WDQAL = 0
     C                   Z-ADD     *ZERO         WK0004
     C* WDQOH = 0
     C                   Z-ADD     *ZERO         WK0005
     C* WDWHSE = stwhse
     C                   MOVE      WTWHSE        WK0006
     C* END                                                           *
     C                   END
     C* WDCBAL = WDOBAL
     C                   Z-ADD     WK0003        WDCBAL
     C* QTYAV = WDQOH - WDQAL
     C     WK0005        SUB       WK0004        NRSLT0
     C                   Z-ADD     NRSLT0        QTYAV
     C*                                                               *
     C* *** Get Item Description.
     C* GETREC D.ITMMAST,F.ITMMAST,*EQ,PRCOYN,WDITEM
     C*
     C                   EXSR      S007
     C* IDESC = ITIDESC
     C                   MOVE      *BLANKS       IDESC
     C                   MOVEL     WK0001        IDESC
     C* IF %STS(D.ITMMAST,F.ITMMAST)=*no
     C*  Status of last file I/O
     C     STS05         IFNE      *ZERO
     C* IDESC = %ljf(wditem)
     C*  Left Justify field into result field
     C                   MOVEL     WK0002        IDESC
     C* IDESC = %rjf('** Item invalid **')
     C*  Right Justify field into result field
     C                   MOVE      C0003         IDESC
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Set first cycle flag.
     C* FIRST = 'Y'
     C                   MOVE      'Y'           FIRST
     C*                                                               *
     C* *** Check for overflow.
     C* IF %OVF(MVTHIS)=*YES
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
     C* PRINT MVTHIS,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT MVTHIS,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Print item header.
     C* PRINT MVTHIS,DD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* SVWHSE = STWHSE
     C                   MOVE      WTWHSE        SVWHSE
     C* SVITEM = STITEM
     C                   MOVE      WTITEM        SVITEM
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Get transaction type details.
     C* GETREC D.IMSTRN,F.IMSTRN,*EQ,PRCOYN,STTTYP
     C*
     C                   EXSR      S008
     C*                                                               *
     C* *** Check On-Hand update requested for trans.
     C* *** If add to QOH; Quantity In.
     C* IF TTONHC = 'A'
     C     WTONHC        IFEQ      'A'
     C* WDCBAL = WDCBAL + STTQTY
     C     WDCBAL        ADD       WTTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WDCBAL
     C* QTYIN = STTQTY
     C                   Z-ADD     WTTQTY        QTYIN
     C* QTYOT = 0
     C                   Z-ADD     *ZERO         QTYOT
     C* NMVQTY = 0
     C                   Z-ADD     *ZERO         NMVQTY
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If subtract from QOH; Quantity Out.
     C* IF TTONHC = 'S'|TTONHC = 'R'
     C     WTONHC        IFEQ      'S'
     C     WTONHC        OREQ      'R'
     C* WDCBAL = WDCBAL - STTQTY
     C     WDCBAL        SUB       WTTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WDCBAL
     C* QTYIN = 0
     C                   Z-ADD     *ZERO         QTYIN
     C* QTYOT = STTQTY
     C                   Z-ADD     WTTQTY        QTYOT
     C* NMVQTY = 0
     C                   Z-ADD     *ZERO         NMVQTY
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If On-Reserve calculation; Quantity Out.
     C* IF TTONHC = 'R'
     C     WTONHC        IFEQ      'R'
     C* WDCBAL = WDCBAL - STTQTY
     C     WDCBAL        SUB       WTTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WDCBAL
     C* QTYIN = 0
     C                   Z-ADD     *ZERO         QTYIN
     C* QTYOT = STTQTY
     C                   Z-ADD     WTTQTY        QTYOT
     C* NMVQTY = 0
     C                   Z-ADD     *ZERO         NMVQTY
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If On-Reserve calculation; Quantity Out.
     C* IF TTONHC = 'N'
     C     WTONHC        IFEQ      'N'
     C* QTYIN = 0
     C                   Z-ADD     *ZERO         QTYIN
     C* QTYOT = 0
     C                   Z-ADD     *ZERO         QTYOT
     C* NMVQTY = STTQTY
     C                   Z-ADD     WTTQTY        NMVQTY
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Check for overflow.
     C* IF %OVF(MVTHIS)=*YES
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
     C* PRINT MVTHIS,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT MVTHIS,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT MVTHIS,DD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Print detail line.
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* SYDATI = STDTTR
     C                   Z-ADD     WTDTTR        RN0002
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* ODATE = SYDATO
     C                   MOVE      RN0003        ODATE
     C*                                                               *
     C* PRINT MVTHIS,DD2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* GETREC D.STOKMOV7,F.STOKMOV7,*NE,PRCOYN
     C*
     C                   EXSR      S003
     C* END                                                           *
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
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
     C*                                                               *
     C* *** If any record read output total.
     C* IF FIRST <> ' '
     C     FIRST         IFNE      *BLANKS
     C* ERROR = ' '
     C                   MOVEL     *BLANKS       ERROR
     C*                                                               *
     C* *** Check if calculated balance not equal to on-hand.
     C* ********** WDQOH ª= WDCBAL
     C* IF Qtyav <> WDCBAL
     C     QTYAV         IFNE      WDCBAL
     C* ERROR = '** STOCK ERROR **'
     C                   MOVE      *BLANKS       ERROR
     C                   MOVEL     C0002         ERROR
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Print item totals.
     C* PRINT MVTHIS,DD3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0006                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Print End of Report narrative
     C* PRINT MVTHIS,XXX
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0007                               OA
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
     C* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYN
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRCOYN        KYCO01
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
     C* S002   - SETLL D.STOKMOV7,F.STOKMOV7,PRCOYN,PRFWHS,PRFITM
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.STOKMOV7
     C                   MOVEL     *LOVAL        HD0004                         Company number
     C                   MOVEL     *LOVAL        HTWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HD0005                         Item Number
     C                   Z-ADD     *LOVAL        HTDTTR                         Transaction Date
     C*
     C                   MOVEL     PRCOYN        KTCO01
     C                   MOVEL     PRCOYN        HD0004                         Company number
     C                   MOVEL     PRCOYN        RN0018                         Company number
     C                   MOVEL     PRFWHS        KTWH02
     C                   MOVEL     PRFWHS        HTWHSE                         Warehouse Number
     C                   MOVEL     PRFWHS        STWHSE                         Warehouse Number
     C                   MOVEL     PRFITM        KTIT03
     C                   MOVEL     PRFITM        HD0005                         Item Number
     C                   MOVEL     PRFITM        STITEM                         Item Number
     C*
     C     K0002         SETLL     STOKMOV7                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - GETREC D.STOKMOV7,F.STOKMOV7,*NE,PRCOYN
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRCOYN        KTCO01
     C     K0003         READE     STOKMOV7                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.STOKMOV7
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.STOKMOV7
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S004                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - Process To Reset File Pointer(EOF) - STOKMOV7
     C**************************************************************************
     C     S004          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.STOKMOV7
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.STOKMOV7
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0018        KTCO01
     C     K0003         SETGT     STOKMOV7
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - GETREC D.WAREHED,F.WAREHED,*EQ,PRCOYN,STWHSE
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRCOYN        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WTWHSE        KHWH02
     C     K0004         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.WAREHED,F.WAREDET,*EQ,PRCOYN,STWHSE,STITEM
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRCOYN        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WTWHSE        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WTITEM        KDIT03
     C     K0005         CHAIN     WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.ITMMAST,F.ITMMAST,*EQ,PRCOYN,WDITEM
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     PRCOYN        KTCO02
     C                   MOVEL     *BLANK        KTIT04
     C                   MOVEL     WK0002        KTIT04
     C     K0006         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST   ITMC
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMMAST   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - GETREC D.IMSTRN,F.IMSTRN,*EQ,PRCOYN,STTTYP
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO03
     C                   MOVEL     PRCOYN        KTCO03
     C                   MOVEL     *BLANK        KTTR04
     C                   MOVEL     WTTTYP        KTTR04
     C     K0007         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.IMSTRN
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
     C     WFILE#        IFEQ      2                                            STOKMOV7
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            WAREHED
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            WAREDET
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
     C     WFILE#        IFEQ      6                                            IMSTRN
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
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
     C                   MOVEL     RN0007        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKMOV7
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   Z-ADD     STDTTR        WTDTTR                         Transaction Date
     C                   MOVEL     STITEM        WTITEM                         Item Number
     C                   Z-ADD     STTQTY        WTTQTY                         Transaction Quantity
     C                   MOVEL     STTREF        WTTREF                         Transaction Referenc
     C                   MOVEL     STTTYP        WTTTYP                         Transaction Type
     C                   MOVEL     STWHSE        WTWHSE                         Warehouse Number
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0018        HD0004                         Company number
     C                   MOVEL     STWHSE        HTWHSE                         Warehouse Number
     C                   MOVEL     STITEM        HD0005                         Item Number
     C                   Z-ADD     STDTTR        HTDTTR                         Transaction Date
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0022        WK0007                         Company number
     C                   MOVEL     RN0023        WK0008                         Warehouse Descriptio
     C                   MOVEL     WHWHSE        WK0009                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0022        HD0007                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     WDITEM        WK0002                         Item Number
     C                   Z-ADD     WDOBAL        WK0003                         Opening balance
     C                   Z-ADD     WDQAL         WK0004                         Quantity Allocated
     C                   Z-ADD     WDQOH         WK0005                         Quantity on hand
     C                   MOVEL     WDWHSE        WK0006                         Warehouse Number
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0020        HD0006                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0016        WK0001                         Item Description
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0015        HD0003                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSTRN
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     TTDESC        WTDESC                         Description
     C                   MOVEL     TTONHC        WTONHC                         On Hand Calculation
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0013        HD0002                         Company number
     C                   MOVEL     TTTRNC        HTTRNC                         Transaction Type
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
