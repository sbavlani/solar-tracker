import os             
import sys
cwd=os.getcwd()                    # Gets the current working directory of the file
(setpath,Examples)=os.path.split(cwd)   # Creates a tuple (head,tail) where tail is everything after the final slash
print setpath                    
sys.path.append(setpath)              #Appends the setpath to sys.path so as to provide a search path for the module Arduino

from Arduino.Arduino import Arduino        # Imports all the functions from module Arduino
from time import sleep                      

class SOLAR_TRACKER:
	def __init__(self,baudrate):
		self.baudrate=baudrate         
		self.setup()
		self.run()
		self.exit()

	def setup(self):
		self.obj_arduino=Arduino()
		self.port=self.obj_arduino.locateport()          #Locates the port 
		self.obj_arduino.open_serial(1,self.port,self.baudrate)

	def run(self):
		self.ldr1=0                      #LDR1 connected at port 0
		self.ldr2=1                      #LDR2 connected at port 1
		s=0
		self.angle=5                   # Step angle
		self.initial=90
		self.obj_arduino.cmd_servo_attach(1,1)     # Attach the servo at pin 9
		sleep(1)
		self.obj_arduino.cmd_servo_move(1,1,self.initial)     #Rotate servo by 90 deg
		sleep(1)
		for i in range(20):
			p=self.obj_arduino.cmd_analog_in(1,self.ldr1)      #Read analog input from LDR1
			q=self.obj_arduino.cmd_analog_in(1,self.ldr2)      # Read analog input from LDR2  
			print p
			print q
			sleep(1)
			if int(p) < int(q):             
				s=s+1
				self.obj_arduino.cmd_servo_move(1,1,90-self.angle*s)   # Clockwise rotation
				sleep(1)
			else:
				s=s-1
				self.obj_arduino.cmd_servo_move(1,1,90-self.angle*s)  # Anti-clockwise rotation
				sleep(1)
		self.obj_arduino.cmd_servo_detach(1,1)		# Detach the motor

	def exit(self):
		self.obj_arduino.close_serial()           # Close the serial port 

def main():
	obj_ldr=SOLAR_TRACKER(115200)

if __name__=='__main__':                                  # Execute the module as script file
	main()
