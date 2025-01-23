     F/TITLE PSTOKMOV Print Daily Stock Transactions
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PSTOKMOV
     F*  Application ID      -    PSTOKMOV
     F*  Application Name    -    Print Daily Stock Transactions
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  STOKMOV5    - (I/DISK   ) IMS Act date whse item
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  WLOCITM     - (I/DISK   ) IMS Warehouse Location Item WI
     F*  IMSTRN      - (I/DISK   ) IMS Transaction Types       TT
     F*  PSTOKMOVO   - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SY0010 - Format Date
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     F* S002   - SETLL d.stokmov5,f.stokmov5,prcoyno,prdate
     F* S003   - GETREC d.stokmov5,f.stokmov5,*ne,prcoyno,prdate
     F* S004   - Process To Reset File Pointer(EOF) - STOKMOV5
     F* S005   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,stitem
     F* S006   - GETREC D.STOKMOV,F.WLOCITM,*EQ,PRCOYNO,STWHSE,STLOCN,STITEM
     F* S007   - GETREC d.imstrn,f.imstrn,*eq,prcoyno,stttyp
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FSTOKMOV5  IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FWLOCITM   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FIMSTRN    IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FFILE0001  O    E             PRINTER
     F                                     INFDS(FIDS06)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
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
     D  REC06                367    368B 0
     D  OLN06                188    189B 0
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
     I              CYCOYNO                     RN0008
     I              CYEMPCOL                    RN0009
     I              CYEMPHEAD                   RN0010
     I              CYPRDHEAD                   RN0011
     I              CYREFHEAD                   RN0012
     I              CYSDESC                     RN0013
     IIMSTRMF
     I              TTCOYNO                     RN0014
     IITMSTRF
     I              ITALPHA                     RN0015
     I              ITCOYNO                     RN0016
     I              ITIDESC                     RN0017
     ISTOKMOVF
     I              STBRNBR                     RN0018
     I              STCOYNO                     RN0019
     I              STSUPPN                     RN0020
     IWLOCITMF
     I              WICOYNO                     RN0021
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
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
     C                   KFLD                    KTCO01
     C                   KFLD                    KTDT02
     C*
     C     K0003         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KTIT03
     C*
     C     K0004         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTWH02
     C                   KFLD                    KTLO03
     C                   KFLD                    KTIT04
     C*
     C     K0005         KLIST
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
     C     *LIKE         DEFINE    RN0018        WK0002                         Branch Number
     C     *LIKE         DEFINE    RN0019        WK0003                         Company number
     C     *LIKE         DEFINE    STDTAC        WTDTAC                         Actual Date
     C     *LIKE         DEFINE    STDTTR        WTDTTR                         Transaction Date
     C     *LIKE         DEFINE    STLOCN        WTLOCN                         Location
     C     *LIKE         DEFINE    STLOCT        WTLOCT                         Other Location
     C     *LIKE         DEFINE    STPCKL        WTPCKL                         Picking List Y/N
     C     *LIKE         DEFINE    STSEQ         WTSEQ                          Picking List No.
     C     *LIKE         DEFINE    RN0020        WK0004                         Supplier Number
     C     *LIKE         DEFINE    STTIME        WTTIME                         Expected Time
     C     *LIKE         DEFINE    STWEIG        WTWEIG                         Weight
     C     *LIKE         DEFINE    STWHST        WTWHST                         Other Warehouse
     C     *LIKE         DEFINE    WIQAL         WK0005                         Quantity Allocated
     C     *LIKE         DEFINE    WIQOH         WK0006                         Quantity on hand
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0008        HD0001
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0014        HD0002
     C     *LIKE         DEFINE    TTTRNC        HTTRNC
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0016        HD0003
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0021        HD0006
     C     *LIKE         DEFINE    WIWHSE        HIWHSE
     C     *LIKE         DEFINE    WILOCN        HILOCN
     C     *LIKE         DEFINE    WIITEM        HIITEM
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0019        HD0004
     C     *LIKE         DEFINE    STDTAC        HTDTAC
     C     *LIKE         DEFINE    STWHSE        HTWHSE
     C     *LIKE         DEFINE    STITEM        HD0005
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
     C                   MOVE      *BLANKS       DTDESC           20
     C                   MOVE      *BLANKS       DTDTTR           10
     C                   MOVE      *BLANKS       FIRST             1
     C                   MOVE      *ZEROS        RN0001            5 0          LRCOUNT
     C                   MOVE      *BLANKS       L1ITEM           20
     C                   MOVE      *BLANKS       L1WHSE            3
     C                   MOVE      *BLANKS       PTDATE           10
     C                   MOVE      *ZEROS        SVDATI            8 0
     C                   MOVE      *BLANKS       SVDATO           10
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0002            4            SYCCYYA
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0003            8 0          SYDATI
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0004           10            SYDATO
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0005            1            SYDFMT
     C                   MOVE      *BLANKS       SYDSEP            1
     C                   MOVE      *BLANKS       RN0006            1            SYDSEP
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0007            4            SYMMDDA
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD05            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       KTCO01            3            STCOYNO
     C                   MOVE      *ZEROS        KTDT02            8 0          STDTAC
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       KTCO02            3            ITCOYNO
     C                   MOVE      *BLANKS       KTIT03           20            ITITEM
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       KTWH02            3            STWHSE
     C                   MOVE      *BLANKS       KTLO03           10            STLOCN
     C                   MOVE      *BLANKS       KTIT04           20            STITEM
     C                   MOVE      *BLANKS       KTCO03            3            TTCOYNO
     C                   MOVE      *BLANKS       KTTR04            2            TTTRNC
     C                   MOVE      *BLANKS       RN0022           99
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
     C* **   Get Company Description
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     C*
     C                   EXSR      S001
     C* SYDFMT = CYDFMT
     C                   MOVE      WYDFMT        RN0005
     C* SYDSEP = CYDSEP
     C                   MOVE      WYDSEP        RN0006
     C* **   read stock movement file for date
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0004
     C* SYDATI = prdate
     C                   Z-ADD     PRDATE        RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* PTDATE = SYDATO
     C                   MOVE      RN0004        PTDATE
     C*                                                               *
     C*                                                               *
     C* PRINT dayb,ahg
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* *** read all details for stok movement
     C* SETLL d.stokmov5,f.stokmov5,prcoyno,prdate
     C*
     C                   EXSR      S002
     C* DOU %sts(d.stokmov5,f.stokmov5)=*no
     C     RSLT01        DOUEQ     1
     C* GETREC d.stokmov5,f.stokmov5,*ne,prcoyno,prdate
     C*
     C                   EXSR      S003
     C* IF %sts(d.stokmov5,f.stokmov5)=*yes
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C* *** find item description and balance
     C* IF l1item <> stitem | l1whse <> stwhse
     C     L1ITEM        IFNE      WTITEM
     C     L1WHSE        ORNE      WTWHSE
     C* L1ITEM = stitem
     C                   MOVE      WTITEM        L1ITEM
     C* L1WHSE = stwhse
     C                   MOVE      WTWHSE        L1WHSE
     C* GETREC d.itmmast,f.itmmast,*eq,prcoyno,stitem
     C*
     C                   EXSR      S005
     C* GETREC D.STOKMOV,F.WLOCITM,*EQ,PRCOYNO,STWHSE,STLOCN,STITEM
     C*
     C                   EXSR      S006
     C* FIRST = ' '
     C                   MOVE      *BLANKS       FIRST
     C* END                                                           *
     C                   END
     C* *** if overflow print headings
     C* IF %ovf(dayb)=*yes
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
     C* PRINT dayb,ahg
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* *** Get transaction description
     C* GETREC d.imstrn,f.imstrn,*eq,prcoyno,stttyp
     C*
     C                   EXSR      S007
     C* DTDESC = ttdesc
     C                   MOVE      *BLANKS       DTDESC
     C                   MOVEL     WTDESC        DTDESC
     C* *** Move dates round
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0004
     C* SYDATI = STDTTR
     C                   Z-ADD     WTDTTR        RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* DTDTTR = SYDATO
     C                   MOVE      RN0004        DTDTTR
     C*                                                               *
     C* *** Print details records
     C* IF first = ' '
     C     FIRST         IFEQ      *BLANKS
     C* PRINT dayb,bd1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* ELSE                                                          *
     C                   ELSE
     C* PRINT dayb,bd2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* *** number of records printed
     C* LRCOUNT = lrcount + 1
     C     RN0001        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        RN0001
     C* FIRST = 'Y'
     C                   MOVE      'Y'           FIRST
     C* END                                                           *
     C                   END
     C* END                                                           *
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
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
     C* PRINT dayb,cer
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
     C                   MOVEL     *BLANKS       RN0004
     C* ***                                                           *
     C* IF sydsep = ' '
     C     RN0006        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           RN0006
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYCCYY = %ljf(SYDATI) ; YEAR  4
     C*  Left Justify field into result field
     C                   MOVEL     RN0003        SYCCYY
     C* SYMMDD = %RJF(SYDATI) ; MMDD  4
     C*  Right Justify field into result field
     C                   MOVE      RN0003        SYMMDD
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
     C                   MOVE      *BLANK        RN0002
     C                   MOVEL     SYCCYY        RN0002
     C* SYMMDDA = %CTC(SYMMDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0007
     C                   MOVEL     SYMMDD        RN0007
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
     C     RN0005        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0002:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0005        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0002:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0003        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0004
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0003        RN0003
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0006        RN0006
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0005        RN0005
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
     C* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
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
     C* S002   - SETLL d.stokmov5,f.stokmov5,prcoyno,prdate
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.STOKMOV5
     C                   MOVEL     *LOVAL        HD0004                         Company number
     C                   Z-ADD     *LOVAL        HTDTAC                         Actual Date
     C                   MOVEL     *LOVAL        HTWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HD0005                         Item Number
     C                   MOVEL     *LOVAL        HTTTYP                         Transaction Type
     C*
     C                   MOVEL     PRM001        KTCO01
     C                   MOVEL     PRM001        HD0004                         Company number
     C                   MOVEL     PRM001        RN0019                         Company number
     C                   Z-ADD     PRDATE        KTDT02
     C                   Z-ADD     PRDATE        HTDTAC                         Actual Date
     C                   Z-ADD     PRDATE        STDTAC                         Actual Date
     C*
     C     K0002         SETLL     STOKMOV5                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - GETREC d.stokmov5,f.stokmov5,*ne,prcoyno,prdate
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRM001        KTCO01
     C                   Z-ADD     PRDATE        KTDT02
     C     K0002         READE     STOKMOV5                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.STOKMOV5
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.STOKMOV5
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S004                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - Process To Reset File Pointer(EOF) - STOKMOV5
     C**************************************************************************
     C     S004          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.STOKMOV5
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.STOKMOV5
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0019        KTCO01
     C                   Z-ADD     STDTAC        KTDT02                         Actual Date
     C     K0002         SETGT     STOKMOV5
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,stitem
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     PRM001        KTCO02
     C                   MOVEL     *BLANK        KTIT03
     C                   MOVEL     WTITEM        KTIT03
     C     K0003         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.ITMMAST   ITMC
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.ITMMAST   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.STOKMOV,F.WLOCITM,*EQ,PRCOYNO,STWHSE,STLOCN,STITEM
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRM001        KTCO01
     C                   MOVEL     *BLANK        KTWH02
     C                   MOVEL     WTWHSE        KTWH02
     C                   MOVEL     *BLANK        KTLO03
     C                   MOVEL     WTLOCN        KTLO03
     C                   MOVEL     *BLANK        KTIT04
     C                   MOVEL     WTITEM        KTIT04
     C     K0004         CHAIN     WLOCITM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WLOCITM   WLOC
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WLOCITM   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC d.imstrn,f.imstrn,*eq,prcoyno,stttyp
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO03
     C                   MOVEL     PRM001        KTCO03
     C                   MOVEL     *BLANK        KTTR04
     C                   MOVEL     WTTTYP        KTTR04
     C     K0005         CHAIN     IMSTRN                             9091
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
     C     WFILE#        IFEQ      2                                            STOKMOV5
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            ITMMAST
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            WLOCITM
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
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
     C                   MOVEL     RN0008        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKMOV5
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0018        WK0002                         Branch Number
     C                   MOVEL     RN0019        WK0003                         Company number
     C                   Z-ADD     STDTAC        WTDTAC                         Actual Date
     C                   Z-ADD     STDTTR        WTDTTR                         Transaction Date
     C                   MOVEL     STITEM        WTITEM                         Item Number
     C                   MOVEL     STLOCN        WTLOCN                         Location
     C                   MOVEL     STLOCT        WTLOCT                         Other Location
     C                   MOVEL     STPCKL        WTPCKL                         Picking List Y/N
     C                   Z-ADD     STSEQ         WTSEQ                          Picking List No.
     C                   MOVEL     RN0020        WK0004                         Supplier Number
     C                   Z-ADD     STTIME        WTTIME                         Expected Time
     C                   Z-ADD     STTQTY        WTTQTY                         Transaction Quantity
     C                   MOVEL     STTREF        WTTREF                         Transaction Referenc
     C                   MOVEL     STTTYP        WTTTYP                         Transaction Type
     C                   Z-ADD     STUCST        WTUCST                         Unit Cost
     C                   Z-ADD     STWEIG        WTWEIG                         Weight
     C                   MOVEL     STWHSE        WTWHSE                         Warehouse Number
     C                   MOVEL     STWHST        WTWHST                         Other Warehouse
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0019        HD0004                         Company number
     C                   Z-ADD     STDTAC        HTDTAC                         Actual Date
     C                   MOVEL     STWHSE        HTWHSE                         Warehouse Number
     C                   MOVEL     STITEM        HD0005                         Item Number
     C                   MOVEL     STTTYP        HTTTYP                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0017        WK0001                         Item Description
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0016        HD0003                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   Z-ADD     WIQAL         WK0005                         Quantity Allocated
     C                   Z-ADD     WIQOH         WK0006                         Quantity on hand
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0021        HD0006                         Company number
     C                   MOVEL     WIWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WILOCN        HILOCN                         Location
     C                   MOVEL     WIITEM        HIITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSTRN
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     TTDESC        WTDESC                         Description
     C                   MOVEL     TTONHC        WTONHC                         On Hand Calculation
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0014        HD0002                         Company number
     C                   MOVEL     TTTRNC        HTTRNC                         Transaction Type
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
