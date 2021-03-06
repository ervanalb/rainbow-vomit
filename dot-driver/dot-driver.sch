EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_ST_STM32F1:STM32F105RCTx U2
U 1 1 5BE23607
P 5000 3850
F 0 "U2" H 5000 1964 50  0000 C CNN
F 1 "STM32F105RCTx" H 5000 1873 50  0000 C CNN
F 2 "Housings_QFP:LQFP-64_10x10mm_Pitch0.5mm" H 4400 2150 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00220364.pdf" H 5000 3850 50  0001 C CNN
	1    5000 3850
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B_Micro J2
U 1 1 5BE2379A
P 1200 1400
F 0 "J2" H 1255 1867 50  0000 C CNN
F 1 "USB_B_Micro" H 1255 1776 50  0000 C CNN
F 2 "Connect:USB_Micro-B" H 1350 1350 50  0001 C CNN
F 3 "~" H 1350 1350 50  0001 C CNN
	1    1200 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1400 2000 1400
Text Label 1650 1400 0    50   ~ 0
USB_DP
Wire Wire Line
	1500 1500 2000 1500
Text Label 1650 1500 0    50   ~ 0
USB_DM
NoConn ~ 1500 1600
$Comp
L power:GND #PWR013
U 1 1 5BE2388E
P 1200 1800
F 0 "#PWR013" H 1200 1550 50  0001 C CNN
F 1 "GND" H 1205 1627 50  0000 C CNN
F 2 "" H 1200 1800 50  0001 C CNN
F 3 "" H 1200 1800 50  0001 C CNN
	1    1200 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5BE23911
P 2900 1350
F 0 "C1" H 3015 1396 50  0000 L CNN
F 1 "2u2" H 3015 1305 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2938 1200 50  0001 C CNN
F 3 "~" H 2900 1350 50  0001 C CNN
	1    2900 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5BE23CEE
P 2900 1500
F 0 "#PWR07" H 2900 1250 50  0001 C CNN
F 1 "GND" H 2905 1327 50  0000 C CNN
F 2 "" H 2900 1500 50  0001 C CNN
F 3 "" H 2900 1500 50  0001 C CNN
	1    2900 1500
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP2127N-3.3 U1
U 1 1 5BE23D0A
P 3650 1200
F 0 "U1" H 3650 1442 50  0000 C CNN
F 1 "AP2127N-3.3" H 3650 1351 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 3650 1425 50  0001 C CIN
F 3 "https://www.diodes.com/assets/Datasheets/AP2127.pdf" H 3650 1200 50  0001 C CNN
	1    3650 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5BE23D71
P 4050 1350
F 0 "C2" H 4165 1396 50  0000 L CNN
F 1 "2u2" H 4165 1305 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4088 1200 50  0001 C CNN
F 3 "~" H 4050 1350 50  0001 C CNN
	1    4050 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5BE23E01
P 3650 1500
F 0 "#PWR08" H 3650 1250 50  0001 C CNN
F 1 "GND" H 3655 1327 50  0000 C CNN
F 2 "" H 3650 1500 50  0001 C CNN
F 3 "" H 3650 1500 50  0001 C CNN
	1    3650 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5BE23E1D
P 4050 1500
F 0 "#PWR09" H 4050 1250 50  0001 C CNN
F 1 "GND" H 4055 1327 50  0000 C CNN
F 2 "" H 4050 1500 50  0001 C CNN
F 3 "" H 4050 1500 50  0001 C CNN
	1    4050 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 1200 3950 1200
Wire Wire Line
	4050 1200 4300 1200
Connection ~ 4050 1200
$Comp
L power:+3V3 #PWR04
U 1 1 5BE23FBF
P 4300 1200
F 0 "#PWR04" H 4300 1050 50  0001 C CNN
F 1 "+3V3" V 4315 1328 50  0000 L CNN
F 2 "" H 4300 1200 50  0001 C CNN
F 3 "" H 4300 1200 50  0001 C CNN
	1    4300 1200
	0    1    1    0   
$EndComp
NoConn ~ 4300 2250
$Comp
L Switch:SW_Push SW1
U 1 1 5BE24815
P 3650 2450
F 0 "SW1" H 3650 2735 50  0000 C CNN
F 1 "BUTTON" H 3650 2644 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_TL3342" H 3650 2650 50  0001 C CNN
F 3 "" H 3650 2650 50  0001 C CNN
	1    3650 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5BE248B6
P 4100 2750
F 0 "#PWR022" H 4100 2500 50  0001 C CNN
F 1 "GND" H 4105 2577 50  0000 C CNN
F 2 "" H 4100 2750 50  0001 C CNN
F 3 "" H 4100 2750 50  0001 C CNN
	1    4100 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5BE248FF
P 4100 2600
F 0 "R1" H 4170 2646 50  0000 L CNN
F 1 "10K" H 4170 2555 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 4030 2600 50  0001 C CNN
F 3 "~" H 4100 2600 50  0001 C CNN
	1    4100 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2450 3900 2450
Wire Wire Line
	4100 2450 4300 2450
Connection ~ 4100 2450
$Comp
L power:+3V3 #PWR020
U 1 1 5BE24AD1
P 3300 2450
F 0 "#PWR020" H 3300 2300 50  0001 C CNN
F 1 "+3V3" H 3315 2623 50  0000 C CNN
F 2 "" H 3300 2450 50  0001 C CNN
F 3 "" H 3300 2450 50  0001 C CNN
	1    3300 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2450 3400 2450
Wire Wire Line
	4800 1950 4800 2050
$Comp
L power:+3V3 #PWR016
U 1 1 5BE25046
P 4800 1950
F 0 "#PWR016" H 4800 1800 50  0001 C CNN
F 1 "+3V3" H 4815 2123 50  0000 C CNN
F 2 "" H 4800 1950 50  0001 C CNN
F 3 "" H 4800 1950 50  0001 C CNN
	1    4800 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5650 5400 5700
$Comp
L power:GND #PWR037
U 1 1 5BE254BD
P 5400 5700
F 0 "#PWR037" H 5400 5450 50  0001 C CNN
F 1 "GND" H 5405 5527 50  0000 C CNN
F 2 "" H 5400 5700 50  0001 C CNN
F 3 "" H 5400 5700 50  0001 C CNN
	1    5400 5700
	1    0    0    -1  
$EndComp
Text Label 7550 2850 0    50   ~ 0
LED3
$Comp
L power:GND #PWR024
U 1 1 5BE26575
P 8150 2950
F 0 "#PWR024" H 8150 2700 50  0001 C CNN
F 1 "GND" H 8155 2777 50  0000 C CNN
F 2 "" H 8150 2950 50  0001 C CNN
F 3 "" H 8150 2950 50  0001 C CNN
	1    8150 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J6
U 1 1 5BE26569
P 8350 2850
F 0 "J6" H 8323 2780 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 2871 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 2850 50  0001 C CNN
F 3 "~" H 8350 2850 50  0001 C CNN
	1    8350 2850
	-1   0    0    1   
$EndComp
Text Label 7550 2200 0    50   ~ 0
LED2
$Comp
L power:GND #PWR019
U 1 1 5BE26561
P 8150 2300
F 0 "#PWR019" H 8150 2050 50  0001 C CNN
F 1 "GND" H 8155 2127 50  0000 C CNN
F 2 "" H 8150 2300 50  0001 C CNN
F 3 "" H 8150 2300 50  0001 C CNN
	1    8150 2300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 5BE26555
P 8350 2200
F 0 "J4" H 8323 2130 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 2221 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 2200 50  0001 C CNN
F 3 "~" H 8350 2200 50  0001 C CNN
	1    8350 2200
	-1   0    0    1   
$EndComp
Text Label 7550 1550 0    50   ~ 0
LED1
$Comp
L power:GND #PWR012
U 1 1 5BE2618D
P 8150 1650
F 0 "#PWR012" H 8150 1400 50  0001 C CNN
F 1 "GND" H 8155 1477 50  0000 C CNN
F 2 "" H 8150 1650 50  0001 C CNN
F 3 "" H 8150 1650 50  0001 C CNN
	1    8150 1650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5BE26181
P 8350 1550
F 0 "J3" H 8323 1480 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 1571 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 1550 50  0001 C CNN
F 3 "~" H 8350 1550 50  0001 C CNN
	1    8350 1550
	-1   0    0    1   
$EndComp
Text Label 7550 900  0    50   ~ 0
LED0
$Comp
L power:GND #PWR03
U 1 1 5BE25C03
P 8150 1000
F 0 "#PWR03" H 8150 750 50  0001 C CNN
F 1 "GND" H 8155 827 50  0000 C CNN
F 2 "" H 8150 1000 50  0001 C CNN
F 3 "" H 8150 1000 50  0001 C CNN
	1    8150 1000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5BE259F5
P 8350 900
F 0 "J1" H 8323 830 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 921 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 900 50  0001 C CNN
F 3 "~" H 8350 900 50  0001 C CNN
	1    8350 900 
	-1   0    0    1   
$EndComp
Text Label 7550 5450 0    50   ~ 0
LED7
$Comp
L power:GND #PWR035
U 1 1 5BE26F0E
P 8150 5550
F 0 "#PWR035" H 8150 5300 50  0001 C CNN
F 1 "GND" H 8155 5377 50  0000 C CNN
F 2 "" H 8150 5550 50  0001 C CNN
F 3 "" H 8150 5550 50  0001 C CNN
	1    8150 5550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J10
U 1 1 5BE26F1A
P 8350 5450
F 0 "J10" H 8323 5380 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 5471 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 5450 50  0001 C CNN
F 3 "~" H 8350 5450 50  0001 C CNN
	1    8350 5450
	-1   0    0    1   
$EndComp
Text Label 7550 4800 0    50   ~ 0
LED6
$Comp
L power:GND #PWR033
U 1 1 5BE26F22
P 8150 4900
F 0 "#PWR033" H 8150 4650 50  0001 C CNN
F 1 "GND" H 8155 4727 50  0000 C CNN
F 2 "" H 8150 4900 50  0001 C CNN
F 3 "" H 8150 4900 50  0001 C CNN
	1    8150 4900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J9
U 1 1 5BE26F2E
P 8350 4800
F 0 "J9" H 8323 4730 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 4821 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 4800 50  0001 C CNN
F 3 "~" H 8350 4800 50  0001 C CNN
	1    8350 4800
	-1   0    0    1   
$EndComp
Text Label 7550 4150 0    50   ~ 0
LED5
$Comp
L power:GND #PWR031
U 1 1 5BE26F36
P 8150 4250
F 0 "#PWR031" H 8150 4000 50  0001 C CNN
F 1 "GND" H 8155 4077 50  0000 C CNN
F 2 "" H 8150 4250 50  0001 C CNN
F 3 "" H 8150 4250 50  0001 C CNN
	1    8150 4250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J8
U 1 1 5BE26F42
P 8350 4150
F 0 "J8" H 8323 4080 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 4171 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 4150 50  0001 C CNN
F 3 "~" H 8350 4150 50  0001 C CNN
	1    8350 4150
	-1   0    0    1   
$EndComp
Text Label 7550 3500 0    50   ~ 0
LED4
$Comp
L power:GND #PWR027
U 1 1 5BE26F4A
P 8150 3600
F 0 "#PWR027" H 8150 3350 50  0001 C CNN
F 1 "GND" H 8155 3427 50  0000 C CNN
F 2 "" H 8150 3600 50  0001 C CNN
F 3 "" H 8150 3600 50  0001 C CNN
	1    8150 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J7
U 1 1 5BE26F56
P 8350 3500
F 0 "J7" H 8323 3430 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 3521 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 3500 50  0001 C CNN
F 3 "~" H 8350 3500 50  0001 C CNN
	1    8350 3500
	-1   0    0    1   
$EndComp
Connection ~ 2900 1200
Wire Wire Line
	2700 1200 2900 1200
$Comp
L power:+5V #PWR02
U 1 1 5BE2AD26
P 2900 1000
F 0 "#PWR02" H 2900 850 50  0001 C CNN
F 1 "+5V" H 2800 1150 50  0000 L CNN
F 2 "" H 2900 1000 50  0001 C CNN
F 3 "" H 2900 1000 50  0001 C CNN
	1    2900 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1200 1650 850 
Wire Wire Line
	1650 850  1850 850 
Connection ~ 1650 1200
Wire Wire Line
	1650 1200 1500 1200
Text Label 1650 850  0    50   ~ 0
VBUS
Wire Wire Line
	3450 3800 4250 3800
Wire Wire Line
	4250 3800 4250 3650
Wire Wire Line
	4250 3650 4300 3650
Wire Wire Line
	4250 3400 4250 3550
Wire Wire Line
	4250 3550 4300 3550
$Comp
L Device:C C6
U 1 1 5BE36C62
P 3450 3950
F 0 "C6" H 3565 3996 50  0000 L CNN
F 1 "20p" H 3565 3905 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3488 3800 50  0001 C CNN
F 3 "~" H 3450 3950 50  0001 C CNN
	1    3450 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5BE36CF4
P 3100 3950
F 0 "C5" H 3215 3996 50  0000 L CNN
F 1 "20p" H 3215 3905 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3138 3800 50  0001 C CNN
F 3 "~" H 3100 3950 50  0001 C CNN
	1    3100 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3800 3100 3400
$Comp
L power:GND #PWR029
U 1 1 5BE37E0A
P 3100 4100
F 0 "#PWR029" H 3100 3850 50  0001 C CNN
F 1 "GND" H 3105 3927 50  0000 C CNN
F 2 "" H 3100 4100 50  0001 C CNN
F 3 "" H 3100 4100 50  0001 C CNN
	1    3100 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR030
U 1 1 5BE37E54
P 3450 4100
F 0 "#PWR030" H 3450 3850 50  0001 C CNN
F 1 "GND" H 3455 3927 50  0000 C CNN
F 2 "" H 3450 4100 50  0001 C CNN
F 3 "" H 3450 4100 50  0001 C CNN
	1    3450 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4550 3700 4550
Wire Wire Line
	4300 4650 3700 4650
Wire Wire Line
	4300 4750 3700 4750
Wire Wire Line
	4300 4850 3700 4850
Wire Wire Line
	5700 4950 6300 4950
Wire Wire Line
	5700 5050 6300 5050
Wire Wire Line
	5700 3750 6300 3750
Wire Wire Line
	5700 4250 6300 4250
Text Label 6100 3750 0    50   ~ 0
LED1
Text Label 6100 4250 0    50   ~ 0
LED0
Text Label 6100 4950 0    50   ~ 0
LED7
Text Label 6100 5050 0    50   ~ 0
LED6
Text Label 3700 4550 0    50   ~ 0
LED5
Text Label 3700 4650 0    50   ~ 0
LED4
Text Label 3700 4750 0    50   ~ 0
LED3
Text Label 3700 4850 0    50   ~ 0
LED2
$Comp
L Device:LED D1
U 1 1 5BE48AC9
P 9850 900
F 0 "D1" H 9842 645 50  0000 C CNN
F 1 "YELLOW" H 9842 736 50  0000 C CNN
F 2 "LEDs:LED_0603" H 9850 900 50  0001 C CNN
F 3 "~" H 9850 900 50  0001 C CNN
	1    9850 900 
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 900  9350 900 
Text Label 9350 900  0    50   ~ 0
IND0
$Comp
L Device:LED D2
U 1 1 5BE6A51B
P 9850 1550
F 0 "D2" H 9842 1295 50  0000 C CNN
F 1 "YELLOW" H 9842 1386 50  0000 C CNN
F 2 "LEDs:LED_0603" H 9850 1550 50  0001 C CNN
F 3 "~" H 9850 1550 50  0001 C CNN
	1    9850 1550
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 1550 9350 1550
Text Label 9350 1550 0    50   ~ 0
IND1
$Comp
L Device:LED D3
U 1 1 5BE6D96E
P 9850 2200
F 0 "D3" H 9842 1945 50  0000 C CNN
F 1 "YELLOW" H 9842 2036 50  0000 C CNN
F 2 "LEDs:LED_0603" H 9850 2200 50  0001 C CNN
F 3 "~" H 9850 2200 50  0001 C CNN
	1    9850 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 2200 9350 2200
Text Label 9350 2200 0    50   ~ 0
IND2
$Comp
L Device:LED D4
U 1 1 5BE6D982
P 9850 2850
F 0 "D4" H 9842 2595 50  0000 C CNN
F 1 "YELLOW" H 9842 2686 50  0000 C CNN
F 2 "LEDs:LED_0603" H 9850 2850 50  0001 C CNN
F 3 "~" H 9850 2850 50  0001 C CNN
	1    9850 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 2850 9350 2850
Text Label 9350 2850 0    50   ~ 0
IND3
$Comp
L Device:LED D6
U 1 1 5BE6F63C
P 9850 3500
F 0 "D6" H 9842 3245 50  0000 C CNN
F 1 "YELLOW" H 9842 3336 50  0000 C CNN
F 2 "LEDs:LED_0603" H 9850 3500 50  0001 C CNN
F 3 "~" H 9850 3500 50  0001 C CNN
	1    9850 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 3500 9350 3500
Text Label 9350 3500 0    50   ~ 0
IND4
$Comp
L Device:LED D7
U 1 1 5BE6F650
P 9850 4150
F 0 "D7" H 9842 3895 50  0000 C CNN
F 1 "YELLOW" H 9842 3986 50  0000 C CNN
F 2 "LEDs:LED_0603" H 9850 4150 50  0001 C CNN
F 3 "~" H 9850 4150 50  0001 C CNN
	1    9850 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 4150 9350 4150
Text Label 9350 4150 0    50   ~ 0
IND5
$Comp
L Device:LED D8
U 1 1 5BE6F664
P 9850 4800
F 0 "D8" H 9842 4545 50  0000 C CNN
F 1 "YELLOW" H 9842 4636 50  0000 C CNN
F 2 "LEDs:LED_0603" H 9850 4800 50  0001 C CNN
F 3 "~" H 9850 4800 50  0001 C CNN
	1    9850 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 4800 9350 4800
Text Label 9350 4800 0    50   ~ 0
IND6
$Comp
L Device:LED D9
U 1 1 5BE6F678
P 9850 5450
F 0 "D9" H 9842 5195 50  0000 C CNN
F 1 "YELLOW" H 9842 5286 50  0000 C CNN
F 2 "LEDs:LED_0603" H 9850 5450 50  0001 C CNN
F 3 "~" H 9850 5450 50  0001 C CNN
	1    9850 5450
	-1   0    0    1   
$EndComp
Wire Wire Line
	9700 5450 9350 5450
Text Label 9350 5450 0    50   ~ 0
IND7
$Comp
L dot-driver-rescue:Micro_SD_Card_Det_Hirose_DM3AT-Connector J15
U 1 1 5BE73FC1
P 3600 6800
F 0 "J15" H 3550 7617 50  0000 C CNN
F 1 "Micro_SD_Card_Det_Hirose_DM3AT" H 3550 7526 50  0000 C CNN
F 2 "Connector_Card:microSD_HC_Hirose_DM3AT-SF-PEJM5" H 5650 7500 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/DM3/category/Catalog/doc_file_id/49662/?file_category_id=4&item_id=195&is_series=1" H 3600 6900 50  0001 C CNN
	1    3600 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6600 2350 6600
Wire Wire Line
	2700 6500 2350 6500
Text Label 2350 6600 0    50   ~ 0
MOSI
Text Label 2350 6500 0    50   ~ 0
NSS
Wire Wire Line
	2700 6800 2350 6800
Text Label 2350 6800 0    50   ~ 0
SCK
Wire Wire Line
	2700 7000 2350 7000
Text Label 2350 7000 0    50   ~ 0
MISO
Wire Wire Line
	2700 7200 2350 7200
Text Label 2350 7200 0    50   ~ 0
DETECT
$Comp
L power:GND #PWR046
U 1 1 5BE880CB
P 2700 7300
F 0 "#PWR046" H 2700 7050 50  0001 C CNN
F 1 "GND" H 2705 7127 50  0000 C CNN
F 2 "" H 2700 7300 50  0001 C CNN
F 3 "" H 2700 7300 50  0001 C CNN
	1    2700 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR047
U 1 1 5BE881B9
P 4400 7300
F 0 "#PWR047" H 4400 7050 50  0001 C CNN
F 1 "GND" H 4405 7127 50  0000 C CNN
F 2 "" H 4400 7300 50  0001 C CNN
F 3 "" H 4400 7300 50  0001 C CNN
	1    4400 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6900 2150 6900
Wire Wire Line
	2150 6900 2150 7000
$Comp
L power:GND #PWR044
U 1 1 5BE8A995
P 2150 7000
F 0 "#PWR044" H 2150 6750 50  0001 C CNN
F 1 "GND" H 2155 6827 50  0000 C CNN
F 2 "" H 2150 7000 50  0001 C CNN
F 3 "" H 2150 7000 50  0001 C CNN
	1    2150 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6700 2150 6700
Wire Wire Line
	2150 6700 2150 6600
NoConn ~ 2700 7100
NoConn ~ 2700 6400
Text Label 6100 5350 0    50   ~ 0
MISO
Text Label 6100 5450 0    50   ~ 0
MOSI
Text Label 6100 5250 0    50   ~ 0
SCK
Text Label 6100 5150 0    50   ~ 0
NSS
Wire Wire Line
	5700 3550 6300 3550
Wire Wire Line
	5700 3650 6300 3650
Text Label 6050 3550 0    50   ~ 0
SWDIO
Text Label 6050 3650 0    50   ~ 0
SWCLK
Wire Wire Line
	5700 7000 6050 7000
Wire Wire Line
	5700 7200 6050 7200
Text Label 5800 7200 0    50   ~ 0
SWDIO
Text Label 5800 7000 0    50   ~ 0
SWCLK
$Comp
L Connector:Conn_01x04_Male J16
U 1 1 5BE5866A
P 5500 7000
F 0 "J16" H 5600 7350 50  0000 C CNN
F 1 "SWD" H 5600 7250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 5500 7000 50  0001 C CNN
F 3 "~" H 5500 7000 50  0001 C CNN
	1    5500 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 6900 6150 6900
Wire Wire Line
	6150 6900 6150 6750
$Comp
L power:+3V3 #PWR043
U 1 1 5BE69721
P 6150 6750
F 0 "#PWR043" H 6150 6600 50  0001 C CNN
F 1 "+3V3" H 6165 6923 50  0000 C CNN
F 2 "" H 6150 6750 50  0001 C CNN
F 3 "" H 6150 6750 50  0001 C CNN
	1    6150 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 7100 6150 7100
Wire Wire Line
	6150 7100 6150 7250
$Comp
L power:GND #PWR045
U 1 1 5BE6CECA
P 6150 7250
F 0 "#PWR045" H 6150 7000 50  0001 C CNN
F 1 "GND" H 6155 7077 50  0000 C CNN
F 2 "" H 6150 7250 50  0001 C CNN
F 3 "" H 6150 7250 50  0001 C CNN
	1    6150 7250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J11
U 1 1 5BE28D5F
P 7800 6050
F 0 "J11" H 7906 6228 50  0000 C CNN
F 1 "5V" H 7906 6137 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01" H 7800 6050 50  0001 C CNN
F 3 "~" H 7800 6050 50  0001 C CNN
	1    7800 6050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J13
U 1 1 5BE28E11
P 7800 6300
F 0 "J13" H 7906 6478 50  0000 C CNN
F 1 "GND" H 7906 6387 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01" H 7800 6300 50  0001 C CNN
F 3 "~" H 7800 6300 50  0001 C CNN
	1    7800 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR040
U 1 1 5BE2922C
P 8100 6300
F 0 "#PWR040" H 8100 6050 50  0001 C CNN
F 1 "GND" H 8105 6127 50  0000 C CNN
F 2 "" H 8100 6300 50  0001 C CNN
F 3 "" H 8100 6300 50  0001 C CNN
	1    8100 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 6300 8100 6300
Wire Wire Line
	8000 6050 8100 6050
Wire Wire Line
	5700 4750 6300 4750
Text Label 6000 4750 0    50   ~ 0
BUTTON
Text Label 3850 2450 0    50   ~ 0
BUTTON
$Comp
L Connector:Conn_01x01_Male J12
U 1 1 5BE3B881
P 8250 6050
F 0 "J12" H 8356 6228 50  0000 C CNN
F 1 "5V" H 8356 6137 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01" H 8250 6050 50  0001 C CNN
F 3 "~" H 8250 6050 50  0001 C CNN
	1    8250 6050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J14
U 1 1 5BE3B887
P 8250 6300
F 0 "J14" H 8356 6478 50  0000 C CNN
F 1 "GND" H 8356 6387 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01" H 8250 6300 50  0001 C CNN
F 3 "~" H 8250 6300 50  0001 C CNN
	1    8250 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR041
U 1 1 5BE3B88D
P 8550 6300
F 0 "#PWR041" H 8550 6050 50  0001 C CNN
F 1 "GND" H 8555 6127 50  0000 C CNN
F 2 "" H 8550 6300 50  0001 C CNN
F 3 "" H 8550 6300 50  0001 C CNN
	1    8550 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 6300 8550 6300
Wire Wire Line
	8450 6050 8550 6050
$Comp
L Device:Crystal Y1
U 1 1 5BE7709F
P 3450 3600
F 0 "Y1" V 3404 3731 50  0000 L CNN
F 1 "8MHz" V 3495 3731 50  0000 L CNN
F 2 "Crystals:Crystal_SMD_5032_4Pads" H 3450 3600 50  0001 C CNN
F 3 "~" H 3450 3600 50  0001 C CNN
	1    3450 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 3400 3450 3400
Wire Wire Line
	3450 3450 3450 3400
Connection ~ 3450 3400
Wire Wire Line
	3450 3400 4250 3400
Wire Wire Line
	3450 3750 3450 3800
Connection ~ 3450 3800
Wire Wire Line
	5700 5250 6300 5250
Wire Wire Line
	5700 5350 6300 5350
Wire Wire Line
	5700 5450 6300 5450
Wire Wire Line
	5700 5150 6300 5150
Text Label 6100 4350 0    50   ~ 0
IND0
Wire Wire Line
	5700 3350 6300 3350
Wire Wire Line
	5700 3450 6300 3450
Text Label 6000 3350 0    50   ~ 0
USB_DM
Text Label 6000 3450 0    50   ~ 0
USB_DP
Wire Wire Line
	5700 3150 6300 3150
Text Label 6100 3150 0    50   ~ 0
VBUS
Text Label 6000 2950 0    50   ~ 0
DETECT
Wire Wire Line
	5700 3250 6300 3250
Text Label 6100 3250 0    50   ~ 0
IND3
Wire Wire Line
	4800 5650 4900 5650
Connection ~ 4900 5650
Wire Wire Line
	4900 5650 5000 5650
Connection ~ 5000 5650
Wire Wire Line
	5000 5650 5100 5650
Connection ~ 5100 5650
Wire Wire Line
	5100 5650 5200 5650
Connection ~ 5200 5650
Wire Wire Line
	5200 5650 5400 5650
Wire Wire Line
	4800 2050 4900 2050
Connection ~ 4800 2050
Connection ~ 4900 2050
Wire Wire Line
	4900 2050 5000 2050
Connection ~ 5000 2050
Wire Wire Line
	5000 2050 5100 2050
Connection ~ 5100 2050
Wire Wire Line
	5100 2050 5200 2050
Connection ~ 5200 2050
Wire Wire Line
	5200 2050 5300 2050
Wire Wire Line
	4300 4950 3700 4950
Wire Wire Line
	4300 5050 3700 5050
Text Label 3700 5050 0    50   ~ 0
IND2
Text Label 3700 4950 0    50   ~ 0
IND1
$Comp
L Device:LED D5
U 1 1 5BEEC8A0
P 1650 2950
F 0 "D5" V 1688 2832 50  0000 R CNN
F 1 "GREEN" V 1597 2832 50  0000 R CNN
F 2 "LEDs:LED_0603" H 1650 2950 50  0001 C CNN
F 3 "~" H 1650 2950 50  0001 C CNN
	1    1650 2950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5BEEC8A6
P 1650 3100
F 0 "#PWR025" H 1650 2850 50  0001 C CNN
F 1 "GND" H 1655 2927 50  0000 C CNN
F 2 "" H 1650 3100 50  0001 C CNN
F 3 "" H 1650 3100 50  0001 C CNN
	1    1650 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5BEEC8AC
P 1650 2650
F 0 "R2" H 1720 2696 50  0000 L CNN
F 1 "680R" H 1720 2605 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 1580 2650 50  0001 C CNN
F 3 "~" H 1650 2650 50  0001 C CNN
	1    1650 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 2300 1650 2500
Wire Wire Line
	1100 1800 1200 1800
Connection ~ 1200 1800
$Comp
L Device:C C3
U 1 1 5BEB7A37
P 5700 1700
F 0 "C3" H 5815 1746 50  0000 L CNN
F 1 "100n" H 5815 1655 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5738 1550 50  0001 C CNN
F 3 "~" H 5700 1700 50  0001 C CNN
	1    5700 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5BEB7B59
P 6100 1700
F 0 "C4" H 6215 1746 50  0000 L CNN
F 1 "100n" H 6215 1655 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6138 1550 50  0001 C CNN
F 3 "~" H 6100 1700 50  0001 C CNN
	1    6100 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR010
U 1 1 5BEB7CD3
P 5700 1550
F 0 "#PWR010" H 5700 1400 50  0001 C CNN
F 1 "+3V3" H 5715 1723 50  0000 C CNN
F 2 "" H 5700 1550 50  0001 C CNN
F 3 "" H 5700 1550 50  0001 C CNN
	1    5700 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR011
U 1 1 5BEB7D4E
P 6100 1550
F 0 "#PWR011" H 6100 1400 50  0001 C CNN
F 1 "+3V3" H 6115 1723 50  0000 C CNN
F 2 "" H 6100 1550 50  0001 C CNN
F 3 "" H 6100 1550 50  0001 C CNN
	1    6100 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5BEB7EEA
P 5700 1850
F 0 "#PWR014" H 5700 1600 50  0001 C CNN
F 1 "GND" H 5705 1677 50  0000 C CNN
F 2 "" H 5700 1850 50  0001 C CNN
F 3 "" H 5700 1850 50  0001 C CNN
	1    5700 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5BEB7FF3
P 6100 1850
F 0 "#PWR015" H 6100 1600 50  0001 C CNN
F 1 "GND" H 6105 1677 50  0000 C CNN
F 2 "" H 6100 1850 50  0001 C CNN
F 3 "" H 6100 1850 50  0001 C CNN
	1    6100 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR042
U 1 1 5E6DCE73
P 2150 6600
F 0 "#PWR042" H 2150 6450 50  0001 C CNN
F 1 "+3V3" H 2165 6773 50  0000 C CNN
F 2 "" H 2150 6600 50  0001 C CNN
F 3 "" H 2150 6600 50  0001 C CNN
	1    2150 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4350 6300 4350
$Comp
L power:+5V #PWR01
U 1 1 5E74D97F
P 8150 800
F 0 "#PWR01" H 8150 650 50  0001 C CNN
F 1 "+5V" H 8050 950 50  0000 L CNN
F 2 "" H 8150 800 50  0001 C CNN
F 3 "" H 8150 800 50  0001 C CNN
	1    8150 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5E74E429
P 8150 1450
F 0 "#PWR05" H 8150 1300 50  0001 C CNN
F 1 "+5V" H 8050 1600 50  0000 L CNN
F 2 "" H 8150 1450 50  0001 C CNN
F 3 "" H 8150 1450 50  0001 C CNN
	1    8150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 5E74EA28
P 8150 2100
F 0 "#PWR017" H 8150 1950 50  0001 C CNN
F 1 "+5V" H 8050 2250 50  0000 L CNN
F 2 "" H 8150 2100 50  0001 C CNN
F 3 "" H 8150 2100 50  0001 C CNN
	1    8150 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR023
U 1 1 5E74EE57
P 8150 2750
F 0 "#PWR023" H 8150 2600 50  0001 C CNN
F 1 "+5V" H 8050 2900 50  0000 L CNN
F 2 "" H 8150 2750 50  0001 C CNN
F 3 "" H 8150 2750 50  0001 C CNN
	1    8150 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR026
U 1 1 5E74F729
P 8150 3400
F 0 "#PWR026" H 8150 3250 50  0001 C CNN
F 1 "+5V" H 8050 3550 50  0000 L CNN
F 2 "" H 8150 3400 50  0001 C CNN
F 3 "" H 8150 3400 50  0001 C CNN
	1    8150 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR028
U 1 1 5E74FC89
P 8150 4050
F 0 "#PWR028" H 8150 3900 50  0001 C CNN
F 1 "+5V" H 8050 4200 50  0000 L CNN
F 2 "" H 8150 4050 50  0001 C CNN
F 3 "" H 8150 4050 50  0001 C CNN
	1    8150 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR032
U 1 1 5E750080
P 8150 4700
F 0 "#PWR032" H 8150 4550 50  0001 C CNN
F 1 "+5V" H 8050 4850 50  0000 L CNN
F 2 "" H 8150 4700 50  0001 C CNN
F 3 "" H 8150 4700 50  0001 C CNN
	1    8150 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR034
U 1 1 5E750539
P 8150 5350
F 0 "#PWR034" H 8150 5200 50  0001 C CNN
F 1 "+5V" H 8050 5500 50  0000 L CNN
F 2 "" H 8150 5350 50  0001 C CNN
F 3 "" H 8150 5350 50  0001 C CNN
	1    8150 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR038
U 1 1 5E756433
P 8100 6050
F 0 "#PWR038" H 8100 5900 50  0001 C CNN
F 1 "+5V" H 8000 6200 50  0000 L CNN
F 2 "" H 8100 6050 50  0001 C CNN
F 3 "" H 8100 6050 50  0001 C CNN
	1    8100 6050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR039
U 1 1 5E756701
P 8550 6050
F 0 "#PWR039" H 8550 5900 50  0001 C CNN
F 1 "+5V" H 8450 6200 50  0000 L CNN
F 2 "" H 8550 6050 50  0001 C CNN
F 3 "" H 8550 6050 50  0001 C CNN
	1    8550 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_PMOS_GSD Q1
U 1 1 5E762758
P 2500 1300
F 0 "Q1" V 2842 1300 50  0000 C CNN
F 1 "SSM3J338R" V 2751 1300 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2700 1400 50  0001 C CNN
F 3 "~" H 2500 1300 50  0001 C CNN
	1    2500 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1650 1200 2300 1200
$Comp
L power:GND #PWR06
U 1 1 5E76FB36
P 2500 1500
F 0 "#PWR06" H 2500 1250 50  0001 C CNN
F 1 "GND" H 2505 1327 50  0000 C CNN
F 2 "" H 2500 1500 50  0001 C CNN
F 3 "" H 2500 1500 50  0001 C CNN
	1    2500 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1200 3350 1200
Wire Wire Line
	2900 1200 2900 1000
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5E77837F
P 3600 2800
F 0 "J5" V 3650 3000 50  0000 R CNN
F 1 "External button" V 3550 3100 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 3600 2800 50  0001 C CNN
F 3 "~" H 3600 2800 50  0001 C CNN
	1    3600 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3400 2450 3400 2600
Wire Wire Line
	3400 2600 3600 2600
Connection ~ 3400 2450
Wire Wire Line
	3400 2450 3450 2450
Wire Wire Line
	3900 2450 3900 2600
Wire Wire Line
	3900 2600 3700 2600
Connection ~ 3900 2450
Wire Wire Line
	3900 2450 4100 2450
$Comp
L Device:R_Network08 RN1
U 1 1 5E798E33
P 12650 2800
F 0 "RN1" V 12033 2800 50  0000 C CNN
F 1 "480R" V 12124 2800 50  0000 C CNN
F 2 "Resistors_SMD:R_Array_Convex_5x0603" V 13125 2800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 12650 2800 50  0001 C CNN
	1    12650 2800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5E7A1823
P 12950 2500
F 0 "#PWR021" H 12950 2250 50  0001 C CNN
F 1 "GND" H 12955 2327 50  0000 C CNN
F 2 "" H 12950 2500 50  0001 C CNN
F 3 "" H 12950 2500 50  0001 C CNN
	1    12950 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	12950 2500 12950 2400
Wire Wire Line
	12950 2400 12850 2400
Wire Wire Line
	10450 900  10000 900 
Wire Wire Line
	10000 1550 10450 1550
Wire Wire Line
	10000 2200 10450 2200
Wire Wire Line
	10450 5450 10000 5450
Wire Wire Line
	10000 4800 10450 4800
Wire Wire Line
	10450 4150 10000 4150
Wire Wire Line
	10000 3500 10450 3500
Wire Wire Line
	7550 900  8150 900 
Wire Wire Line
	7550 1550 8150 1550
Wire Wire Line
	7550 2200 8150 2200
Wire Wire Line
	7550 2850 8150 2850
Wire Wire Line
	7550 3500 8150 3500
Wire Wire Line
	7550 4150 8150 4150
Wire Wire Line
	7550 4800 8150 4800
Wire Wire Line
	7550 5450 8150 5450
$Comp
L Device:R_Network08 RN2
U 1 1 5E817291
P 10650 6100
F 0 "RN2" V 10033 6100 50  0000 C CNN
F 1 "1K" V 10124 6100 50  0000 C CNN
F 2 "Resistors_SMD:R_Array_Convex_5x0603" V 11125 6100 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 10650 6100 50  0001 C CNN
	1    10650 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	10450 5700 9900 5700
Text Label 10100 5700 2    50   ~ 0
LED3
Wire Wire Line
	10450 5800 9900 5800
Wire Wire Line
	10450 5900 9900 5900
Wire Wire Line
	10450 6000 9900 6000
Wire Wire Line
	10450 6100 9900 6100
Wire Wire Line
	10450 6200 9900 6200
Wire Wire Line
	10450 6300 9900 6300
Wire Wire Line
	9900 6400 10450 6400
Wire Wire Line
	10850 5700 10950 5700
Wire Wire Line
	10950 5700 10950 5600
$Comp
L power:+5V #PWR036
U 1 1 5E8866FB
P 10950 5600
F 0 "#PWR036" H 10950 5450 50  0001 C CNN
F 1 "+5V" H 10850 5750 50  0000 L CNN
F 2 "" H 10950 5600 50  0001 C CNN
F 3 "" H 10950 5600 50  0001 C CNN
	1    10950 5600
	-1   0    0    -1  
$EndComp
Text Label 10100 5800 2    50   ~ 0
LED2
Text Label 10100 5900 2    50   ~ 0
LED1
Text Label 10100 6000 2    50   ~ 0
LED0
Text Label 10100 6100 2    50   ~ 0
LED7
Text Label 10100 6200 2    50   ~ 0
LED6
Text Label 10100 6300 2    50   ~ 0
LED5
Text Label 10100 6400 2    50   ~ 0
LED4
$Comp
L power:+5V #PWR018
U 1 1 5E8B8F45
P 1650 2300
F 0 "#PWR018" H 1650 2150 50  0001 C CNN
F 1 "+5V" H 1550 2450 50  0000 L CNN
F 2 "" H 1650 2300 50  0001 C CNN
F 3 "" H 1650 2300 50  0001 C CNN
	1    1650 2300
	1    0    0    -1  
$EndComp
Text Label 10150 900  0    50   ~ 0
INDCAT0
Text Label 10150 1550 0    50   ~ 0
INDCAT1
Text Label 10150 2200 0    50   ~ 0
INDCAT2
Wire Wire Line
	10000 2850 10450 2850
Text Label 10150 2850 0    50   ~ 0
INDCAT3
Text Label 10150 3500 0    50   ~ 0
INDCAT4
Text Label 10150 4150 0    50   ~ 0
INDCAT5
Text Label 10150 4800 0    50   ~ 0
INDCAT6
Text Label 10150 5450 0    50   ~ 0
INDCAT7
Wire Wire Line
	12450 2400 11850 2400
Text Label 11850 2400 0    50   ~ 0
INDCAT0
Wire Wire Line
	12450 2500 11850 2500
Wire Wire Line
	11850 2600 12450 2600
Wire Wire Line
	12450 2700 11850 2700
Wire Wire Line
	11850 2800 12450 2800
Wire Wire Line
	12450 2900 11850 2900
Wire Wire Line
	11850 3000 12450 3000
Wire Wire Line
	12450 3100 11850 3100
Text Label 11850 2500 0    50   ~ 0
INDCAT1
Text Label 11850 2600 0    50   ~ 0
INDCAT2
Text Label 11850 2700 0    50   ~ 0
INDCAT3
Text Label 11850 2800 0    50   ~ 0
INDCAT4
Text Label 11850 2900 0    50   ~ 0
INDCAT5
Text Label 11850 3100 0    50   ~ 0
INDCAT6
Text Label 11850 3000 0    50   ~ 0
INDCAT7
Wire Wire Line
	5700 4150 6300 4150
Wire Wire Line
	5700 4050 6300 4050
Wire Wire Line
	5700 3950 6300 3950
Text Label 6100 4150 0    50   ~ 0
IND6
Text Label 6100 4050 0    50   ~ 0
IND5
Text Label 6100 3950 0    50   ~ 0
IND7
Wire Wire Line
	5700 2950 6300 2950
$EndSCHEMATC
