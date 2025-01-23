     F/TITLE PSTOKSTAT      Stock Status Report
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PSTOKSTAT
     F*  Application ID      -    PSTOKSTAT
     F*  Application Name    -         Stock Status Report
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  WAREDET     - (I/DISK   ) IMS Warehouse Item Details  WD
     F*  WAREHED     - (I/DISK   ) IMS Warehouse Header        WH
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  WRITTYP     - (I/DISK   ) IMS Warehouse Item Types    WT
     F*  IMSTRN      - (I/DISK   ) IMS Transaction Types       TT
     F*  PSTOKSTATO  - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYN
     F* S002   - SETLL D.WAREHED,F.WAREDET,PRCOYN,PRFWHS,PRFITM
     F* S003   - GETREC D.WAREHED,F.WAREDET,*NE,PRCOYN
     F* S004   - Process To Reset File Pointer(EOF) - WAREDET
     F* S005   - GETREC D.WAREHED,F.WAREHED,*EQ,WDCOYNO,WDWHSE
     F* S006   - GETREC D.WAREHED,F.ITMMAST,*EQ,PRCOYN,WDITEM
     F* S007   - SETLL D.WAREHED,F.WRITTYP,WDCOYNO,WDWHSE,WDITEM
     F* S008   - GETREC D.WAREHED,F.WRITTYP,*NE,WDCOYNO,WDWHSE,WDITEM
     F* S009   - Process To Reset File Pointer(EOF) - WRITTYP
     F* S010   - GETREC D.IMSTRN,F.IMSTRN,*EQ,WTCOYNO,WTTRNC
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FWAREDET   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FWAREHED   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FWRITTYP   IF   E           K DISK
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
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D*
     D* EXPDS
     D*
     D EXPDS           DS
     D  EXP1                   1      1
     D  EXP2                   2      2
     D  EXP3                   3      3
     D  EXP4                   4      4
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                367    368B 0
     D  OLN07                188    189B 0
     D*
     D* Named constants
     D*
     D C0001           C                   CONST('99999999999999999999')
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
     I              CYCOYNO                     RN0001
     I              CYEMPCOL                    RN0002
     I              CYEMPHEAD                   RN0003
     I              CYPRDHEAD                   RN0004
     I              CYREFHEAD                   RN0005
     I              CYSDESC                     RN0006
     IIMSTRMF
     I              TTCOYNO                     RN0007
     IITMSTRF
     I              ITALPHA                     RN0008
     I              ITCOYNO                     RN0009
     I              ITIDESC                     RN0010
     IWDETAILF
     I              WDCOYNO                     RN0011
     I              WDSUPPN                     RN0012
     IWAREHEDF
     I              WHCOYNO                     RN0013
     I              WHWDESC                     RN0014
     IWRITTYPF
     I              WTCOYNO                     RN0015
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRCOYN            3
     C                   PARM                    PRFWHS            3
     C                   PARM                    PRTWHS            3
     C                   PARM                    PRFITM           20
     C                   PARM                    PRTITM           20
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
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C*
     C     K0003         KLIST
     C                   KFLD                    KHCO01
     C*
     C     K0004         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C*
     C     K0005         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KDIT02
     C*
     C     K0006         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTTR02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0007        WK0001                         Company number
     C     *LIKE         DEFINE    TTTRNC        WK0002                         Transaction Type
     C     *LIKE         DEFINE    RN0011        WK0004                         Company number
     C     *LIKE         DEFINE    WDLCST        WK0006                         Cost at last receipt
     C     *LIKE         DEFINE    WDMAXB        WK0007                         Maximum Balance
     C     *LIKE         DEFINE    WDMINB        WK0008                         Minimum Balance
     C     *LIKE         DEFINE    WDQBQ         WK0011                         Quantity on backorde
     C     *LIKE         DEFINE    WDQOO         WK0013                         Quantity on Order
     C     *LIKE         DEFINE    WDQOR         WK0014                         Quantity on reserve
     C     *LIKE         DEFINE    WDUCST        WK0017                         Unit Cost
     C     *LIKE         DEFINE    RN0013        WK0019                         Company number
     C     *LIKE         DEFINE    WHWHSE        WK0021                         Warehouse Number
     C     *LIKE         DEFINE    RN0015        WK0022                         Company number
     C     *LIKE         DEFINE    WTITEM        WK0023                         Item Number
     C     *LIKE         DEFINE    WTTRNC        WK0024                         Transaction Type
     C     *LIKE         DEFINE    WTTRPV        WK0026                         Trans Period Value
     C     *LIKE         DEFINE    WTTRYQ        WK0027                         Trans YTD Quantity
     C     *LIKE         DEFINE    WTTRYV        WK0028                         Trans YTD Value
     C     *LIKE         DEFINE    WTWHSE        WK0029                         Warehouse Number
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0001        HD0001
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0007        HD0002
     C     *LIKE         DEFINE    TTTRNC        HTTRNC
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0009        HD0003
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0011        HD0004
     C     *LIKE         DEFINE    WDWHSE        HDWHSE
     C     *LIKE         DEFINE    WDITEM        HDITEM
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0013        HD0005
     C     *LIKE         DEFINE    WHWHSE        HHWHSE
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0015        HD0006
     C     *LIKE         DEFINE    WTWHSE        HTWHSE
     C     *LIKE         DEFINE    WTITEM        HD0007
     C     *LIKE         DEFINE    WTTRNC        HD0008
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
     C                   MOVE      *BLANKS       EXCEPT            4
     C                   MOVE      *BLANKS       FIRST             1
     C                   MOVE      *ZEROS        NITEMS            5 0
     C                   MOVE      *ZEROS        QTYAV             9 0
     C                   MOVE      *BLANKS       SVWHSE            3
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD06            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          003
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       KDIT02           20            WDITEM
     C                   MOVE      *BLANKS       KTCO01            3            TTCOYNO
     C                   MOVE      *BLANKS       KTTR02            2            TTTRNC
     C                   MOVE      *BLANKS       SAVIN            99            Save Indword
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        RSLT02            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS
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
     C* *** Get Company Name.
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYN
     C*
     C                   EXSR      S001
     C*                                                               *
     C* *** Check if 'To' parameters blank.
     C* IF PRTWHS = ' '
     C     PRTWHS        IFEQ      *BLANKS
     C* IF PRFWHS <> ' '
     C     PRFWHS        IFNE      *BLANKS
     C* PRTWHS = PRFWHS
     C                   MOVE      PRFWHS        PRTWHS
     C* ELSE                                                          *
     C                   ELSE
     C* PRTWHS = '999'
     C                   MOVE      '999'         PRTWHS
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Check if 'To' parameters blank.
     C* IF PRTITM = ' '
     C     PRTITM        IFEQ      *BLANKS
     C* IF PRFITM <> ' '
     C     PRFITM        IFNE      *BLANKS
     C* PRTITM = PRFITM
     C                   MOVE      PRFITM        PRTITM
     C* ELSE                                                          *
     C                   ELSE
     C* PRTITM = '99999999999999999999'
     C                   MOVE      *BLANKS       PRTITM
     C                   MOVEL     C0001         PRTITM
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Set limits on Warehouse details.
     C* SETLL D.WAREHED,F.WAREDET,PRCOYN,PRFWHS,PRFITM
     C*
     C                   EXSR      S002
     C* GETREC D.WAREHED,F.WAREDET,*NE,PRCOYN
     C*
     C                   EXSR      S003
     C*                                                               *
     C* *** Set Read loop.
     C* DOW %STS(D.WAREHED,F.WAREDET)=*YES
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
     C* *** Check item is in range selected.
     C* IF WDWHSE >= PRFWHS & WDWHSE <= PRTWHS
     C     WK0018        IFGE      PRFWHS
     C     WK0018        ANDLE     PRTWHS
     C* IF WDITEM >= PRFITM & WDITEM <= PRTITM
     C     WK0005        IFGE      PRFITM
     C     WK0005        ANDLE     PRTITM
     C*                                                               *
     C* *** Check for change of warehouse if not 1st cycle.
     C* IF WDWHSE <> SVWHSE
     C     WK0018        IFNE      SVWHSE
     C* GETREC D.WAREHED,F.WAREHED,*EQ,WDCOYNO,WDWHSE
     C*
     C                   EXSR      S005
     C* PRINT STKSTT,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* IF FIRST = ' '
     C     FIRST         IFEQ      *BLANKS
     C* PRINT STKSTT,AH2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* PRINT STKSTT,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* SVWHSE = WDWHSE
     C                   MOVE      WK0018        SVWHSE
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If First cycle.
     C* IF FIRST = ' '
     C     FIRST         IFEQ      *BLANKS
     C* SVWHSE = WDWHSE
     C                   MOVE      WK0018        SVWHSE
     C* FIRST = 'Y'
     C                   MOVE      'Y'           FIRST
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Calculate Quantity available.
     C* QTYAV = WDQOH - WDQAL
     C     WK0012        SUB       WK0010        NRSLT0
     C                   Z-ADD     NRSLT0        QTYAV
     C*                                                               *
     C* *** Increment No. of items listed.
     C* NITEMS = NITEMS + 1
     C     NITEMS        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        NITEMS
     C*                                                               *
     C* *** Get Item Description.
     C* GETREC D.WAREHED,F.ITMMAST,*EQ,PRCOYN,WDITEM
     C*
     C                   EXSR      S006
     C*                                                               *
     C* *** Check for Exception errors.
     C*                                                               *
     C* EXPDS = ' '
     C                   MOVEL     *BLANKS       EXPDS
     C* *** Below Minimum Balance.
     C* IF WDMINB <> 0 & WDQOH < WDMINB
     C     WK0008        IFNE      *ZERO
     C     WK0012        ANDLT     WK0008
     C* EXP1 = '1'
     C                   MOVE      '1'           EXP1
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Above Maximum Balance.
     C* IF WDMAXB <> 0 & WDQOH > WDMAXB
     C     WK0007        IFNE      *ZERO
     C     WK0012        ANDGT     WK0007
     C* EXP2 = '2'
     C                   MOVE      '2'           EXP2
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** On Backorder.
     C* IF WDQBQ > 0
     C     WK0011        IFGT      *ZERO
     C* EXP3 = '3'
     C                   MOVE      '3'           EXP3
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Cost Deviation.
     C* IF WDUCST <> WDLCST
     C     WK0017        IFNE      WK0006
     C* EXP4 = '4'
     C                   MOVE      '4'           EXP4
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Move Exception DS to output field.
     C* EXCEPT = EXPDS
     C                   MOVE      *BLANKS       EXCEPT
     C                   MOVEL     EXPDS         EXCEPT
     C*                                                               *
     C* *** Check for overflow.
     C* IF %OVF(STKSTT)=*YES
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
     C* PRINT STKSTT,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT STKSTT,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Print detail line.
     C* PRINT STKSTT,DD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* *** Set limits on Warehouse Movements Summary.
     C* SETLL D.WAREHED,F.WRITTYP,WDCOYNO,WDWHSE,WDITEM
     C*
     C                   EXSR      S007
     C* GETREC D.WAREHED,F.WRITTYP,*NE,WDCOYNO,WDWHSE,WDITEM
     C*
     C                   EXSR      S008
     C*                                                               *
     C* *** Read all entries for Whse/Item.
     C* DOW %STS(D.WAREHED,F.WRITTYP)=*YES
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
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
     C*                                                               *
     C* *** Get transaction description.
     C* GETREC D.IMSTRN,F.IMSTRN,*EQ,WTCOYNO,WTTRNC
     C*
     C                   EXSR      S010
     C*                                                               *
     C* *** Output transaction line.
     C* PRINT STKSTT,DD2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* *** Read next record.
     C* GETREC D.WAREHED,F.WRITTYP,*NE,WDCOYNO,WDWHSE,WDITEM
     C*
     C                   EXSR      S008
     C* END                                                           *
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
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
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* GETREC D.WAREHED,F.WAREDET,*NE,PRCOYN
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
     C* *** Print Totals.
     C* PRINT STKSTT,TT1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0006                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* *** Print End of Report narrative
     C* PRINT STKSTT,XXX
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
     C* S002   - SETLL D.WAREHED,F.WAREDET,PRCOYN,PRFWHS,PRFITM
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.WAREDET   WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMMAST   STOV
     C                   MOVE      'N'           SWRD05                         RD.SW.WRITTYP   WLOC
     C                   MOVEL     *LOVAL        HDITEM                         Item Number
     C*
     C                   MOVEL     PRCOYN        KHCO01
     C                   MOVEL     PRCOYN        HD0004                         Company number
     C                   MOVEL     PRCOYN        RN0011                         Company number
     C                   MOVEL     PRFWHS        KHWH02
     C                   MOVEL     PRFWHS        HDWHSE                         Warehouse Number
     C                   MOVEL     PRFWHS        WDWHSE                         Warehouse Number
     C                   MOVEL     PRFITM        KDIT03
     C                   MOVEL     PRFITM        HDITEM                         Item Number
     C                   MOVEL     PRFITM        WDITEM                         Item Number
     C*
     C     K0002         SETLL     WAREDET                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - GETREC D.WAREHED,F.WAREDET,*NE,PRCOYN
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRCOYN        KHCO01
     C     K0003         READE     WAREDET                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S004                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - Process To Reset File Pointer(EOF) - WAREDET
     C**************************************************************************
     C     S004          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.WAREDET   WARE
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.WAREDET   WARE
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0011        KHCO01
     C     K0003         SETGT     WAREDET
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - GETREC D.WAREHED,F.WAREHED,*EQ,WDCOYNO,WDWHSE
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0004        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0018        KHWH02
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
     C* S006   - GETREC D.WAREHED,F.ITMMAST,*EQ,PRCOYN,WDITEM
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRCOYN        KHCO01
     C                   MOVEL     *BLANK        KDIT02
     C                   MOVEL     WK0005        KDIT02
     C     K0005         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMMAST   STOV
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMMAST   STOV
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - SETLL D.WAREHED,F.WRITTYP,WDCOYNO,WDWHSE,WDITEM
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD05                         RD.SW.WRITTYP   WLOC
     C                   MOVEL     *LOVAL        HD0008                         Transaction Type
     C*
     C                   MOVEL     WK0004        KHCO01
     C                   MOVEL     WK0004        HD0006                         Company number
     C                   MOVEL     WK0004        RN0015                         Company number
     C                   MOVEL     WK0018        KHWH02
     C                   MOVEL     WK0018        HTWHSE                         Warehouse Number
     C                   MOVEL     WK0018        WTWHSE                         Warehouse Number
     C                   MOVEL     WK0005        KDIT03
     C                   MOVEL     WK0005        HD0007                         Item Number
     C                   MOVEL     WK0005        WTITEM                         Item Number
     C*
     C     K0002         SETLL     WRITTYP                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS05                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - GETREC D.WAREHED,F.WRITTYP,*NE,WDCOYNO,WDWHSE,WDITEM
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0004        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0018        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WK0005        KDIT03
     C     K0002         READE     WRITTYP                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.WRITTYP   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S009                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - Process To Reset File Pointer(EOF) - WRITTYP
     C**************************************************************************
     C     S009          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.WRITTYP   WLOC
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0015        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     WTWHSE        KHWH02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     WTITEM        KDIT03
     C     K0002         SETGT     WRITTYP
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - GETREC D.IMSTRN,F.IMSTRN,*EQ,WTCOYNO,WTTRNC
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     WK0022        KTCO01
     C                   MOVEL     *BLANK        KTTR02
     C                   MOVEL     WK0024        KTTR02
     C     K0006         CHAIN     IMSTRN                             9091
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
     C     WFILE#        IFEQ      2                                            WAREDET
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
     C     WFILE#        IFEQ      4                                            ITMMAST
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            WRITTYP
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
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0011        WK0004                         Company number
     C                   MOVEL     WDITEM        WK0005                         Item Number
     C                   Z-ADD     WDLCST        WK0006                         Cost at last receipt
     C                   Z-ADD     WDMAXB        WK0007                         Maximum Balance
     C                   Z-ADD     WDMINB        WK0008                         Minimum Balance
     C                   Z-ADD     WDOBAL        WK0009                         Opening balance
     C                   Z-ADD     WDQAL         WK0010                         Quantity Allocated
     C                   Z-ADD     WDQBQ         WK0011                         Quantity on backorde
     C                   Z-ADD     WDQOH         WK0012                         Quantity on hand
     C                   Z-ADD     WDQOO         WK0013                         Quantity on Order
     C                   Z-ADD     WDQOR         WK0014                         Quantity on reserve
     C                   MOVEL     WDSBRN        WK0015                         Branch Number
     C                   MOVEL     RN0012        WK0016                         Supplier Number
     C                   Z-ADD     WDUCST        WK0017                         Unit Cost
     C                   MOVEL     WDWHSE        WK0018                         Warehouse Number
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0011        HD0004                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0013        WK0019                         Company number
     C                   MOVEL     RN0014        WK0020                         Warehouse Descriptio
     C                   MOVEL     WHWHSE        WK0021                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0013        HD0005                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0010        WK0003                         Item Description
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0009        HD0003                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0015        WK0022                         Company number
     C                   MOVEL     WTITEM        WK0023                         Item Number
     C                   MOVEL     WTTRNC        WK0024                         Transaction Type
     C                   Z-ADD     WTTRPQ        WK0025                         Trans Period Quantit
     C                   Z-ADD     WTTRPV        WK0026                         Trans Period Value
     C                   Z-ADD     WTTRYQ        WK0027                         Trans YTD Quantity
     C                   Z-ADD     WTTRYV        WK0028                         Trans YTD Value
     C                   MOVEL     WTWHSE        WK0029                         Warehouse Number
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0015        HD0006                         Company number
     C                   MOVEL     WTWHSE        HTWHSE                         Warehouse Number
     C                   MOVEL     WTITEM        HD0007                         Item Number
     C                   MOVEL     WTTRNC        HD0008                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSTRN
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     RN0007        WK0001                         Company number
     C                   MOVEL     TTDESC        WTDESC                         Description
     C                   MOVEL     TTTRNC        WK0002                         Transaction Type
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0007        HD0002                         Company number
     C                   MOVEL     TTTRNC        HTTRNC                         Transaction Type
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
