unsigned short kp;
char code1[15] ,user1[4];


int i = 0, j, cnt;

int w1;

//keypad module connections
char keypadPort at PORTD;
//end keypad module connections

//lcd module connections
	sbit LCD_RS at RB4_bit;
	sbit LCD_EN at RB5_bit;
	sbit LCD_D4 at RB0_bit;
	sbit LCD_D5 at RB1_bit;
	sbit LCD_D6 at RB2_bit;
	sbit LCD_D7 at RB3_bit;
	sbit LCD_RS_Direction at TRISB4_bit;
	sbit LCD_EN_Direction at TRISB5_bit;
	sbit LCD_D4_Direction at TRISB0_bit;
	sbit LCD_D5_Direction at TRISB1_bit;
	sbit LCD_D6_Direction at TRISB2_bit;
	sbit LCD_D7_Direction at TRISB3_bit;
//

void code_enter(){
	kp = 0;       //Reset key code variable
	//wait for key to be pressed and released
	do
     //kp = Keypad_Key_Press();     // store key code in kp variable
     kp = Keypad_Key_Click();       // store key code in kp variable
     while (!kp);
     //prepare value for output, transform key to it's ASCII value
     switch (kp){
                case  1: kp = 49; break; // 1
                case  2: kp = 50; break; // 2
                case  3: kp = 51; break; // 3
                //case  4: kp = 65; break; // A for 4x4 pad
                case  5: kp = 52; break; // 4
                case  6: kp = 53; break; // 5
                case  7: kp = 54; break; // 6
                //case  8: kp = 66; break; // B for 4x4 pad
                case  9: kp = 55; break; // 7
                case 10: kp = 56; break; // 8
                case 11: kp = 57; break; // 9
                //case 12: kp = 67; break; // C for 4x4 pad
                case 13: kp = 42; break; // *
                case 14: kp = 48; break; // 0
                case 15: kp = 35; break; // #
                //case 16: kp = 67; break; // D for 4x4 pad
                }

     code1[i] = kp;
     Lcd_Chr(2, i+1, code1[i]);        //Print key ASCII value on Lcd
     i++;
     }

//20ms delay function no need of it

void code_read(){      //read data from eeprom
     Delay_ms(20);
     user1[0] = EEPROM_Read(0x00);            // Read data from address 0
     Delay_ms(20);
     user1[1] = EEPROM_Read(0x01);            // Read data from address 1
     Delay_ms(20);
     user1[2] = EEPROM_Read(0x02);            // Read data from address 2
     Delay_ms(20);
     user1[3] = EEPROM_Read(0x03);            // Read data from address 3
     Delay_ms(20);
     }

void code_write(){       //write data to eeprom
     Delay_ms(20);
     EEPROM_Write(0x00,code1[0]);           // Write data to address 0
     Delay_ms(20);
     EEPROM_Write(0x01,code1[1]);           // Write data to address 1
     Delay_ms(20);
     EEPROM_Write(0x02,code1[2]);           // Write data to address 2
     Delay_ms(20);
     EEPROM_Write(0x03,code1[3]);           // Write data to address 3
     }

void change_code(){
     Lcd_Cmd(_LCD_CLEAR);           // clear display
     Lcd_Out(1,1, "Enter New Code:");

     i = 0;

     code_enter();
     code_enter();
     code_enter();
     code_enter();


     code_write();
     delay_ms(20);
     code_read();
     delay_ms(20);

     Lcd_Cmd(_LCD_CLEAR);           // clear display
     Lcd_Out(1,1, "New Code Set");
     Delay_ms(5000);
     }

void main(){
     ADCON1 != 0x07;
     Keypad_Init();          // Initialize Keypad
     ANSEL  = 0;             // Configure AN pins as digital I/O
     ANSELH = 0;

     c1on_bit=0;            // disable comparator
     c2on_bit=0;

     TRISC = 0x00;
     PORTC = 0x00;

     Lcd_Init();  		           // Initialize LCD
     Lcd_Cmd(_LCD_CLEAR);          // Clear display
     Lcd_Cmd(_LCD_CURSOR_OFF);    // Cursor off

     code_read();

     Lcd_Cmd(_LCD_CLEAR);        //clear display
     Lcd_Cmd(_LCD_CURSOR_OFF);     // cursor off
     //Lcd_Out(1, 1, msg1);
     //Delay_ms(500);


     Lcd_Cmd(_LCD_CLEAR);            // Clear display
     Lcd_Out(1, 5, "Access Pin");          // Write message text on LCD
     Lcd_Out(2, 4, "Security");
     delay_ms(2000);


     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Out(1, 1,  "DigitalLock By:");
     Lcd_Out(2, 1,  "FrederickBianzon");
     delay_ms(2000);

     cnt = 0;


	L1:do{
        Lcd_Cmd(_LCD_CLEAR);
        Lcd_Out(2, 3, "Press *");
        i = 0;
        code_enter();
        if(code1[0] == 42){      // *
                    Lcd_Cmd(_LCD_CLEAR);       // clear display
                    Lcd_Out(1, 1, "Enter Code");
                    //delay_ms(500);
                    i = 0;
                    code_enter();
                    code_enter();
                    code_enter();
                    code_enter();
                    code_enter();
                    if(code1[0] == '1' && code1[1] == '2'  && code1[2] == '3' && code1[3] == '4' && code1[4] == '5' ){      // master code
                                code_enter();
                                if(code1[5] == 35){      // #
                                            change_code();

                                            }
                                }
                           else if(cnt<3 && code1[0] == user1[0] && code1[1] == user1[1] && code1[2] == user1[2] && code1[3] == user1[3] && code1[4] == 35){     // save password verification

                                                 Lcd_Cmd(_LCD_CLEAR);       //Lcd clear
                                                 Lcd_out(1,4,"Door Open");  //Door Open


                                                 EEPROM_Read(0x21);
                                                 w1 = 1;
                                                 Delay_ms(20);
                                                 EEPROM_Write(0X21, w1);
                                                 Delay_ms(20);
                                                 EEPROM_Read(0x21);

                                                 //move stepper motor to ON position
                                                 PORTC=0x03;
                                                 Delay_ms(500);
                                                 PORTC=0x06;
                                                 Delay_ms(500);
                                                 PORTC=0x0C;
                                                 Delay_ms(500);
                                                 PORTC=0x09;
                                                 Delay_ms(500);

                                                 Delay_ms(5000);
                                                 //goto L1;


                                                 LCD_Cmd(_LCD_CLEAR);
                                                 Lcd_out(1,4,"Door Close");


                                                 EEPROM_Read(0x21);
                                                 w1 = 0;
                                                 Delay_ms(20);
                                                 EEPROM_Write(0x21, w1);
                                                 Delay_ms(20);
                                                 EEPROM_Read(0x21);


                                                 //move stepper motor to OFF position
                                                 PORTC=0x0C;
                                                 Delay_ms(500);
                                                 PORTC=0x06;
                                                 Delay_ms(500);
                                                 PORTC=0x03;
                                                 Delay_ms(500);
                                                 PORTC=0x09;
                                                 Delay_ms(500);

                                                 Delay_ms(2000);
                                                 //goto L1;
                                                 }

                                         else{
                                         cnt++;
                                         Lcd_Cmd(_LCD_CLEAR);     //clear display
                                         Lcd_Out(1, 1, "Wrong Password");
                                         Delay_ms(2000);
                                         //goto L1;
                                         }
                                if(cnt>=3)
                                goto L1;


                    }
     }while(1);



}