     F/TITLE PLRPLN Print Rplenishment at Location
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PLRPLN
     F*  Application ID      -    PLRPLN
     F*  Application Name    -    Print Rplenishment at Location
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  SECIMS      - (I/DISK   ) IMS User Security           US
     F*  WLOCITM     - (I/DISK   ) IMS Warehouse Location Item WI
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  PLRPLNO     - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     F* S002   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,USER
     F* S003   - SETLL D.WARELOC,F.WLOCITM,PRCOYNO,USWHSE
     F* S004   - GETREC D.WARELOC,F.WLOCITM,*NE,PRCOYNO,USWHSE
     F* S005   - Process To Reset File Pointer(EOF) - WLOCITM
     F* S006   - SETLL D.WARELOC,F.WLOCITM,PRCOYNO
     F* S007   - GETREC D.WARELOC,F.WLOCITM,*NE,PRCOYNO
     F* S008   - Process To Reset File Pointer(EOF) - WLOCITM
     F* S009   - GETREC D.WARELOC,F.ITMMAST,*EQ,WICOYNO,WIITEM
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FSECIMS    IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FWLOCITM   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FPLRPLNO   O    E             PRINTER
     F                                     INFDS(FIDS05)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D A1              S             80    DIM(1) CTDATA PERRCD(1)              Alpha constants i
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
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
     D  REC05                367    368B 0
     D  OLN05                188    189B 0
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
     ICOMPANYF
     I              CYCOYNO                     RN0002
     I              CYEMPCOL                    RN0003
     I              CYEMPHEAD                   RN0004
     I              CYPRDHEAD                   RN0005
     I              CYREFHEAD                   RN0006
     I              CYSDESC                     RN0007
     IITMSTRF
     I              ITALPHA                     RN0008
     I              ITCOYNO                     RN0009
     I              ITIDESC                     RN0010
     ISECIMSF
     I              USCOYNO                     RN0011
     IWLOCITMF
     I              WICOYNO                     RN0012
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
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
     C                   KFLD                    KSCO01
     C                   KFLD                    KSUS02
     C*
     C     K0003         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C*
     C     K0004         KLIST
     C                   KFLD                    KICO01
     C*
     C     K0005         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIIT02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0009        WK0001                         Company number
     C     *LIKE         DEFINE    ITITEM        WTITEM                         Item Number
     C     *LIKE         DEFINE    USWHSE        WSWHSE                         Allowed Warehouse
     C     *LIKE         DEFINE    RN0012        WK0003                         Company number
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0002        HD0001
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0011        HD0003
     C     *LIKE         DEFINE    USUSER        HSUSER
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0009        HD0002
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0012        HD0004
     C     *LIKE         DEFINE    WIWHSE        HIWHSE
     C     *LIKE         DEFINE    WILOCN        HILOCN
     C     *LIKE         DEFINE    WIITEM        HIITEM
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
     C                   MOVE      *BLANKS       RN0001           10            USER
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       KSCO01            3            USCOYNO
     C                   MOVE      *BLANKS       KSUS02           10            USUSER
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       KICO01            3            WICOYNO
     C                   MOVE      *BLANKS       KIWH02            3            WIWHSE
     C                   MOVE      *BLANKS       KIIT02           20            WIITEM
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
     C*                                                               *
     C* ** Get company name.
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     C*
     C                   EXSR      S001
     C*                                                               *
     C* ** Check user's warehouse access
     C* USER = *USERID
     C                   MOVE      *BLANKS       RN0001
     C                   MOVEL     USER          RN0001
     C* GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,USER
     C*
     C                   EXSR      S002
     C*                                                               *
     C* *** Output Report Heading.
     C* PRINT PLRPLEN,AAA
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* *** Start read of Warehouse/Location/Item file.
     C* IF USWHSE <>' '
     C     WSWHSE        IFNE      *BLANKS
     C* SETLL D.WARELOC,F.WLOCITM,PRCOYNO,USWHSE
     C*
     C                   EXSR      S003
     C* GETREC D.WARELOC,F.WLOCITM,*NE,PRCOYNO,USWHSE
     C*
     C                   EXSR      S004
     C* ELSE                                                          *
     C                   ELSE
     C* SETLL D.WARELOC,F.WLOCITM,PRCOYNO
     C*
     C                   EXSR      S006
     C* GETREC D.WARELOC,F.WLOCITM,*NE,PRCOYNO
     C*
     C                   EXSR      S007
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Read until end.
     C* DOW %STS(D.WARELOC,F.WLOCITM)=*YES
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
     C* Output to report if On-Hand<Minimum Balance.
     C* IF WIQOH < WIMINB
     C     WK0007        IFLT      WK0006
     C*                                                               *
     C* Get Item Description.
     C* GETREC D.WARELOC,F.ITMMAST,*EQ,WICOYNO,WIITEM
     C*
     C                   EXSR      S009
     C*                                                               *
     C* Check for overflow.
     C* IF %OVF(PLRPLEN)=*YES
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
     C* PRINT PLRPLEN,AAA
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Print detail line.
     C* PRINT PLRPLEN,BBB
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* IF USWHSE <>' '
     C     WSWHSE        IFNE      *BLANKS
     C* GETREC D.WARELOC,F.WLOCITM,*NE,PRCOYNO,USWHSE
     C*
     C                   EXSR      S004
     C* ELSE                                                          *
     C                   ELSE
     C* GETREC D.WARELOC,F.WLOCITM,*NE,PRCOYNO
     C*
     C                   EXSR      S007
     C* END                                                           *
     C                   END
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
     C* ** Output End of Report narrative
     C* PRINT PLRPLEN,XXX
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
     C* S002   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,USER
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     PRM001        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     RN0001        KSUS02
     C     K0002         CHAIN     SECIMS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - SETLL D.WARELOC,F.WLOCITM,PRCOYNO,USWHSE
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM   ITMM
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMMAST
     C                   MOVEL     *LOVAL        HD0004                         Company number
     C                   MOVEL     *LOVAL        HIWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HILOCN                         Location
     C                   MOVEL     *LOVAL        HIITEM                         Item Number
     C*
     C                   MOVEL     PRM001        KICO01
     C                   MOVEL     PRM001        HD0004                         Company number
     C                   MOVEL     PRM001        RN0012                         Company number
     C                   MOVEL     WSWHSE        KIWH02
     C                   MOVEL     WSWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WSWHSE        WIWHSE                         Warehouse Number
     C*
     C     K0003         SETLL     WLOCITM                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC D.WARELOC,F.WLOCITM,*NE,PRCOYNO,USWHSE
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     PRM001        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     WSWHSE        KIWH02
     C     K0003         READE     WLOCITM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WLOCITM   ITMM
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S005                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - Process To Reset File Pointer(EOF) - WLOCITM
     C**************************************************************************
     C     S005          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.WLOCITM   ITMM
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM   ITMM
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0012        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C     K0003         SETGT     WLOCITM
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(1)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - SETLL D.WARELOC,F.WLOCITM,PRCOYNO
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM   ITMM
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMMAST
     C                   MOVEL     *LOVAL        HD0004                         Company number
     C                   MOVEL     *LOVAL        HIWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HILOCN                         Location
     C                   MOVEL     *LOVAL        HIITEM                         Item Number
     C*
     C                   MOVEL     PRM001        KICO01
     C                   MOVEL     PRM001        HD0004                         Company number
     C                   MOVEL     PRM001        RN0012                         Company number
     C*
     C     K0004         SETLL     WLOCITM                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.WARELOC,F.WLOCITM,*NE,PRCOYNO
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     PRM001        KICO01
     C     K0004         READE     WLOCITM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WLOCITM   ITMM
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S008                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - Process To Reset File Pointer(EOF) - WLOCITM
     C**************************************************************************
     C     S008          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.WLOCITM   ITMM
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM   ITMM
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0012        KICO01
     C     K0004         SETGT     WLOCITM
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(1)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.WARELOC,F.ITMMAST,*EQ,WICOYNO,WIITEM
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     WK0003        KICO01
     C                   MOVEL     *BLANK        KIIT02
     C                   MOVEL     WK0004        KIIT02
     C     K0005         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMMAST
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMMAST
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
     C     WFILE#        IFEQ      2                                            SECIMS
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            WLOCITM
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
     C                   MOVEL     RN0002        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SECIMS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     USWHSE        WSWHSE                         Allowed Warehouse
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0011        HD0003                         Company number
     C                   MOVEL     USUSER        HSUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0012        WK0003                         Company number
     C                   MOVEL     WIITEM        WK0004                         Item Number
     C                   MOVEL     WILOCN        WK0005                         Location
     C                   Z-ADD     WIMINB        WK0006                         Minimum Balance
     C                   Z-ADD     WIQOH         WK0007                         Quantity on hand
     C                   MOVEL     WIWHSE        WK0008                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0012        HD0004                         Company number
     C                   MOVEL     WIWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WILOCN        HILOCN                         Location
     C                   MOVEL     WIITEM        HIITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0009        WK0001                         Company number
     C                   MOVEL     RN0010        WK0002                         Item Description
     C                   MOVEL     ITITEM        WTITEM                         Item Number
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0009        HD0002                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
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
The end of the file was reached
