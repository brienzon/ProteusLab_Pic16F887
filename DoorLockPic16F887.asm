
_code_enter:

;DoorLockPic16F887.c,28 :: 		void code_enter(){
;DoorLockPic16F887.c,29 :: 		kp = 0;       //Reset key code variable
	CLRF       _kp+0
;DoorLockPic16F887.c,31 :: 		do
L_code_enter0:
;DoorLockPic16F887.c,33 :: 		kp = Keypad_Key_Click();       // store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;DoorLockPic16F887.c,34 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter0
;DoorLockPic16F887.c,36 :: 		switch (kp){
	GOTO       L_code_enter3
;DoorLockPic16F887.c,37 :: 		case  1: kp = 49; break; // 1
L_code_enter5:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,38 :: 		case  2: kp = 50; break; // 2
L_code_enter6:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,39 :: 		case  3: kp = 51; break; // 3
L_code_enter7:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,41 :: 		case  5: kp = 52; break; // 4
L_code_enter8:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,42 :: 		case  6: kp = 53; break; // 5
L_code_enter9:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,43 :: 		case  7: kp = 54; break; // 6
L_code_enter10:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,45 :: 		case  9: kp = 55; break; // 7
L_code_enter11:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,46 :: 		case 10: kp = 56; break; // 8
L_code_enter12:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,47 :: 		case 11: kp = 57; break; // 9
L_code_enter13:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,49 :: 		case 13: kp = 42; break; // *
L_code_enter14:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,50 :: 		case 14: kp = 48; break; // 0
L_code_enter15:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,51 :: 		case 15: kp = 35; break; // #
L_code_enter16:
	MOVLW      35
	MOVWF      _kp+0
	GOTO       L_code_enter4
;DoorLockPic16F887.c,53 :: 		}
L_code_enter3:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter5
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter6
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter7
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter8
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter9
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter10
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter11
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter12
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter13
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter14
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter15
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter16
L_code_enter4:
;DoorLockPic16F887.c,55 :: 		code1[i] = kp;
	MOVF       _i+0, 0
	ADDLW      _code1+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
;DoorLockPic16F887.c,56 :: 		Lcd_Chr(2, i+1, code1[i]);        //Print key ASCII value on Lcd
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _i+0, 0
	ADDLW      _code1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;DoorLockPic16F887.c,57 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;DoorLockPic16F887.c,58 :: 		}
L_end_code_enter:
	RETURN
; end of _code_enter

_code_read:

;DoorLockPic16F887.c,62 :: 		void code_read(){      //read data from eeprom
;DoorLockPic16F887.c,63 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_read17:
	DECFSZ     R13+0, 1
	GOTO       L_code_read17
	DECFSZ     R12+0, 1
	GOTO       L_code_read17
	NOP
	NOP
;DoorLockPic16F887.c,64 :: 		user1[0] = EEPROM_Read(0x00);            // Read data from address 0
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _user1+0
;DoorLockPic16F887.c,65 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_read18:
	DECFSZ     R13+0, 1
	GOTO       L_code_read18
	DECFSZ     R12+0, 1
	GOTO       L_code_read18
	NOP
	NOP
;DoorLockPic16F887.c,66 :: 		user1[1] = EEPROM_Read(0x01);            // Read data from address 1
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _user1+1
;DoorLockPic16F887.c,67 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_read19:
	DECFSZ     R13+0, 1
	GOTO       L_code_read19
	DECFSZ     R12+0, 1
	GOTO       L_code_read19
	NOP
	NOP
;DoorLockPic16F887.c,68 :: 		user1[2] = EEPROM_Read(0x02);            // Read data from address 2
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _user1+2
;DoorLockPic16F887.c,69 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_read20:
	DECFSZ     R13+0, 1
	GOTO       L_code_read20
	DECFSZ     R12+0, 1
	GOTO       L_code_read20
	NOP
	NOP
;DoorLockPic16F887.c,70 :: 		user1[3] = EEPROM_Read(0x03);            // Read data from address 3
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _user1+3
;DoorLockPic16F887.c,71 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_read21:
	DECFSZ     R13+0, 1
	GOTO       L_code_read21
	DECFSZ     R12+0, 1
	GOTO       L_code_read21
	NOP
	NOP
;DoorLockPic16F887.c,72 :: 		}
L_end_code_read:
	RETURN
; end of _code_read

_code_write:

;DoorLockPic16F887.c,74 :: 		void code_write(){       //write data to eeprom
;DoorLockPic16F887.c,75 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_write22:
	DECFSZ     R13+0, 1
	GOTO       L_code_write22
	DECFSZ     R12+0, 1
	GOTO       L_code_write22
	NOP
	NOP
;DoorLockPic16F887.c,76 :: 		EEPROM_Write(0x00,code1[0]);           // Write data to address 0
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _code1+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;DoorLockPic16F887.c,77 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_write23:
	DECFSZ     R13+0, 1
	GOTO       L_code_write23
	DECFSZ     R12+0, 1
	GOTO       L_code_write23
	NOP
	NOP
;DoorLockPic16F887.c,78 :: 		EEPROM_Write(0x01,code1[1]);           // Write data to address 1
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _code1+1, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;DoorLockPic16F887.c,79 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_write24:
	DECFSZ     R13+0, 1
	GOTO       L_code_write24
	DECFSZ     R12+0, 1
	GOTO       L_code_write24
	NOP
	NOP
;DoorLockPic16F887.c,80 :: 		EEPROM_Write(0x02,code1[2]);           // Write data to address 2
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _code1+2, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;DoorLockPic16F887.c,81 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_write25:
	DECFSZ     R13+0, 1
	GOTO       L_code_write25
	DECFSZ     R12+0, 1
	GOTO       L_code_write25
	NOP
	NOP
;DoorLockPic16F887.c,82 :: 		EEPROM_Write(0x03,code1[3]);           // Write data to address 3
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _code1+3, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;DoorLockPic16F887.c,83 :: 		}
L_end_code_write:
	RETURN
; end of _code_write

_change_code:

;DoorLockPic16F887.c,85 :: 		void change_code(){
;DoorLockPic16F887.c,86 :: 		Lcd_Cmd(_LCD_CLEAR);           // clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,87 :: 		Lcd_Out(1,1, "Enter New Code:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_DoorLockPic16F887+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DoorLockPic16F887.c,89 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;DoorLockPic16F887.c,91 :: 		code_enter();
	CALL       _code_enter+0
;DoorLockPic16F887.c,92 :: 		code_enter();
	CALL       _code_enter+0
;DoorLockPic16F887.c,93 :: 		code_enter();
	CALL       _code_enter+0
;DoorLockPic16F887.c,94 :: 		code_enter();
	CALL       _code_enter+0
;DoorLockPic16F887.c,97 :: 		code_write();
	CALL       _code_write+0
;DoorLockPic16F887.c,98 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_change_code26:
	DECFSZ     R13+0, 1
	GOTO       L_change_code26
	DECFSZ     R12+0, 1
	GOTO       L_change_code26
	NOP
	NOP
;DoorLockPic16F887.c,99 :: 		code_read();
	CALL       _code_read+0
;DoorLockPic16F887.c,100 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_change_code27:
	DECFSZ     R13+0, 1
	GOTO       L_change_code27
	DECFSZ     R12+0, 1
	GOTO       L_change_code27
	NOP
	NOP
;DoorLockPic16F887.c,102 :: 		Lcd_Cmd(_LCD_CLEAR);           // clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,103 :: 		Lcd_Out(1,1, "New Code Set");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_DoorLockPic16F887+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DoorLockPic16F887.c,104 :: 		Delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_change_code28:
	DECFSZ     R13+0, 1
	GOTO       L_change_code28
	DECFSZ     R12+0, 1
	GOTO       L_change_code28
	DECFSZ     R11+0, 1
	GOTO       L_change_code28
	NOP
	NOP
;DoorLockPic16F887.c,105 :: 		}
L_end_change_code:
	RETURN
; end of _change_code

_main:

;DoorLockPic16F887.c,107 :: 		void main(){
;DoorLockPic16F887.c,109 :: 		Keypad_Init();          // Initialize Keypad
	CALL       _Keypad_Init+0
;DoorLockPic16F887.c,110 :: 		ANSEL  = 0;             // Configure AN pins as digital I/O
	CLRF       ANSEL+0
;DoorLockPic16F887.c,111 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;DoorLockPic16F887.c,113 :: 		c1on_bit=0;            // disable comparator
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;DoorLockPic16F887.c,114 :: 		c2on_bit=0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;DoorLockPic16F887.c,116 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;DoorLockPic16F887.c,117 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;DoorLockPic16F887.c,119 :: 		Lcd_Init();  		           // Initialize LCD
	CALL       _Lcd_Init+0
;DoorLockPic16F887.c,120 :: 		Lcd_Cmd(_LCD_CLEAR);          // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,121 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);    // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,123 :: 		code_read();
	CALL       _code_read+0
;DoorLockPic16F887.c,125 :: 		Lcd_Cmd(_LCD_CLEAR);        //clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,126 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);     // cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,131 :: 		Lcd_Cmd(_LCD_CLEAR);            // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,132 :: 		Lcd_Out(1, 5, "Access Pin");          // Write message text on LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_DoorLockPic16F887+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DoorLockPic16F887.c,133 :: 		Lcd_Out(2, 4, "Security");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_DoorLockPic16F887+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DoorLockPic16F887.c,134 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
;DoorLockPic16F887.c,137 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,138 :: 		Lcd_Out(1, 1,  "DigitalLock By:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_DoorLockPic16F887+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DoorLockPic16F887.c,139 :: 		Lcd_Out(2, 1,  "FrederickBianzon");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_DoorLockPic16F887+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DoorLockPic16F887.c,140 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	DECFSZ     R11+0, 1
	GOTO       L_main30
	NOP
;DoorLockPic16F887.c,142 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;DoorLockPic16F887.c,145 :: 		L1:do{
___main_L1:
L_main31:
;DoorLockPic16F887.c,146 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,147 :: 		Lcd_Out(2, 3, "Press *");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_DoorLockPic16F887+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DoorLockPic16F887.c,148 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;DoorLockPic16F887.c,149 :: 		code_enter();
	CALL       _code_enter+0
;DoorLockPic16F887.c,150 :: 		if(code1[0] == 42){      // *
	MOVF       _code1+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_main34
;DoorLockPic16F887.c,151 :: 		Lcd_Cmd(_LCD_CLEAR);       // clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,152 :: 		Lcd_Out(1, 1, "Enter Code");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_DoorLockPic16F887+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DoorLockPic16F887.c,154 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;DoorLockPic16F887.c,155 :: 		code_enter();
	CALL       _code_enter+0
;DoorLockPic16F887.c,156 :: 		code_enter();
	CALL       _code_enter+0
;DoorLockPic16F887.c,157 :: 		code_enter();
	CALL       _code_enter+0
;DoorLockPic16F887.c,158 :: 		code_enter();
	CALL       _code_enter+0
;DoorLockPic16F887.c,159 :: 		code_enter();
	CALL       _code_enter+0
;DoorLockPic16F887.c,160 :: 		if(code1[0] == '1' && code1[1] == '2'  && code1[2] == '3' && code1[3] == '4' && code1[4] == '5' ){      // master code
	MOVF       _code1+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main37
	MOVF       _code1+1, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main37
	MOVF       _code1+2, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_main37
	MOVF       _code1+3, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L_main37
	MOVF       _code1+4, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L_main37
L__main61:
;DoorLockPic16F887.c,161 :: 		code_enter();
	CALL       _code_enter+0
;DoorLockPic16F887.c,162 :: 		if(code1[5] == 35){      // #
	MOVF       _code1+5, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_main38
;DoorLockPic16F887.c,163 :: 		change_code();
	CALL       _change_code+0
;DoorLockPic16F887.c,165 :: 		}
L_main38:
;DoorLockPic16F887.c,166 :: 		}
	GOTO       L_main39
L_main37:
;DoorLockPic16F887.c,167 :: 		else if(cnt<3 && code1[0] == user1[0] && code1[1] == user1[1] && code1[2] == user1[2] && code1[3] == user1[3] && code1[4] == 35){     // save password verification
	MOVLW      128
	XORWF      _cnt+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVLW      3
	SUBWF      _cnt+0, 0
L__main67:
	BTFSC      STATUS+0, 0
	GOTO       L_main42
	MOVF       _code1+0, 0
	XORWF      _user1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main42
	MOVF       _code1+1, 0
	XORWF      _user1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main42
	MOVF       _code1+2, 0
	XORWF      _user1+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main42
	MOVF       _code1+3, 0
	XORWF      _user1+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main42
	MOVF       _code1+4, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_main42
L__main60:
;DoorLockPic16F887.c,169 :: 		Lcd_Cmd(_LCD_CLEAR);       //Lcd clear
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,170 :: 		Lcd_out(1,4,"Door Open");  //Door Open
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_DoorLockPic16F887+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DoorLockPic16F887.c,173 :: 		EEPROM_Read(0x21);
	MOVLW      33
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;DoorLockPic16F887.c,174 :: 		w1 = 1;
	MOVLW      1
	MOVWF      _w1+0
	MOVLW      0
	MOVWF      _w1+1
;DoorLockPic16F887.c,175 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main43:
	DECFSZ     R13+0, 1
	GOTO       L_main43
	DECFSZ     R12+0, 1
	GOTO       L_main43
	NOP
	NOP
;DoorLockPic16F887.c,176 :: 		EEPROM_Write(0X21, w1);
	MOVLW      33
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _w1+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;DoorLockPic16F887.c,177 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main44:
	DECFSZ     R13+0, 1
	GOTO       L_main44
	DECFSZ     R12+0, 1
	GOTO       L_main44
	NOP
	NOP
;DoorLockPic16F887.c,178 :: 		EEPROM_Read(0x21);
	MOVLW      33
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;DoorLockPic16F887.c,181 :: 		PORTC=0x03;
	MOVLW      3
	MOVWF      PORTC+0
;DoorLockPic16F887.c,182 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main45:
	DECFSZ     R13+0, 1
	GOTO       L_main45
	DECFSZ     R12+0, 1
	GOTO       L_main45
	DECFSZ     R11+0, 1
	GOTO       L_main45
	NOP
	NOP
;DoorLockPic16F887.c,183 :: 		PORTC=0x06;
	MOVLW      6
	MOVWF      PORTC+0
;DoorLockPic16F887.c,184 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main46:
	DECFSZ     R13+0, 1
	GOTO       L_main46
	DECFSZ     R12+0, 1
	GOTO       L_main46
	DECFSZ     R11+0, 1
	GOTO       L_main46
	NOP
	NOP
;DoorLockPic16F887.c,185 :: 		PORTC=0x0C;
	MOVLW      12
	MOVWF      PORTC+0
;DoorLockPic16F887.c,186 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	DECFSZ     R11+0, 1
	GOTO       L_main47
	NOP
	NOP
;DoorLockPic16F887.c,187 :: 		PORTC=0x09;
	MOVLW      9
	MOVWF      PORTC+0
;DoorLockPic16F887.c,188 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main48:
	DECFSZ     R13+0, 1
	GOTO       L_main48
	DECFSZ     R12+0, 1
	GOTO       L_main48
	DECFSZ     R11+0, 1
	GOTO       L_main48
	NOP
	NOP
;DoorLockPic16F887.c,190 :: 		Delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main49:
	DECFSZ     R13+0, 1
	GOTO       L_main49
	DECFSZ     R12+0, 1
	GOTO       L_main49
	DECFSZ     R11+0, 1
	GOTO       L_main49
	NOP
	NOP
;DoorLockPic16F887.c,194 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,195 :: 		Lcd_out(1,4,"Door Close");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_DoorLockPic16F887+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DoorLockPic16F887.c,198 :: 		EEPROM_Read(0x21);
	MOVLW      33
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;DoorLockPic16F887.c,199 :: 		w1 = 0;
	CLRF       _w1+0
	CLRF       _w1+1
;DoorLockPic16F887.c,200 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main50:
	DECFSZ     R13+0, 1
	GOTO       L_main50
	DECFSZ     R12+0, 1
	GOTO       L_main50
	NOP
	NOP
;DoorLockPic16F887.c,201 :: 		EEPROM_Write(0x21, w1);
	MOVLW      33
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _w1+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;DoorLockPic16F887.c,202 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main51:
	DECFSZ     R13+0, 1
	GOTO       L_main51
	DECFSZ     R12+0, 1
	GOTO       L_main51
	NOP
	NOP
;DoorLockPic16F887.c,203 :: 		EEPROM_Read(0x21);
	MOVLW      33
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;DoorLockPic16F887.c,207 :: 		PORTC=0x0C;
	MOVLW      12
	MOVWF      PORTC+0
;DoorLockPic16F887.c,208 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main52:
	DECFSZ     R13+0, 1
	GOTO       L_main52
	DECFSZ     R12+0, 1
	GOTO       L_main52
	DECFSZ     R11+0, 1
	GOTO       L_main52
	NOP
	NOP
;DoorLockPic16F887.c,209 :: 		PORTC=0x06;
	MOVLW      6
	MOVWF      PORTC+0
;DoorLockPic16F887.c,210 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main53:
	DECFSZ     R13+0, 1
	GOTO       L_main53
	DECFSZ     R12+0, 1
	GOTO       L_main53
	DECFSZ     R11+0, 1
	GOTO       L_main53
	NOP
	NOP
;DoorLockPic16F887.c,211 :: 		PORTC=0x03;
	MOVLW      3
	MOVWF      PORTC+0
;DoorLockPic16F887.c,212 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main54:
	DECFSZ     R13+0, 1
	GOTO       L_main54
	DECFSZ     R12+0, 1
	GOTO       L_main54
	DECFSZ     R11+0, 1
	GOTO       L_main54
	NOP
	NOP
;DoorLockPic16F887.c,213 :: 		PORTC=0x09;
	MOVLW      9
	MOVWF      PORTC+0
;DoorLockPic16F887.c,214 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main55:
	DECFSZ     R13+0, 1
	GOTO       L_main55
	DECFSZ     R12+0, 1
	GOTO       L_main55
	DECFSZ     R11+0, 1
	GOTO       L_main55
	NOP
	NOP
;DoorLockPic16F887.c,216 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main56:
	DECFSZ     R13+0, 1
	GOTO       L_main56
	DECFSZ     R12+0, 1
	GOTO       L_main56
	DECFSZ     R11+0, 1
	GOTO       L_main56
	NOP
;DoorLockPic16F887.c,218 :: 		}
	GOTO       L_main57
L_main42:
;DoorLockPic16F887.c,221 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;DoorLockPic16F887.c,222 :: 		Lcd_Cmd(_LCD_CLEAR);     //clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DoorLockPic16F887.c,223 :: 		Lcd_Out(1, 1, "Wrong Password");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_DoorLockPic16F887+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DoorLockPic16F887.c,224 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main58:
	DECFSZ     R13+0, 1
	GOTO       L_main58
	DECFSZ     R12+0, 1
	GOTO       L_main58
	DECFSZ     R11+0, 1
	GOTO       L_main58
	NOP
;DoorLockPic16F887.c,226 :: 		}
L_main57:
L_main39:
;DoorLockPic16F887.c,227 :: 		if(cnt>=3)
	MOVLW      128
	XORWF      _cnt+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      3
	SUBWF      _cnt+0, 0
L__main68:
	BTFSS      STATUS+0, 0
	GOTO       L_main59
;DoorLockPic16F887.c,228 :: 		goto L1;
	GOTO       ___main_L1
L_main59:
;DoorLockPic16F887.c,231 :: 		}
L_main34:
;DoorLockPic16F887.c,232 :: 		}while(1);
	GOTO       L_main31
;DoorLockPic16F887.c,236 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
