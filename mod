partial alphanumeric_keys
xkb_symbols "dvp" {
    include "us(dvorak)"

    key.type[Group1] = "EIGHT_LEVEL";

    //             Unmodified       Shift           AltGr            Shift+AltGr
    // symbols row, left side
    key <TLDE> { [ dollar,          asciitilde,     dead_tilde,NoSymbol,dead_tilde                  ] };
    key <AE01> { [ 9,       percent                                     ] };
    key <AE02> { [ 5,       percent                                     ] };
    key <AE03> { [ 0,       percent                                     ] };
    key <AE04> { [ 3,       percent                                     ] };
	key <AE05> { [ 7													] };
    key <AE06> { [ 6,           9,              sterling                ] };

    key.type[Group1] = "EIGHT_LEVEL_ALPHABETIC";
    // symbols row, right side
    key <AE07> { [ 2,        0                                           ] };
    key <AE08> { [ 1,        0                                           ] };
    key <AE09> { [ 4,        0                                           ] };
	key <AE10> { [ 8,    6                                           ] };
    key <AE11> { [ exclam,          8,              exclamdown,      U2E18      ] };
    key <AE12> { [ numbersign,      grave,          dead_grave                  ] };
    key <BKSP> { [ BackSpace,       BackSpace                                   ] }; 

    // upper row, left side
    key <AD01> { [ period,NoSymbol, NoSymbol, NoSymbol, dollar,NoSymbol,9] };
    key <AD02> { [ comma, period, period,comma,question,NoSymbol,5] };
	key <AD03> { 	
		symbols[Group1]=[VoidSymbol,NoSymbol,exclamdown,NoSymbol,parenleft],
		actions[Group1]=[SetMods(modifiers=Alt), NoAction(), NoAction(), NoAction(), NoAction()]
	};  

    key <AD04> {[ p, P, asciitilde, NoSymbol, parenright, section, P]};
	key <AD05> {[ y, Y,	NoSymbol, NoSymbol, backslash, NoSymbol, Y]};

    // upper row, right side
	
	key <AD06> { [ f, F, asciicircum, asterisk, asciicircum, NoSymbol, F]};
    key <AD07> { [ g, G, dead_acute, 7, slash, NoSymbol, G]};
    key <AD08> { [ c, C, less, 8,minus,C, C]};
    key <AD09> { [ r,               R,              greater, 9,plus,NoSymbol,R   ] };
    key <AD10> { [ l,               L,              Delete, plus,plus,NoSymbol,L ] };
    key <AD11> { [ dead_acute,      question,       questiondown,    U203D      ] };
    key <AD12> { [ at,              asciicircum,    dead_circumflex, dead_caron] };

    // home row, left side
    key <AC01> { [ a,               A,              percent, NoSymbol, slash,NoSymbol, A    ] };
    key <AC02> { [ o,               O,              ampersand,Ooblique,Tab,NoSymbol, O   ] };
    key <AC03> { [ e,               E,              exclam,Eacute, BackSpace,BackSpace,E         ] };
    key <AC04> { [ u,               U,              question,Uacute,Escape,NoSymbol,U  ] };  
    key <AC05> { [ i,				I,				NoSymbol,NoSymbol,bar,NoSymbol,I]	};

    // home row, right side
    key <AC06> { [ d,               D,              quoteleft, period,at,6,D] };
    key <AC07> { [ h,               H,              Left,4,underscore,NoSymbol,H                 ] };
    key <AC08> { [ t,               T,              Up,5,equal,NoSymbol,T     ] }; 
    key <AC09> { [ n,               N,              Down, 6, semicolon, Ntilde, N     ] };
    key <AC10> { [ s,               S,              Right, 0,asterisk,NoSymbol,S      ] };
    key <BKSL> { [ backslash,       bar                                         ] };
	

    // lower row, left side
    key <AB01> { [ apostrophe,      dead_acute,       dead_acute, NoSymbol,quotedbl   ] };
    key <AB02> { [ q, Q,NoSymbol,NoSymbol, NoSymbol, NoSymbol, Q]	};
	key <AB03> { [ j, J,bracketleft,NoSymbol,bracketleft,NoSymbol,J]};
	key <AB04> { [ k, K,bracketright,NoSymbol,bracketright,NoSymbol,K]};
	key <AB05> { [ x, X, NoSymbol, NoSymbol, X, NoSymbol,X ]};

	//lower row, right side	
	key <AB06> { [ b,B, semicolon, NoSymbol, NoSymbol,NoSymbol, B]};
	key <AB07> { [ m,M, colon, 1,Home,NoSymbol, M]};
	key <AB08> { [ w,W, braceleft,NoSymbol,numbersign, NoSymbol, W]};
	key <AB09> { [ v,V, braceright,NoSymbol, question, NoSymbol, V]};
	key <AB10> { [ z,Z, NoSymbol, minus, End, NoSymbol, Z]};
	  key <SPCE> {
		symbols[Group1]=[space,space,omacron,NoSymbol,Return]
	  }; 

	  
	  key <RALT> {
	    type[Group1]="ONE_LEVEL",
	    symbols[Group1] = [ ISO_Level5_Shift ]
	  };
	  
	  key <LALT> {
	    type[Group1]="ONE_LEVEL",
	    symbols[Group1] = [ISO_Level3_Shift]
	  };

	  key <CAPS> {
	    type[Group1]="ONE_LEVEL",
	    symbols[Group1] = [Super_L]
	  };

	  key <LWIN> {
	    type[Group1]="ONE_LEVEL",
	    symbols[Group1] = [voidsymbol],
		actions[Group1] = [SetMods(mods=Control)]
	  };

	//include "level3(modifier_mapping)"
	//include "level5(modifier_mapping)"
};
