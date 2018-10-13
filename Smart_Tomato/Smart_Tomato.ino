
int Sensor[4][5]={0};
int offset[4][5]={0};
int count = 0;
int offsetCount[4][5] = {0};
void setup() {
  // put your setup code here, to run once:
Serial.begin(57600);
pinMode(A3, INPUT);
pinMode(A4, INPUT);
pinMode(A5, INPUT);
pinMode(A6, INPUT);
pinMode(A7, INPUT);

pinMode(2, OUTPUT);
pinMode(3, OUTPUT);
pinMode(4, OUTPUT);
pinMode(5, OUTPUT);


//---------------------------------------------
for( int Index=0; Index<=10; Index++){

for(int y=2; y<=5; y++){
    
   digitalWrite(y,HIGH);
   
    for(int x=3; x<=7; x++){
      offset[(y-2)][(x-3)]+=analogRead(x);

    }
  
    digitalWrite(y,LOW);
  }
}
//---------------------------------------------
  for(int a=0; a<=3; a++){
    for(int b=0; b<=4; b++){
      offset[a][b]/= 10;
    }
  }
}

void loop() {

  // put your main code here, to run repeatedly
  for(int y=2; y<=5; y++){
    digitalWrite(y,HIGH);
   
    for(int x=3; x<=7; x++){
        // delay(50);
        Sensor[(y-2)][(x-3)]= analogRead(x) - offset[y-2][x-3];
        // delay(50);
        if (count <= 3){
          offsetCount[(y-2)][(x-3)]+=analogRead(x);
        }
        else
        {
          offset[y-2][x-3] = offsetCount[y-2][x-3]/3;             
        }
      }
        digitalWrite(y,LOW);
  }

    if (count == 3){
      count = 0;
      offsetCount[4][5] = {0};
    }
    else{
    count++;
    }

  //display

  for(int a=0; a<=3; a++){
    for(int b=0; b<=4; b++){
      Serial.print(Sensor[a][b]);
      Serial.print(",");
      delay(50);
    }
  
  }
  Serial.println();
  // Serial.println("-------------------------------");
  // Serial.print(27,BYTE);   //Print "esc"
  // Serial.println("[2J");
  
}
