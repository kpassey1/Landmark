     F/TITLE BPEDEL      Expected Deliveries
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    BPEDEL
     F*  Application ID      -    BPEDEL
     F*  Application Name    -         Expected Deliveries
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  IMSCPYD     - (I/DISK   ) IMS Company Details         CD
     F*  EXPDEL      - (I/DISK   ) IMS Expected Deliveries     ED
     F*  STOKMOV6    - (I/DISK   ) IMS reference type
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  BPEDELO     - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SY0010 - Format Date
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYN
     F* S002   - GETREC D.COMPANY,F.imscpyd,*EQ,PRCOYN
     F* S003   - SETLL D.EXPDEL,F.EXPDEL,PRCOYN,PRDATE
     F* S004   - GETREC D.EXPDEL,F.EXPDEL,*NE,PRCOYN,prdate
     F* S005   - Process To Reset File Pointer(EOF) - EXPDEL
     F* S006   - SETLL D.EXPDEL,F.STOKMOV6,PRCOYN,EDTREF
     F* S007   - GETREC D.EXPDEL,F.STOKMOV6,*NE,PRCOYN,EDTREF
     F* S008   - Process To Reset File Pointer(EOF) - STOKMOV6
     F* S009   - GETREC D.EXPDEL,F.ITMMAST,*EQ,PRCOYN,STITEM
     F* SFERR - File Exception Handler
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
     FEXPDEL    IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FSTOKMOV6  IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FBPEDELO   O    E             PRINTER
     F                                     INFDS(FIDS06)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                367    368B 0
     D  OLN06                188    189B 0
     D*
     D* Data structure for user define
     D*
     D @DS001          DS
     D  WK0004                 1     40
     D  ITSD                   1     20
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
     IEXPDELF
     I              EDBRNBR                     RN0013
     I              EDCOYNO                     RN0014
     I              EDSUPPN                     RN0015
     IIMSCPYDF
     I              CDCOYNO                     RN0016
     I              CDHEAD1                     RN0017
     I              CDHEAD2                     RN0018
     I              CDHEAD3                     RN0019
     IITMSTRF
     I              ITALPHA                     RN0020
     I              ITCOYNO                     RN0021
     I              ITIDESC                     RN0022
     ISTOKMOVF
     I              STBRNBR                     RN0023
     I              STCOYNO                     RN0024
     I              STSUPPN                     RN0025
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRCOYN            3
     C                   PARM                    PRDATE            8 0
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
     C                   KFLD                    KDCO01
     C                   KFLD                    KDDT02
     C*
     C     K0003         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDTR02
     C*
     C     K0004         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KTIT02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    RN0014        WK0002                         Company number
     C     *LIKE         DEFINE    EDDTTR        WDDTTR                         Transaction Date
     C     *LIKE         DEFINE    CDTRNP        WDTRNP                         Purchasing Trans
     C     *LIKE         DEFINE    STLOCN        WTLOCN                         Location
     C     *LIKE         DEFINE    STTTYP        WTTTYP                         Transaction Type
     C     *LIKE         DEFINE    STWHSE        WTWHSE                         Warehouse Number
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0007        HD0001
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0016        HD0003
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0014        HD0002
     C     *LIKE         DEFINE    EDDTTR        HDDTTR
     C     *LIKE         DEFINE    EDTIME        HDTIME
     C     *LIKE         DEFINE    EDTREF        HDTREF
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0021        HD0004
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0024        HD0005
     C     *LIKE         DEFINE    STTREF        HTTREF
     C     *LIKE         DEFINE    STTTYP        HTTTYP
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
     C                   MOVE      *BLANKS       FIRST            20
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
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          003
     C                   MOVE      *BLANKS       KDCO01            3            EDCOYNO
     C                   MOVE      *ZEROS        KDDT02            8 0          EDDTTR
     C                   MOVE      *BLANKS       KDTR02           15            EDTREF
     C                   MOVE      *BLANKS       KTIT02           20            STITEM
     C                   MOVE      *BLANKS       RN0026           99
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       SAVIN            99            Save Indword
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        RSLT02            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS
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
     C*                                                               *
     C* ** Get company name.
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYN
     C*
     C                   EXSR      S001
     C*                                                               *
     C* SYDFMT = cydfmt
     C                   MOVE      WYDFMT        RN0004
     C* SYDSEP = cydsep
     C                   MOVE      WYDSEP        RN0005
     C*                                                               *
     C* GETREC D.COMPANY,F.imscpyd,*EQ,PRCOYN
     C*
     C                   EXSR      S002
     C*                                                               *
     C* ** Output report headings.
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* SYDATI = PRDATE
     C                   Z-ADD     PRDATE        RN0002
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* ODATE = SYDATO
     C                   MOVE      RN0003        ODATE
     C* PRINT EXPDEL,AAA
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* ** Read entries for company/date.
     C* SETLL D.EXPDEL,F.EXPDEL,PRCOYN,PRDATE
     C*
     C                   EXSR      S003
     C* GETREC D.EXPDEL,F.EXPDEL,*NE,PRCOYN,prdate
     C*
     C                   EXSR      S004
     C*                                                               *
     C* ** Read to end of entries.
     C* DOW %STS(D.EXPDEL,F.EXPDEL)=*YES
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
     C*                                                               *
     C* SETLL D.EXPDEL,F.STOKMOV6,PRCOYN,EDTREF
     C*
     C                   EXSR      S006
     C* GETREC D.EXPDEL,F.STOKMOV6,*NE,PRCOYN,EDTREF
     C*
     C                   EXSR      S007
     C* ** Read to end of entries.
     C* FIRST = 'N'
     C                   MOVE      *BLANKS       FIRST
     C                   MOVEL     'N'           FIRST
     C* DOW %STS(D.EXPDEL,F.STOKMOV6)=*YES
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
     C                   Z-ADD     NRSLT0        RSLT02
     C     RSLT02        DOWEQ     1
     C* IF STTTYP = CDTRNP
     C     WTTTYP        IFEQ      WDTRNP
     C* GETREC D.EXPDEL,F.ITMMAST,*EQ,PRCOYN,STITEM
     C*
     C                   EXSR      S009
     C* IF FIRST = 'N'
     C     FIRST         IFEQ      'N'
     C* PRINT EXPDEL,BBB
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* ELSE                                                          *
     C                   ELSE
     C* PRINT EXPDEL,CCC
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* FIRST = 'Y'
     C                   MOVE      *BLANKS       FIRST
     C                   MOVEL     'Y'           FIRST
     C* GETREC D.EXPDEL,F.STOKMOV6,*NE,PRCOYN,EDTREF
     C*
     C                   EXSR      S007
     C*                                                               *
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
     C                   Z-ADD     NRSLT0        RSLT02
     C                   END
     C*                                                               *
     C* ** Get next Expected delivery record.
     C* GETREC D.EXPDEL,F.EXPDEL,*NE,PRCOYN,PRDATE
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
     C*                                                               *
     C* ** Output end of report narrative.
     C* PRINT EXPDEL,XXX
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
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
     C* S002   - GETREC D.COMPANY,F.imscpyd,*EQ,PRCOYN
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRCOYN        KYCO01
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
     C* S003   - SETLL D.EXPDEL,F.EXPDEL,PRCOYN,PRDATE
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.EXPDEL    SUPL
     C                   MOVE      'N'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST
     C                   MOVEL     *LOVAL        HD0002                         Company number
     C                   Z-ADD     *LOVAL        HDDTTR                         Transaction Date
     C                   Z-ADD     *LOVAL        HDTIME                         Expected time
     C                   MOVEL     *LOVAL        HDTREF                         Transaction Referenc
     C*
     C                   MOVEL     PRCOYN        KDCO01
     C                   MOVEL     PRCOYN        HD0002                         Company number
     C                   MOVEL     PRCOYN        RN0014                         Company number
     C                   Z-ADD     PRDATE        KDDT02
     C                   Z-ADD     PRDATE        HDDTTR                         Transaction Date
     C                   Z-ADD     PRDATE        EDDTTR                         Transaction Date
     C*
     C     K0002         SETLL     EXPDEL                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC D.EXPDEL,F.EXPDEL,*NE,PRCOYN,prdate
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRCOYN        KDCO01
     C                   Z-ADD     PRDATE        KDDT02
     C     K0002         READE     EXPDEL                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.EXPDEL    SUPL
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.EXPDEL    SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S005                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - Process To Reset File Pointer(EOF) - EXPDEL
     C**************************************************************************
     C     S005          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.EXPDEL    SUPL
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.EXPDEL    SUPL
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0014        KDCO01
     C                   Z-ADD     EDDTTR        KDDT02                         Transaction Date
     C     K0002         SETGT     EXPDEL
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - SETLL D.EXPDEL,F.STOKMOV6,PRCOYN,EDTREF
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST
     C                   MOVEL     *LOVAL        HTTTYP                         Transaction Type
     C*
     C                   MOVEL     PRCOYN        KDCO01
     C                   MOVEL     PRCOYN        HD0005                         Company number
     C                   MOVEL     PRCOYN        RN0024                         Company number
     C                   MOVEL     WDTREF        KDTR02
     C                   MOVEL     WDTREF        HTTREF                         Transaction Referenc
     C                   MOVEL     WDTREF        STTREF                         Transaction Referenc
     C*
     C     K0003         SETLL     STOKMOV6                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.EXPDEL,F.STOKMOV6,*NE,PRCOYN,EDTREF
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRCOYN        KDCO01
     C                   MOVEL     *BLANK        KDTR02
     C                   MOVEL     WDTREF        KDTR02
     C     K0003         READE     STOKMOV6                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S008                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - Process To Reset File Pointer(EOF) - STOKMOV6
     C**************************************************************************
     C     S008          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.STOKMOV6  IMST
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0024        KDCO01
     C                   MOVEL     *BLANK        KDTR02                         Transaction Referenc
     C                   MOVEL     STTREF        KDTR02
     C     K0003         SETGT     STOKMOV6
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.EXPDEL,F.ITMMAST,*EQ,PRCOYN,STITEM
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRCOYN        KDCO01
     C                   MOVEL     *BLANK        KTIT02
     C                   MOVEL     WTITEM        KTIT02
     C     K0004         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMMAST
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
     C     WFILE#        IFEQ      3                                            EXPDEL
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            STOKMOV6
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
     C*          | Move Fields From File To Work Area - IMSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     CDTRNP        WDTRNP                         Purchasing Trans
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0016        HD0003                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - EXPDEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0013        WK0001                         Branch Number
     C                   MOVEL     EDCARR        WDCARR                         Carrier
     C                   MOVEL     RN0014        WK0002                         Company number
     C                   Z-ADD     EDDTTR        WDDTTR                         Transaction Date
     C                   MOVEL     RN0015        WK0003                         Supplier Number
     C                   Z-ADD     EDTIME        WDTIME                         Expected time
     C                   MOVEL     EDTREF        WDTREF                         Transaction Referenc
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0014        HD0002                         Company number
     C                   Z-ADD     EDDTTR        HDDTTR                         Transaction Date
     C                   Z-ADD     EDTIME        HDTIME                         Expected time
     C                   MOVEL     EDTREF        HDTREF                         Transaction Referenc
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKMOV6
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     STITEM        WTITEM                         Item Number
     C                   MOVEL     STLOCN        WTLOCN                         Location
     C                   Z-ADD     STTQTY        WTTQTY                         Transaction Quantity
     C                   MOVEL     STTTYP        WTTTYP                         Transaction Type
     C                   MOVEL     STWHSE        WTWHSE                         Warehouse Number
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0024        HD0005                         Company number
     C                   MOVEL     STTREF        HTTREF                         Transaction Referenc
     C                   MOVEL     STTTYP        HTTTYP                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0021        HD0004                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   MOVE      RN0022        WK0004                         MV RN0022 TO WK0004
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
