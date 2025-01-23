      /free
         // ****************************************************************
         // SATRIB - Display Attribute Handler
         // ****************************************************************
         begsr satrib;

            // FIND TABLE OFFSET BY SCREEN ID AND FIELD NAME AND FIELD INDEX

            x0 = 1;
            i1 = 1;
            i2 = 1;
            x0 = %lookup(#map:da1:x0);
            if x0 > 3;
               dow i1 <= %elem(DA3);
                  da3(i1) = %subst(da2(x0):i2:2);
                  i1 += 1;
                  i2 += 2;
               enddo;

               // ------------------------------------------------------
               // | @DSPERR/VALIDATION FIELD DISPLAY ATTRIBUTES
               // ------------------------------------------------------
               if dsperr <> *blank;
                  if da3(6) <> *blank;
                     x1 = %dec(da3(6):3:0);
                     if dsperr = 'X';
                        *in80 = *off;
                        *in(x1) = *on;
                        else;
                        *in(x1) = *off;
                     endif;
                  endif;

                  if da3(2) <> *blank;
                     x1 = %dec(da3(2):3:0);
                     if dsperr = 'X';
                        *in(x1) = *on;
                        else;
                        *in(x1) = *off;
                     endif;
                  endif;

                  if da3(3) <> *blank  and
                     da3(16) = ' Y';
                     x1 = %dec(da3(3):3:0);
                     if dsperr = 'X';
                        *in(x1) = *off;
                        else;
                        *in(x1) = *on;
                     endif;
                  endif;
                  else;

                  // ------------------------------------------------------
                  // | *DS - RESET FIELD DISPLAY ATTRIBUTES
                  // ------------------------------------------------------
                  if #ds <> *blank;
                     for x0 = 1 to 15;
                        if da3(x0) <> *blank;
                           if x0 = 3  and
                              da3(16) = ' Y';
                              else;
                              x1 = %dec(da3(x0):3:0);
                              *in(x1) = *off;
                           endif;
                        endif;
                     endfor;
                     // ------------------------------------------------------
                     // | *DS - TURN ON ORIGINAL COLOR ATTRIBUTES
                     // |       IF THERE IS NO COLOR SPECIFIED
                     // ------------------------------------------------------
                     if da3(17) <> *blank  and
                        #gn = *blank  and
                        #rd = *blank  and
                        #wt = *blank  and
                        #pk = *blank  and
                        #tq = *blank  and
                        #yw = *blank  and
                        #bu = *blank;
                        x1 = %dec(da3(17):3:0);
                        *in(x1) = *on;
                     endif;
                  endif;

                  // ------------------------------------------------------
                  // | LOOP TO TURN ON/OFF ATTRIBUTE INDICATORS
                  // ------------------------------------------------------
                  for x0 = 1 to 15;
                     if da3(x0) <> *blank;
                        x1 = %dec(da3(x0):3:0);
                        // ------------------------------------------------------
                        // | TURN ON ATTRIBUTE INDICATORS
                        // ------------------------------------------------------
                        if da6(x0) <> *blank;
                           *in(x1) = *on;
                           else;
                           // ------------------------------------------------------
                           // | FOR COLOR ATTRIBUTE, RESET OTHER COLOR THAT ARE
                           // | NOT SPECIFIED.
                           // ------------------------------------------------------
                           if x0 >= 9  and
                              x0 <= 15;
                              if #gn <> *blank  or
                                 #rd <> *blank  or
                                 #wt <> *blank  or
                                 #pk <> *blank  or
                                 #tq <> *blank  or
                                 #yw <> *blank  or
                                 #bu <> *blank;
                                 *in(x1) = *off;
                              endif;
                           endif;
                        endif;
                     endif;
                  endfor;
               endif;
            endif;

            #atrib = *blanks;
         endsr;
      /end-free
