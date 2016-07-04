int p,q,i=1;
void setup() 
{
  Serial.begin(115200);
  pinMode(10,OUTPUT);   // Assign pin 10 as output
  pinMode(11,OUTPUT);   // Assign pin 11 as output
  for(i=1;i<=10;i++)
  {
    p=analogRead(A0);   // Read the analog value of LDR1
    q=analogRead(A1);  // Read the analog value of LDR2
    Serial.println(p);  // Display the value converted by ADC in the range of 0-1023
    Serial.println(q);   // Display the value converted by ADC in the range of 0-1023
    if (p<q)             // Compare the values
    {
      digitalWrite(11, HIGH); // If condition true then blink the red LED
      delay(500);
      digitalWrite(11, LOW);
      delay(500);
    }
    else
    {
      digitalWrite(10, HIGH); // otherwise blink green LED
      delay(500);
      digitalWrite(10, LOW);
      delay(500);
    }
  }
}

void loop() {
  // put your main code here, to run repeatedly:

}
