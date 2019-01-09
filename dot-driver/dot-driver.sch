EESchema Schematic File Version 4
LIBS:dot-driver-cache
EELAYER 26 0
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
L Connector:USB_B_Micro J5
U 1 1 5BE2379A
P 1200 1400
F 0 "J5" H 1255 1867 50  0000 C CNN
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
L power:GND #PWR015
U 1 1 5BE2388E
P 1200 1800
F 0 "#PWR015" H 1200 1550 50  0001 C CNN
F 1 "GND" H 1205 1627 50  0000 C CNN
F 2 "" H 1200 1800 50  0001 C CNN
F 3 "" H 1200 1800 50  0001 C CNN
	1    1200 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5BE23911
P 2250 1350
F 0 "C1" H 2365 1396 50  0000 L CNN
F 1 "2u2" H 2365 1305 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2288 1200 50  0001 C CNN
F 3 "~" H 2250 1350 50  0001 C CNN
	1    2250 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5BE23CEE
P 2250 1500
F 0 "#PWR011" H 2250 1250 50  0001 C CNN
F 1 "GND" H 2255 1327 50  0000 C CNN
F 2 "" H 2250 1500 50  0001 C CNN
F 3 "" H 2250 1500 50  0001 C CNN
	1    2250 1500
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP2127N-3.3 U1
U 1 1 5BE23D0A
P 3000 1200
F 0 "U1" H 3000 1442 50  0000 C CNN
F 1 "AP2127N-3.3" H 3000 1351 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 3000 1425 50  0001 C CIN
F 3 "https://www.diodes.com/assets/Datasheets/AP2127.pdf" H 3000 1200 50  0001 C CNN
	1    3000 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1200 2550 1200
$Comp
L Device:C C2
U 1 1 5BE23D71
P 3400 1350
F 0 "C2" H 3515 1396 50  0000 L CNN
F 1 "2u2" H 3515 1305 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3438 1200 50  0001 C CNN
F 3 "~" H 3400 1350 50  0001 C CNN
	1    3400 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5BE23E01
P 3000 1500
F 0 "#PWR012" H 3000 1250 50  0001 C CNN
F 1 "GND" H 3005 1327 50  0000 C CNN
F 2 "" H 3000 1500 50  0001 C CNN
F 3 "" H 3000 1500 50  0001 C CNN
	1    3000 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5BE23E1D
P 3400 1500
F 0 "#PWR013" H 3400 1250 50  0001 C CNN
F 1 "GND" H 3405 1327 50  0000 C CNN
F 2 "" H 3400 1500 50  0001 C CNN
F 3 "" H 3400 1500 50  0001 C CNN
	1    3400 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1200 3300 1200
Wire Wire Line
	3400 1200 3650 1200
Connection ~ 3400 1200
$Comp
L power:+3V3 #PWR08
U 1 1 5BE23FBF
P 3650 1200
F 0 "#PWR08" H 3650 1050 50  0001 C CNN
F 1 "+3V3" V 3665 1328 50  0000 L CNN
F 2 "" H 3650 1200 50  0001 C CNN
F 3 "" H 3650 1200 50  0001 C CNN
	1    3650 1200
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
L power:GND #PWR024
U 1 1 5BE248B6
P 4100 2750
F 0 "#PWR024" H 4100 2500 50  0001 C CNN
F 1 "GND" H 4105 2577 50  0000 C CNN
F 2 "" H 4100 2750 50  0001 C CNN
F 3 "" H 4100 2750 50  0001 C CNN
	1    4100 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5BE248FF
P 4100 2600
F 0 "R5" H 4170 2646 50  0000 L CNN
F 1 "10K" H 4170 2555 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 4030 2600 50  0001 C CNN
F 3 "~" H 4100 2600 50  0001 C CNN
	1    4100 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2450 4100 2450
Wire Wire Line
	4100 2450 4300 2450
Connection ~ 4100 2450
$Comp
L power:+3V3 #PWR021
U 1 1 5BE24AD1
P 3300 2450
F 0 "#PWR021" H 3300 2300 50  0001 C CNN
F 1 "+3V3" H 3315 2623 50  0000 C CNN
F 2 "" H 3300 2450 50  0001 C CNN
F 3 "" H 3300 2450 50  0001 C CNN
	1    3300 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2450 3450 2450
Wire Wire Line
	4800 1950 4800 2050
$Comp
L power:+3V3 #PWR017
U 1 1 5BE25046
P 4800 1950
F 0 "#PWR017" H 4800 1800 50  0001 C CNN
F 1 "+3V3" H 4815 2123 50  0000 C CNN
F 2 "" H 4800 1950 50  0001 C CNN
F 3 "" H 4800 1950 50  0001 C CNN
	1    4800 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5650 5400 5700
$Comp
L power:GND #PWR046
U 1 1 5BE254BD
P 5400 5700
F 0 "#PWR046" H 5400 5450 50  0001 C CNN
F 1 "GND" H 5405 5527 50  0000 C CNN
F 2 "" H 5400 5700 50  0001 C CNN
F 3 "" H 5400 5700 50  0001 C CNN
	1    5400 5700
	1    0    0    -1  
$EndComp
Text Label 7550 3400 0    50   ~ 0
LED3
Wire Wire Line
	8150 3400 7850 3400
$Comp
L power:GND #PWR031
U 1 1 5BE26575
P 8150 3500
F 0 "#PWR031" H 8150 3250 50  0001 C CNN
F 1 "GND" H 8155 3327 50  0000 C CNN
F 2 "" H 8150 3500 50  0001 C CNN
F 3 "" H 8150 3500 50  0001 C CNN
	1    8150 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR029
U 1 1 5BE2656F
P 8150 3300
F 0 "#PWR029" H 8150 3150 50  0001 C CNN
F 1 "+5VL" H 8165 3473 50  0000 C CNN
F 2 "" H 8150 3300 50  0001 C CNN
F 3 "" H 8150 3300 50  0001 C CNN
	1    8150 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J9
U 1 1 5BE26569
P 8350 3400
F 0 "J9" H 8323 3330 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 3421 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 3400 50  0001 C CNN
F 3 "~" H 8350 3400 50  0001 C CNN
	1    8350 3400
	-1   0    0    1   
$EndComp
Text Label 7550 2750 0    50   ~ 0
LED2
Wire Wire Line
	8150 2750 7850 2750
$Comp
L power:GND #PWR026
U 1 1 5BE26561
P 8150 2850
F 0 "#PWR026" H 8150 2600 50  0001 C CNN
F 1 "GND" H 8155 2677 50  0000 C CNN
F 2 "" H 8150 2850 50  0001 C CNN
F 3 "" H 8150 2850 50  0001 C CNN
	1    8150 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR023
U 1 1 5BE2655B
P 8150 2650
F 0 "#PWR023" H 8150 2500 50  0001 C CNN
F 1 "+5VL" H 8165 2823 50  0000 C CNN
F 2 "" H 8150 2650 50  0001 C CNN
F 3 "" H 8150 2650 50  0001 C CNN
	1    8150 2650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J8
U 1 1 5BE26555
P 8350 2750
F 0 "J8" H 8323 2680 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 2771 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 2750 50  0001 C CNN
F 3 "~" H 8350 2750 50  0001 C CNN
	1    8350 2750
	-1   0    0    1   
$EndComp
Text Label 7550 2100 0    50   ~ 0
LED1
Wire Wire Line
	8150 2100 7850 2100
$Comp
L power:GND #PWR020
U 1 1 5BE2618D
P 8150 2200
F 0 "#PWR020" H 8150 1950 50  0001 C CNN
F 1 "GND" H 8155 2027 50  0000 C CNN
F 2 "" H 8150 2200 50  0001 C CNN
F 3 "" H 8150 2200 50  0001 C CNN
	1    8150 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR018
U 1 1 5BE26187
P 8150 2000
F 0 "#PWR018" H 8150 1850 50  0001 C CNN
F 1 "+5VL" H 8165 2173 50  0000 C CNN
F 2 "" H 8150 2000 50  0001 C CNN
F 3 "" H 8150 2000 50  0001 C CNN
	1    8150 2000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J7
U 1 1 5BE26181
P 8350 2100
F 0 "J7" H 8323 2030 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 2121 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 2100 50  0001 C CNN
F 3 "~" H 8350 2100 50  0001 C CNN
	1    8350 2100
	-1   0    0    1   
$EndComp
Text Label 7550 1450 0    50   ~ 0
LED0
$Comp
L power:GND #PWR014
U 1 1 5BE25C03
P 8150 1550
F 0 "#PWR014" H 8150 1300 50  0001 C CNN
F 1 "GND" H 8155 1377 50  0000 C CNN
F 2 "" H 8150 1550 50  0001 C CNN
F 3 "" H 8150 1550 50  0001 C CNN
	1    8150 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR09
U 1 1 5BE25B6A
P 8150 1350
F 0 "#PWR09" H 8150 1200 50  0001 C CNN
F 1 "+5VL" H 8165 1523 50  0000 C CNN
F 2 "" H 8150 1350 50  0001 C CNN
F 3 "" H 8150 1350 50  0001 C CNN
	1    8150 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J6
U 1 1 5BE259F5
P 8350 1450
F 0 "J6" H 8323 1380 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 1471 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 1450 50  0001 C CNN
F 3 "~" H 8350 1450 50  0001 C CNN
	1    8350 1450
	-1   0    0    1   
$EndComp
Text Label 7550 6000 0    50   ~ 0
LED7
Wire Wire Line
	8150 6000 7850 6000
$Comp
L power:GND #PWR050
U 1 1 5BE26F0E
P 8150 6100
F 0 "#PWR050" H 8150 5850 50  0001 C CNN
F 1 "GND" H 8155 5927 50  0000 C CNN
F 2 "" H 8150 6100 50  0001 C CNN
F 3 "" H 8150 6100 50  0001 C CNN
	1    8150 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR048
U 1 1 5BE26F14
P 8150 5900
F 0 "#PWR048" H 8150 5750 50  0001 C CNN
F 1 "+5VL" H 8165 6073 50  0000 C CNN
F 2 "" H 8150 5900 50  0001 C CNN
F 3 "" H 8150 5900 50  0001 C CNN
	1    8150 5900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J13
U 1 1 5BE26F1A
P 8350 6000
F 0 "J13" H 8323 5930 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 6021 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 6000 50  0001 C CNN
F 3 "~" H 8350 6000 50  0001 C CNN
	1    8350 6000
	-1   0    0    1   
$EndComp
Text Label 7550 5350 0    50   ~ 0
LED6
Wire Wire Line
	8150 5350 7850 5350
$Comp
L power:GND #PWR045
U 1 1 5BE26F22
P 8150 5450
F 0 "#PWR045" H 8150 5200 50  0001 C CNN
F 1 "GND" H 8155 5277 50  0000 C CNN
F 2 "" H 8150 5450 50  0001 C CNN
F 3 "" H 8150 5450 50  0001 C CNN
	1    8150 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR043
U 1 1 5BE26F28
P 8150 5250
F 0 "#PWR043" H 8150 5100 50  0001 C CNN
F 1 "+5VL" H 8165 5423 50  0000 C CNN
F 2 "" H 8150 5250 50  0001 C CNN
F 3 "" H 8150 5250 50  0001 C CNN
	1    8150 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J12
U 1 1 5BE26F2E
P 8350 5350
F 0 "J12" H 8323 5280 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 5371 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 5350 50  0001 C CNN
F 3 "~" H 8350 5350 50  0001 C CNN
	1    8350 5350
	-1   0    0    1   
$EndComp
Text Label 7550 4700 0    50   ~ 0
LED5
Wire Wire Line
	8150 4700 7850 4700
$Comp
L power:GND #PWR041
U 1 1 5BE26F36
P 8150 4800
F 0 "#PWR041" H 8150 4550 50  0001 C CNN
F 1 "GND" H 8155 4627 50  0000 C CNN
F 2 "" H 8150 4800 50  0001 C CNN
F 3 "" H 8150 4800 50  0001 C CNN
	1    8150 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR039
U 1 1 5BE26F3C
P 8150 4600
F 0 "#PWR039" H 8150 4450 50  0001 C CNN
F 1 "+5VL" H 8165 4773 50  0000 C CNN
F 2 "" H 8150 4600 50  0001 C CNN
F 3 "" H 8150 4600 50  0001 C CNN
	1    8150 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J11
U 1 1 5BE26F42
P 8350 4700
F 0 "J11" H 8323 4630 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 4721 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 4700 50  0001 C CNN
F 3 "~" H 8350 4700 50  0001 C CNN
	1    8350 4700
	-1   0    0    1   
$EndComp
Text Label 7550 4050 0    50   ~ 0
LED4
Wire Wire Line
	8150 4050 7850 4050
$Comp
L power:GND #PWR037
U 1 1 5BE26F4A
P 8150 4150
F 0 "#PWR037" H 8150 3900 50  0001 C CNN
F 1 "GND" H 8155 3977 50  0000 C CNN
F 2 "" H 8150 4150 50  0001 C CNN
F 3 "" H 8150 4150 50  0001 C CNN
	1    8150 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR033
U 1 1 5BE26F50
P 8150 3950
F 0 "#PWR033" H 8150 3800 50  0001 C CNN
F 1 "+5VL" H 8165 4123 50  0000 C CNN
F 2 "" H 8150 3950 50  0001 C CNN
F 3 "" H 8150 3950 50  0001 C CNN
	1    8150 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J10
U 1 1 5BE26F56
P 8350 4050
F 0 "J10" H 8323 3980 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8323 4071 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 8350 4050 50  0001 C CNN
F 3 "~" H 8350 4050 50  0001 C CNN
	1    8350 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:D D1
U 1 1 5BE27D4A
P 2250 1050
F 0 "D1" V 2296 971 50  0000 R CNN
F 1 "D" V 2205 971 50  0000 R CNN
F 2 "Diodes_SMD:SOD-323" H 2250 1050 50  0001 C CNN
F 3 "~" H 2250 1050 50  0001 C CNN
	1    2250 1050
	0    -1   -1   0   
$EndComp
Connection ~ 2250 1200
$Comp
L Device:D D2
U 1 1 5BE28E77
P 1900 1200
F 0 "D2" H 1900 984 50  0000 C CNN
F 1 "D" H 1900 1075 50  0000 C CNN
F 2 "Diodes_SMD:SOD-323" H 1900 1200 50  0001 C CNN
F 3 "~" H 1900 1200 50  0001 C CNN
	1    1900 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1750 1200 1650 1200
Wire Wire Line
	2050 1200 2250 1200
$Comp
L power:+5VL #PWR04
U 1 1 5BE29A95
P 2250 900
F 0 "#PWR04" H 2250 750 50  0001 C CNN
F 1 "+5VL" H 2265 1073 50  0000 C CNN
F 2 "" H 2250 900 50  0001 C CNN
F 3 "" H 2250 900 50  0001 C CNN
	1    2250 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 1200 2550 850 
Wire Wire Line
	2550 850  3650 850 
Connection ~ 2550 1200
Wire Wire Line
	2550 1200 2250 1200
$Comp
L power:+5V #PWR01
U 1 1 5BE2AD26
P 3650 850
F 0 "#PWR01" H 3650 700 50  0001 C CNN
F 1 "+5V" V 3665 978 50  0000 L CNN
F 2 "" H 3650 850 50  0001 C CNN
F 3 "" H 3650 850 50  0001 C CNN
	1    3650 850 
	0    1    1    0   
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
$Comp
L Device:R R1
U 1 1 5BE2BED6
P 7850 1300
F 0 "R1" H 7920 1346 50  0000 L CNN
F 1 "1K" H 7920 1255 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 7780 1300 50  0001 C CNN
F 3 "~" H 7850 1300 50  0001 C CNN
	1    7850 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5BE2BF68
P 7850 1150
F 0 "#PWR07" H 7850 1000 50  0001 C CNN
F 1 "+5V" H 7865 1323 50  0000 C CNN
F 2 "" H 7850 1150 50  0001 C CNN
F 3 "" H 7850 1150 50  0001 C CNN
	1    7850 1150
	1    0    0    -1  
$EndComp
Connection ~ 7850 1450
Wire Wire Line
	7850 1450 7550 1450
Wire Wire Line
	7850 1450 8150 1450
$Comp
L Device:R R3
U 1 1 5BE30701
P 7850 1950
F 0 "R3" H 7920 1996 50  0000 L CNN
F 1 "1K" H 7920 1905 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 7780 1950 50  0001 C CNN
F 3 "~" H 7850 1950 50  0001 C CNN
	1    7850 1950
	1    0    0    -1  
$EndComp
Connection ~ 7850 2100
Wire Wire Line
	7850 2100 7550 2100
$Comp
L Device:R R6
U 1 1 5BE3074F
P 7850 2600
F 0 "R6" H 7920 2646 50  0000 L CNN
F 1 "1K" H 7920 2555 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 7780 2600 50  0001 C CNN
F 3 "~" H 7850 2600 50  0001 C CNN
	1    7850 2600
	1    0    0    -1  
$EndComp
Connection ~ 7850 2750
Wire Wire Line
	7850 2750 7550 2750
$Comp
L Device:R R9
U 1 1 5BE307A3
P 7850 3250
F 0 "R9" H 7920 3296 50  0000 L CNN
F 1 "1K" H 7920 3205 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 7780 3250 50  0001 C CNN
F 3 "~" H 7850 3250 50  0001 C CNN
	1    7850 3250
	1    0    0    -1  
$EndComp
Connection ~ 7850 3400
Wire Wire Line
	7850 3400 7550 3400
$Comp
L Device:R R11
U 1 1 5BE307F9
P 7850 3900
F 0 "R11" H 7920 3946 50  0000 L CNN
F 1 "1K" H 7920 3855 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 7780 3900 50  0001 C CNN
F 3 "~" H 7850 3900 50  0001 C CNN
	1    7850 3900
	1    0    0    -1  
$EndComp
Connection ~ 7850 4050
Wire Wire Line
	7850 4050 7550 4050
$Comp
L Device:R R13
U 1 1 5BE3084D
P 7850 4550
F 0 "R13" H 7920 4596 50  0000 L CNN
F 1 "1K" H 7920 4505 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 7780 4550 50  0001 C CNN
F 3 "~" H 7850 4550 50  0001 C CNN
	1    7850 4550
	1    0    0    -1  
$EndComp
Connection ~ 7850 4700
Wire Wire Line
	7850 4700 7550 4700
$Comp
L Device:R R15
U 1 1 5BE308A3
P 7850 5200
F 0 "R15" H 7920 5246 50  0000 L CNN
F 1 "1K" H 7920 5155 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 7780 5200 50  0001 C CNN
F 3 "~" H 7850 5200 50  0001 C CNN
	1    7850 5200
	1    0    0    -1  
$EndComp
Connection ~ 7850 5350
Wire Wire Line
	7850 5350 7550 5350
$Comp
L power:+5V #PWR016
U 1 1 5BE308FF
P 7850 1800
F 0 "#PWR016" H 7850 1650 50  0001 C CNN
F 1 "+5V" H 7865 1973 50  0000 C CNN
F 2 "" H 7850 1800 50  0001 C CNN
F 3 "" H 7850 1800 50  0001 C CNN
	1    7850 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR022
U 1 1 5BE3093A
P 7850 2450
F 0 "#PWR022" H 7850 2300 50  0001 C CNN
F 1 "+5V" H 7865 2623 50  0000 C CNN
F 2 "" H 7850 2450 50  0001 C CNN
F 3 "" H 7850 2450 50  0001 C CNN
	1    7850 2450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR028
U 1 1 5BE30975
P 7850 3100
F 0 "#PWR028" H 7850 2950 50  0001 C CNN
F 1 "+5V" H 7865 3273 50  0000 C CNN
F 2 "" H 7850 3100 50  0001 C CNN
F 3 "" H 7850 3100 50  0001 C CNN
	1    7850 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR032
U 1 1 5BE309B0
P 7850 3750
F 0 "#PWR032" H 7850 3600 50  0001 C CNN
F 1 "+5V" H 7865 3923 50  0000 C CNN
F 2 "" H 7850 3750 50  0001 C CNN
F 3 "" H 7850 3750 50  0001 C CNN
	1    7850 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR038
U 1 1 5BE309EB
P 7850 4400
F 0 "#PWR038" H 7850 4250 50  0001 C CNN
F 1 "+5V" H 7865 4573 50  0000 C CNN
F 2 "" H 7850 4400 50  0001 C CNN
F 3 "" H 7850 4400 50  0001 C CNN
	1    7850 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR042
U 1 1 5BE30A26
P 7850 5050
F 0 "#PWR042" H 7850 4900 50  0001 C CNN
F 1 "+5V" H 7865 5223 50  0000 C CNN
F 2 "" H 7850 5050 50  0001 C CNN
F 3 "" H 7850 5050 50  0001 C CNN
	1    7850 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 5BE30AF1
P 7850 5850
F 0 "R17" H 7920 5896 50  0000 L CNN
F 1 "1K" H 7920 5805 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 7780 5850 50  0001 C CNN
F 3 "~" H 7850 5850 50  0001 C CNN
	1    7850 5850
	1    0    0    -1  
$EndComp
Connection ~ 7850 6000
Wire Wire Line
	7850 6000 7550 6000
$Comp
L power:+5V #PWR047
U 1 1 5BE30B4B
P 7850 5700
F 0 "#PWR047" H 7850 5550 50  0001 C CNN
F 1 "+5V" H 7865 5873 50  0000 C CNN
F 2 "" H 7850 5700 50  0001 C CNN
F 3 "" H 7850 5700 50  0001 C CNN
	1    7850 5700
	1    0    0    -1  
$EndComp
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
L Device:C C4
U 1 1 5BE36C62
P 3450 3950
F 0 "C4" H 3565 3996 50  0000 L CNN
F 1 "20p" H 3565 3905 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3488 3800 50  0001 C CNN
F 3 "~" H 3450 3950 50  0001 C CNN
	1    3450 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5BE36CF4
P 3100 3950
F 0 "C3" H 3215 3996 50  0000 L CNN
F 1 "20p" H 3215 3905 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3138 3800 50  0001 C CNN
F 3 "~" H 3100 3950 50  0001 C CNN
	1    3100 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3800 3100 3400
$Comp
L power:GND #PWR035
U 1 1 5BE37E0A
P 3100 4100
F 0 "#PWR035" H 3100 3850 50  0001 C CNN
F 1 "GND" H 3105 3927 50  0000 C CNN
F 2 "" H 3100 4100 50  0001 C CNN
F 3 "" H 3100 4100 50  0001 C CNN
	1    3100 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5BE37E54
P 3450 4100
F 0 "#PWR036" H 3450 3850 50  0001 C CNN
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
L Device:LED D6
U 1 1 5BE48986
P 1150 2950
F 0 "D6" V 1188 2832 50  0000 R CNN
F 1 "GREEN" V 1097 2832 50  0000 R CNN
F 2 "LEDs:LED_0603" H 1150 2950 50  0001 C CNN
F 3 "~" H 1150 2950 50  0001 C CNN
	1    1150 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D3
U 1 1 5BE48AC9
P 10150 1450
F 0 "D3" H 10142 1195 50  0000 C CNN
F 1 "YELLOW" H 10142 1286 50  0000 C CNN
F 2 "LEDs:LED_0603" H 10150 1450 50  0001 C CNN
F 3 "~" H 10150 1450 50  0001 C CNN
	1    10150 1450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR027
U 1 1 5BE48B98
P 1150 3100
F 0 "#PWR027" H 1150 2850 50  0001 C CNN
F 1 "GND" H 1155 2927 50  0000 C CNN
F 2 "" H 1150 3100 50  0001 C CNN
F 3 "" H 1150 3100 50  0001 C CNN
	1    1150 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5BE48BE6
P 10300 1450
F 0 "#PWR010" H 10300 1200 50  0001 C CNN
F 1 "GND" H 10305 1277 50  0000 C CNN
F 2 "" H 10300 1450 50  0001 C CNN
F 3 "" H 10300 1450 50  0001 C CNN
	1    10300 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5BE48C70
P 1150 2650
F 0 "R7" H 1220 2696 50  0000 L CNN
F 1 "680R" H 1220 2605 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 1080 2650 50  0001 C CNN
F 3 "~" H 1150 2650 50  0001 C CNN
	1    1150 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5BE48CEA
P 9850 1450
F 0 "R2" V 9643 1450 50  0000 C CNN
F 1 "470R" V 9734 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 9780 1450 50  0001 C CNN
F 3 "~" H 9850 1450 50  0001 C CNN
	1    9850 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	1150 2500 1150 2200
Text Label 1150 2400 1    50   ~ 0
VBUS
Wire Wire Line
	9700 1450 9350 1450
Text Label 9350 1450 0    50   ~ 0
IND0
$Comp
L Device:LED D4
U 1 1 5BE6A51B
P 10150 2100
F 0 "D4" H 10142 1845 50  0000 C CNN
F 1 "YELLOW" H 10142 1936 50  0000 C CNN
F 2 "LEDs:LED_0603" H 10150 2100 50  0001 C CNN
F 3 "~" H 10150 2100 50  0001 C CNN
	1    10150 2100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5BE6A521
P 10300 2100
F 0 "#PWR019" H 10300 1850 50  0001 C CNN
F 1 "GND" H 10305 1927 50  0000 C CNN
F 2 "" H 10300 2100 50  0001 C CNN
F 3 "" H 10300 2100 50  0001 C CNN
	1    10300 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5BE6A527
P 9850 2100
F 0 "R4" V 9643 2100 50  0000 C CNN
F 1 "470R" V 9734 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 9780 2100 50  0001 C CNN
F 3 "~" H 9850 2100 50  0001 C CNN
	1    9850 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 2100 9350 2100
Text Label 9350 2100 0    50   ~ 0
IND1
$Comp
L Device:LED D5
U 1 1 5BE6D96E
P 10150 2750
F 0 "D5" H 10142 2495 50  0000 C CNN
F 1 "YELLOW" H 10142 2586 50  0000 C CNN
F 2 "LEDs:LED_0603" H 10150 2750 50  0001 C CNN
F 3 "~" H 10150 2750 50  0001 C CNN
	1    10150 2750
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5BE6D974
P 10300 2750
F 0 "#PWR025" H 10300 2500 50  0001 C CNN
F 1 "GND" H 10305 2577 50  0000 C CNN
F 2 "" H 10300 2750 50  0001 C CNN
F 3 "" H 10300 2750 50  0001 C CNN
	1    10300 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5BE6D97A
P 9850 2750
F 0 "R8" V 9643 2750 50  0000 C CNN
F 1 "470R" V 9734 2750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 9780 2750 50  0001 C CNN
F 3 "~" H 9850 2750 50  0001 C CNN
	1    9850 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 2750 9350 2750
Text Label 9350 2750 0    50   ~ 0
IND2
$Comp
L Device:LED D7
U 1 1 5BE6D982
P 10150 3400
F 0 "D7" H 10142 3145 50  0000 C CNN
F 1 "YELLOW" H 10142 3236 50  0000 C CNN
F 2 "LEDs:LED_0603" H 10150 3400 50  0001 C CNN
F 3 "~" H 10150 3400 50  0001 C CNN
	1    10150 3400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR030
U 1 1 5BE6D988
P 10300 3400
F 0 "#PWR030" H 10300 3150 50  0001 C CNN
F 1 "GND" H 10305 3227 50  0000 C CNN
F 2 "" H 10300 3400 50  0001 C CNN
F 3 "" H 10300 3400 50  0001 C CNN
	1    10300 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5BE6D98E
P 9850 3400
F 0 "R10" V 9643 3400 50  0000 C CNN
F 1 "470R" V 9734 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 9780 3400 50  0001 C CNN
F 3 "~" H 9850 3400 50  0001 C CNN
	1    9850 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 3400 9350 3400
Text Label 9350 3400 0    50   ~ 0
IND3
$Comp
L Device:LED D8
U 1 1 5BE6F63C
P 10150 4050
F 0 "D8" H 10142 3795 50  0000 C CNN
F 1 "YELLOW" H 10142 3886 50  0000 C CNN
F 2 "LEDs:LED_0603" H 10150 4050 50  0001 C CNN
F 3 "~" H 10150 4050 50  0001 C CNN
	1    10150 4050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR034
U 1 1 5BE6F642
P 10300 4050
F 0 "#PWR034" H 10300 3800 50  0001 C CNN
F 1 "GND" H 10305 3877 50  0000 C CNN
F 2 "" H 10300 4050 50  0001 C CNN
F 3 "" H 10300 4050 50  0001 C CNN
	1    10300 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5BE6F648
P 9850 4050
F 0 "R12" V 9643 4050 50  0000 C CNN
F 1 "470R" V 9734 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 9780 4050 50  0001 C CNN
F 3 "~" H 9850 4050 50  0001 C CNN
	1    9850 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 4050 9350 4050
Text Label 9350 4050 0    50   ~ 0
IND4
$Comp
L Device:LED D9
U 1 1 5BE6F650
P 10150 4700
F 0 "D9" H 10142 4445 50  0000 C CNN
F 1 "YELLOW" H 10142 4536 50  0000 C CNN
F 2 "LEDs:LED_0603" H 10150 4700 50  0001 C CNN
F 3 "~" H 10150 4700 50  0001 C CNN
	1    10150 4700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR040
U 1 1 5BE6F656
P 10300 4700
F 0 "#PWR040" H 10300 4450 50  0001 C CNN
F 1 "GND" H 10305 4527 50  0000 C CNN
F 2 "" H 10300 4700 50  0001 C CNN
F 3 "" H 10300 4700 50  0001 C CNN
	1    10300 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5BE6F65C
P 9850 4700
F 0 "R14" V 9643 4700 50  0000 C CNN
F 1 "470R" V 9734 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 9780 4700 50  0001 C CNN
F 3 "~" H 9850 4700 50  0001 C CNN
	1    9850 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 4700 9350 4700
Text Label 9350 4700 0    50   ~ 0
IND5
$Comp
L Device:LED D10
U 1 1 5BE6F664
P 10150 5350
F 0 "D10" H 10142 5095 50  0000 C CNN
F 1 "YELLOW" H 10142 5186 50  0000 C CNN
F 2 "LEDs:LED_0603" H 10150 5350 50  0001 C CNN
F 3 "~" H 10150 5350 50  0001 C CNN
	1    10150 5350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR044
U 1 1 5BE6F66A
P 10300 5350
F 0 "#PWR044" H 10300 5100 50  0001 C CNN
F 1 "GND" H 10305 5177 50  0000 C CNN
F 2 "" H 10300 5350 50  0001 C CNN
F 3 "" H 10300 5350 50  0001 C CNN
	1    10300 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 5BE6F670
P 9850 5350
F 0 "R16" V 9643 5350 50  0000 C CNN
F 1 "470R" V 9734 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 9780 5350 50  0001 C CNN
F 3 "~" H 9850 5350 50  0001 C CNN
	1    9850 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 5350 9350 5350
Text Label 9350 5350 0    50   ~ 0
IND6
$Comp
L Device:LED D11
U 1 1 5BE6F678
P 10150 6000
F 0 "D11" H 10142 5745 50  0000 C CNN
F 1 "YELLOW" H 10142 5836 50  0000 C CNN
F 2 "LEDs:LED_0603" H 10150 6000 50  0001 C CNN
F 3 "~" H 10150 6000 50  0001 C CNN
	1    10150 6000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR049
U 1 1 5BE6F67E
P 10300 6000
F 0 "#PWR049" H 10300 5750 50  0001 C CNN
F 1 "GND" H 10305 5827 50  0000 C CNN
F 2 "" H 10300 6000 50  0001 C CNN
F 3 "" H 10300 6000 50  0001 C CNN
	1    10300 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5BE6F684
P 9850 6000
F 0 "R18" V 9643 6000 50  0000 C CNN
F 1 "470R" V 9734 6000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 9780 6000 50  0001 C CNN
F 3 "~" H 9850 6000 50  0001 C CNN
	1    9850 6000
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 6000 9350 6000
Text Label 9350 6000 0    50   ~ 0
IND7
$Comp
L Connector:Micro_SD_Card_Det_Hirose_DM3AT J14
U 1 1 5BE73FC1
P 3600 6800
F 0 "J14" H 3550 7617 50  0000 C CNN
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
L power:GND #PWR055
U 1 1 5BE880CB
P 2700 7300
F 0 "#PWR055" H 2700 7050 50  0001 C CNN
F 1 "GND" H 2705 7127 50  0000 C CNN
F 2 "" H 2700 7300 50  0001 C CNN
F 3 "" H 2700 7300 50  0001 C CNN
	1    2700 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR056
U 1 1 5BE881B9
P 4400 7300
F 0 "#PWR056" H 4400 7050 50  0001 C CNN
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
L power:GND #PWR053
U 1 1 5BE8A995
P 2150 7000
F 0 "#PWR053" H 2150 6750 50  0001 C CNN
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
$Comp
L power:VDD #PWR051
U 1 1 5BE8D2F8
P 2150 6600
F 0 "#PWR051" H 2150 6450 50  0001 C CNN
F 1 "VDD" H 2167 6773 50  0000 C CNN
F 2 "" H 2150 6600 50  0001 C CNN
F 3 "" H 2150 6600 50  0001 C CNN
	1    2150 6600
	1    0    0    -1  
$EndComp
NoConn ~ 2700 7100
NoConn ~ 2700 6400
Wire Wire Line
	5700 2850 6300 2850
Wire Wire Line
	5700 2950 6300 2950
Text Label 6100 2850 0    50   ~ 0
MISO
Text Label 6100 2950 0    50   ~ 0
MOSI
Wire Wire Line
	5700 2750 6300 2750
Text Label 6100 2750 0    50   ~ 0
SCK
Wire Wire Line
	5700 2650 6300 2650
Text Label 6100 2650 0    50   ~ 0
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
L Connector:Conn_01x04_Male J15
U 1 1 5BE5866A
P 5500 7000
F 0 "J15" H 5606 7278 50  0000 C CNN
F 1 "SWD" H 5606 7187 50  0000 C CNN
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
L power:+3V3 #PWR052
U 1 1 5BE69721
P 6150 6750
F 0 "#PWR052" H 6150 6600 50  0001 C CNN
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
L power:GND #PWR054
U 1 1 5BE6CECA
P 6150 7250
F 0 "#PWR054" H 6150 7000 50  0001 C CNN
F 1 "GND" H 6155 7077 50  0000 C CNN
F 2 "" H 6150 7250 50  0001 C CNN
F 3 "" H 6150 7250 50  0001 C CNN
	1    6150 7250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J1
U 1 1 5BE28D5F
P 8400 850
F 0 "J1" H 8506 1028 50  0000 C CNN
F 1 "5VL" H 8506 937 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01" H 8400 850 50  0001 C CNN
F 3 "~" H 8400 850 50  0001 C CNN
	1    8400 850 
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5BE28E11
P 8400 1100
F 0 "J3" H 8506 1278 50  0000 C CNN
F 1 "GND" H 8506 1187 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01" H 8400 1100 50  0001 C CNN
F 3 "~" H 8400 1100 50  0001 C CNN
	1    8400 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5BE2922C
P 8700 1100
F 0 "#PWR05" H 8700 850 50  0001 C CNN
F 1 "GND" H 8705 927 50  0000 C CNN
F 2 "" H 8700 1100 50  0001 C CNN
F 3 "" H 8700 1100 50  0001 C CNN
	1    8700 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR02
U 1 1 5BE29323
P 8700 850
F 0 "#PWR02" H 8700 700 50  0001 C CNN
F 1 "+5VL" H 8715 1023 50  0000 C CNN
F 2 "" H 8700 850 50  0001 C CNN
F 3 "" H 8700 850 50  0001 C CNN
	1    8700 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 1100 8700 1100
Wire Wire Line
	8600 850  8700 850 
Wire Wire Line
	5700 4750 6300 4750
Text Label 6000 4750 0    50   ~ 0
BUTTON
Text Label 3850 2450 0    50   ~ 0
BUTTON
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 5BE3B881
P 8850 850
F 0 "J2" H 8956 1028 50  0000 C CNN
F 1 "5VL" H 8956 937 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01" H 8850 850 50  0001 C CNN
F 3 "~" H 8850 850 50  0001 C CNN
	1    8850 850 
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J4
U 1 1 5BE3B887
P 8850 1100
F 0 "J4" H 8956 1278 50  0000 C CNN
F 1 "GND" H 8956 1187 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01" H 8850 1100 50  0001 C CNN
F 3 "~" H 8850 1100 50  0001 C CNN
	1    8850 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5BE3B88D
P 9150 1100
F 0 "#PWR06" H 9150 850 50  0001 C CNN
F 1 "GND" H 9155 927 50  0000 C CNN
F 2 "" H 9150 1100 50  0001 C CNN
F 3 "" H 9150 1100 50  0001 C CNN
	1    9150 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR03
U 1 1 5BE3B893
P 9150 850
F 0 "#PWR03" H 9150 700 50  0001 C CNN
F 1 "+5VL" H 9165 1023 50  0000 C CNN
F 2 "" H 9150 850 50  0001 C CNN
F 3 "" H 9150 850 50  0001 C CNN
	1    9150 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1100 9150 1100
Wire Wire Line
	9050 850  9150 850 
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
Text Label 6100 5250 0    50   ~ 0
IND6
Wire Wire Line
	5700 5350 6300 5350
Wire Wire Line
	5700 5450 6300 5450
Text Label 6100 5350 0    50   ~ 0
IND5
Text Label 6100 5450 0    50   ~ 0
IND4
Wire Wire Line
	5700 5150 6300 5150
Text Label 6100 5150 0    50   ~ 0
IND7
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
Wire Wire Line
	5700 3050 6300 3050
Text Label 6000 3050 0    50   ~ 0
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
Wire Wire Line
	4300 5150 3700 5150
Text Label 3700 5150 0    50   ~ 0
IND0
Text Label 3700 5050 0    50   ~ 0
IND1
Text Label 3700 4950 0    50   ~ 0
IND2
$Comp
L Device:LED D12
U 1 1 5BEEC8A0
P 1650 2950
F 0 "D12" V 1688 2832 50  0000 R CNN
F 1 "GREEN" V 1597 2832 50  0000 R CNN
F 2 "LEDs:LED_0603" H 1650 2950 50  0001 C CNN
F 3 "~" H 1650 2950 50  0001 C CNN
	1    1650 2950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR058
U 1 1 5BEEC8A6
P 1650 3100
F 0 "#PWR058" H 1650 2850 50  0001 C CNN
F 1 "GND" H 1655 2927 50  0000 C CNN
F 2 "" H 1650 3100 50  0001 C CNN
F 3 "" H 1650 3100 50  0001 C CNN
	1    1650 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5BEEC8AC
P 1650 2650
F 0 "R19" H 1720 2696 50  0000 L CNN
F 1 "680R" H 1720 2605 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" V 1580 2650 50  0001 C CNN
F 3 "~" H 1650 2650 50  0001 C CNN
	1    1650 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR057
U 1 1 5BEFBA13
P 1650 2300
F 0 "#PWR057" H 1650 2150 50  0001 C CNN
F 1 "+5VL" H 1665 2473 50  0000 C CNN
F 2 "" H 1650 2300 50  0001 C CNN
F 3 "" H 1650 2300 50  0001 C CNN
	1    1650 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 2300 1650 2500
Wire Wire Line
	1100 1800 1200 1800
Connection ~ 1200 1800
$Comp
L Device:C C5
U 1 1 5BEB7A37
P 5700 1700
F 0 "C5" H 5815 1746 50  0000 L CNN
F 1 "100n" H 5815 1655 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5738 1550 50  0001 C CNN
F 3 "~" H 5700 1700 50  0001 C CNN
	1    5700 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5BEB7B59
P 6100 1700
F 0 "C6" H 6215 1746 50  0000 L CNN
F 1 "100n" H 6215 1655 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6138 1550 50  0001 C CNN
F 3 "~" H 6100 1700 50  0001 C CNN
	1    6100 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR059
U 1 1 5BEB7CD3
P 5700 1550
F 0 "#PWR059" H 5700 1400 50  0001 C CNN
F 1 "+3V3" H 5715 1723 50  0000 C CNN
F 2 "" H 5700 1550 50  0001 C CNN
F 3 "" H 5700 1550 50  0001 C CNN
	1    5700 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR060
U 1 1 5BEB7D4E
P 6100 1550
F 0 "#PWR060" H 6100 1400 50  0001 C CNN
F 1 "+3V3" H 6115 1723 50  0000 C CNN
F 2 "" H 6100 1550 50  0001 C CNN
F 3 "" H 6100 1550 50  0001 C CNN
	1    6100 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR061
U 1 1 5BEB7EEA
P 5700 1850
F 0 "#PWR061" H 5700 1600 50  0001 C CNN
F 1 "GND" H 5705 1677 50  0000 C CNN
F 2 "" H 5700 1850 50  0001 C CNN
F 3 "" H 5700 1850 50  0001 C CNN
	1    5700 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR062
U 1 1 5BEB7FF3
P 6100 1850
F 0 "#PWR062" H 6100 1600 50  0001 C CNN
F 1 "GND" H 6105 1677 50  0000 C CNN
F 2 "" H 6100 1850 50  0001 C CNN
F 3 "" H 6100 1850 50  0001 C CNN
	1    6100 1850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
