#line 1 "C:/Users/ADMIN/Documents/ProteusLab/DoorLock/DoorLockPic16F887.c"
unsigned short kp;
char code1[15] ,user1[4];


int i = 0, j, cnt;

int w1;


char keypadPort at PORTD;



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


void code_enter(){
 kp = 0;

 do

 kp = Keypad_Key_Click();
 while (!kp);

 switch (kp){
 case 1: kp = 49; break;
 case 2: kp = 50; break;
 case 3: kp = 51; break;

 case 5: kp = 52; break;
 case 6: kp = 53; break;
 case 7: kp = 54; break;

 case 9: kp = 55; break;
 case 10: kp = 56; break;
 case 11: kp = 57; break;

 case 13: kp = 42; break;
 case 14: kp = 48; break;
 case 15: kp = 35; break;

 }

 code1[i] = kp;
 Lcd_Chr(2, i+1, code1[i]);
 i++;
 }



void code_read(){
 Delay_ms(20);
 user1[0] = EEPROM_Read(0x00);
 Delay_ms(20);
 user1[1] = EEPROM_Read(0x01);
 Delay_ms(20);
 user1[2] = EEPROM_Read(0x02);
 Delay_ms(20);
 user1[3] = EEPROM_Read(0x03);
 Delay_ms(20);
 }

void code_write(){
 Delay_ms(20);
 EEPROM_Write(0x00,code1[0]);
 Delay_ms(20);
 EEPROM_Write(0x01,code1[1]);
 Delay_ms(20);
 EEPROM_Write(0x02,code1[2]);
 Delay_ms(20);
 EEPROM_Write(0x03,code1[3]);
 }

void change_code(){
 Lcd_Cmd(_LCD_CLEAR);
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

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1, "New Code Set");
 Delay_ms(5000);
 }

void main(){
 ADCON1 != 0x07;
 Keypad_Init();
 ANSEL = 0;
 ANSELH = 0;

 c1on_bit=0;
 c2on_bit=0;

 TRISC = 0x00;
 PORTC = 0x00;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 code_read();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);




 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 5, "Access Pin");
 Lcd_Out(2, 4, "Security");
 delay_ms(2000);


 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "DigitalLock By:");
 Lcd_Out(2, 1, "FrederickBianzon");
 delay_ms(2000);

 cnt = 0;


 L1:do{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 3, "Press *");
 i = 0;
 code_enter();
 if(code1[0] == 42){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Enter Code");

 i = 0;
 code_enter();
 code_enter();
 code_enter();
 code_enter();
 code_enter();
 if(code1[0] == '1' && code1[1] == '2' && code1[2] == '3' && code1[3] == '4' && code1[4] == '5' ){
 code_enter();
 if(code1[5] == 35){
 change_code();

 }
 }
 else if(cnt<3 && code1[0] == user1[0] && code1[1] == user1[1] && code1[2] == user1[2] && code1[3] == user1[3] && code1[4] == 35){

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_out(1,4,"Door Open");


 EEPROM_Read(0x21);
 w1 = 1;
 Delay_ms(20);
 EEPROM_Write(0X21, w1);
 Delay_ms(20);
 EEPROM_Read(0x21);


 PORTC=0x03;
 Delay_ms(500);
 PORTC=0x06;
 Delay_ms(500);
 PORTC=0x0C;
 Delay_ms(500);
 PORTC=0x09;
 Delay_ms(500);

 Delay_ms(5000);



 LCD_Cmd(_LCD_CLEAR);
 Lcd_out(1,4,"Door Close");


 EEPROM_Read(0x21);
 w1 = 0;
 Delay_ms(20);
 EEPROM_Write(0x21, w1);
 Delay_ms(20);
 EEPROM_Read(0x21);



 PORTC=0x0C;
 Delay_ms(500);
 PORTC=0x06;
 Delay_ms(500);
 PORTC=0x03;
 Delay_ms(500);
 PORTC=0x09;
 Delay_ms(500);

 Delay_ms(2000);

 }

 else{
 cnt++;
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Wrong Password");
 Delay_ms(2000);

 }
 if(cnt>=3)
 goto L1;


 }
 }while(1);



}
