using SerialPorts
using ArduinoTools

ser = connectBoard(115200)
ServoAttach(ser,1)
sleep(1)
j = 0
k = 0
r = 0
ServoMove(ser,1,90)  # Initially move the servo motor by 90 deg
for i = 1:30
  p = analogRead(ser,0)   # Read the analog value of LDR1
  println(p)
  q = analogRead(ser,1)  # Read the analog value of LDR2
  println(q)
  k = p-q  # threshold
  r = q-p  # threshold
  if p<q && r>10
    j = j+1
    ServoMove(ser,1,90-5j)   # Clockwise rotation
    sleep(0.5)
  end
  if p>q && k>10
    j = j-1
    ServoMove(ser,1,90-5j)  # Anti-clockwise
    sleep(0.5)
  end
  sleep(1)
end
ServoDetach(ser,1)
close(ser)
