     F/TITLE KDPKVI Input Key (Modified 4/4/02)
     F*****************************************************************
     F* Copyright    ** KDP Software Ltd. **      2019
     F*****************************************************************
     F*
     F*  Program ID          -    KDPKVI
     F*  Application ID      -    KDPKVI
     F*  Application Name    -    Input Key (Modified 4/4/02)
     F*  Date Generated      -    Aug 30, 2019
     F*
     F*****************************************************************
     F*  Files Usage
     F*
     F*  KDPKVID     - (C/WORKSTN) Generated display file
     F*
     F*****************************************************************
     F*  Function Of Indicators
     F*
     F*  SCVALD2    - Key is valid
     F*
     F* N79     - SCR002 PUTOVR
     F*
     F*  SC0002     - System Security Program
     F*
     F*  99     - SCR001 OVERLAY
     F* N79     - SCR001 PUTOVR
     F*
     F*****************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - System Security Program
     F* S002 - Key is valid
     F* SREDSP -  Redisplay Windows within stack.
     F* SBRDAT - Converts DATE field into YEAR, MONTH, and DAYS
     F* SMSG - calls message handling program to either clear, add, or
     F* SDMC - Convert date into Day_month_cenyr form.
     F* *PSSR - Program Execution Errors Handler
     F*
     F*****************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F*****************************************************************
     FKDPKVID   CF   E             WORKSTN
     F                                     INFDS(DSPFDS)
     F*
     D*****************************************************************
     D*      A r r a y  /  T a b l e   S p e c i f i c a t i o n
     D*****************************************************************
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D*
     D*****************************************************************
     D*            I n p u t    S p e c i f i c a t i o n
     D*****************************************************************
     D*
     D* Key
     D*
     D @DS001          DS
     D  PASS                   1     27
     D*
     D* DOCUMENTOR
     D*
     D @DS002          DS            27
     D  DAONE                  1     27
     D*
     D* COSHHY
     D*
     D @DS003          DS            27
     D  DATWO                  1     27
     D*
     D* LANDIMS
     D*
     D @DS004          DS            27
     D  DATHRE                 1     27
     D*
     D* LANDSOP
     D*
     D @DS005          DS            27
     D  DAFOUR                 1     27
     D*
     D* LANDIPS
     D*
     D @DS006          DS            27
     D  DAFIVE                 1     27
     D*
     D* SETTURN
     D*
     D @DS007          DS            27
     D  DASIX                  1     27
     D*
     D* Cross-Applications
     D*
     D @DS008          DS            27
     D  DASEVE                 1     27
     D*
     D* Area 8
     D*
     D @DS009          DS            27
     D  DAEIGH                 1     27
     D*
     D* Area 9
     D*
     D @DS010          DS            27
     D  DANINE                 1     27
     D*
     D* NUMBER
     D*
     D NUMBER          DS
     D  WK0101                 1      1  0
     D  WK0901                 1      9  0
     D  WK0102                 2      2  0
     D  WK0103                 3      3  0
     D  WK0104                 4      4  0
     D  WK0105                 5      5  0
     D  WK0106                 6      6  0
     D  WK0107                 7      7  0
     D  WK0108                 8      8  0
     D  WK0109                 9      9  0
     D  DTSRNL                10     17  0
     D  DTSR01                10     10  0
     D  DTSR02                11     11  0
     D  DTSR03                12     12  0
     D  DTSR04                13     13  0
     D  DTSR05                14     14  0
     D  DTSR06                15     15  0
     D  DTSR07                16     16  0
     D  DTSR08                17     17  0
     D*
     D* Security Key
     D*
     D @DS011          DS
     D  DSSECR                 1     27
     D  DSSE01                 1      1  0
     D  DSSE02                 2      2  0
     D  DSSE03                 3      3  0
     D  DSSE04                 4      4  0
     D  DSSE05                 5      5  0
     D  DSSE06                 6      6  0
     D  DSSE07                 7      7  0
     D  DSSE08                 8      8  0
     D  DSSE09                 9      9  0
     D  DSSE10                10     10  0
     D  DSSE11                11     11  0
     D  DSSE12                12     12  0
     D  DSSE13                13     13  0
     D  DSSE14                14     14  0
     D  DSSE15                15     15  0
     D  DSSE16                16     16  0
     D  DSSE17                17     17  0
     D  DSSE18                18     18  0
     D  DSSE19                19     19  0
     D  DSSE20                20     20  0
     D  DSSE21                21     21  0
     D  DSSE22                22     22  0
     D  DSSE23                23     23  0
     D  DSSE24                24     24  0
     D  DSSE25                25     25  0
     D  DSSE26                26     26  0
     D  DSSE27                27     27  0
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
     D @DS012          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
     D*
     D* Named constants
     D*
     D C0001           C                   CONST('Security key is inva-
     D                                     lid')
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
     D @DS013          DS
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
     I*
     C*****************************************************************
     C*            P a r a m e t e r     L i s t
     C*****************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    SERIAL
     C*
     C     *ENTRY        PLIST
     C                   PARM                    XYMD              6 0
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
     C*****************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C*****************************************************************
     C     LRFLAG        IFNE      'N'
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
     C                   MOVE      *BLANKS       ERROR             1
     C                   MOVE      *BLANKS       SECNUM           27
     C                   MOVE      *BLANKS       SERIAL            8
     C                   MOVE      *ZEROS        SERIAN            8 0
     C                   MOVE      *ZEROS        SERNUM            8 0
     C                   MOVE      *ZEROS        WKTEST            1 0
     C                   MOVE      *ZEROS        WK0201            2 0
     C                   MOVE      *ZEROS        WK0202            2 0
     C                   MOVE      *ZEROS        WK0601            6 0
     C                   MOVE      *ZEROS        WK0602            6 0
     C                   MOVE      *ZEROS        WK0801            8 0
     C                   MOVE      *ZEROS        WK0802           15 6
     C                   MOVE      *ZEROS        RN0001            8 0          WSDATE
     C                   MOVE      *ZEROS        WK0101                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0901                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0102                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0103                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0104                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0105                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0106                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0107                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0108                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        WK0109                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSRNL                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR01                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR02                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR03                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR04                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR05                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR06                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR07                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DTSR08                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE01                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE02                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE03                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE04                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE05                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE06                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE07                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE08                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE09                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE10                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE11                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE12                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE13                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE14                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE15                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE16                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE17                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE18                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE19                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE20                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE21                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE22                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE23                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE24                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE25                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE26                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        DSSE27                         Init DS/*DTA flds
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *BLANKS       APPSET           10
     C                   MOVE      'D'           APPTYP            1
     C                   MOVE      *BLANKS       APPSCR           10
     C                   MOVE      *ZEROS        APPROW            3 0
     C                   MOVE      *ZEROS        APPCOL            3 0
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   MOVEL     'KDPUTIL'     APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   Z-ADD     *ZEROS        SP                3 0          Stk ptr
     C                   Z-ADD     *ZEROS        CT                3 0          Counter
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        DAS001            5 0
     C                   Z-ADD     *ZEROS        DAS002            5 0
     C                   Z-ADD     *ZEROS        DAS003            5 0
     C                   Z-ADD     *ZEROS        DAS004            5 0
     C                   Z-ADD     *ZEROS        DAS005            5 0
     C                   Z-ADD     *ZEROS        DAS006            5 0
     C                   Z-ADD     *ZEROS        DAS007            5 0
     C                   Z-ADD     *ZEROS        DAS009            5 0
     C                   Z-ADD     1             CALLST            1 0          CALL STS pressed fla
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C                   MOVE      '0'           *IN60
     C*
     C     *DTAARA       DEFINE    KDPKEY1       @DS002
     C     *DTAARA       DEFINE    KDPKEY2       @DS003
     C     *DTAARA       DEFINE    KDPKEY3       @DS004
     C     *DTAARA       DEFINE    KDPKEY4       @DS005
     C     *DTAARA       DEFINE    KDPKEY5       @DS006
     C     *DTAARA       DEFINE    KDPKEY6       @DS007
     C     *DTAARA       DEFINE    KDPKEY7       @DS008
     C     *DTAARA       DEFINE    KDPKEY8       @DS009
     C     *DTAARA       DEFINE    KDPKEY9       @DS010
     C/EJECT
     C*****************************************************************
     C*        M a i n l i n e      R o u t i n e
     C*****************************************************************
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
     C                   MOVEL     'SC0002'      SCRNID
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SC0002'      S001
     C     SCRNID        CASEQ     'SCVALD2'     S002
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
     C* S001 - System Security Program
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '1'           *IN(80)
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
     C                   EXFMT     SCR001
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Return
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C* DSSECR = secnum
     C                   MOVE      SECNUM        DSSECR
     C* DTSR05 = dsse04
     C                   Z-ADD     DSSE04        DTSR05
     C* DTSR03 = dsse06
     C                   Z-ADD     DSSE06        DTSR03
     C* DTSR06 = dsse08
     C                   Z-ADD     DSSE08        DTSR06
     C* DTSR07 = dsse10
     C                   Z-ADD     DSSE10        DTSR07
     C* WK0101 = dsse11
     C                   Z-ADD     DSSE11        WK0101
     C* WK0102 = dsse12
     C                   Z-ADD     DSSE12        WK0102
     C* DTSR04 = dsse13
     C                   Z-ADD     DSSE13        DTSR04
     C* WK0104 = dsse14
     C                   Z-ADD     DSSE14        WK0104
     C* WK0105 = dsse16
     C                   Z-ADD     DSSE16        WK0105
     C* WK0106 = dsse17
     C                   Z-ADD     DSSE17        WK0106
     C* WK0103 = dsse18
     C                   Z-ADD     DSSE18        WK0103
     C* DTSR02 = dsse19
     C                   Z-ADD     DSSE19        DTSR02
     C* WK0107 = dsse20
     C                   Z-ADD     DSSE20        WK0107
     C* WK0108 = dsse21
     C                   Z-ADD     DSSE21        WK0108
     C* WK0109 = dsse23
     C                   Z-ADD     DSSE23        WK0109
     C* DTSR01 = dsse24
     C                   Z-ADD     DSSE24        DTSR01
     C* DTSR08 = dsse25
     C                   Z-ADD     DSSE25        DTSR08
     C* WKTEST = wk0102 + dtsr06
     C     WK0102        ADD       DTSR06        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse01 <> wktest
     C     DSSE01        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0101 + dtsr08
     C     WK0101        ADD       DTSR08        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse02 <> wktest
     C     DSSE02        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0105 + dtsr01
     C     WK0105        ADD       DTSR01        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse03 <> wktest
     C     DSSE03        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0106 + dtsr02
     C     WK0106        ADD       DTSR02        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse05 <> wktest
     C     DSSE05        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0107 + dtsr03
     C     WK0107        ADD       DTSR03        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse07 <> wktest
     C     DSSE07        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0108 + dtsr04
     C     WK0108        ADD       DTSR04        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse09 <> wktest
     C     DSSE09        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0103 + dtsr07
     C     WK0103        ADD       DTSR07        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse15 <> wktest
     C     DSSE15        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0104 + dtsr05
     C     WK0104        ADD       DTSR05        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse22 <> wktest
     C     DSSE22        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* WKTEST = wk0109 + dsse26
     C     WK0109        ADD       DSSE26        NRSLT0
     C                   Z-ADD     NRSLT0        WKTEST
     C* IF dsse27 <> wktest
     C     DSSE27        IFNE      WKTEST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* Check serial number
     C* SERIAL = ' '
     C                   MOVEL     *BLANKS       SERIAL
     C* CALL 'KDPKYR',serial
     C                   Z-ADD     1             CALLST
     C                   CALL      'KDPKYR'      P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* SERNUM = %ctn(serial)
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        SERNUM
     C                   MOVE      SERIAL        SERNUM
     C* ***
     C* *** MAKE SURE SERIAL NO IS POSITIVE
     C* ***
     C* IF SERNUM < *ZEROS
     C     SERNUM        IFLT      *ZEROS
     C* SERNUM = SERNUM * 1-
     C     SERNUM        MULT      -1            NRSLT0
     C                   Z-ADD     NRSLT0        SERNUM
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF sernum <> dtsrnl
     C     SERNUM        IFNE      DTSRNL
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C*                                                               *
     C* WK0601 = wk0901 - sernum
     C     WK0901        SUB       SERNUM        NRSLT0
     C                   Z-ADD     NRSLT0        WK0601
     C*                                                               *
     C* WK0602 = *YMD
     C                   Z-ADD     XYMD          WK0602
     C* WK0202 = %LJF(WK0602)
     C*  Left Justify field into result field
     C                   MOVEL     WK0602        WK0202
     C* IF WK0202 > 80
     C     WK0202        IFGT      80
     C* WK0802 = 19000000 + WK0602
     C     19000000      ADD       WK0602        NRSLT0
     C                   Z-ADD     NRSLT0        WK0802
     C* ELSE                                                          *
     C                   ELSE
     C* WK0802 = 20000000 + WK0602
     C     20000000      ADD       WK0602        NRSLT0
     C                   Z-ADD     NRSLT0        WK0802
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF wk0601 = 999999
     C     WK0601        IFEQ      999999
     C* WK0801 = 20991231
     C                   Z-ADD     20991231      WK0801
     C* ELSE                                                          *
     C                   ELSE
     C* WK0201 = %LJF(WK0601)
     C*  Left Justify field into result field
     C                   MOVEL     WK0601        WK0201
     C* IF WK0201 > 80
     C     WK0201        IFGT      80
     C* WK0801 = 19000000 + WK0601
     C     19000000      ADD       WK0601        NRSLT0
     C                   Z-ADD     NRSLT0        WK0801
     C* ELSE                                                          *
     C                   ELSE
     C* WK0801 = 20000000 + WK0601
     C     20000000      ADD       WK0601        NRSLT0
     C                   Z-ADD     NRSLT0        WK0801
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF wk0801 < wk0802
     C     WK0801        IFLT      WK0802
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* no error update
     C* IF error = 'N'
     C     ERROR         IFEQ      'N'
     C* IF wk0601 = 999999
     C     WK0601        IFEQ      999999
     C* WSDATE2 = 31122099
     C                   Z-ADD     31122099      RN0001
     C* ELSE                                                          *
     C                   ELSE
     C* WSDATE2 = %dmc(wk0801)
     C*  Day Month Cenyr
     C                   Z-ADD     WK0801        NARG1
     C                   MOVE      'CMD'         DATFMT
     C                   EXSR      SDMC
     C                   Z-ADD     NRSLT         NRSLT0
     C                   Z-ADD     NRSLT0        RN0001
     C* END                                                           *
     C                   END
     C* ***                                                           *
     C* *** output valid screen
     C* ***                                                           *
     C* EXSCR scvald2
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
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
     C* ***                                                           *
     C* *** update the relevant data area
     C* ***                                                           *
     C* IF dsse26 = 1
     C     DSSE26        IFEQ      1
     C* GETDTAA kdpkey1,*LOCK
     C     *LOCK         IN        @DS002                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
     C                   END
     C* DAONE = secnum
     C                   MOVE      SECNUM        DAONE
     C* UPDDTAA kdpkey1
     C                   OUT       @DS002                               93
     C* END                                                           *
     C                   END
     C* IF dsse26 = 2
     C     DSSE26        IFEQ      2
     C* GETDTAA kdpkey2,*LOCK
     C     *LOCK         IN        @DS003                               93
     C                   Z-ADD     0             DAS002
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS002
     C                   END
     C* DATWO = secnum
     C                   MOVE      SECNUM        DATWO
     C* UPDDTAA kdpkey2
     C                   OUT       @DS003                               93
     C* END                                                           *
     C                   END
     C* IF dsse26 = 3
     C     DSSE26        IFEQ      3
     C* GETDTAA kdpkey3,*LOCK
     C     *LOCK         IN        @DS004                               93
     C                   Z-ADD     0             DAS003
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS003
     C                   END
     C* DATHRE = secnum
     C                   MOVE      SECNUM        DATHRE
     C* UPDDTAA kdpkey3
     C                   OUT       @DS004                               93
     C* END                                                           *
     C                   END
     C* IF dsse26 = 4
     C     DSSE26        IFEQ      4
     C* GETDTAA kdpkey4,*LOCK
     C     *LOCK         IN        @DS005                               93
     C                   Z-ADD     0             DAS004
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS004
     C                   END
     C* DAFOUR = secnum
     C                   MOVE      SECNUM        DAFOUR
     C* UPDDTAA kdpkey4
     C                   OUT       @DS005                               93
     C* END                                                           *
     C                   END
     C* IF dsse26 = 5
     C     DSSE26        IFEQ      5
     C* GETDTAA kdpkey5,*LOCK
     C     *LOCK         IN        @DS006                               93
     C                   Z-ADD     0             DAS005
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS005
     C                   END
     C* DAFIVE = secnum
     C                   MOVE      SECNUM        DAFIVE
     C* UPDDTAA kdpkey5
     C                   OUT       @DS006                               93
     C* END                                                           *
     C                   END
     C* IF dsse26 = 6
     C     DSSE26        IFEQ      6
     C* GETDTAA kdpkey6,*LOCK
     C     *LOCK         IN        @DS007                               93
     C                   Z-ADD     0             DAS006
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS006
     C                   END
     C* DASIX = secnum
     C                   MOVE      SECNUM        DASIX
     C* UPDDTAA kdpkey6
     C                   OUT       @DS007                               93
     C* END                                                           *
     C                   END
     C* IF dsse26 = 7
     C     DSSE26        IFEQ      7
     C* GETDTAA kdpkey7,*LOCK
     C     *LOCK         IN        @DS008                               93
     C                   Z-ADD     0             DAS007
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS007
     C                   END
     C* DASEVE = secnum
     C                   MOVE      SECNUM        DASEVE
     C* UPDDTAA kdpkey7
     C                   OUT       @DS008                               93
     C* END                                                           *
     C                   END
     C* IF dsse26 = 8
     C     DSSE26        IFEQ      8
     C* GETDTAA kdpkey6,*LOCK
     C     *LOCK         IN        @DS007                               93
     C                   Z-ADD     0             DAS006
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS006
     C                   END
     C* DASIX = secnum
     C                   MOVE      SECNUM        DASIX
     C* UPDDTAA kdpkey6
     C                   OUT       @DS007                               93
     C* GETDTAA kdpkey8,*LOCK
     C* DAEIGH secnum
     C* UPDDTAA kdpkey8
     C* END                                                           *
     C                   END
     C* IF dsse26 = 9
     C     DSSE26        IFEQ      9
     C* GETDTAA kdpkey9,*LOCK
     C     *LOCK         IN        @DS010                               93
     C                   Z-ADD     0             DAS009
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS009
     C                   END
     C* DANINE = secnum
     C                   MOVE      SECNUM        DANINE
     C* UPDDTAA kdpkey9
     C                   OUT       @DS010                               93
     C* END                                                           *
     C                   END
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C* ELSE                                                          *
     C                   ELSE
     C* DSPERR *none,'Security key is invalid'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C     $00199        ENDSR
     C/EJECT
     C*****************************************************************
     C* S002 - Key is valid
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '1'           *IN(80)
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
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   END
     C     $00299        ENDSR
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
     C     SID(CT)       IFEQ      'SC0002'
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR001
     C                   ELSE
     C     SID(CT)       IFEQ      'SCVALD2'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
     C                   END
     C                   END
     C*
     C                   ADD       1             CT
     C                   END
     C*
     C                   ENDSR
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
     C                   Z-ADD     19            SVCC
     C                   MOVEL     19            SVCY
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
     C                   Z-ADD     19            SVCC
     C                   MOVEL     19            SVCY
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
