     F/TITLE PCOMIT Open Order Commitment Summary
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PCOMIT
     F*  Application ID      -    PCOMIT
     F*  Application Name    -    Open Order Commitment Summary
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Program Narrative
     F*
     F*  Open order commitment summary - rel 1.0
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  PORDDL2     - (I/DISK   ) Purchase Order By Required Dt
     F*  PCOMITO     - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - SETLL D.IPSPORDL2,F.PORDDL2,PRM001
     F* S002   - GETREC D.IPSPORDL2,F.PORDDL2,*NE,PRM001
     F* S003   - Process To Reset File Pointer(EOF) - PORDDL2
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FPORDDL2   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FPCOMITO   O    E             PRINTER
     F                                     INFDS(FIDS02)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D*
     D* Delivery MM/YY
     D*
     D @DS001          DS
     D  YY1                    1      4
     D  MM1                    5      6
     D  DD1                    7      8
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                367    368B 0
     D  OLN02                188    189B 0
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
     IPORDDF
     I              POCOYNO                     RN0001
     I              PODLVDT                     RN0002
     I              POIDESC                     RN0003
     I              PONLALL                     RN0004
     I              POPRICE                     RN0005
     I              POQRCVD                     RN0006
     I              POQRCYC                     RN0007
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
     C                   PARM                    XDMY              6 0
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
     C                   KFLD                    KOCO01
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0001        WK0001                         Company number
     C     *LIKE         DEFINE    RN0002        WK0002                         Delivery Date
     C     *LIKE         DEFINE    RN0004        WK0003                         Allocated account
     C     *LIKE         DEFINE    RN0005        WK0004                         Price
     C     *LIKE         DEFINE    POQORD        WOQORD                         Quantity ordered
     C     *LIKE         DEFINE    RN0006        WK0005                         Quantity received
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0001        HD0001
     C     *LIKE         DEFINE    RN0002        HD0002
     C     *LIKE         DEFINE    RN0004        HD0003
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
     C                   MOVE      *ZEROS        ACCVAL           13 2
     C                   MOVE      *BLANKS       ACNAME           40
     C                   MOVE      *BLANKS       LALOC            15
     C                   MOVE      *ZEROS        LMMYY             6 0
     C                   MOVE      *BLANKS       MMYY              6
     C                   MOVE      *ZEROS        MMYYN             6 0
     C                   MOVE      *ZEROS        MONVAL           13 2
     C                   MOVE      *ZEROS        OPENQ             7 0
     C                   MOVE      *ZEROS        OPENV            13 2
     C                   MOVE      *ZEROS        REPVAL           13 2
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KOCO01            3            POCOYNO
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       SAVIN            99            Save Indword
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
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
     C* *** commitment summary
     C* SETLL D.IPSPORDL2,F.PORDDL2,PRM001
     C*
     C                   EXSR      S001
     C* GETREC D.IPSPORDL2,F.PORDDL2,*NE,PRM001
     C*
     C                   EXSR      S002
     C*                                                               *
     C* *** set up MM/YY
     C* DELMMYY = %ctc(podlvdt)
     C*  Convert To Character
     C                   MOVE      *BLANK        @DS001
     C                   MOVEL     WK0002        @DS001
     C* MMYY = %con(MM1,YY1)
     C*  Concatenate
     C     MM1           CAT(P)    YY1:0         ARSLT0
     C                   MOVE      *BLANKS       MMYY
     C                   MOVEL     ARSLT0        MMYY
     C* MMYYN = %ctn(MMYY)
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        MMYYN
     C                   MOVE      MMYY          MMYYN
     C* LMMYY = MMYYN
     C                   Z-ADD     MMYYN         LMMYY
     C* LALOC = ponlall
     C                   MOVE      WK0003        LALOC
     C* *** print 1st Page
     C* PRINT comit,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* DOW %sts(D.IPSPORDL2,F.PORDDL2)=*yes
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
     C* *** set up MM/YY
     C* DELMMYY = %ctc(podlvdt)
     C*  Convert To Character
     C                   MOVE      *BLANK        @DS001
     C                   MOVEL     WK0002        @DS001
     C* MMYY = %con(MM1,YY1)
     C*  Concatenate
     C     MM1           CAT(P)    YY1:0         ARSLT0
     C                   MOVE      *BLANKS       MMYY
     C                   MOVEL     ARSLT0        MMYY
     C* MMYYN = %ctn(MMYY)
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        MMYYN
     C                   MOVE      MMYY          MMYYN
     C*                                                               *
     C* *** print Allocation Totals
     C* IF laloc<>ponlall
     C     LALOC         IFNE      WK0003
     C* IF %ovf(comit)=*yes
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
     C* PRINT comit,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* IF accval>0
     C     ACCVAL        IFGT      *ZERO
     C* PRINT comit,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* ACNAME = ' '
     C                   MOVEL     *BLANKS       ACNAME
     C* ACCVAL = 0
     C                   Z-ADD     *ZERO         ACCVAL
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** print monthly totals
     C* IF lmmyy<>mmyyn
     C     LMMYY         IFNE      MMYYN
     C* IF %ovf(comit)=*yes
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
     C* PRINT comit,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* IF accval>0
     C     ACCVAL        IFGT      *ZERO
     C* PRINT comit,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* IF monval>0
     C     MONVAL        IFGT      *ZERO
     C* PRINT comit,ccc
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* MONVAL = 0
     C                   Z-ADD     *ZERO         MONVAL
     C* ACCVAL = 0
     C                   Z-ADD     *ZERO         ACCVAL
     C* END                                                           *
     C                   END
     C* *** detail processing
     C* *** calculate open value
     C* OPENQ = poqord-poqrcvd
     C     WOQORD        SUB       WK0005        NRSLT0
     C                   Z-ADD     NRSLT0        OPENQ
     C* OPENV = poprice*openq
     C     WK0004        MULT      OPENQ         NRSLT0
     C                   Z-ADD     NRSLT0        OPENV
     C* *** get account name ***
     C* IF acname=' '
     C* ACNAME ' '
     C* GETREC D.COMITSUM,F.ACCBALN,*EQ,PONLALL
     C* END                                                           *
     C* *** accumulate values
     C* IF openq>0
     C     OPENQ         IFGT      *ZERO
     C* REPVAL = repval+openv
     C     REPVAL        ADD       OPENV         NRSLT0
     C                   Z-ADD     NRSLT0        REPVAL
     C* MONVAL = monval+openv
     C     MONVAL        ADD       OPENV         NRSLT0
     C                   Z-ADD     NRSLT0        MONVAL
     C* ACCVAL = accval+openv
     C     ACCVAL        ADD       OPENV         NRSLT0
     C                   Z-ADD     NRSLT0        ACCVAL
     C* END                                                           *
     C                   END
     C*                                                               *
     C* LMMYY = MMYYN
     C                   Z-ADD     MMYYN         LMMYY
     C* LALOC = ponlall
     C                   MOVE      WK0003        LALOC
     C* GETREC D.IPSPORDL2,F.PORDDL2,*NE,PRM001
     C*
     C                   EXSR      S002
     C* END                                                           *
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
     C                   END
     C*                                                               *
     C* *** last record totals
     C* IF %ovf(comit)=*yes
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
     C* PRINT comit,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* IF accval>0
     C     ACCVAL        IFGT      *ZERO
     C* PRINT comit,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* *** report totals
     C* IF %ovf(comit)=*yes
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
     C* PRINT comit,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* IF monval>0
     C     MONVAL        IFGT      *ZERO
     C* PRINT comit,fff
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0006                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* PRINT comit,ddd
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT comit,eee
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OA
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
     C* S001   - SETLL D.IPSPORDL2,F.PORDDL2,PRM001
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.PORDDL2
     C                   MOVEL     *LOVAL        HD0001                         Company number
     C                   Z-ADD     *LOVAL        HD0002                         Delivery Date
     C                   MOVEL     *LOVAL        HD0003                         Allocated account
     C*
     C                   MOVEL     PRM001        KOCO01
     C                   MOVEL     PRM001        HD0001                         Company number
     C                   MOVEL     PRM001        RN0001                         Company number
     C*
     C     K0001         SETLL     PORDDL2                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC D.IPSPORDL2,F.PORDDL2,*NE,PRM001
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     PRM001        KOCO01
     C     K0001         READE     PORDDL2                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.PORDDL2
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.PORDDL2
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S003                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - Process To Reset File Pointer(EOF) - PORDDL2
     C**************************************************************************
     C     S003          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.PORDDL2
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.PORDDL2
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0001        KOCO01
     C     K0001         SETGT     PORDDL2
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            PORDDL2
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From File To Work Area - PORDDL2
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0001        WK0001                         Company number
     C                   Z-ADD     RN0002        WK0002                         Delivery Date
     C                   MOVEL     RN0004        WK0003                         Allocated account
     C                   Z-ADD     RN0005        WK0004                         Price
     C                   Z-ADD     POQORD        WOQORD                         Quantity ordered
     C                   Z-ADD     RN0006        WK0005                         Quantity received
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   Z-ADD     RN0002        HD0002                         Delivery Date
     C                   MOVEL     RN0004        HD0003                         Allocated account
     C                   END
     C                   ENDSR
