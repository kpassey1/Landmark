     F/TITLE MNU040 Check user security
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MNU040
     F*  Application ID      -    MNU040
     F*  Application Name    -    Check user security
     F*  Date Generated      -    Jan 11, 2012
     F*  LM1SQL-41
     F********************************************************************
     F*  Files Usage
     F*
     F*  MNUUSR      - (I/DISK   ) Menu Users                  MA
     F*  MNUOPT1     - (I/DISK   ) Program Name, User Seq
     F*  MNUOPT2     - (I/DISK   ) Secondary Pgm,User Seq
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.MENU,F.MNUUSR,*EQ,USPARM
     F* S002   - GETREC D.MNUOPT1,F.MNUOPT1,*EQ,PGPARM,WKUSER
     F* S003   - GETREC D.mnuopt2,F.mnuopt2,*EQ,PGPARM,WKUSER
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FMNUUSR    IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FMNUOPT1   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FMNUOPT2   IF   E           K DISK
     F                                     RENAME(MNUOPTF:FMT001)
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     F*
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
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
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     IMNUUSRF
     I              MAGUSER                     RN0002
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    USPARM           10
     C                   PARM                    PGPARM           10
     C                   PARM                    OPPARM            1
     C                   PARM                    PRM001            1
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
     C                   KFLD                    KAUS01
     C*
     C     K0002         KLIST
     C                   KFLD                    KCPG01
     C                   KFLD                    KCUS02
     C*
     C     K0003         KLIST
     C                   KFLD                    KCSP01
     C                   KFLD                    KCUS02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    MCACTA        WCACTA                         Add
     C     *LIKE         DEFINE    MCACTD        WCACTD                         Delete
     C     *LIKE         DEFINE    MCACTR        WCACTR                         Revise
     C     *LIKE         DEFINE    MCACTA        WK0001                         Add
     C     *LIKE         DEFINE    MCACTD        WK0002                         Delete
     C     *LIKE         DEFINE    MCACTR        WK0003                         Revise
     C     *LIKE         DEFINE    RN0002        WK0004                         Group User
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    MAUSER        HAUSER
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    MCPGMN        HCPGMN
     C     *LIKE         DEFINE    MCUSER        HCUSER
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    MCSPGM        HCSPGM
     C     *LIKE         DEFINE    MCUSER        HD0001
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
     C                   MOVE      *BLANKS       RN0001           20            @GETREC
     C                   MOVE      *BLANKS       WKCRTA            1
     C                   MOVE      *BLANKS       WKDELA            1
     C                   MOVE      *BLANKS       WKUPDA            1
     C                   MOVE      *BLANKS       WKUSER           10
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KAUS01           10            MAUSER
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          010
     C                   MOVE      *BLANKS       KCPG01           10            MCPGMN
     C                   MOVE      *BLANKS       KCUS02           10            MCUSER
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0100
     C                   MOVE      *BLANKS       KCSP01           10            MCSPGM
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
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
     C* *** Initialise Error Return Code to 'Error'.
     C* RNPARM = 'N'
     C                   MOVE      'N'           PRM001
     C* WKUSER = usparm
     C                   MOVE      USPARM        WKUSER
     C*                                                               *
     C* *** Get user security record.
     C* GETREC D.MENU,F.MNUUSR,*EQ,USPARM
     C*
     C                   EXSR      S001
     C*                                                               *
     C* *** If record does not exists error.
     C* IF %STS(D.MENU,F.MNUUSR)=*NO
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If User is under Group profile get the
     C* *** Group Program allowed options.
     C* IF maguser <> ' '
     C     WK0004        IFNE      *BLANKS
     C* WKUSER = maguser
     C                   MOVE      WK0004        WKUSER
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Get the User Program allowed options.
     C* GETREC D.MNUOPT1,F.MNUOPT1,*EQ,PGPARM,WKUSER
     C*
     C                   EXSR      S002
     C* WKUPDA = mnuopt1.mnuopt1.mcactr
     C                   MOVE      WCACTR        WKUPDA
     C* WKDELA = mnuopt1.mnuopt1.mcactd
     C                   MOVE      WCACTD        WKDELA
     C* WKCRTA = mnuopt1.mnuopt1.mcACTA
     C                   MOVE      WCACTA        WKCRTA
     C*                                                               *
     C* *** If no record found try program names in parm 1
     C* IF %STS(D.mnuopt1,F.mnuopt1)=*NO
     C*  Status of last file I/O
     C     STS02         IFNE      *ZERO
     C* GETREC D.mnuopt2,F.mnuopt2,*EQ,PGPARM,WKUSER
     C*
     C                   EXSR      S003
     C* WKUPDA = mnuopt2.mnuopt2.mcactr
     C                   MOVE      WK0003        WKUPDA
     C* WKDELA = mnuopt2.mnuopt2.mcactd
     C                   MOVE      WK0002        WKDELA
     C* WKCRTA = mnuopt2.mnuopt2.mcACTA
     C                   MOVE      WK0001        WKCRTA
     C* IF %STS(D.mnuopt2,F.mnuopt2)=*NO
     C*  Status of last file I/O
     C     STS03         IFNE      *ZERO
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   EXSR      SEND
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If edit requested check allowed.
     C* IF OPPARM = '2' & wkUPDA <> 'Y'
     C* EXTPGM                                                        *
     C* END                                                           *
     C*                                                               *
     C* *** If delete requested check allowed.
     C* IF OPPARM = '4' & wkDELA <> 'Y'
     C* EXTPGM                                                        *
     C* END                                                           *
     C*                                                               *
     C* *** If add requested check allowed.
     C* IF OPPARM = '6' & wkCRTA <> 'Y'
     C* EXTPGM                                                        *
     C* END                                                           *
     C*                                                               *
     C* RNPARM = 'Y'
     C                   MOVE      'Y'           PRM001
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
     C* S001   - GETREC D.MENU,F.MNUUSR,*EQ,USPARM
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01
     C                   MOVEL     USPARM        KAUS01
     C     K0001         CHAIN     MNUUSR                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC D.MNUOPT1,F.MNUOPT1,*EQ,PGPARM,WKUSER
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KCPG01
     C                   MOVEL     PGPARM        KCPG01
     C                   MOVEL     *BLANK        KCUS02
     C                   MOVEL     WKUSER        KCUS02
     C     K0002         CHAIN     MNUOPT1                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.MNUOPT1
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.MNUOPT1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - GETREC D.mnuopt2,F.mnuopt2,*EQ,PGPARM,WKUSER
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KCSP01
     C                   MOVEL     PGPARM        KCSP01
     C                   MOVEL     *BLANK        KCUS02
     C                   MOVEL     WKUSER        KCUS02
     C     K0003         CHAIN     MNUOPT2                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.MNUOPT2
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUOPT2
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
     C     WFILE#        IFEQ      1                                            MNUUSR
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            MNUOPT1
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            MNUOPT2
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From File To Work Area - MNUUSR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0002        WK0004                         Group User
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     MAUSER        HAUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUOPT1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     MCACTA        WCACTA                         Add
     C                   MOVEL     MCACTD        WCACTD                         Delete
     C                   MOVEL     MCACTR        WCACTR                         Revise
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     MCPGMN        HCPGMN                         Program Name
     C                   MOVEL     MCUSER        HCUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUOPT2
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     MCACTA        WK0001                         Add
     C                   MOVEL     MCACTD        WK0002                         Delete
     C                   MOVEL     MCACTR        WK0003                         Revise
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     MCSPGM        HCSPGM                         Secondary Program Na
     C                   MOVEL     MCUSER        HD0001                         User
     C                   END
     C                   END
     C                   END
     C                   ENDSR
